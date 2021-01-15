import csv
import numpy
import time
from apyori import apriori

FILENAME = 'Data/Groceries_data.csv'
DATA = []
MIN_SUPPORT = 0.001 #0.01, 0.001
MIN_LIFT = 3


def readfile(filename):
    with open(filename, newline='') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
        for row in spamreader:
            DATA.append(row)


def apriori_analysis(data, min_support, min_confidence, min_lift):
    association_rules = apriori(data, min_support=min_support, min_confidence=min_confidence, min_lift=min_lift)
    association_results = list(association_rules)
    return association_results


def print_result(association_results):
    for item in association_results:
        pair = item[0]
        items = [x for x in pair]
        print("Frequent Set: ", ",".join(item.items))
        print("Rule: " + items[0] + " -> " + items[1])
        print("Support: ", item[1])
        print("Confidence: ", item[2][0][2])
        print("Lift: ", item[2][0][3])
        print("=====================================")


def main():
    readfile(FILENAME)
    for min_confidence in numpy.arange(0.1, 0.4, 0.05):
        start_time = time.time()
        print("#################################################")
        result = apriori_analysis(DATA, MIN_SUPPORT, min_confidence, MIN_LIFT)
        print_result(result)
        end_time = time.time()
        relation_record_num = len(result)
        _time = end_time - start_time
        print("**** Current min_support:", MIN_SUPPORT, "Current min_confidence:", min_confidence, " ****")
        print("**** Number of RelationRecord: ", str(relation_record_num), " Time: ",
              str(_time), " Efficiency: ", str(relation_record_num/_time), " ****")


if __name__ == '__main__':
    main()