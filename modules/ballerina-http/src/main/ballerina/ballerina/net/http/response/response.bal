package ballerina.net.http.response;

import ballerina.doc;
import ballerina.net.http;

@doc:Description { value:"Gets the HTTP status code from the message"}
@doc:Param { value:"res: The response message" }
@doc:Return { value:"int: http status code" }
native function getStatusCode (http:Response res) (int);

@doc:Description { value:"Gets the Content-Length header from the message"}
@doc:Param { value:"res: The response message" }
@doc:Return { value:"int: length of the message" }
native function getContentLength (http:Response res) (int);

@doc:Description { value:"Sets the Content-Length header on the message"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"contentLength: Length of the message" }
native function setContentLength (http:Response res, int contentLength);

@doc:Description { value:"Sets the HTTP StatusCode on the message"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"statusCode: HTTP status code" }
native function setStatusCode (http:Response res, int statusCode);

@doc:Description { value:"Sets a custom HTTP Reason phrase"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"reasonPhrase: Reason phrase value" }
native function setReasonPhrase (http:Response res, string reasonPhrase);

@doc:Description { value:"Gets the message payload in JSON format"}
@doc:Param { value:"res: The response message" }
@doc:Return { value:"json: The JSON reresentation of the message payload" }
native function getJsonPayload (http:Response res) (json);

@doc:Description { value:"Gets the message payload in JSON format"}
@doc:Param { value:"res: The response message" }
@doc:Return { value:"json: The JSON reresentation of the message payload" }
native function getJsonPayload (http:Response res) (json);

@doc:Description { value:"Gets the message payload in XML format"}
@doc:Param { value:"res: The response message" }
@doc:Return { value:"xml: The XML representation of the message payload" }
native function getXmlPayload (http:Response res) (xml);

@doc:Description { value:"Gets the message payload in BLOB format"}
@doc:Param { value:"res: The response message" }
@doc:Return { value:"json: The BLOB reresentation of the message payload" }
native function getBinaryPayload (http:Response res) (blob);

@doc:Description { value:"Sets a message property"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"propertyName: The name of the property" }
@doc:Param { value:"propertyValue: The value of the property" }
native function setProperty (http:Response res, string propertyName, string propertyValue);

@doc:Description { value:"Sets the message payload using a string object"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"payload: The string payload object" }
native function setStringPayload (http:Response res, string payload);

@doc:Description { value:"Gets a transport header from the message"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"headerName: The header name" }
@doc:Return { value:"string: The header value" }
native function getHeader (http:Response res, string headerName) (string);

@doc:Description { value:"Gets the message payload in string format"}
@doc:Param { value:"res: The response message" }
@doc:Return { value:"string: The string representation of the message payload" }
native function getStringPayload (http:Response res) (string);

@doc:Description { value:"Adds a transport header to the message"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"key: The header name" }
@doc:Param { value:"value: The header value" }
native function addHeader (http:Response res, string key, string value);

@doc:Description { value:"Gets transport headers from the message"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"headerName: The header name" }
@doc:Return { value:"string[]: The header values" }
native function getHeaders (http:Response res, string headerName) (string[]);

@doc:Description { value:"Sets the message payload using a JSON object"}
@doc:Param { value:"req: The response message" }
@doc:Param { value:"payload: The JSON payload object" }
native function setJsonPayload (http:Response res, json payload);

@doc:Description { value:"Retrieve a message property"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"propertyName: The name of the property" }
@doc:Return { value:"string: The property value" }
native function getProperty (http:Response res, string propertyName) (string);

@doc:Description { value:"Removes a transport header from the message"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"key: The header name" }
native function removeHeader (http:Response res, string key);

@doc:Description { value:"Removes all transport headers from the message"}
@doc:Param { value:"res: The response message" }
native function removeAllHeaders (http:Response res);

@doc:Description { value:"Sets the message payload using an XML object"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"payload: The XML payload object" }
native function setXmlPayload (http:Response res, xml payload);

@doc:Description { value:"Clones and creates a new instance of a message object"}
@doc:Param { value:"res: The response message" }
@doc:Return { value:"message: The new instance of the message object " }
native function clone (http:Response res) (message);

@doc:Description { value:"Sets the value of a transport header"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"key: The header name" }
@doc:Param { value:"value: The header value" }
native function setHeader (http:Response res, string key, string value);

@doc:Description { value:"Sets the message payload using a map object"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"payload: The map payload object" }
native function setMapPayload (http:Response res, map payload);

@doc:Description { value:"To get the value for a string property in a map type message"}
@doc:Param { value:"res: The response message" }
@doc:Param { value:"propertyName: Name of the property" }
@doc:Return { value:"string: The value of the map property" }
native function getStringValue (http:Response res, string propertyName) (string);

@doc:Description { value:"To get the value for a string property in a map type message"}
@doc:Param { value:"res: The response message" }
native function send (http:Response res);
