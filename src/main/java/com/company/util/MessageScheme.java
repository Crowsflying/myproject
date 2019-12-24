package com.company.util;

import backtype.storm.spout.Scheme;
import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Values;

import java.util.List;

public class MessageScheme implements Scheme {
    @Override
    public List<Object> deserialize(byte[] bytes) {
        String msg=new String(bytes);
        return new Values(msg);
    }

    @Override
    public Fields getOutputFields() {
        return new Fields("msg");
    }
}
