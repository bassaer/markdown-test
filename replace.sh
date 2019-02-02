#!/bin/bash

desc=$(cat << EOS
<!-- start -->
$(grep desc files/*.yaml | awk -F':desc:' '{print "-",$1,"\t",$2}')
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
