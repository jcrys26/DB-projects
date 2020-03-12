YouTube2 Data Set	
Download: Dataset
Abstract: YouTube is a video-sharing website on which users can upload, share, and view videos. Both the contact network and selected group membership information are included.
Number of Nodes:	1138499	Number of Edges:	2990443	Missing Values?	no
Source:
Lei Tang*, Huan Liu*

* School of Computing, Informatics and Decision Systems Engineering, Arizona State University. E-mail: l.tang@asu.edu, huan.liu@asu.edu
Data Set Information:
4 files are included:

1. nodes.csv
-- it's the file of all the users. This file works as a dictionary of all the users in this data set. It's useful for fast reference. It contains
all the node ids used in the dataset

2. groups.csv
-- it's the file of all the groups. It contains all the group ids used in the dataset

3. edges.csv
-- this is the friendship network among the users. The user's friends are represented using edges.
Since the network is symmetric, each edge is represented only once. Here is an example.

1,2

This means user with id "1" is friend with user id "2".

4. group-edges.csv
-- the user-group membership. In each line, the first entry represents user, and the 2nd entry is the group index.

If you need to know more details, please check the relevant papers and code:
http://www.public.asu.edu/~ltang9/social_dimension.html
Attribute Information:
This is the data set crawled from YouTube ( http://www.youtube.com ). YouTube is a video-sharing website on which users can upload, share, and view videos.
This contains the friendship network crawled and group memberships. For easier understanding, all the contents are organized in CSV file format.

-. Basic statistics
Number of users : 1,138,499
Number of friendship pairs: 2,990,443
Number of groups: 47
Relevant Papers:
1. Lei Tang and Huan Liu. Relational Learning via Latent Social Dimensions. In Proceedings of The 15th ACM SIGKDD Conference on Knowledge Discovery and Data Mining (KDD’09), Pages 817–826, 2009.

2. Lei Tang and Huan Liu. Scalable Learning of Collective Behavior based on Sparse Social Dimensions. In Proceedings of the 18th ACM Conference on Information and Knowledge Management (CIKM’09), 2009.
Citation Request:
Please refer to the Social Computing Data Repository's citation policy

From <http://socialcomputing.asu.edu/datasets/YouTube2> 
