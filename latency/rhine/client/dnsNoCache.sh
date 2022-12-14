query100LinesWithOutput(){
  head -n 120 "$1" |
  while read -r line ; do
    ./rdig -port 53 -rhine -config=./config.yml -fallback -output="./output/100ms/$1_nocache" @10.114.16.5 "$line"
    sleep 5
  done
}

for file in "level2.level1." "level3.level2.level1." \
        "level4.level3.level2.level1." "level5.level4.level3.level2.level1." \
        "level6.level5.level4.level3.level2.level1." \
        "level7.level6.level5.level4.level3.level2.level1."; \
        do query100LinesWithOutput $file; done

