## Consolidating Similar Names Using Powershell
The script makes use of Shappel's Powershell implementation of Levenshtein-Distance algorithm to find similarities between the names.
You can learn more about the Levenshtein-Distance implementation from this link:
http://www.codeproject.com/Tips/102192/Levenshtein-Distance-in-Windows-PowerShell

Similar names will be grouped into one.
For example:
The following:
* Justice League Agency 1
* Justice League Agency 10
* Justice League Agency 11
* Justice League Employment Agency 1
* Justice League Employment Agency 10
* Justice League Employment Agency 11
will just be group into: Justice League Agency 1
Justice League Agency 1 will be used since it's the first entry in the list.

### Script Usage
1. Copy the whole  CleanAgency folder to your local working directory
2. Open clean_agency.ps1 file in a text editor (e.g notepad)
Update to following parameters to ensure the path to your working directory:

*Configuration: Start*

$max_distance_percent = 15
$distance_counter = "D:\Laboratory\GitHub\datalab\datalab\CleanAgency\get-ld.ps1"
$agency_file = "D:\Laboratory\GitHub\datalab\datalab\CleanAgency\agency_nm"
$stopwords_location = "D:\Laboratory\GitHub\datalab\datalab\CleanAgency\stopwords.txt"

*Configuration: End*

$max_distance_percent - This is the percentage of the name to be considered as maximum distance (levenshtein). For example, if the name is "name", the length is 4 (characters). Therefore, 50% distance would be 2 characters. 
$distance_counter - This just points to the location of Shappel's levenshtein powershell script
$agency_file - This contains the list of agency names (this assumes that all lines are already unique)
$stopwords_location - This list words that won't be part of the comparison. e.g. agency, the

3. To run the script, just execute the following in powershell console:
.\clean_agency.ps1

4. Once the script completed execution, it will produce two files:
agency_to_commonname_mapping.csv - this contains all the names mapped to the decided common name
unique_agency_names.txt - this lists all the common names





