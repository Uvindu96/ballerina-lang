/*
 * Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.ballerinalang.util.metrics;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Track the duration distribution of events.
 */
public interface Timer extends Metric {

    /**
     * Create new builder for {@link Timer}.
     *
     * @param name The name of the metric.
     * @return The builder for {@link Timer}.
     */
    static Builder builder(String name) {
        return new Builder(name);
    }

    /**
     * Builder for {@link Timer}s.
     */
    class Builder extends Metric.Builder<Builder, Timer> {

        private final String name;
        private final List<Tag> tags = new ArrayList<>();
        private String description;

        private Builder(String name) {
            this.name = name;
        }

        @Override
        public Builder description(String description) {
            this.description = description;
            return this;
        }

        @Override
        public Builder tags(String... keyValues) {
            this.tags.addAll(Tags.tags(keyValues));
            return this;
        }

        @Override
        public Builder tags(Iterable<Tag> tags) {
            this.tags.addAll(Tags.tags(tags));
            return this;
        }

        @Override
        public Builder tag(String key, String value) {
            this.tags.addAll(Tags.tags(key, value));
            return this;
        }

        @Override
        public Builder tags(Map<String, String> tags) {
            this.tags.addAll(Tags.tags(tags));
            return this;
        }

        @Override
        public Timer register(MetricRegistry registry) {
            return registry.timer(new MetricId(name, description, tags));
        }
    }

    /**
     * Updates the statistics kept by the timer with the specified amount.
     *
     * @param amount Duration of a single event being measured by this timer.
     * @param unit   Time unit for the amount being recorded.
     */
    void record(long amount, TimeUnit unit);

    /**
     * Updates the statistics kept by the counter with the specified amount.
     *
     * @param duration Duration of a single event being measured by this timer.
     */
    default void record(Duration duration) {
        record(duration.toNanos(), TimeUnit.NANOSECONDS);
    }

    /**
     * @return The number of times that record has been called since this timer was created.
     */
    long count();

}
