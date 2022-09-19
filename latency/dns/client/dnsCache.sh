query100LinesWithOutput(){
  head -n 100 "$1" |
  while read -r line ; do
    ./q -port 53 -output="./output/10ms/$1_cached" @10.114.16.9 "$line"
  done
}

query100Lines(){
  head -n 100 "$1" |
  while read -r line ; do
    ./q -port 53 @10.114.16.9 "$line"
  done
}


for file in "level2.level1." "level3.level2.level1." \
        "level4.level3.level2.level1." "level5.level4.level3.level2.level1." \
        "level6.level5.level4.level3.level2.level1." \
        "level7.level6.level5.level4.level3.level2.level1."; \
        do query100Lines $file; done

for file in "level2.level1." "level3.level2.level1." \
        "level4.level3.level2.level1." "level5.level4.level3.level2.level1." \
        "level6.level5.level4.level3.level2.level1." \
        "level7.level6.level5.level4.level3.level2.level1."; \
        do query100LinesWithOutput $file; done



