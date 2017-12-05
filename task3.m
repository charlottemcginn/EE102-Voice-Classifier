function task3()
    % Part A
    matlabFile = load ('Audiorecords.mat');
    voices = matlabFile.trainAudiorecords;
    voice1 = voices(1, 1:24000);
    voice2 = voices(2, 1:24000);
    
    T_voice1 = transpose(voice1);
    T_voice2 = transpose(voice2);
    
    fft_voice1 = fft(T_voice1);
    fft_voice2 = fft(T_voice2);
    
    mag_fft_voice1 = abs(fft_voice1);
    mag_fft_voice2 = abs(fft_voice2);
    

    time = 0:23999;
    %plot(time, mag_fft_voice1, 'r');
    %plot(time, mag_fft_voice2, 'b');
    
    % Part B
    centered_mag_fft_voice1 = fftshift(mag_fft_voice1);
    centered_mag_fft_voice2 = fftshift(mag_fft_voice2);
    
    time_centered = -12000:11999;
    %plot(time_centered, centered_mag_fft_voice1, 'r');
    plot(time, centered_mag_fft_voice2, 'b');
    
end