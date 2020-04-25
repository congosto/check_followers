# check_followers
Set of basic tools to check followers profile


## content

### link_datasets
Followers from popular users. For each analyzed user there are two files:
* user_follower_profiles.csv <- all profile data to calculate statistics with the script R followers_stats.R
* user_follwer_profiles_ff.csv <- The data required for the follower factory NYT chart

files are very large so a link to an external repository is provided

### images
Profile Statistics

### html 
 Html code to display the NYT follower factory graph
 code from http://github.com/elaineo/FollowerFactory
 
### scripts

*followers_stats.R: code in R to calculate the followers histograms 

*followers2ff.py:converts a t-hoarder_kit follower file to the format used in the NYT Followers Falacy chart. Usage

     followers2ff.py [-h] file_in net

*followers2csv.py: change format of t-hoarder_kit from tab separated text to csv to work better in R. Usage

     followers2csv.py [-h] file_in
