class AWSLambda {
    static version = [0, 1, 0];
    static SERVICE = "lambda";

    _awsRequest = null;
    _headers = {};

    constructor(region, accessKeyId, secretAccessKey) {
        if ("AWSRequestV4" in getroottable()) {
            _awsRequest = AWSRequestV4(SERVICE, region, accessKeyId, secretAccessKey);
        } else {
            throw("This class requires AWSRequestV4 - please make sure it is loaded.");
        }
    }

    function invoke(name, data, callback) {
        return _awsRequest.post("/2015-03-31/functions/"+name+"/invocations", _headers, data, callback);
    }
}
