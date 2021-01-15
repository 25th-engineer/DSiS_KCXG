# Zhu Lei
# e0203764@u.nus.edu


In this task you will need to implement the DBSCAN algorithm to do clustering.


Things to do:
=============================================================================================================
Please implement the following functions in the dbscan-template.py file:

	def dbscan(X, eps, minpts):
	'''dbscan function for clustering
	Args:
		X (numpy.ndarray): a numpy array of points with dimension (n, d) where n is the number of points and d is the dimension of the data points
		eps (float): eps specifies the maximum distance between two samples for them to be considered as in the same neighborhood
		minpts (int): minpts is the number of samples in a neighborhood for a point to be considered as a core point. This includes the point itself.
	
	Returns:
		list: The output is a list of two lists, the first list contains the cluster label of each point, where -1 means that point is a noise point, the second list contains the indexes of the core points from the X array.
	
	Example:
		Input: X = np.array([[-10.1,-20.3], [2.0, 1.5], [4.3, 4.4], [4.3, 4.6], [4.3, 4.5], [2.0, 1.6], [2.0, 1.4]]), eps = 0.1, minpts = 3
		Output: [[-1, 1, 0, 0, 0, 1, 1], [1, 4]]
		The meaning of the output is as follows: the first list from the output tells us: X[0] is a noise point, X[1],X[5],X[6] belong to cluster 1 and X[2],X[3],X[4] belong to cluster 0; the second list tell us X[1] and X[4] are the only two core points

	'''

Notice: 
1. there is no requirement on the integer you use to represent each clusters as long as different clusters have different numbers
=============================================================================================================




Dataset:
=============================================================================================================
There are two datasets in the .\Data folder, namely data_1.txt and data_2.txt. data_1.txt contains 750 2D data points and data_2.txt contains 1050 2D points. You are encouraged to create your own dataset to test your algorithm. For testing, we will use other datasets to test your code.
=============================================================================================================




Command for execution:
=============================================================================================================
The template currently support the following commands:

	python dbscan-template.py data_filepath eps minpts

This command run the dbscan on the data points stored in the file specified by the data_filepath with a float number specifies eps and an integer specifies the minpts. If the dimension of the data points is 2, the a plot with the filename "cluster-result.png" of the data points will be saved in the .\Output folder, otherwise no plot will be saved.

Examples of the commands can be:
	
	python dbscan-template.py .\Data\data_1.txt 0.3 10
	python dbscan-template.py .\Data\data_2.txt 0.2 10

Notice: The side effect of running these two commands is that we will store the results output by your functions into labels.txt and core_sample_indexes.txt in the .\Output folder, this enable us to automatically check the correctness of your implementation on different datasets.
=============================================================================================================




Output folder:
=============================================================================================================
There are two files which are created as side effects of execution the template file on your function, that is the labels.txt file and core_sample_indexes.txt file. These two files stores the cluster labels and the core sample indexes returned by your dbscan() function. If you want to write your own template, you need to implement this side effects too and following the format of the output files, as we will use these two generated files to check the correctness of your implementation.
=============================================================================================================




Test Result folder:
=============================================================================================================
The Test Result folder contains the output files from running the completed (correct) program using the following commands. After implementing the code, you should get the same results as in these files if you run the following commands:


data_1_labels.txt contains the cluster labels by running the command "python dbscan-template.py .\Data\data_1.txt 0.3 10"

data_1_core_sample_indexes.txt contains the indexes of core samples by running the command "python dbscan-template.py .\Data\data_1.txt 0.3 10"

data_1_cluster-result.png is the output plot by running the command "python dbscan-template.py .\Data\data_1.txt 0.3 10"

data_2_labels.txt contains the cluster labels by running the command "python dbscan-template.py .\Data\data_2.txt 0.2 10"

data_2_core_sample_indexes.txt contains the indexes of core samples by running the command "python dbscan-template.py .\Data\data_2.txt 0.2 10"

data_2_cluster-result.png is the output plot by running the command "python dbscan-template.py .\Data\data_2.txt 0.2 10"


You are welcomed to use the data_1.txt and data_2.txt to create your own output labels.txt file, core_sample_indexes.txt file and cluster-result.png plot with the corresponding eps and minpts parameters and publish it in the forum to help yourself and your classmates to check the correctness of their implementation.
=============================================================================================================




Free Policy:
=============================================================================================================
If you find the template is not suitable for your implementation, you are free to modify it or write your own template. However, for this part of project, you will need to make sure that your template can accept the same command and the side effects of storing the results into the labels.txt and core_sample_indexes.txt file should be the same as our template when executing the commands. And finally the format of the output in these two files should be the same as our template. You should be warned that you are responsible for any kinds of errors may encounter when we ran your code. And if your code can not run according to our requirement, corresponding marks will be deducted from you.
=============================================================================================================