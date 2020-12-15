#$!/bin/bash
klasor1=/home/isikhamza/Desktop
klasor2=CORDEX-TAS
#NCL klasoru bunun ltına gelecek
klasor3=AFR
klasor4=histo
klasor5_5=METHODYTTEST
clas=CONCLUSION2
clas2=/home/isikhamza/Desktop/CORDEX-TAS/AFR
clas3=$clas2/$line/CONCLUSION2/RESULT
dir4=$klasor1/$klasor2/$klasor3/$klasor4

#for line in $(cat list3)
#do
#cd $line
#mkdir merge
#cdo mergetime *.nc* $line.nc
#cdo seldate,2006-02-01,2017-07-15 $line.nc ./merge/$line.nc
#cd ..
#done


#cdo remapbil,targetgrid_genel -setgrid,mygrid ./SELINDEXBOX/TAS_1976-2005.nc ./GRID/TAS_1976-2005.nc\n",
#			"Tue Mar 06 02:50:12 2018: cdo #selindexbox,9,107,4,112 TAS_1976-2005.nc ./SELINDEXBOX/TAS_1976-2005.nc\n",


cd $clas2
mkdir -p ./FUT/rcp26 ./FUT/rcp45 ./FUT/rcp85
pwd
echo "rcp26 rcp45 rcp85" >list
for line in $(cat list)
do

cd $line
pwd
#for line3 in $(cat list3)
#do

#cd $line3
#mkdir yedek
#mv $line3*mon*nc ./yedek/
#mv d$line3*.nc ./yedek/
#cd ..
#done

#cdo selindexbox,17,122,2,104 TAS_1976-2005.nc selTAS_1976-2005.nc\n",
mkdir $clas
cd $clas
mkdir METHODYTTEST 
echo "METHODYTTEST " >listmethod
for line40 in $(cat listmethod)
#1
do

cd ./$line40
mkdir TESTT TEST6
cd ./TESTT
cp /media/one/CORDEX/TAS/AFR/$line40/ANALIZ/SELECT_1/MODELS/TESTSVM1/COEF_SUCESS_final .
cp /media/one/CORDEX/TAS/AFR/$line40/ANALIZ/SELECT_1/MODELS/COEF_SUCESS_list.txt_v4 .
cp $clas2/$line/tas_AFR-44_*/*.nc .

ls tas_AFR-44_*.nc >list1
mkdir ARA ARA2 ARA3
for line11 in  list1
do

sed 's/tas_AFR-44_//' $line11 >./ARA/$line11
sed 's/_rcp26_//' ./ARA/$line11 >./ARA/a$line11
sed 's/_rcp45_//' ./ARA/a$line11 >./ARA/a1$line11
sed 's/_rcp85_//' ./ARA/a1$line11 >./ARA/a2$line11
sed 's/.nc//' ./ARA/a2$line11 >./ARA/a3$line11
sed 's/r1i1p1_//' ./ARA/a3$line11 >./ARA/b$line11
sed 's/r12i1p1_//' ./ARA/b$line11 >./ARA/c$line11
sed 's/r3i1p1_//' ./ARA/c$line11 >nlist1
done

paste list1 nlist1 >m1.txt
awk '{print "mv "$1" "$2}' m1.txt >move
chmod +x move
./move
for line21 in  COEF_SUCESS_list.txt_v4
do

sed 's/tas_AFR-44_//' $line21 >./ARA2/$line21
sed 's/_historical_//' ./ARA2/$line21 >./ARA2/a$line21
sed 's/r1i1p1_//' ./ARA2/a$line21 >./ARA2/b$line21
sed 's/r12i1p1_//' ./ARA2/b$line21 >./ARA2/c$line21
sed 's/r3i1p1_//' ./ARA2/c$line21 >nCOEF_SUCESS_list.txt_v4
done

paste COEF_SUCESS_list.txt_v4 COEF_SUCESS_final >m2.txt
for line54 in  m2.txt
do

sed 's/tas_AFR-44_//' $line54 >./ARA3/$line54
sed 's/_historical_//' ./ARA3/$line54 >./ARA3/a$line54
sed 's/r1i1p1_//' ./ARA3/a$line54 >./ARA3/b$line54
sed 's/r12i1p1_//' ./ARA3/b$line54 >./ARA3/c$line54
sed 's/r3i1p1_//' ./ARA3/c$line54 >nam2.txt
done

awk '{print >>$1".txt"}' nam2.txt
mkdir GOOD_MODEL
for line23 in $(cat nCOEF_SUCESS_list.txt_v4)
do

if [ -e $line23 ]
then
cp $line23 $clas2/FUT/$line/$line23.nc
cp $line23.txt $clas2/FUT/$line/$line23.txt
echo "$line23"
fi
done
pwd
if [ "$(ls -A GOOD_MODEL)" ]; then
cd GOOD_MODEL
#cdo ensmean *.nc ../../TEST6/test6.nc
ls *.txt >listtxt
cd ../../
else 
pwd
fi
cd ../TEST6
cp /media/one/CORDEX/TAS/AFR/$line40/ANALIZ/SELECT_1/MODELS/TEST6/COEF_SUCESS_list.txt_v4 .
#cp $clas2/*/merge/*.nc .

pwd
cd $line
pwd
done
cd $clas2
done





