In this part, you are going to implement two functions to generate frequent itemsets and to mine the association rules from a list of transactions.


Things to do:
=============================================================================================================
Please implement the following functions in the assoc-rule-miner-template.py file:

	def generate_frequent_itemset(transactions, minsup):
	'''Generate the frequent itemsets from transactions
	Args:
		transactions (list): a list of lists, where each component list is a list of string representing a transaction
		minsup (float): specifies the minsup for mining

	Returns:
		list: a list of frequent itemsets and each itemset is represented as a list string

	Example:
		Output: [['margarine'], ['ready soups'], ['citrus fruit','semi-finished bread'], ['tropical fruit','yogurt','coffee'], ['whole milk']]
		The meaning of the output is as follows: itemset {margarine}, {ready soups}, {citrus fruit, semi-finished bread}, {tropical fruit, yogurt, coffee}, {whole milk} are all frequent itemset

	'''


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

Notice: 
1. there is no requirement on the order of the outputs from these two functions, the output list from these two functions can be any order.
2. you should remove trivial rules like "{} => {root vegetables}" and "{root vegetables} => {}" in the output of your function generate_association_rules()
=============================================================================================================




Dataset:
=============================================================================================================
There are two datasets in the .\Data folder, namely Groceries.csv and Groceries100.csv. Groceries.csv contains 9835 transactions and Groceries100.csv contains the top 100 transactions from Groceries.csv. You are encouraged to create your own dataset to test your algorithm. For testing, we will randomly select transactions from Groceries.csv to test your code.
=============================================================================================================




Command for execution:
=============================================================================================================
The template currently support the following two types of commands:

	python assoc-rule-miner-template.py csv_filepath minsup
	python assoc-rule-miner-template.py csv_filepath minsup minconf

The first command mines the frequent itemsets with minsup from the csv file specified by csv_filepath and the second command mines the association rules with minsup and minconf from the csv file specified by the csv_filepath.

Examples of the commands can be:
	
	python assoc-rule-miner-template.py .\Data\Groceries.csv 0.05
	python assoc-rule-miner-template.py .\Data\Groceries.csv 0.05 0.3

Notice: The side effect of running these two commands is that we will store the results output by your functions into frequent_itemset_result.txt and assoc-rule-result.txt in the .\Output folder, this enable us to automatically check the correctness of your implementation on different datasets.
=============================================================================================================




Output folder:
=============================================================================================================
There are two files which are created as side effects of execution the template file on your two functions, that is the frequent_itemset_result.txt file and assoc-rule-result.txt file. These two files stores the frequent itemset returned by your generate_frequent_itemset() function and the association rules returned by your generate_association_rules() function. If you want to write your own template, you need to implement this side effects too and following the format of the output files, as we will use these two generated files to check the correctness of your implementation.
=============================================================================================================




Test Result folder:
=============================================================================================================
The Test Result folder contains the output files from running the completed (correct) program using the following commands. After implementing the code, you should get the same results as in these files if you run the following commands:

Groceries100-association_rules-0.05-0.3.txt is the output assoc-rule-result.txt file for running command:
python assoc-rule-miner-template.py .\Data\Groceries100.csv 0.05 0.3

Groceries100-association_rules-0.05-0.5.txt is the output assoc-rule-result.txt file for running command:
python assoc-rule-miner-template.py .\Data\Groceries100.csv 0.05 0.5

Groceries100-frequent_itemset_0.1.txt is the output frequent_itemset_result.txt file for running command:
python assoc-rule-miner-template.py .\Data\Groceries100.csv 0.1

Groceries100-frequent_itemset_0.05.txt is the output frequent_itemset_result.txt file for running command:
python assoc-rule-miner-template.py .\Data\Groceries100.csv 0.05


You are welcomed to use the Groceries.csv to create your own output frequent_itemset_result.txt file and assoc-rule-result.txt file with the corresponding commands and publish it in the forum to help yourself and your classmates to check the correctness of their implementation.
=============================================================================================================




Free Policy:
=============================================================================================================
If you find the template is not suitable for your implementation, you are free to modify or write your own template. However, for this part of project, you will need to make sure that your template can accept the same two kinds of commands and the side effects of storing the results into the frequent_itemset_result.txt and assoc-rule-result.txt file should be the same as our template when executing the commands. And finally the format of the output in these two files should be the same as our template. You should be warned that you are responsible for any kinds of errors may encounter when we ran your code. And if your code can not run according to our requirement, corresponding marks will be deducted from you.
=============================================================================================================