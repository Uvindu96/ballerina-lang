// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerinax/java;

# Provides the functionality to manipulate the messages received by the consumer services.
public type Message client object {
   handle amqpChannel = JAVA_NULL;
   private byte[] messageContent = [];
   private int deliveryTag = -1;
   private BasicProperties? properties = ();
   private boolean ackStatus = false;
   private boolean autoAck = true;

   # Acknowledge one or several received messages.
   #
   # + multiple - `true` to acknowledge all messages up to and including the message called on,
   #                `false` to acknowledge just the message called on.
   # + return - An error if an I/O error is encountered or nil if successful.
   public remote function basicAck(boolean multiple = false) returns Error? {
        var result = nativeBasicAck(self.amqpChannel, self.deliveryTag, multiple, self.autoAck, self.ackStatus);
        self.ackStatus = true;
        return result;
   }

   # Reject one or several received messages.
   #
   # + multiple - `true` to reject all messages up to and including the message called on;
   #                `false` to reject just the message called on.
   # + requeue - `true` if the rejected message(s) should be re-queued rather than discarded/dead-lettered.
   # + return - An error if an I/O error is encountered or nil if successful.
   public remote function basicNack(boolean multiple = false, boolean requeue = true)
                            returns Error? {
        var result = nativeBasicNack(self.amqpChannel, self.deliveryTag, self.autoAck, self.ackStatus,
                                multiple, requeue);
        self.ackStatus = true;
        return result;
   }

   # Retrieves the delivery tag of the message.
   #
   # + return - int containing the delivery tag of the message.
   public function getDeliveryTag() returns @tainted int {
        if (self.deliveryTag > -1) {
            return self.deliveryTag;
        } else {
            Error e = Error(message = "Delivery tag not properly initiliazed.");
            panic e;
        }
   }

   # Retrieves the properties of the message (i.e., routing headers etc.).
   #
   # + return - Properties of the message or error if an error is encountered.
   public function getProperties() returns BasicProperties | Error {
        var basicProperties = self.properties;
        if (basicProperties is BasicProperties) {
            return basicProperties;
        }
        Error e = Error(message = "Properties not properly initialized.");
        return e;
   }

   # Retrieves the text content of the RabbitMQ message.
   #
   # + return - string containing message data or error if an error is encountered.
   public function getTextContent() returns @tainted string | Error {
        var result =  nativeGetTextContent(self.messageContent);
        if (result is handle) {
            var toStringResult = java:toString(result);
            if (toStringResult is string) {
                return toStringResult;
            } else {
                Error e = Error(message = "Error occuurred while retrieving the text content of the message.");
                return e;
            }
        } else {
            return result;
        }
   }

    # Retrieves the float content of the RabbitMQ message.
    #
    # + return - float containing message data or error if an error is encountered.
    public function getFloatContent() returns @tainted float | Error {
        return  nativeGetFloatContent(self.messageContent);
    }

   # Retrieves the int content of the RabbitMQ message.
   #
   # + return - int containing message data or error if an error is encountered.
   public function getIntContent() returns @tainted int | Error {
       return nativeGetIntContent(self.messageContent);
   }

   # Retrieves the byte array content of the RabbitMQ message.
   #
   # + return - byte array containing message data or error if an error is encountered.
   public function getByteArrayContent() returns @tainted byte[] {
        return self.messageContent;
   }

   # Retrieves the json content of the RabbitMQ message.
   #
   # + return - json containing message data or error if an error is encountered.
   public function getJSONContent() returns @tainted json | Error {
        return nativeGetJSONContent(self.messageContent);
   }

   # Retrieves the xml content of the RabbitMQ message.
   #
   # + return - xml containing message data or error if an error is encountered.
   public function getXMLContent() returns @tainted xml | Error {
        return nativeGetXMLContent(self.messageContent);
   }
};

function nativeBasicAck(handle amqpChannel, int deliveryTag, boolean multiple, boolean ackMode, boolean ackStatus)
returns Error? =
@java:Method {
    name: "basicAck",
    class: "org.ballerinalang.messaging.rabbitmq.util.MessageUtils"
} external;

function nativeBasicNack(handle amqpChannel, int deliveryTag, boolean ackMode, boolean ackStatus, boolean multiple,
boolean requeue) returns Error? =
@java:Method {
    name: "basicNack",
    class: "org.ballerinalang.messaging.rabbitmq.util.MessageUtils"
} external;

function nativeGetTextContent(byte[] messageContent) returns handle | Error =
@java:Method {
    name: "getTextContent",
    class: "org.ballerinalang.messaging.rabbitmq.util.MessageUtils"
} external;

function nativeGetFloatContent(byte[] messageContent) returns float | Error  =
@java:Method {
    name: "getFloatContent",
    class: "org.ballerinalang.messaging.rabbitmq.util.MessageUtils"
} external;

function nativeGetIntContent(byte[] messageContent) returns int | Error  =
@java:Method {
    name: "getIntContent",
    class: "org.ballerinalang.messaging.rabbitmq.util.MessageUtils"
} external;

function nativeGetXMLContent(byte[] messageContent) returns xml | Error  =
@java:Method {
    name: "getXMLContent",
    class: "org.ballerinalang.messaging.rabbitmq.util.MessageUtils"
} external;

function nativeGetJSONContent(byte[] messageContent) returns json | Error  =
@java:Method {
    name: "getJSONContent",
    class: "org.ballerinalang.messaging.rabbitmq.util.MessageUtils"
} external;
