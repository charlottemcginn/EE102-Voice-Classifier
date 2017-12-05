function y = task5()
    matlabFile = load ('Audiorecords.mat');
    
    % convert training data to mean
    trainingData = matlabFile.trainAudiorecords;
    T_trainingData = transpose(trainingData);
    fft_trainingData = fft(T_trainingData);
    mag_fft_trainingData = abs(fft_trainingData);
    T_mag_fft_trainingData = transpose(mag_fft_trainingData);
    means_trainingData = mean(T_mag_fft_trainingData,1800);
    
    trainingLabels = matlabFile.trainAudiolabels;
    svmTraining = svmtrain(means_trainingData, trainingLabels);

    % convert testing data to mean
    testData = matlabFile.testAudiorecords;
    T_testData = transpose(testData);
    fft_testData = fft(T_testData);
    mag_fft_testData = abs(fft_testData);
    T_mag_fft_testData = transpose(mag_fft_testData);
    means_testData = mean(T_mag_fft_testData,900);
    
    testLabels = matlabFile.testAudiolabels;
    svmClassification = svmclassify(svmTraining, means_testData);

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