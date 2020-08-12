awk -e '$1 ~ /\./ {gsub(/#/, "", $0}; split($0, a, " "); print a[1]' /etc/locale.gen
