<h3>
  <b>
    Steps to push your image to Dockerhub .................................................................................................
  </b>
  
</h3>

$ docker login

Next, you will need to rename the image to include your username, and then you can push it:

$ docker tag "image-name>:tag"    "username/repository "
  

$ docker push "username/repository"
<h3>
  <b>
    Nginx reverse proxy issues ...............................................................................................................................................................................
  </b>
</h3>
when we try reverse proxy nginx reverse proxy there might be something running on port 80
to check this out use this command...

$ sudo lsof -i :80

to remove it temporarily use the following command

sudo service apache2 stop

to restart it use

sudo service apache2 start

<h4>Unix Commands<h4>
------------------------------------------------------------------------------------------------------------------------------------------------------------
$grep -i "UNix" geekfile.txt
$grep -c "unix" geekfile.txt
$grep -l "unix" f1.txt f2.txt f3.xt f4.txt
$ grep -w "unix" geekfile.txt
$ grep -o "unix" geekfile.txt
$ grep -n "unix" geekfile.txt
$ grep -v "unix" geekfile.txt
$ grep "^unix" geekfile.txt
$ grep "os$" geekfile.tx
$grep –e "Agarwal" –e "Aggarwal" –e "Agrawal" geekfile.txt
$grep -A1 learn geekfile.txt
$ tail -n 3 state.txt
$ tail +25 state.txt
$ tail -c -6 state.txt
$ tail -c +263 state.txt
$ tail -q state.txt capital.txt
$ sort -o file 2file
$sort -r file
$sort -k 2n file
$sort -n file
$sort -r file
$sort -nr file
$awk ‘{print}’ file
$awk ‘/manager/{print}’ file
$awk ‘{print $1,$3}’ file
$awk ‘{print NR,$0}’ file
$awk ‘{print NF}’ file
$awk ‘NR==3 , NR==6 {print}’ file
$awk ‘{print NR “-” $1}’
$sed ‘s/unix/linux/’ file
$sed ‘s/u/l/3’ file
$sed ‘s/u/l/g’ file
$sed ‘s/u/l3g’ file
$sed ‘3 s/u/l/p’ file
$sed -n ‘s/unix/l/p’ file
$sed ‘1,3
$sed ‘3,$
delete
$sed ‘nd’ file
$sed ‘3,5d’ file
$sed ‘/sid/d’ file
$cut -b 1-3,5-6 file
$cut -b 1,2,3 file
$cut -c 1,4,6 fil
$cut -d “ ” -f 2 file
--complementecho ${#varname}
arr=(1 2 3)
echo ${arr[0]}
echo ${#arr[@]}
echo ${arr[@]:8}
echo ${arr[@]:3:4}
echo ${str:7}
echo ${str:1:4}
if [ $a == $b ]
then
echo "a is equal to b"
else
echo "a is not equal to b"
fi
CARS="bmw"
#Pass the variable in string
case "$CARS" in
"mercedes") echo "Headquarters - Affalterbach, Germany" ;;
"audi") echo "Headquarters - Ingolstadt, Germany" ;;
"bmw") echo "Headquarters - Chennai, Tamil Nadu, India" ;;
esac
#Start of for loop
for a in 1 2 3 4 5 6 7 8 9 10
do
if [ $a == 5 ]
then
break
fi
echo "Iteration no $a"
done
while [ $a -lt 10 ]
do
echo $a
a=`expr $a + 1`
done
COLORS="red green blue"
for COLOR in $COLORS
do
echo "COLOR: $COLOR"
donefor SAMPLE in $@
do
echo "The given sample is: $SAMPLE"
done
