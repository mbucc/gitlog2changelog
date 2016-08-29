#! /bin/sh -e
#  Usage:
#		git log --pretty --numstat --summary | git2cl.sh
# Requires the per git2cl tool (https://savannah.nongnu.org/projects/git2cl).
# Additions:
#	* Groups changes under unique (author,date) combinations.
#	* Wraps to 80 characters
# 

git2cl \
| awk '/^20[0-9][0-9]-[01][0-9]-[0123][0-9]/ {if ($0 in authors) next; authors[$0]=1;an=an+1;a[an]=$0;i=1} {n[an]=i;b[an,i]=$0; i++} END {for (i=1;i<=an;i++) for (j=1;j<=n[i];j++) print b[i,j]}' \
|fmt -w 80 \
|tr -s \\n \
| awk '/^20/ {print "\n" $0; next} {print}' \
| awk '/^\t[^*]/ {printf "\t " ; for (i=1;i<=NF;i++) printf " %s",$i;printf "\n"; next} {print}' \
| awk '/\t\*/ {print "\n" $0; next} {print}'
