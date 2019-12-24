package com.company.util;

import backtype.storm.Config;
import backtype.storm.LocalCluster;
import backtype.storm.spout.SchemeAsMultiScheme;
import backtype.storm.topology.TopologyBuilder;
import storm.kafka.BrokerHosts;
import storm.kafka.KafkaSpout;
import storm.kafka.SpoutConfig;
import storm.kafka.ZkHosts;

public class CountToMain {
    public static void main(String[] args) {
        String topic="dsj04";
        String zkRoot="/dsj";
        String spountId="kagkaSpount";
        BrokerHosts zkHosts = new ZkHosts("zjgm01:2181,zjgm02:2181,zjgm03:2181");
        TopologyBuilder builder= new TopologyBuilder();
        SpoutConfig conf=new SpoutConfig(zkHosts,topic,zkRoot,spountId);
        conf.forceFromStart=true;//重头开始读取
        conf.scheme=new SchemeAsMultiScheme(new MessageScheme());
        builder.setSpout(spountId,new KafkaSpout(conf));
        builder.setBolt("readBolt",new ReadBolt()).shuffleGrouping(spountId);
        builder.setBolt("writeCountBolt",new WriteCountBolt()).shuffleGrouping("readBolt");
        LocalCluster cluster=new LocalCluster();
        Config conf1=new Config();
        conf1.setNumWorkers(4);
        cluster.submitTopology("count",conf1,builder.createTopology());

    }
}
