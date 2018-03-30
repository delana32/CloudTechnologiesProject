# Cloud Technologies Project
This is the GitHub site for our Cloud Technologies Project.

This project aims to use Pig and Hive to parse Kickstarter Data.
The data can be found at https://webrobots.io/kickstarter-datasets/.
I have downloaded the most recent file in csv format. Some of the fields are in json but these have been treated in the Pig file to only pull the most relevant value. Note that to convert these json fields to normal text, I used a jar called JsonStringToMap to convert the json string to a pig map datatype. I have put the jar in the folder above. Just download the jar and put it in the /usr/local/pig/lib/ folder or wherever your pig installation is. Then the script should work successfully.

Note that to create the Pig Script, I only ran it for the first 4 records of the first file. It's working fine for these so hopefully it will work ok for the rest. 
I'll check this later on.
I haven't kept all of the fields that is in the original dataset as I didn't think they were all needed. Let me now if I have left any out that I shouldn't have. 

Let me know if you have any questions about anything, or if you want to continue with the Kaggle dataset.



