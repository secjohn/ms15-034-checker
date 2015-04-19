#MS15-034-Checker

A simple Ruby script to check if your IIS server is vulnerable to MS15-034. This was written for any other Ruby scripters out there for something to look at and learn from and expend upon since the only things out there seemed to be in Python or a Metasploit module.

##Usage
./ms15_034_check.rb http://url.com
It can do http and https URL's, leaving both off it will try it with http.

##Other Info
I don't recomend using this other than to learn from. I recommend using the nmap script https://github.com/pr4jwal/quick-scripts/blob/master/ms15-034.nse or the Metasploit module https://github.com/rapid7/metasploit-framework/pull/5150, both can test ranges of IP's instead of one at a time like this script does.