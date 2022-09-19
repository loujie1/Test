query100LinesWithOutput(){
  head -n 130 "$1" |
  while read -r line ; do
    ./q -port 53 -dnssec -check -output="./output/100ms/$1_nocache" @10.114.16.9 "$line"
    sleep 5
  done
}

for file in "level2.level1." "level3.level2.level1." \
        "level4.level3.level2.level1." "level5.level4.level3.level2.level1." \
        "level6.level5.level4.level3.level2.level1." \
        "level7.level6.level5.level4.level3.level2.level1."; \
        do query100LinesWithOutput $file; done

