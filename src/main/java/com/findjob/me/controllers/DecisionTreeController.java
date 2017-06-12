package com.findjob.me.controllers;

import com.findjob.me.services.DecisionTreeService;
import com.findjob.me.services.FileFactory;
import com.findjob.me.services.LoadData;
import com.findjob.me.models.DecisionTree;


import com.google.gson.JsonObject;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import weka.classifiers.Classifier;

import java.util.*;


/**
 * Created by jun on 2017-05-22.
 */

@Controller
public class DecisionTreeController {
    @Autowired
    DecisionTreeService decisionTreeService;


    @RequestMapping(value ="/decisiontree", method={RequestMethod.GET})
    public String getDecisionTreeAccuracy(Model model, DecisionTree decisionTree) throws Exception{
        String str = decisionTreeService.getDecisionTreeInformation(decisionTree);
        System.out.print(str);
        return str;
    }

    @RequestMapping(value ="/decisiontreeToJson", method={RequestMethod.GET})
    public String getDecisionTreeAccuracyToJson(Model model, DecisionTree decisionTree) throws Exception{
        JSONObject json = decisionTreeService.getDecisionTreeInformationToJson(decisionTree);
        System.out.print(json.toJSONString());
        return json.toJSONString();
    }

   @RequestMapping(value="/index")
    public void index()throws Exception {

    }
    @RequestMapping(value="/chart2014")
    public void chart2014()throws Exception {

    }


}
