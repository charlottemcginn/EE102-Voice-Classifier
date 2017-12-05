function y = task4()
    matlabFile = load ('Audiorecords.mat');
    
    % convert training data to power spec
    trainingData = matlabFile.trainAudiorecords;
    T_trainingData = transpose(trainingData);
    fft_trainingData = fft(T_trainingData);
    mag_fft_trainingData = abs(fft_trainingData);
    powerSpec_trainingData = mag_fft_trainingData.^2;
    T_powerSpec_trainingData = transpose(powerSpec_trainingData);
    
    trainingLabels = matlabFile.trainAudiolabels;
    svmTraining = svmtrain(T_powerSpec_trainingData, trainingLabels);

    % convert testing data to power spec
    testData = matlabFile.testAudiorecords;
    T_testData = transpose(testData);
    fft_testData = fft(T_testData);
    mag_fft_testData = abs(fft_testData);
    powerSpec_testData = mag_fft_testData.^2;
    T_powerSpec_testData = transpose(powerSpec_testData);
    
    testLabels = matlabFile.testAudiolabels;
    svmClassification = svmclassify(svmTraining, T_powerSpec_testData);

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