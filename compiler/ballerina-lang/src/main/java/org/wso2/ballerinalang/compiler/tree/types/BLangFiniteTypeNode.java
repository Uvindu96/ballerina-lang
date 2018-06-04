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
package org.wso2.ballerinalang.compiler.tree.types;

import org.ballerinalang.model.tree.NodeKind;
import org.ballerinalang.model.tree.expressions.ExpressionNode;
import org.ballerinalang.model.tree.types.FiniteTypeNode;
import org.wso2.ballerinalang.compiler.tree.BLangNodeVisitor;
import org.wso2.ballerinalang.compiler.tree.expressions.BLangExpression;

import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

/**
 * {@code BLangFiniteTypeNode} represents a finite type node in Ballerina
 * <p>
 * e.g. 5 | 3 | "abc"
 *
 * @since 0.971.0
 */
public class BLangFiniteTypeNode extends BLangType implements FiniteTypeNode {

    public List<BLangExpression> valueSpace;

    public BLangFiniteTypeNode() {
        this.valueSpace = new ArrayList<>();
    }

    @Override
    public List<? extends ExpressionNode> getValueSet() {
        return valueSpace;
    }

    @Override
    public void addValue(ExpressionNode value) {
        valueSpace.add((BLangExpression) value);
    }

    @Override
    public void accept(BLangNodeVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public NodeKind getKind() {
        return NodeKind.FINITE_TYPE_NODE;
    }

    @Override
    public String toString() {
        StringJoiner stringJoiner = new StringJoiner(" | ");
        valueSpace.forEach(memberTypeNode -> stringJoiner.add(memberTypeNode.toString()));
        return stringJoiner.toString();
    }


}
