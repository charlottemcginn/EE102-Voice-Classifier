% Task 1: Convert the audio files to .wav files
function audioConvert(matrixName, name, num, Fs)
    matlabFile = load ('Audiorecords.mat');
    
    % 0 = trainAudiorecords
    % 1 = testAudiorecords
    if matrixName == 0
        voices = matlabFile.trainAudiorecords;
    else
        voices = matlabFile.testAudiorecords;
    end
    
    voice = voices(num, 1:24000);
    audiowrite(name, voice, Fs);
end
