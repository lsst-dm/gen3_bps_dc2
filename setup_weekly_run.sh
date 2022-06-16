NUMBER='18'
WEEKLY='2022_18'
IS_GEN2TO3=0
if [ $IS_GEN2TO3 == 1 ]; then
	SUFFIX='_gen2to3'
else
	SUFFIX=''
fi
TICKETNUM='34608'
DATETAG='2022-04-28T21:29'

DIR=w_${WEEKLY}${SUFFIX}
echo Copying to $DIR
mkdir -p $DIR
cp -r template/* $DIR/
sed -i "s/NUMBER/${NUMBER}/g" $DIR/*
sed -i "s/WEEKLY/${WEEKLY}/g" $DIR/*
sed -i "s/IS_GEN2TO3/${IS_GEN2TO3}/g" $DIR/*
sed -i "s/SUFFIX/${SUFFIX}/g" $DIR/*
sed -i "s/TICKETNUM/${TICKETNUM}/g" $DIR/*

cd $DIR
mkdir -p metrics_dispatch
mv dispatch.sh make_json.sh metrics_dispatch/
sed -i "s/TICKETNUM/${TICKETNUM}/g" ./metrics_dispatch/*
sed -i "s/WEEKLY/${WEEKLY}/g" ./metrics_dispatch/*
sed -i "s/DATETAG/${DATETAG}/g" ./metrics_dispatch/*

