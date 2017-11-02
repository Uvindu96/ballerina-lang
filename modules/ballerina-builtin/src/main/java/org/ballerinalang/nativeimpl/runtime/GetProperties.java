/*
 *  Copyright (c) 2017, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package org.ballerinalang.nativeimpl.runtime;

import org.ballerinalang.bre.Context;
import org.ballerinalang.model.types.TypeKind;
import org.ballerinalang.model.values.BMap;
import org.ballerinalang.model.values.BString;
import org.ballerinalang.model.values.BValue;
import org.ballerinalang.natives.AbstractNativeFunction;
import org.ballerinalang.natives.annotations.BallerinaFunction;
import org.ballerinalang.natives.annotations.ReturnType;

import java.util.Properties;

/**
 * Native function ballerina.runtime:getProperties.
 *
 * @since 0.94.1
 */
@BallerinaFunction(
        packageName = "ballerina.runtime",
        functionName = "getProperties",
        returnType = {@ReturnType(type = TypeKind.MAP)},
        isPublic = true
)
public class GetProperties extends AbstractNativeFunction {

    @Override
    public BValue[] execute(Context context) {
        Properties properties = System.getProperties();
        BMap<String, BString> propertyMap = new BMap<>();
        properties.forEach((key, value) -> propertyMap.put(key.toString(), new BString(value.toString())));
        return getBValues(propertyMap);
    }
}
