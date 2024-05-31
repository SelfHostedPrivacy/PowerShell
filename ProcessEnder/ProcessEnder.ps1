#Load Data from files. Files stored in C:\scripts\pe

$Processes = Get-Content -Path C:\scripts\pe\processes.txt
$Servers = Get-Content -path C:\scripts\pe\servers.txt

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$SystemBuilder               = New-Object system.Windows.Forms.Form
$SystemBuilder.ClientSize    = '600,525
'
$SystemBuilder.text          = "Process Ender"
$SystemBuilder.TopMost       = $false

$Groupbox1                       = New-Object system.Windows.Forms.Groupbox
$Groupbox1.height                = 360
$Groupbox1.width                 = 290
$Groupbox1.location              = New-Object System.Drawing.Point(5,50)

$Groupbox2                       = New-Object system.Windows.Forms.Groupbox
$Groupbox2.height                = 360
$Groupbox2.width                 = 290
$Groupbox2.location              = New-Object System.Drawing.Point(305,50)

$GroupLabel1                              = New-Object system.Windows.Forms.Label
$GroupLabel1.text                         = "Servers"
$GroupLabel1.AutoSize                     = $true
$GroupLabel1.width                        = 40
$GroupLabel1.height                       = 10
$GroupLabel1.location                     = New-Object System.Drawing.Point(85,60)
$GroupLabel1.Font                         = 'Microsoft Sans Serif,20'

$GroupLabel2                              = New-Object system.Windows.Forms.Label
$GroupLabel2.text                         = "Process"
$GroupLabel2.AutoSize                     = $true
$GroupLabel2.width                        = 40
$GroupLabel2.height                       = 10
$GroupLabel2.location                     = New-Object System.Drawing.Point(355,60)
$GroupLabel2.Font                         = 'Microsoft Sans Serif,20'

$ServersListBox1                  = New-Object System.Windows.Forms.CheckedListBox
$ServersListBox1.height           = 280
$ServersListBox1.width            = 270
$ServersListBox1.location         = New-Object System.Drawing.Point(15, 100)
$ServersListBox1.CheckOnClick     = $true


$Servers | foreach-object { $ServersListBox1.Items.Add($_) | Out-Null }

$ProcessesListBox1                  = New-Object System.Windows.Forms.CheckedListBox
$ProcessesListBox1.height           = 280
$ProcessesListBox1.width            = 270
$ProcessesListBox1.location         = New-Object System.Drawing.Point(315, 100)
$ProcessesListBox1.CheckOnClick     = $true
$Processes | foreach-object { $ProcessesListBox1.Items.Add($_) | Out-Null }


$KillButton1                         = New-Object System.Windows.Forms.Button
$KillButton1.text                    = "End Proccess(s)"
$KillButton1.width                   = 200
$KillButton1.height                  = 80
$KillButton1.location                = New-Object System.Drawing.Point(200,425)
$KillButton1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',16)


$SystemBuilder.controls.AddRange(@($ServersListBox1,$GroupLabel1,$GroupLabel2,$ProcessesListBox1,$GroupBox1,$GroupBox2,$KillButton1))


$KillButton1.Add_Click({
    $servers = $ServersListBox1.CheckedItems
    $process = $ProcessesListBox1.CheckedItems
    $servers = $servers | sort-object {get-random}
    $process = $process | sort-object {get-random}

    $i = 0
    foreach ($server in $servers) {
        if ($i -gt 0) {
            write-host "would sleep 30, sleeping 2"
            sleep 2
        }
        $i++
        foreach ($image in $process) {
            write-host "Ending $image"
            taskkill /s \\$server  /fi "IMAGENAME eq $image" /f
            write-host "$image has been ended"
        }
    }
write-host "All processes have been ended"
})



function main() {

    [void]$SystemBuilder.ShowDialog()

}


main
