set -l uname_out (uname -a)
if string match -qi '*WSL*' -- $uname_out
	set -gx BROWSER "/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe"
else if string match -qi '*Darwin*' -- $uname_out
	set -gx BROWSER "/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
else
	set -gx BROWSER "google-chrome"
end
