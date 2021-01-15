from __future__ import print_function
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

import os
# from sklearn.externals import joblib
import joblib
from sklearn import model_selection
from sklearn.metrics import accuracy_score
from datahandler import load_data_set_train

from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.svm import SVC
from sklearn.naive_bayes import GaussianNB
from sklearn.neural_network import MLPClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import BaggingClassifier
'''
import warnings
warnings.filterwarnings("ignore")  # 忽略版本问题
'''
import datahandler


def all_Algorithms():
    all_algorithms_score = []
    all_algorithms_score_avg = []
    all_algorithms_name = ["KNN", "DecisionTree", "MLPClassifier", "NaiveBayes", "SVM", "RandomForestClassifier",
                           "Bagging"]

    # load data
    dataset_train = load_data_set_train()
    array = dataset_train.values
    x = array[:, 1:len(list(dataset_train)) - 1]
    y = array[:, 0]
    validation_size = 0.20
    seed = 7
    x_train, x_validation, y_train, y_validation = model_selection.train_test_split(x, y, test_size=validation_size,
                                                                                    random_state=seed)
    accuracy, average_mae_history = knn_Algorithms(x_train, x_validation, y_train, y_validation)
    all_algorithms_score.append(accuracy)
    all_algorithms_score_avg.append(average_mae_history)

    accuracy, average_mae_history = DecisionTree_Algorithms(x_train, x_validation, y_train, y_validation)
    all_algorithms_score.append(accuracy)
    all_algorithms_score_avg.append(average_mae_history)

    accuracy, average_mae_history = MLPClassifier_Algorithms(x_train, x_validation, y_train, y_validation)
    all_algorithms_score.append(accuracy)
    all_algorithms_score_avg.append(average_mae_history)

    accuracy, average_mae_history = NaiveBayes_Algorithms(x_train, x_validation, y_train, y_validation)
    all_algorithms_score.append(accuracy)
    all_algorithms_score_avg.append(average_mae_history)

    accuracy, average_mae_history = SVM_Algorithms(x_train, x_validation, y_train, y_validation)
    all_algorithms_score.append(accuracy)
    all_algorithms_score_avg.append(average_mae_history)

    accuracy, average_mae_history = RandomForestClassifier_Algorithms(x_train, x_validation, y_train, y_validation)
    all_algorithms_score.append(accuracy)
    all_algorithms_score_avg.append(average_mae_history)

    accuracy, average_mae_history = Bagging_Algorithms(x_train, x_validation, y_train, y_validation)
    all_algorithms_score.append(accuracy)
    all_algorithms_score_avg.append(average_mae_history)

    return all_algorithms_name, all_algorithms_score, all_algorithms_score_avg, list(dataset_train), list(
        dataset_train.mean())


'''
https://www.cnblogs.com/en-heng/p/5000628.html
核心思想：在训练集中选取离输入的数据点最近的k个邻居，
根据这个k个邻居中出现次数最多的类别（最大表决规则），作为该数据点的类别。
'''
def knn_Algorithms(x_train, x_validation, y_train, y_validation, max_iter=100000):
    # knn Algorithms
    best_k, max_value = choose_best_k_to_knn(x_train, y_train, x_validation, y_validation)
    knn = KNeighborsClassifier(n_neighbors=best_k)
    knn.fit(x_train, y_train)
    predictions = knn.predict(x_validation)
    accuracy = accuracy_score(y_validation, predictions)
    save_model(knn, "KNN")
    print("KNN:", accuracy)
    return accuracy, max_value

'''
https://www.cnblogs.com/en-heng/p/5013995.html
决策树学习的本质是从训练数据集中归纳出一组分类规则。但随着分裂属性次序的不同，所得到的决策树也会不同。
'''
def DecisionTree_Algorithms(x_train, x_validation, y_train, y_validation):
    # DecisionTree Algorithms
    all_mae_histories = []
    k = 10
    num_val_samples = len(x_train) // k
    for i in range(k):
        # 准备验证数据，第K个分区的数据
        val_data = x_train[i * num_val_samples: (i + 1) * num_val_samples]
        val_targets = y_train[i * num_val_samples: (i + 1) * num_val_samples]

        # 准备训练数据，其他所有分区的数据
        partial_train_data = np.concatenate(
            [x_train[:i * num_val_samples],
             x_train[(i + 1) * num_val_samples:]],
            axis=0)
        partial_train_targets = np.concatenate(
            [y_train[:i * num_val_samples],
             y_train[(i + 1) * num_val_samples:]],
            axis=0)
        # 构建 Keras 模型
        dtc = DecisionTreeClassifier()
        # 训练模式
        dtc.fit(partial_train_data, partial_train_targets)
        predictions = dtc.predict(val_data)
        accuracy_aux = accuracy_score(val_targets, predictions)
        all_mae_histories.append(accuracy_aux)
    # K折验证分数平均,没有使用
    average_mae_history = np.mean(all_mae_histories)

    predictions = dtc.predict(x_validation)
    accuracy = accuracy_score(y_validation, predictions)
    save_model(dtc, "DecisionTree")
    print("DecisionTree:", accuracy)
    return accuracy, average_mae_history

'''
https://www.cnblogs.com/noluye/p/11246251.html
训练MLP（多层感知器分类器）的算法是后馈训练算法（backpropagation training algorithm）。
后馈训练算法也就是使用反向自动求导（reverse-mode autodiff）的梯度下降法。
1. 前馈：在每个连接层计算每个神经元的输出。
2. 计算网络的输出误差，并且计算最后一层的每个神经元对于误差的贡献程度。
3. 继续计算上一层的每个神经元对于误差的贡献程度。
4. 直到算法到达输入层。
'''
def MLPClassifier_Algorithms(x_train, x_validation, y_train, y_validation):
    # MLPClassifier Algorithms
    seed = 7
    all_mae_histories = []
    k = 10
    num_val_samples = len(x_train) // k
    for i in range(k):
        # 准备验证数据，第K个分区的数据
        val_data = x_train[i * num_val_samples: (i + 1) * num_val_samples]
        val_targets = y_train[i * num_val_samples: (i + 1) * num_val_samples]

        # 准备训练数据，其他所有分区的数据
        partial_train_data = np.concatenate(
            [x_train[:i * num_val_samples],
             x_train[(i + 1) * num_val_samples:]],
            axis=0)
        partial_train_targets = np.concatenate(
            [y_train[:i * num_val_samples],
             y_train[(i + 1) * num_val_samples:]],
            axis=0)
        # 构建 Keras 模型
        mlp = MLPClassifier(random_state=seed, solver='lbfgs')
        # 训练模式
        mlp.fit(partial_train_data, partial_train_targets)
        predictions = mlp.predict(val_data)
        accuracy_aux = accuracy_score(val_targets, predictions)
        all_mae_histories.append(accuracy_aux)
    # K折验证分数平均,没有使用
    average_mae_history = np.mean(all_mae_histories)

    predictions = mlp.predict(x_validation)
    accuracy = accuracy_score(y_validation, predictions)
    save_model(mlp, "MLPClassifier")
    print("MLPClassifier:", accuracy)
    return accuracy, average_mae_history


'''
https://www.cnblogs.com/en-heng/p/5002753.html
朴素贝叶斯（Naive Bayes）属于监督学习的生成模型，实现简单，没有迭代，学习效率高，
在大样本量下会有较好的表现。但因为假设太强——假设特征条件独立，在输入向量的特征条件有关联的场景下并不适用。
通过联合概率P(x,y)=P(x|y)P(y)建模，运用贝叶斯定理求解后验概率P(y|x)；将后验概率最大者对应的的类别作为预测类别。
'''
def NaiveBayes_Algorithms(x_train, x_validation, y_train, y_validation):
    # Naive Bayes Algorithms
    all_mae_histories = []
    k = 10
    num_val_samples = len(x_train) // k
    for i in range(k):
        # 准备验证数据，第K个分区的数据
        val_data = x_train[i * num_val_samples: (i + 1) * num_val_samples]
        val_targets = y_train[i * num_val_samples: (i + 1) * num_val_samples]

        # 准备训练数据，其他所有分区的数据
        partial_train_data = np.concatenate(
            [x_train[:i * num_val_samples],
             x_train[(i + 1) * num_val_samples:]],
            axis=0)
        partial_train_targets = np.concatenate(
            [y_train[:i * num_val_samples],
             y_train[(i + 1) * num_val_samples:]],
            axis=0)
        # 构建 Keras 模型
        nb = GaussianNB()
        # 训练模式
        nb.fit(partial_train_data, partial_train_targets)
        predictions = nb.predict(val_data)
        accuracy_aux = accuracy_score(val_targets, predictions)
        all_mae_histories.append(accuracy_aux)
    # K折验证分数平均,没有使用
    average_mae_history = np.mean(all_mae_histories)

    predictions = nb.predict(x_validation)
    accuracy = accuracy_score(y_validation, predictions)
    save_model(nb, "NaiveBayes")
    print("Naive Bayes:", accuracy)
    return accuracy, average_mae_history

'''
https://www.cnblogs.com/en-heng/p/5965438.html
通过空间变换ϕ（一般是低维空间映射到高维空间x→ϕ(x)）后实现线性可分
'''
def SVM_Algorithms(x_train, x_validation, y_train, y_validation):
    # SVM Algorithms
    all_mae_histories = []
    k = 10
    num_val_samples = len(x_train) // k
    for i in range(k):
        # 准备验证数据，第K个分区的数据
        val_data = x_train[i * num_val_samples: (i + 1) * num_val_samples]
        val_targets = y_train[i * num_val_samples: (i + 1) * num_val_samples]

        # 准备训练数据，其他所有分区的数据
        partial_train_data = np.concatenate(
            [x_train[:i * num_val_samples],
             x_train[(i + 1) * num_val_samples:]],
            axis=0)
        partial_train_targets = np.concatenate(
            [y_train[:i * num_val_samples],
             y_train[(i + 1) * num_val_samples:]],
            axis=0)
        # 构建 Keras 模型
        svc = SVC(kernel='poly', gamma="auto")
        # 训练模式
        svc.fit(partial_train_data, partial_train_targets)
        predictions = svc.predict(val_data)
        accuracy_aux = accuracy_score(val_targets, predictions)
        all_mae_histories.append(accuracy_aux)
    # K折验证分数平均,没有使用
    average_mae_history = np.mean(all_mae_histories)

    predictions = svc.predict(x_validation)
    accuracy = accuracy_score(y_validation, predictions)
    save_model(svc, "SVM")
    print("SVM:", accuracy)
    return accuracy, average_mae_history


def RandomForestClassifier_Algorithms(x_train, x_validation, y_train, y_validation):
    # SVM Algorithms
    all_mae_histories = []
    k = 10
    num_val_samples = len(x_train) // k
    for i in range(k):
        # 准备验证数据，第K个分区的数据
        val_data = x_train[i * num_val_samples: (i + 1) * num_val_samples]
        val_targets = y_train[i * num_val_samples: (i + 1) * num_val_samples]

        # 准备训练数据，其他所有分区的数据
        partial_train_data = np.concatenate(
            [x_train[:i * num_val_samples],
             x_train[(i + 1) * num_val_samples:]],
            axis=0)
        partial_train_targets = np.concatenate(
            [y_train[:i * num_val_samples],
             y_train[(i + 1) * num_val_samples:]],
            axis=0)
        # 构建 Keras 模型
        rf = RandomForestClassifier(n_estimators=10, max_depth=10)
        # 训练模式
        rf.fit(partial_train_data, partial_train_targets)
        predictions = rf.predict(val_data)
        accuracy_aux = accuracy_score(val_targets, predictions)
        all_mae_histories.append(accuracy_aux)
    # K折验证分数平均,没有使用
    average_mae_history = np.mean(all_mae_histories)

    predictions = rf.predict(x_validation)
    accuracy = accuracy_score(y_validation, predictions)
    save_model(rf, "RandomForestClassifier")
    print("RandomForestClassifier:", accuracy)
    return accuracy, average_mae_history


def Bagging_Algorithms(x_train, x_validation, y_train, y_validation):
    # Naive Bayes Algorithms
    all_mae_histories = []
    k = 10
    num_val_samples = len(x_train) // k
    for i in range(k):
        # 准备验证数据，第K个分区的数据
        val_data = x_train[i * num_val_samples: (i + 1) * num_val_samples]
        val_targets = y_train[i * num_val_samples: (i + 1) * num_val_samples]

        # 准备训练数据，其他所有分区的数据
        partial_train_data = np.concatenate(
            [x_train[:i * num_val_samples],
             x_train[(i + 1) * num_val_samples:]],
            axis=0)
        partial_train_targets = np.concatenate(
            [y_train[:i * num_val_samples],
             y_train[(i + 1) * num_val_samples:]],
            axis=0)
        # 构建 Keras 模型
        clfb = BaggingClassifier(base_estimator=DecisionTreeClassifier()
                                 , max_samples=0.5, max_features=0.5)
        # 训练模式
        clfb.fit(partial_train_data, partial_train_targets)
        predictions = clfb.predict(val_data)
        accuracy_aux = accuracy_score(val_targets, predictions)
        all_mae_histories.append(accuracy_aux)
    # K折验证分数平均,没有使用
    average_mae_history = np.mean(all_mae_histories)

    predictions = clfb.predict(x_validation)
    accuracy = accuracy_score(y_validation, predictions)
    save_model(clfb, "Bagging")
    print("Bagging:", accuracy)
    return accuracy, average_mae_history


def choose_best_k_to_knn(x_train, y_train, x_validation, y_validation):
    all_mae_histories = []
    accuracy = 0
    k = 1
    for i in range(1, 30):
        average_mae_history = K_vertify_knn(x_train, y_train, i)
        all_mae_histories.append(average_mae_history)
    index = -1
    max_value = -999

    # 可视化画图部分
    # plt.plot(range(1, len(all_mae_histories) + 1), all_mae_histories)
    # plt.xlabel('k value')
    # plt.ylabel('grade')
    # plt.show()

    for i, val in enumerate(all_mae_histories):
        if max_value < val:
            index = i
            max_value = val
    return index, max_value


def K_vertify_knn(train_data, train_targets, knnnumber):
    # K折验证，适用于数据集较少的数据集
    all_mae_histories = []
    k = 10
    num_val_samples = len(train_data) // k
    for i in range(k):
        # 准备验证数据，第K个分区的数据
        val_data = train_data[i * num_val_samples: (i + 1) * num_val_samples]
        val_targets = train_targets[i * num_val_samples: (i + 1) * num_val_samples]

        # 准备训练数据，其他所有分区的数据
        partial_train_data = np.concatenate(
            [train_data[:i * num_val_samples],
             train_data[(i + 1) * num_val_samples:]],
            axis=0)
        partial_train_targets = np.concatenate(
            [train_targets[:i * num_val_samples],
             train_targets[(i + 1) * num_val_samples:]],
            axis=0)
        # 构建 Keras 模型
        knn = KNeighborsClassifier(n_neighbors=knnnumber)
        # 训练模式
        knn.fit(partial_train_data, partial_train_targets)
        predictions = knn.predict(val_data)
        accuracy_aux = accuracy_score(val_targets, predictions)
        all_mae_histories.append(accuracy_aux)
    # K折验证分数平均
    average_mae_history = np.mean(all_mae_histories)
    return average_mae_history


def save_model(model_temp, model_name):
    dirs = "testModel"
    if not os.path.exists(dirs):
        os.makedirs(dirs)
    joblib.dump(model_temp, dirs + "/" + model_name)


all_Algorithms()