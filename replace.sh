#!/bin/bash

desc=$(cat << EOS
<!-- start -->
|file name|content|
|:--|:--|
$(grep desc files1/*.yaml files2/*.yaml | awk -F':desc: ' -v 'OFS=' '{print "|",$1,"|",$2,"|"}')
<!-- end -->
EOS
)

awk --assign d="$desc" '
  /<!-- start -->/ {
  print d
  }
  /<!-- start -->/,/<!-- end -->/ {
  next
  }
  1
' README.md > tmp && mv tmp README.md
