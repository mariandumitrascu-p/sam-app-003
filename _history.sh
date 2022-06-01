

# sam demo


sam pipeline init --bootstrap

sam-app-003$ sam build --use-container

sam-app-003$ sam local invoke HelloWorldFunction --event events/event.json


sam-app-003$ sam local start-api
sam-app-003$ curl http://localhost:3000/


sam-app-003$ sam logs -n HelloWorldFunction --stack-name sam-app-003 --tail


sam-app-003$ pip install -r tests/requirements.txt --user
# unit test
sam-app-003$ python -m pytest tests/unit -v
# integration test, requiring deploying the stack first.
# Create the env variable AWS_SAM_STACK_NAME with the name of the stack we are testing
sam-app-003$ AWS_SAM_STACK_NAME=<stack-name> python -m pytest tests/integration -v

aws cloudformation delete-stack --stack-name sam-app-003