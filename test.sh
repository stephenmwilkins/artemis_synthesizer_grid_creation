


list1=("1" "2")
list2=("a" "b")
list2=("a")

for i in "${!list1[@]}"; do

    l1=${list1[$i]}

    if [ "${#list2[@]}" -eq 1 ]; then
        l2=${list2[0]}
    else
        l2=${list2[$i]}
    fi
    
    echo $i, ${l1}, ${l2}
done