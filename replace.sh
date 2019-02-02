#!/bin/bash

result=$(cat << EOS
<!-- start -->
$(grep desc files/*.yaml | awk -F':desc:' '{print "-",$1,"\t",$2}')
<!-- end -->
EOS
)

#echo "$result"

foo="ok"

awk '/<!-- start -->/{print '${foo}'} /<!-- start -->/,/<!-- end -->/{next}1' README.md

