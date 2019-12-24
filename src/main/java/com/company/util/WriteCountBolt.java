package com.company.util;

import backtype.storm.task.TopologyContext;
import backtype.storm.topology.BasicOutputCollector;
import backtype.storm.topology.OutputFieldsDeclarer;
import backtype.storm.topology.base.BaseBasicBolt;
import backtype.storm.tuple.Tuple;
import redis.clients.jedis.Jedis;

import java.util.Map;

public class WriteCountBolt extends BaseBasicBolt {
    Jedis jedis=null;

    @Override
    public void prepare(Map stormConf, TopologyContext context) {
        jedis=new Jedis("127.0.0.1",6379);
    }

    @Override
    public void execute(Tuple tuple, BasicOutputCollector basicOutputCollector) {
        String s = tuple.getString(0);
        jedis.hincrBy("username",s,1);//默认1，自动加+1
    }

    @Override
    public void declareOutputFields(OutputFieldsDeclarer outputFieldsDeclarer) {
    }
}
