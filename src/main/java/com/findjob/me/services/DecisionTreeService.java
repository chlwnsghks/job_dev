package com.findjob.me.services;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.findjob.me.models.DecisionTree;
import com.findjob.me.models.Options;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.classifiers.meta.AdaBoostM1;
import weka.classifiers.trees.J48;


import weka.core.Instances;

import java.util.Random;

/**
 * Created by jun on 2017-05-22.
 */
@Service
public class DecisionTreeService {

    private LoadData loadData;
    private FileFactory fileFactory;
    private EvaluationService evaluationService;


    @Autowired
    public DecisionTreeService(FileFactory fileFactory, LoadData loadData, EvaluationService evaluationService){
        this.fileFactory = fileFactory;
        this.loadData = loadData;
        this.evaluationService = evaluationService;

    }

    public String getDecisionTreeInformation(DecisionTree decisionTree) throws Exception{

        if (decisionTree.getTreeType() == DecisionTree.TreeType.J48) {
            return handleJ48(decisionTree);
        }
        return null;
    }

    public JSONObject getDecisionTreeInformationToJson(DecisionTree decisionTree) throws Exception{

        if (decisionTree.getTreeType() == DecisionTree.TreeType.J48) {
            return handleJ48ToJson(decisionTree);
        }
        return null;
    }

    public Classifier buildJ48(DecisionTree decisionTree, Instances data) throws Exception{
        //uses information gain ratio
        J48 j48 = new J48();
        if (decisionTree.getUnpruned() != null){
            j48.setUnpruned(decisionTree.getUnpruned());
        }
        if (decisionTree.getConfidence() != null){
            j48.setOptions(new String[]{"-C", decisionTree.getConfidence()});
        }
        if (decisionTree.getMinNumObj() != null){
            j48.setMinNumObj(decisionTree.getMinNumObj());
        }
        if (decisionTree.isBoost()){
            AdaBoostM1 adaBoostM1 = new AdaBoostM1();
            adaBoostM1.setUseResampling(false);
            adaBoostM1.setClassifier(j48);
            adaBoostM1.buildClassifier(data);
            return adaBoostM1;
        } else {
            j48.buildClassifier(data);
            return j48;
        }

    }



    public String evaluateData(FileFactory.TrainTest data, Classifier classifier, DecisionTree decisionTree) throws Exception{
        Evaluation evaluation = new Evaluation(data.train);
        if (decisionTree.getTestType() == DecisionTree.TestType.CrossValidation){
            evaluation.crossValidateModel(classifier, data.train, 10, new Random(1));
        } else if (decisionTree.getTestType() == DecisionTree.TestType.Train){
            FileFactory.TrainTest d;

                d = fileFactory.handlePublicCar(0);

            evaluation.evaluateModel(classifier, d.train);
        } else {
            evaluation.evaluateModel(classifier, data.test);
        }
        String retString= "";
        //retString += evaluation.toSummaryString() + " \n";
        //retString += evaluation.toClassDetailsString() + " \n";
        //retString += evaluation.toMatrixString() + " \n";
        return retString;
    }


    private String handleJ48(DecisionTree decisionTree) throws Exception{
        FileFactory.TrainTest data = fileFactory.getInstancesFromFile(decisionTree.getFileName(), new Options(decisionTree.isFeatureSelection()));
        Classifier j48 = buildJ48(decisionTree, data.train);

        return /*evaluateData(data, j48, decisionTree) + "\n \n " +*/ j48.toString();
    }

    private JSONObject handleJ48ToJson(DecisionTree decisionTree) throws Exception{
        FileFactory.TrainTest data = fileFactory.getInstancesFromFile(decisionTree.getFileName(), new Options(decisionTree.isFeatureSelection()));
        Classifier j48 = buildJ48(decisionTree, data.train);
        ObjectMapper mapper = new ObjectMapper();
        JSONObject json = mapper.readValue(j48.toString(), JSONObject.class);
        return json;
    }

}
