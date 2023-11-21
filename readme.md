
 # Steps to push your image to Dockerhub ...............................................................................................................
```bash
$ docker login
```

### Next, you will need to rename the image to include your username, and then you can push it:
```bash
$ docker tag "image-name>:tag"    "username/repository "
```
### pushing
```bash
$ docker push "username/repository"
```

# Nginx reverse proxy issues ................................................................................................................

### when we try reverse proxy nginx reverse proxy there might be something running on port 80
to check this out use this command...
```bash
$ sudo lsof -i :80
```
to remove it temporarily use the following command
```bash
sudo service apache2 stop
```
to restart it use
```bash
sudo service apache2 start
```

# Unix Commands Cheat Sheet ...............................................................................................................

## Grep Commands
```bash
$ grep -i "UNix" geekfile.txt
$ grep -c "unix" geekfile.txt
$ grep -l "unix" f1.txt f2.txt f3.xt f4.txt
$ grep -w "unix" geekfile.txt
$ grep -o "unix" geekfile.txt
$ grep -n "unix" geekfile.txt
$ grep -v "unix" geekfile.txt
$ grep "^unix" geekfile.txt
$ grep "os$" geekfile.tx
$ grep –e "Agarwal" –e "Aggarwal" –e "Agrawal" geekfile.txt
$ grep -A1 learn geekfile.txt
```
## Tail Commands
```bash
$ tail -n 3 state.txt
$ tail +25 state.txt
$ tail -c -6 state.txt
$ tail -c +263 state.txt
$ tail -q state.txt capital.txt
```
# Sort Commands
```bash
$ sort -o file 2file
$ sort -r file
$ sort -k 2n file
$ sort -n file
$ sort -nr file
```
## Awk Commands
```bash
$ awk ‘{print}’ file
$ awk ‘/manager/{print}’ file
$ awk ‘{print $1,$3}’ file
$ awk ‘{print NR,$0}’ file
$ awk ‘{print NF}’ file
$ awk ‘NR==3 , NR==6 {print}’ file
$ awk ‘{print NR “-” $1}’
```
## Sed Commands
```bash
$ sed ‘s/unix/linux/’ file
$ sed ‘s/u/l/3’ file
$ sed ‘s/u/l/g’ file
$ sed ‘s/u/l3g’ file
$ sed ‘3 s/u/l/p’ file
$ sed -n ‘s/unix/l/p’ file
$ sed ‘1,3d’ file
$ sed ‘3,$d’ file
$ sed ‘nd’ file
$ sed ‘3,5d’ file
$ sed ‘/sid/d’ file
```
## Cut Commands
```bash
$ cut -b 1-3,5-6 file
$ cut -b 1,2,3 file
$ cut -c 1,4,6 fil
$ cut -d “ ” -f 2 file --complement
```
## Echo and Variable Commands
```bash
$ echo ${#varname}
$ echo ${arr[0]}
$ echo ${#arr[@]}
$ echo ${arr[@]:8}
$ echo ${arr[@]:3:4}
$ echo ${str:7}
$ echo ${str:1:4}
```
## If-Else Command
```bash
if [ $a == $b ]; then
  echo "a is equal to b"
else
  echo "a is not equal to b"
fi
```
## Case Command
```bash
CARS="bmw"
case "$CARS" in
  "mercedes") echo "Headquarters - Affalterbach, Germany" ;;
  "audi") echo "Headquarters - Ingolstadt, Germany" ;;
  "bmw") echo "Headquarters - Chennai, Tamil Nadu, India" ;;
esac
```
## For Loop Commands
```bash
for a in 1 2 3 4 5 6 7 8 9 10; do
  if [ $a == 5 ]; then
    break
  fi
  echo "Iteration no $a"
done
```

## While Loop Commands
```bash
while [ $a -lt 10 ]; do
  echo $a
  a=`expr $a + 1`
done
```

## For Loop with Array Commands
```bash
COLORS="red green blue"
for COLOR in $COLORS; do
  echo "COLOR: $COLOR"
done
```
## For Loop with Command Line Arguments Command
```bash
for SAMPLE in $@; do
  echo "The given sample is: $SAMPLE"
done
```


