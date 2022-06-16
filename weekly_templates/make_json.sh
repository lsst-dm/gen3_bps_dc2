mkdir json
cd json
gen3_to_job.py /repo/dc2 '2.2i/runs/test-med-1/w_WEEKLY/DM-TICKETNUM' --dataset_name 'DC2_test-med-1'
if [ IS_GEN2TO3 == 1 ]; then
    sed -i "s/Gen3/Gen2to3/g" *.json
fi
