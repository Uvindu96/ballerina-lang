/*
 * Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.ballerinalang.stdlib.io.nativeimpl;

import org.ballerinalang.jvm.scheduling.Scheduler;
import org.ballerinalang.jvm.values.utils.StringUtils;

import java.io.PrintStream;

/**
 * This class will hold all utility functionalities that require to print to StdOut.
 *
 * @since 1.0.5
 */
public class PrintUtils {

    private PrintUtils() {
    }

    public static void print(Object... values) {
        PrintStream out = System.out;
        if (values == null) {
            out.print((Object) null);
            return;
        }
        for (Object value : values) {
            if (value != null) {
                out.print(StringUtils.getStringValue(Scheduler.getStrand(), value));
            }
        }
    }

    public static void println(Object... values) {
        PrintStream out = System.out;
        if (values == null) {
            out.println((Object) null);
            return;
        }
        StringBuilder content = new StringBuilder();
        for (Object value : values) {
            if (value != null) {
                content.append(StringUtils.getStringValue(Scheduler.getStrand(), value));
            }
        }
        out.println(content);
    }
}
