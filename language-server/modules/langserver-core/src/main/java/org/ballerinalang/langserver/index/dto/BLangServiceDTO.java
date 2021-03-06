/*
*  Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
*
*  WSO2 Inc. licenses this file to you under the Apache License,
*  Version 2.0 (the "License"); you may not use this file except
*  in compliance with the License.
*  You may obtain a copy of the License at
*
*    http://www.apache.org/licenses/LICENSE-2.0
*
*  Unless required by applicable law or agreed to in writing,
*  software distributed under the License is distributed on an
*  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
*  KIND, either express or implied.  See the License for the
*  specific language governing permissions and limitations
*  under the License.
*/
package org.ballerinalang.langserver.index.dto;

/**
 * DTO for BServiceSymbol.
 * 
 * @since 0.983.0
 */
public final class BLangServiceDTO {
    
    private int id;
    
    private int packageId;
    
    private String name;

    private BLangServiceDTO(int id, int packageId, String name) {
        this.id = id;
        this.packageId = packageId;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public int getPackageId() {
        return packageId;
    }

    public String getName() {
        return name;
    }

    /**
     * Builder for BLangServiceDTO.
     */
    public static class BLangServiceDTOBuilder {

        private int id = -1;

        private int packageId = -1;

        private String name = "";

        public BLangServiceDTOBuilder setId(int id) {
            this.id = id;
            return this;
        }

        public BLangServiceDTOBuilder setPackageId(int packageId) {
            this.packageId = packageId;
            return this;
        }

        public BLangServiceDTOBuilder setName(String name) {
            this.name = name;
            return this;
        }
        
        public BLangServiceDTO build() {
            return new BLangServiceDTO(this.id, this.packageId, this.name);
        }
    }
}
