ProcessEnder is a PowerShell script that presents a GUI to allow users to select servers and processes and then end those processes.
The user will need to be on the same network as the machines they are trying to reach and be logged in with an account that has administrative privileges to execute remote taskkill.
The script requires two files (used by the get-content call) to provide a list of server/machine names and a list of processes. Keep in mind that the process name should include the .exe extention.
The file names and paths are as follows:
c:\script\servers.txt
c:\script\processes.txt

