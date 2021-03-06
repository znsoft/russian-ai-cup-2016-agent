name="MyStrategy"

if [ ! -f $name.cpp ]
then
    echo Unable to find $name.cpp > compilation.log
    exit 1
fi

rm -f $name

files=""

for i in *.cpp
do
    files="$files $i"
done

for i in model/*.cpp
do
    files="$files $i"
done

for i in csimplesocket/*.cpp
do
    files="$files $i"
done

g++ -std=c++14 -fno-optimize-sibling-calls -fno-strict-aliasing -D_LINUX -lm -pthread -s -x c++ -O2 -Wall -Wtype-limits -Wno-unknown-pragmas -o $name $files
