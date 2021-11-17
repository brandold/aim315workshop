sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install jq -y
sudo yum install python38 python38-devel python38-pip -y
export AWS_DEFAULT_REGION='us-east-1'
export STACK_NAME=$(aws cloudformation list-exports | jq -r -c '.Exports[] | select(.Name | contains("StackNameAIM315")) | .Name')
export C9_EC2_ID=`aws ec2 describe-instances --region us-east-1 --filters Name=tag-key,Values='aws:cloud9:environment' Name=instance-state-name,Values='running' --query "Reservations[*].Instances[*].InstanceId" --output text`
aws ec2 associate-iam-instance-profile --iam-instance-profile Name=AIM315WorkshopInstanceProfile --region us-east-1 --instance-id $C9_EC2_ID
# Set Nginx EIP variable
export KIBANA_IP=$(aws cloudformation list-exports --query "Exports[?Name==\`$STACK_NAME\`].Value" --no-paginate --output text)
# Set dataplane variable
export DATAPLANE_API_ENDPOINT=$(aws cloudformation list-exports --query "Exports[?Name==\`$STACK_NAME:DataplaneApiEndpoint\`].Value" --no-paginate --output text)
export DATAPLANE_API_NAME=$(aws cloudformation list-exports --query "Exports[?Name==\`$STACK_NAME:DataPlaneApiHandlerName\`].Value" --no-paginate --output text)
# Set workflow variable
export WORKFLOW_API_ENDPOINT=$(aws cloudformation list-exports --query "Exports[?Name==\`$STACK_NAME:WorkflowApiEndpoint\`].Value" --no-paginate --output text)
export WORKFLOW_API_NAME=$(aws cloudformation list-exports --query "Exports[?Name==\`$STACK_NAME:WorkflowApiHandlerName\`].Value" --no-paginate --output text)
# Set bucket variable
export DATAPLANE_BUCKET=$(aws cloudformation list-exports --query "Exports[?Name==\`$STACK_NAME:DataplaneBucket\`].Value" --no-paginate --output text)
# Set layer variable
export MIE_LAYER=$(aws cloudformation list-exports --query "Exports[?Name==\`$STACK_NAME:MediaInsightsEnginePython38Layer\`].Value" --no-paginate --output text)
# Set custom resource variable
export CUSTOM_RESOURCE=$(aws cloudformation list-exports --query "Exports[?Name==\`$STACK_NAME:WorkflowCustomResourceArn\`].Value" --no-paginate --output text)
virtualenv aim315-workshop -p $(which python3)
source aim315-workshop/bin/activate
cd aim315-workshop
pip install botocore
pip install awscurl
pip install aws-sam-cli










