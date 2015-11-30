# AWSLambda

<blockquote>
This is a WORK IN PROGRESS. Suggestions and improvements welcome.
Based very heavily on the AWSKinesisFirehose library by @electricimp. 
</blockquote>

This class can be used to invoke AWS Lambda functions via an Electric Imp Agent.

To add this library to your model, add the following lines to the top of your agent code:

```
#require "AWSRequestV4.class.nut:1.0.0"
```

Then copy and paste the code from the AWSLambda.class.nut file into your agent.

**Note: [AWSRequestV4](https://github.com/electricimp/AWSRequestV4/) must be loaded. As of writing, pull request electricimp/AWSRequestV4#2 is required to function correctly**

## Class Methods

### constructor(region, accessKeyId, secretAccessKey)

All parameters are strings. Your IAM access key will need the "lambda:InvokeFunction" action permitted for the function(s) you want to run.

### invoke(name, data, callback)

http://docs.aws.amazon.com/firehose/latest/APIReference/API_PutRecord.html

       Parameter       |       Type     | Description
---------------------- | -------------- | -----------
**name** | string         | AWS Lambda function name
**data**               | string or blob | The actual data to be sent - you probably want to send JSON.
**userCallback**       | function       | Callback function from HTTP post

## Example

```squirrel
#require "AWSRequestV4.class.nut:1.0.0"

// Copy the AWSLambda.class.nut file here...

const ACCESS_KEY_ID = "YOUR_KEY_ID_HERE";
const SECRET_ACCESS_KEY = "YOUR_KEY_HERE";

aws <- AWSLambda("us-west-2", ACCESS_KEY_ID, SECRET_ACCESS_KEY);

local body = {
    "key1": "imp_1",
    "key2": "imp_2"
};

// Call the hello world function
aws.invoke("helloLambda", http.jsonencode(body), function(response) {
    server.log(response.statuscode + ": " + response.body);
});

```