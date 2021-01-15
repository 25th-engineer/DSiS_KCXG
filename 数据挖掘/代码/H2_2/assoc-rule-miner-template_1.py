import sys
import os
import math
import itertools

def read_csv(filepath):
	'''Read transactions from csv_file specified by filepath
	Args:
			filepath (str): the path to the file to be read

	Returns:
			list: a list of lists, where each component list is a list of string representing a transaction

	'''

	transactions = []
	with open(filepath, 'r') as f:
		lines = f.readlines()
		for line in lines:
			transactions.append(line.strip().split(',')[:-1])
	return transactions

def generateItemSetWithMinSup(transactionsListSet, itemLists, minsup):
	result = list()
	for itemList in itemLists:
		count = 0
		for transaction in transactionsListSet:
			if all(elem in transaction for elem in itemList):
				count = count+1
		if count/len(transactionsListSet) >= minsup:
			itemList.sort()
			result.append(itemList)
	return result

def generateCandiateSet(frequentItemLists, length):
	candiate = []
	numbers = len(frequentItemLists)
	if length == 2:
		for i in range(numbers -1):
			for j in range(i+1,numbers):
				c = []
				c.append(frequentItemLists[i][0])
				c.append(frequentItemLists[j][0])
				c.sort()
				candiate.append(c)
		return candiate

	for first in range(numbers-1):
		for second in range(first + 1, numbers):
			list1 = frequentItemLists[first]
			list2 = frequentItemLists[second]
			c = []
			list1.sort()
			list2.sort()
			isNeedMerge = True
			for i in range(length - 2):
				if list1[i] != list2[i]:
					isNeedMerge = False
					break
			if isNeedMerge:
				for item in list1:
					c.append(item)
				c.append(list2[length-2])
				c.sort()
			if c != []:
				candiate.append(c)
				c = []
	return candiate

# To be implemented
def generate_frequent_itemset(transactions, minsup):
	result = list()
	frequent_itemset = dict()
	transactionsListSet = list()
	itemSet = set()
	for transaction in transactions:
		transactionsListSet.append(transaction)
		for item in transaction:
			itemSet.add(item)
	temp_list = list()
	for item in itemSet:
		temp_list.append([item])
	one_item_frequentset = generateItemSetWithMinSup(transactionsListSet, temp_list, minsup)
	k = 1
	current_frequent_set = one_item_frequentset
	while len(current_frequent_set) != 0:
		frequent_itemset[k] = current_frequent_set
		for item in current_frequent_set:
			result.append(item)
		k = k+1
		candiateSet = generateCandiateSet(current_frequent_set, k)
		current_frequent_set = generateItemSetWithMinSup(transactionsListSet, candiateSet, minsup)
	return result



def findsubsets(originSet,subSetLength):
	return set(itertools.combinations(originSet,subSetLength))
# To be implemented
def generate_association_rules(transactions, minsup, minconf):
	'''Mine the association rules from transactions
	Args:
			transactions (list): a list of lists, where each component list is a list of string representing a transaction
			minsup (float): specifies the minsup for mining
			minconf (float): specifies the minconf for mining

	Returns:
			list: a list of association rule, each rule is represented as a list of string

	Example:
			Output: [['root vegetables', 'rolls/buns','=>', 'other vegetables'],['root vegetables', 'yogurt','=>','other vegetables']]
			The meaning of the output is as follows: {root vegetables, rolls/buns} => {other vegetables} and {root vegetables, yogurt} => {other vegetables} are the two associated rules found by the algorithm


	'''
	result = []
	frequentItemSet = generate_frequent_itemset(transactions,minsup)
	for item in frequentItemSet:
		count =  1
		length = len(item)
		while count < length:
			subsets = findsubsets(set(item),count)
			# need check all items subsets using confidence
			count = count +  1

			for subset in subsets:
				count_x = 0
				count_y = 0
				x = []
				y = []
				for element in subset:
					x.append(element)
				for transaction in transactions:
					if all(i in transaction for i in x):
						count_x = count_x + 1
					if all(i in transaction for i in item):
						count_y = count_y + 1
				if count_y >= minconf * count_x:
					for i in item:
						if i not in x:
							y.append(i)
					temp = list()
					for i in x:
						temp.append(i)
					temp.append('=>')
					for i in y:
						temp.append(i)
					result.append(temp)

	return result


def main():
	# this is for debug in ide
	#sys.argv = ['', 'C:\\Users\\anyone\\Desktop\\python\\data-mining\\Association Rule Mining\\Data\\test.csv', 0.02,0.1]
	if len(sys.argv) != 3 and len(sys.argv) != 4:
		print("Wrong command format, please follwoing the command format below:")
		print("python assoc-rule-miner-template.py csv_filepath minsup")
		print("python assoc-rule-miner-template.py csv_filepath minsup minconf")
		exit(0)

	if len(sys.argv) == 3:
		transactions = read_csv(sys.argv[1])
		result = generate_frequent_itemset(transactions, float(sys.argv[2]))

		# store frequent itemsets found by your algorithm for automatic marking
		with open('.'+os.sep+'Output_1'+os.sep+'frequent_itemset_result.txt', 'w') as f:
			for items in result:
				output_str = '{'
				for e in items:
					output_str += e
					output_str += ','

				output_str = output_str[:-1]
				output_str += '}\n'
				f.write(output_str)
	elif len(sys.argv) == 4:
		transactions = read_csv(sys.argv[1])
		minsup = float(sys.argv[2])
		minconf = float(sys.argv[3])
		result = generate_association_rules(transactions, minsup, minconf)

		# store associative rule found by your algorithm for automatic marking

		with open('.'+os.sep+'Output_1'+os.sep+'assoc-rule-result.txt', 'w') as f:
			for items in result:
				output_str = '{'
				for e in items:
					if e == '=>':
						output_str = output_str[:-1]
						output_str += '} => {'
					else:
						output_str += e
						output_str += ','

				output_str = output_str[:-1]
				output_str += '}\n'
				f.write(output_str)


main()
