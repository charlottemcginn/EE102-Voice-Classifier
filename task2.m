% Task 2: train an SVM and calculate the accuracy on test data

function y = task2()
    matlabFile = load ('Audiorecords.mat');
    trainingData = matlabFile.trainAudiorecords;
    trainingLabels = matlabFile.trainAudiolabels;
    svmTraining = svmtrain(trainingData, trainingLabels);

    testData = matlabFile.testAudiorecords;
    testLabels = matlabFile.testAudiolabels;
    svmClassification = svmclassify(svmTraining, testData);

    % calculate accuracy
    trueNum = 0;
    testNum = 0;

    for i = 1:900
       trueNum = trueNum + testLabels(i,1);
       testNum = testNum + svmClassification(i,1);
    end

    percentAccuracy = (1-abs((testNum - trueNum) / trueNum));
    y = percentAccuracy;
end