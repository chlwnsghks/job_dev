package com.findjob.me.models;

/**
 * Created by jun on 2017-05-22.
 */
public class ML {

    protected ML.Files fileName = Files.GOMS2014;
    protected ML.TestType testType = ML.TestType.CrossValidation;

    public Files getFileName() {
        return fileName;
    }

    public void setFileName(Files fileName) {
        this.fileName = fileName;
    }

    public TestType getTestType() {
        return testType;
    }

    public void setTestType(TestType testType) {
        this.testType = testType;
    }

    public static enum Files {
        GOMS2014,Boston, Census, Car, CarBin, CensusBin, CensusKm, CensusEm;
    }

    public static enum TestType {
        CrossValidation, TestData, Train;
    }

}
