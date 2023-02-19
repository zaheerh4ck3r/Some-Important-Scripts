# get today's and yesterday's date
d=$(date +%Y-%m-%d)
y=$(date -d yesterday +%Y-%m-%d)

# run Nmap scan and save results in XML format
/usr/bin/nmap -T4 -oX optnmap_diff/scan_$d.xml 10.100.100.0/24 >/dev/null 2>&1

# if yesterday's results exist, compare them with today's results and write differences to a text file
if [ -e optnmap_diff/scan_$y.xml ]; then
  /usr/bin/ndiff optnmap_diff/scan_$y.xml optnmap_diff/scan_$d.xml > optnmap_diff/diff.txt
fi
