

# sam demo


sam pipeline init --bootstrap

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



aws cloudformation delete-stack --stack-name sam-app-003