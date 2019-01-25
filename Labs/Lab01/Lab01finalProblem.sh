head -1 PredPreyData.csv | cut -f 2-4 -d , > NewPPD.txt
cut -f 2-4 -d , PredPreyData.csv | tail >> NewPPD.txt
