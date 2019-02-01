#!/bin/bash

result=$(cat << EOS
<!-- start -->
$(grep desc files/*.yaml | awk -F':desc:' '{printf "- %s\t%s\n",$1,$2}')
<!-- end -->
EOS
)

sed -i -e 's/<!-- start -->.*<!-- end -->/"$result"/g' README.md

