# Cloud Technologies Project
This is the GitHub site for our Cloud Technologies Project.

This project aims to use Pig and Hive to parse Kickstarter Data.
The data can be found at https://webrobots.io/kickstarter-datasets/.
I have downloaded the most recent file in csv format. There is a total of 195,614 records in this dataset. Some of the fields are in json but these have been treated in the Pig file to only pull the most relevant value. Note that to convert these json fields to normal text, I used a jar called JsonStringToMap to convert the json string to a pig map datatype. I have put the jar in the folder above. Just download the jar and put it in the /usr/local/pig/lib/ folder or wherever your pig installation is. Then the script should work successfully.

Let me know if you have any questions about anything, or if you want to continue with the Kaggle dataset.



