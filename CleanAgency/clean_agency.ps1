## Configuration: Start

$max_distance_percent = 15
$distance_counter = "D:\Laboratory\GitHub\datalab\datalab\CleanAgency\get-ld.ps1"
$agency_file = "D:\Laboratory\GitHub\datalab\datalab\CleanAgency\agency_nm"
$stopwords_location = "D:\Laboratory\GitHub\datalab\datalab\CleanAgency\stopwords.txt"

## Configuration: End

$agency_list = {(gc $agency_file) -split '#'}.Invoke()
$stopwords = (gc $stopwords_location)
$agency_map = @{}

function Remove-StopWords([string]$name, $stopwords)
{
    $new_name = $name.ToLower()

    foreach($word in $stopwords)
    {
        $new_name = $new_name.Replace($word.ToLower(), "")
    }

    return $new_name
}

while($agency_list.Count -gt 0)
{
    #$agency_list.Count
    $agency = $agency_list[0]
    [void]$agency_list.Remove($agency)

    [void]$agency_map.Add($agency, $agency)
    #$agency

    $agency_list2 = $agency_list | foreach{$_}
    $agency_list2 = {$agency_list2}.Invoke()

    $base_agency = Remove-StopWords $agency $stopwords
    $max_distance_step = [Math]::Round($base_agency.Length*($max_distance_percent/100))
    while($agency_list2.Count -gt 0)
    {
        $other_agency = Remove-StopWords $agency_list2[0] $stopwords


        if((&$distance_counter $other_agency $base_agency) -le $max_distance_step)
        {
            #$agency_list2[0]
            [void]$agency_map.Add($agency_list2[0], $agency)
            [void]$agency_list.Remove($agency_list2[0])
        }

        [void]$agency_list2.Remove($agency_list2[0])
    }
}

$agency_map.GetEnumerator() | sort Name | select @{Label="Agency_Name";Expression={$_.Name}}, @{Label="Common_Name";Expression={$_.Value}}|Export-Csv "agency_to_commonname_mapping.csv" -NoTypeInformation
$agency_map.GetEnumerator() | sort Value | select Value -Unique | %{$_.Value} | Out-File "unique_agency_names.txt"
