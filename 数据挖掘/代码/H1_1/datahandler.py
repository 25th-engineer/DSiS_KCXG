# -*- coding: utf-8 -*-

import pandas as pd
import numpy as np
# from sklearn.preprocessing import Imputer
from sklearn.impute import SimpleImputer
names = ['Class', 'date', 'plant-stand', 'precip', 'temp', 'hail', 'crop-hist', 'area-damaged',
         'severity', 'seed-tmt', 'germination', 'plant-growth',
         'leaves', 'leafspots-halo', 'leafspots-marg', 'leafspot-size', 'leaf-shread', 'leaf-malf',
         'leaf-mild', 'stem', 'lodging', 'stem-cankers', 'canker-lesion', 'fruiting-bodies',
         'external decay', 'mycelium', 'int-discolor', 'sclerotia', 'fruit-pods', 'fruit spots',
         'seed', 'mold-growth', 'seed-discolor', 'seed-size', 'shriveling', 'roots']


def load_data_set_train():
    url = "data/soybean-large.data"

    dataset = pd.read_csv(url, names=names)
    dataset = dataset.replace({'?': np.nan})
    for item in dataset.columns.values:
        drop_col(dataset, item, cutoff=0.8)
    df1 = dataset.iloc[:, 1:]
    df2 = dataset.iloc[:, :1]
    # imr = Imputer(missing_values='NaN', strategy='most_frequent', axis=0)
    imr = SimpleImputer(strategy='most_frequent')
    imr = imr.fit(df1)
    imputed_data = imr.transform(df1.values)
    df = pd.DataFrame(imputed_data)
    df = pd.concat([df2, df], axis=1)
    return df


def load_data_set_test(df_col_mean):
    url = "data/soybean-large.data"

    dataset = pd.read_csv(url, names=names)
    dataset = dataset.replace({'?': np.nan})

    dictionary = {}
    for i in range(1, len(df_col_mean)):
        dictionary[i] = df_col_mean
    dataset.fillna(dictionary)

    df1 = dataset.iloc[:, 1:]
    df2 = dataset.iloc[:, :1]
    # imr = Imputer(missing_values='NaN', strategy='most_frequent', axis=0)
    imr = SimpleImputer(strategy='most_frequent')
    imr = imr.fit(df1)
    imputed_data = imr.transform(df1.values)
    df = pd.DataFrame(imputed_data)
    df = pd.concat([df2, df], axis=1)
    return df


# 剔除缺失值大于90%的列
def drop_col(df, col_name, cutoff=0.9):
    n = len(df)
    cnt = df[col_name].count()
    if (float(cnt) / n) < cutoff:
        df.drop(col_name, axis=1, inplace=True)