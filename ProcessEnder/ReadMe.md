# ProcessEnder is a PowerShell script that presents a GUI allowing users to select servers and processes and then end those processes on the selected servers.

The user will need to be on the same network as the machines they are trying to reach and be logged in with an account that has administrative privileges to execute remote taskkill.
The script requires two files (used by the get-content call) to provide a list of server/machine names and a list of processes. Keep in mind that the process name should include the .exe extention.

The file names and paths are as follows:

c:\script\pe\servers.txt

c:\script\pe\processes.txt

The user can select multiple servers and multiple processes.
There is a 2 second delay between each server. This might need to be longer based on your needs.
The servers and processes are also randomized before the proccess ending begins.
