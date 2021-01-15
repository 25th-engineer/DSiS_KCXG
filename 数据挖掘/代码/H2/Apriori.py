"""
@author xch
"""

import pandas


def obtain_dataset():
    """
    获取数据集
    :return: data
        list, 每个元素是一个交易行为:transaction(set), set中是购买的商品
    """

    data = pandas.read_csv('Data/groceries.csv', header=None, delimiter="\t")
    data = [set(d[0].split(",")) for d in data.values]

    return data


def create_single_item_set(data):
    """
    生成所有单个商品组成的列表
    :param data:
        list, 数据集
    :return: c1
        set, 单个商品组成的集合
    """

    c1 = []
    for transaction in data:
        for item in transaction:
            if item not in c1:
                c1.append(item)

    c1.sort()
    c1 = [{item} for item in c1]
    return c1


def scan(data, ck, min_support, frequent_item_dict):
    """
    在数据集里扫描查找集的支持度, 与最小支持度比较, 并更新频繁项集
    :param data:
        list, 数据集
    :param ck:
        list, 查找集
    :param min_support:
        float, 最小支持度
    :return:
        1. l_set
            list, 这一层的频繁项集
        2. 更新frequent_item_dict
    """
    # 定义一个集合, 返回这一层的频繁项集
    l_set = []

    num_of_transaction = len(data)
    for find in ck:
        # 记录出现次数
        cnt = 0
        for transaction in data:
            if find.issubset(transaction):
                cnt += 1
        # 计算支持度
        support = cnt/num_of_transaction
        # 比较支持度
        if support >= min_support:
            l_set.append(find)
            # 更新
            frequent_item_dict[frozenset(find)] = support

    return l_set


def apriori_generate_next(parent, k):
    """
    生成parent列表中的每个集合(均有k-1个元素)的含有k个元素的并集
    :param parent:
        list, 上一层的频繁项集
    :param k:
        int, 层数
    :return: son
        list, 下一层的候选的频繁项集
    """
    son = []
    for i in range(len(parent)):
        for j in range(i+1, len(parent)):
            # 如果他们的前k-2个元素相同, 则只有一个元素不相同
            si, sj = list(parent[i])[:k-2], list(parent[j])[:k-2]
            si.sort()
            sj.sort()
            if si == sj:
                son.append(parent[i] | parent[j])

    return son



def obtain_frequent_item_sets(data, min_support):
    """
    获取dataset的频繁项集
    :param data
        list, 数据集: 每个元素是一个交易行为:transaction(set), set中是购买的商品
    :param min_support
        float, 最小支持度
    :return: frequent_item_dict
                dict, 频繁项集, {某种交易的商品组合: 其支持度}
    """

    # 返回值预定义
    frequent_item_dict = dict()

    # 所有单个商品构成的集合
    c1 = create_single_item_set(data)

    # 第一次扫描（本次扫描单个元素的集合）
    L1 = scan(data, c1, min_support, frequent_item_dict)

    # 用一个list记录每一层的频繁项集
    L = [[], L1]

    # 第k=2,...,n次循环（本次扫描k个元素的集合）
    k = 2
    while(len(L[k-1])>0):
        ck = apriori_generate_next(L[k-1], k)
        L.append(scan(data, ck, min_support, frequent_item_dict))
        k += 1

    return frequent_item_dict


def obtain_association_rules(data, frequent_item_dict, min_conf):
    """
    基于dataset的支持度获取关联规则
    :param data:
        list, 数据集: 每个元素是一个交易行为:transaction(set), set中是购买的商品
    :param frequent_item_dict:
        dict, {某种交易的商品组合: 其支持度}
    :param min_conf:
        float, 最小置信度
    :return: rules_dict
        dict, {'from':A, 'to':B, 'support':support, 'conf':confidence, 'lift':lift} # P(B|A)=P(AB)/P(A)
        support = P(AB), confidence = P(B|A), lift=P(AB)/p(A)/P(B)
    """

    rules_dict = []

    for items in frequent_item_dict:
        # 该集合的元素个数
        items_cnt = len(items)

        # 只处理含有2个及以上的商品组合
        if items_cnt < 2:
            continue

        for itemA in frequent_item_dict:
            # 这个子集的元素个数
            itemA_cnt = len(itemA)
            if itemA_cnt >= items_cnt or 2*itemA_cnt < items_cnt:
                continue
            if not itemA.issubset(items):
                continue
            # P(B|A)=P(AB)/P(A)
            confidence = frequent_item_dict[items]/frequent_item_dict[itemA]
            lift = frequent_item_dict[items]/frequent_item_dict[itemA]/frequent_item_dict[items-itemA]
            if confidence >= min_conf and lift >= 1:
                # print(itemA, '-->', items-itemA, 'conf:', confidence)
                A = [x for x in itemA]
                B = [x for x in items-itemA]
                rules_dict.append({'from': A, 'to': B, 'support': frequent_item_dict[items], 'conf': confidence, 'lift': lift})

    return {'rules': rules_dict}


if __name__ == '__main__':
    # 1. 获取数据集
    dataset = obtain_dataset()
    min_support = 0.015 #0.006
    min_conf = 0.1 #0.25

    # 2. 获取频繁项集
    frequent_item_dict = obtain_frequent_item_sets(dataset, min_support=0.006)

    print("最小支持度:", min_support, "含有频繁项集共", len(frequent_item_dict), "个")

    # 3. 获取关联规则
    rules_dict = obtain_association_rules(dataset, frequent_item_dict, min_conf=0.25)

    print("最小置信度:", min_conf, "挖掘出关联规则共", len(rules_dict['rules']), "条")

    # 4. 保存关联规则
    import json
    with open('result.json', 'w') as fw:
        json.dump(rules_dict, fw)
        fw.close()