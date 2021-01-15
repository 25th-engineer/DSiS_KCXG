# -*- coding: utf-8 -*-
# -*- coding: utf-8 -*-
import matplotlib.pyplot as plt
import numpy as np
# from sklearn.externals import joblib
import joblib
from soybean_classification import accuracy_score, all_Algorithms
from datahandler import load_data_set_test
from matplotlib.font_manager import FontProperties


def showbar(all_algorithms_name, all_algorithms_score, all_algorithms_score_avg):
    font = FontProperties(fname=r"C:\Windows\Fonts\simhei.ttf", size=14)
    x = np.arange(7)
    all_algorithms_score_avg = [-l for l in all_algorithms_score_avg]
    plt.bar(x, all_algorithms_score, width=0.3, label="vaildate_score")
    plt.bar(x, all_algorithms_score_avg, width=0.3, label="avg_score")
    plt.legend(bbox_to_anchor=(1.01, 1),
               ncol=1,
               mode="None",
               borderaxespad=0,
               shadow=False,
               fancybox=True)
    plt.xticks(np.arange(7), all_algorithms_name, rotation=90)  # rotation控制倾斜角度
    plt.xlabel(u'algorithms', FontProperties=font)
    plt.ylabel(u'score', FontProperties=font)
    plt.title(u'算法结果', FontProperties=font)
    plt.savefig('t1.png')
    plt.show()


def get_maxalgorithms(all_algorithms_name, all_algorithms_score):
    max_index = -1
    max_value = -999
    for i in all_algorithms_score:
        if max_value < i:
            max_index = all_algorithms_score.index(i)
            max_value = i
    return max_value, all_algorithms_name[max_index]


# 加载训练的模型，进行测试
def test_algorithms(test_x, test_y, model_name):
    dirs = "./testModel"
    model_temp = joblib.load(dirs + "/" + model_name)
    predictions = model_temp.predict(test_x)
    accuracy = accuracy_score(test_y, predictions)
    print("准确度:", accuracy)


if __name__ == '__main__':

    all_algorithms_name, all_algorithms_score, all_algorithms_score_avg, df_name, df_col_mean = all_Algorithms()

    showbar(all_algorithms_name, all_algorithms_score, all_algorithms_score_avg)
    accuracy, algorithm_chosen = get_maxalgorithms(all_algorithms_name, all_algorithms_score)

    print("\n最佳算法: " + algorithm_chosen)
    print("准确度: %f" % accuracy)

    # 使用做好的乱模型测试
    print("\n测试部分:")
    print("选择算法:", algorithm_chosen)
    df_test = load_data_set_test(df_col_mean)
    for item in list(df_test):
        if (item not in df_name):
            df_test.drop(item, axis=1, inplace=True)
    array = df_test.values
    x = array[:, 1:len(list(df_test)) - 1]
    y = array[:, 0]
    test_algorithms(x, y, algorithm_chosen)