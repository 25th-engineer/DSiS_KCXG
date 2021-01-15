# -*- coding: utf-8 -*-
"""
Description:
Brute force item set mining: Market basket analysis
@title: Market Basket Analysis: Movies
@author: Adwan Salahuddin Syed, 100525709
@email: adwan.syed@uoit.net
"""

# Import libraries
import time


def frequentTriples(dataset, tHold):
    """
    frequentTriples(dataset, tHold)

    This function finds frequent triples with minimum support threshold.
    Time taken in seconds for frequent triples: 0.12496328353881836

    @arg dataset    Dataset being investigated
    @arg tHold      Minimum support threshold

    @return frequent triples in dataset
    """

    myFile = open(dataset)

    # Key = 'item,item,item,...'
    # triplesTable[Key] = # of times seen
    triplesTable = {}

    # lines:
    # [
    #   '1 2 3 \n'
    #   '4 2 1 \n'
    #   ...
    # ]
    lines = myFile.readlines()

    for line in lines:
        for item1 in line.split():
            for item2 in line.split():
                for item3 in line.split():
                    if (item1 < item2 and item2 < item3):
                        if (item1 + ',' + item2 + ',' + item3) not in triplesTable:
                            triplesTable[item1 + ',' + item2 + ',' + item3] = 1
                        else:
                            triplesTable[item1 + ',' + item2 + ',' + item3] += 1

    # ordered:
    # [
    #   [ 54 , '39,5,3' ]
    #   [ 37 , '8,21,2' ]
    #   ...
    # ]
    ordered = []
    for i in triplesTable:
        if triplesTable[i] > (len(lines) * tHold):
            ordered.append([triplesTable[i], i])
    ordered.sort(reverse=True)

    tot = 0
    for i in ordered:
        tot += 1
        print(tot, ')', i[1], ':', i[0])


def frequentDoubles(dataset, tHold):
    """
    frequentDoubles(dataset, tHold)

    This function finds frequent doubles with minimum support threshold.
    Time taken in seconds for frequent doubles: 0.09378218650817871

    @arg dataset    Dataset being investigated
    @arg tHold      Minimum support threshold

    @return frequent pairs in dataset
    """

    myFile = open(dataset)

    # Key = 'item,item,item,...'
    # pairsTable[Key] = # of times seen
    pairsTable = {}

    # lines:
    # [
    #   '1 2 3 \n'
    #   '4 2 1 \n'
    #   ...
    # ]
    lines = myFile.readlines()

    pairsTable = {}
    for line in lines:
        for item1 in line.split():
            for item2 in line.split():
                if (item1 < item2):
                    if (item1 + ',' + item2) not in pairsTable:
                        pairsTable[item1 + ',' + item2] = 1
                    else:
                        pairsTable[item1 + ',' + item2] += 1

    # ordered:
    # [
    #   [ 54 , '39,5' ]
    #   [ 37 , '8,21' ]
    #   ...
    # ]
    ordered2 = []
    for i in pairsTable:
        if pairsTable[i] > (len(lines) * tHold):
            ordered2.append([pairsTable[i], i])
    ordered2.sort(reverse=True)

    tot = 0
    for i in ordered2:
        tot += 1
        print(tot, ')', i[1], ':', i[0])


# -------------------------------------------------------------------------------

print('------------------------------------------------------------------------')
print('Running...')
print('Done!')

threshold = 0.03  # minimum support threshold

# Start the clock
start = time.time()
frequentDoubles('Data/Groceries.csv', threshold)
end = time.time()

print('Time taken in seconds for frequent doubles:', end - start)
print('Done!')

print('------------------------------------------------------------------------')
print('Running...')
print('Done!')

# Start the clock
start = time.time()
frequentTriples('Data/Groceries.csv', threshold)
end = time.time()

print('Time taken in seconds for frequent triples:', end - start)
print('Done!')