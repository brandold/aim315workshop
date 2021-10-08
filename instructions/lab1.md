


# 1. Sync videos to upload location

`aws s3 sync ./videos/ s3://"$DATAPLANE_BUCKET"/upload/`

# 2. Start a workflow for a video file

`awscurl -X POST --data '{"Name":"'$WORKFLOW_NAME'", "Input":{"Media":{"Video":{"S3Bucket":"'$DATAPLANE_BUCKET'","S3Key":"upload/the_lucy_show_ring_a_ding_ding_tools.mp4"}}}}' $WORKFLOW_API_ENDPOINT\workflow/execution | jq . | tee startWorkflow1.json`

# 3. Store Asset ID and WorkflowID from output and export them as env variables

`export ASSET_ID=$(jq -r '.AssetId' startWorkflow1.json)`
`export WORKFLOW_ID=$(jq -r '.Id' startWorkflow1.json)`


# Check Workflow Status
`awscurl -X GET $WORKFLOW_API_ENDPOINT\workflow/execution/$WORKFLOW_ID | jq '.[].Status'`

You can continually check the status in your IDE with this command:

`while [ "$WORKFLOW_STATUS" != 'Complete' ]; do sleep 10; export WORKFLOW_STATUS=$(awscurl -X GET $WORKFLOW_API_ENDPOINT\workflow/execution/$WORKFLOW_ID | jq '.[].Status'); echo $WORKFLOW_STATUS ; done`

You can visually check the status of the workflow from the stepfunctions console: https://console.aws.amazon.com/states/home?region=us-east-1#/statemachines

# 4. Explore extracted metadata through an API call

`awscurl -X GET $DATAPLANE_API_ENDPOINT\metadata/$ASSET_ID/labelDetection`

Try some other metadata types:

`awscurl -X GET $DATAPLANE_API_ENDPOINT\metadata/$ASSET_ID/contentModeration`
`awscurl -X GET $DATAPLANE_API_ENDPOINT\metadata/$ASSET_ID/celebrityRecognition`
`awscurl -X GET $DATAPLANE_API_ENDPOINT\metadata/$ASSET_ID/shotDetection`

# 5. Add an elasticsearch consumer for this data

Open lambda console: https://console.aws.amazon.com/lambda/home?region=us-east-1#/functions
Enter "elasticsearch" in the function search bar
Click on the function containing "ElasticsearchConsumerLambda" in the name
Click Add Trigger
From the drop down, select Kinesis
Select the kinesis stream containing "AnalyticsStream" in the name
Leave the other settings at their default values and click Add


# 6. Start another workflow with a different video file

`awscurl -X POST --data '{"Name":"'$WORKFLOW_NAME'", "Input":{"Media":{"Video":{"S3Bucket":"'$DATAPLANE_BUCKET'","S3Key":"upload/the_lucy_show_french_movie_star.mp4"}}}}' $WORKFLOW_API_ENDPOINT\workflow/execution | jq . | tee startWorkflow2.json`

# 7. Store Asset ID and WorkflowID from output and export them as env variables

`export ASSET_ID=$(jq -r '.AssetId' startWorkflow2.json)`
`export WORKFLOW_ID=$(jq -r '.Id' startWorkflow2.json)`

# Wait for workflow to complete

`while [ "$WORKFLOW_STATUS" != 'Complete' ]; do sleep 10; export WORKFLOW_STATUS=$(awscurl -X GET $WORKFLOW_API_ENDPOINT\workflow/execution/$WORKFLOW_ID | jq '.Status'); echo $WORKFLOW_STATUS ; done`
https://console.aws.amazon.com/states/home?region=us-east-1#/statemachines

# 8. Search metadata in Kibana

Get Kibana address: 
`echo http://$KIBANA_IP/_plugin/kibana`

Open kibana in a new tab

Click discover.

Create index pattern: Use * and click next step then 'create index pattern'.

Click discover again. 

Explore the data. Try some sample queries. Use the 'Add Filter' function. Build custom queries. Add fields from the available fields. 

# 9. Add a kendra consumer 

Open lambda console: https://console.aws.amazon.com/lambda/home?region=us-east-1#/functions
Enter "kendra" in the function search bar
Click on the function containing "KendraConsumerLambda" in the name
Click Add Trigger
From the drop down, select Kinesis
Select the kinesis stream containing "AnalyticsStream" in the name
Leave the other settings at their default values and click Add

# 10. Start another workflow with a different video file

`awscurl -X POST --data '{"Name":"'$WORKFLOW_NAME'", "Input":{"Media":{"Video":{"S3Bucket":"'$DATAPLANE_BUCKET'","S3Key":"upload/the_lucy_show_john_wayne.mp4"}}}}' $WORKFLOW_API_ENDPOINT\workflow/execution | jq . | tee startWorkflow3.json`

# Store Asset ID and WorkflowID from output and export them as env variables

`export ASSET_ID=$(jq -r '.AssetId' startWorkflow3.json)`
`export WORKFLOW_ID=$(jq -r '.Id' startWorkflow3.json)`

# Wait for workflow to complete

`while [ "$WORKFLOW_STATUS" != 'Complete' ]; do sleep 10; export WORKFLOW_STATUS=$(awscurl -X GET $WORKFLOW_API_ENDPOINT\workflow/execution/$WORKFLOW_ID | jq '.Status'); echo $WORKFLOW_STATUS ; done`
https://console.aws.amazon.com/states/home?region=us-east-1#/statemachines

# 11. Natural language search

Open the kendra console: https://console.aws.amazon.com/kendra/home?region=us-east-1#indexes
Select the index named aim315index
Select Search Console from the left side navigation page
Queries: "What did lucy say to John Wayne?" "What was lucys maiden name?" "Where does Lucy work?" "What did lucy bring?"


