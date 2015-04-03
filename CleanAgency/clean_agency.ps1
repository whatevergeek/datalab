$agency_list = {(gc agency_nm) -split '#'}.Invoke()
$agency_map = @{}

while($agency_list.Count -gt 0)
{
    $agency_list.Count
    $agency = $agency_list[0]
    [void]$agency_list.Remove($agency)

    [void]$agency_map.Add($agency, $agency)
    $agency

    $agency_list2 = $agency_list | foreach{$_}
    $agency_list2 = {$agency_list2}.Invoke()

    while($agency_list2.Count -gt 0)
    {
        if((.\get-ld.ps1 $agency_list2[0] $agency) -lt 5)
        {
            $agency_list2[0]
            [void]$agency_map.Add($agency_list2[0], $agency)
            [void]$agency_list.Remove($agency_list2[0])
        }

        [void]$agency_list2.Remove($agency_list2[0])
    }
}
