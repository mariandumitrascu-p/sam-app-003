# sam demo

sam pipeline init --bootstrap
sam pipeline init

sam build --use-container
sam deploy --guided

sam build --use-container
sam deploy

sam local invoke HelloWorldFunction --event events/event.json

sam local start-api
curl http://localhost:3000/

sam logs -n HelloWorldFunction --stack-name sam-app --tail

# ##############################################################################
pip install -r tests/requirements.txt --user
# unit test
python -m pytest tests/unit -v
# integration test, requiring deploying the stack first.
# Create the env variable AWS_SAM_STACK_NAME with the name of the stack we are testing
AWS_SAM_STACK_NAME=<stack-name> python -m pytest tests/integration -v

aws lambda invoke --function-name testFunction --cli-binary-format raw-in-base64-out --payload '{"name": "John Smith"}' response.json

aws lambda invoke \
    --function-name arn:aws:lambda:us-east-1:327004596447:function:sam-app-HelloWorldFunction-W1OJIH1QSESm  \
    --cli-binary-format raw-in-base64-out \
    --payload file:///Users/marian.dumitrascu/Dropbox/Work/Current/lambda/SAM/sam-app-003/events/event02.json \
    response.json

aws cloudformation delete-stack --stack-name sam-app

mariandumitrascu-p/sam-app-003

# https://aws.amazon.com/blogs/compute/introducing-aws-sam-pipelines-automatically-generate-deployment-pipelines-for-serverless-applications/
# https://haydnjmorris.medium.com/solving-permissions-error-with-aws-codepipeline-c93cfc000285

sam deploy -t codepipeline.yaml --stack-name sam-app-pipeline-001 --capabilities=CAPABILITY_IAM --region us-east-1


# chage 01


