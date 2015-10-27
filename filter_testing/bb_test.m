%% Plot our raw data
close all
clear all

% Read in audio file
[bb, Fs] = audioread('surfinusa.wav');
bb_two_channel = bb;
bb = bb(:,1);
bb = bb(1:1000000);
bb_two_channel = bb_two_channel(1:1000000,:);
t = 1:length(bb);
bb_f = fft(bb);
bb_f_two_channel = fft(bb_two_channel);

% Plot audio
figure
hold on
subplot(2,1,1)
plot(t,bb)
title('Beach boys')
subplot(2,1,2)
rea = 2*abs(bb_f);
plot(rea(1:length(rea)/2))
title('Beach boys Freq Domain')
hold off

% Plot cliff
figure
cliff =  [1.0, 166.0, 167.0, 329.0, 329.0, 285.0, 289.0, 290.0, 315.0, 286.0, 288.0, 291.0, 283.0, 291.0, 314.0, 283.0, 290.0, 285.0, 310.0, 290.0, 285.0, 284.0, 40.0, 51.0, 53.0, 64.0, 289.0, 286.0, 313.0, 52.0, 329.0, 53.0, 309.0, 317.0, 355.0, 323.0, 356.0, 396.0, 478.0, 479.0, 51.0, 53.0, 53.0, 488.0, 495.0, 496.0, 488.0, 54.0, 56.0, 56.0, 54.0, 51.0, 52.0, 57.0, 59.0, 59.0, 57.0, 52.0, 53.0, 54.0, 53.0, 60.0, 61.0, 62.0, 60.0, 499.0, 499.0, 54.0, 57.0, 57.0, 55.0, 62.0, 64.0, 63.0, 58.0, 60.0, 58.0, 514.0, 515.0, 593.0, 592.0, 593.0, 597.0, 599.0, 596.0, 516.0, 596.0, 598.0, 595.0, 598.0, 595.0, 595.0, 597.0, 591.0, 594.0, 596.0, 598.0, 594.0, 515.0, 509.0, 509.0, 516.0, 522.0, 531.0, 531.0, 511.0, 511.0, 536.0, 537.0, 520.0, 523.0, 523.0, 533.0, 534.0, 538.0, 539.0, 552.0, 555.0, 578.0, 554.0, 554.0, 553.0, 554.0, 544.0, 543.0, 509.0, 512.0, 432.0, 432.0, 507.0, 507.0, 440.0, 439.0, 429.0, 430.0, 502.0, 501.0, 483.0, 488.0, 442.0, 447.0, 442.0, 468.0, 468.0, 505.0, 511.0, 506.0, 481.0, 482.0, 450.0, 435.0, 456.0, 439.0, 457.0, 495.0, 497.0, 495.0, 484.0, 491.0, 484.0, 499.0, 457.0, 459.0, 480.0, 487.0, 490.0, 490.0, 456.0, 460.0, 470.0, 501.0, 455.0, 459.0, 457.0, 460.0, 453.0, 462.0, 501.0, 449.0, 461.0, 461.0, 502.0, 502.0, 502.0, 462.0, 452.0, 464.0, 501.0, 501.0, 506.0, 445.0, 434.0, 436.0, 445.0, 461.0, 453.0, 454.0, 490.0, 493.0, 493.0, 483.0, 485.0, 435.0, 452.0, 449.0, 453.0, 494.0, 495.0, 496.0, 494.0, 488.0, 439.0, 436.0, 455.0, 496.0, 488.0, 490.0, 445.0, 492.0, 491.0, 439.0, 501.0, 501.0, 496.0, 492.0, 492.0, 439.0, 495.0, 499.0, 496.0, 491.0, 491.0, 432.0, 433.0, 502.0, 503.0, 500.0, 440.0, 440.0, 497.0, 503.0, 501.0, 499.0, 498.0, 429.0, 430.0, 431.0, 468.0, 491.0, 432.0, 432.0, 455.0, 456.0, 474.0, 490.0, 431.0, 374.0, 481.0, 480.0, 491.0, 428.0, 374.0, 489.0, 378.0, 482.0, 481.0, 491.0, 491.0, 380.0, 479.0, 493.0, 492.0, 380.0, 493.0, 393.0, 392.0, 400.0, 380.0, 381.0, 385.0, 395.0, 396.0, 388.0, 381.0, 386.0, 394.0, 391.0, 448.0, 449.0, 426.0, 431.0, 425.0, 420.0, 416.0, 433.0, 424.0, 406.0, 413.0, 424.0, 412.0, 412.0, 404.0, 419.0, 412.0, 432.0, 499.0, 499.0, 413.0, 403.0, 403.0, 413.0, 413.0, 495.0, 498.0, 500.0, 502.0, 504.0, 509.0, 500.0, 498.0, 412.0, 412.0, 412.0, 503.0, 503.0, 405.0, 405.0, 400.0, 405.0, 413.0, 415.0, 413.0, 503.0, 506.0, 504.0, 404.0, 404.0, 412.0, 406.0, 433.0, 433.0, 437.0, 428.0, 417.0, 409.0, 409.0, 412.0, 434.0, 422.0, 422.0, 435.0, 408.0, 404.0, 404.0, 411.0, 427.0, 406.0, 426.0, 415.0, 414.0, 425.0, 399.0, 395.0, 396.0, 399.0, 414.0, 418.0, 415.0, 413.0, 418.0, 423.0, 424.0, 393.0, 394.0, 412.0, 386.0, 405.0, 403.0, 418.0, 347.0, 352.0, 352.0, 318.0, 418.0, 411.0, 410.0, 410.0, 411.0, 353.0, 353.0, 289.0, 296.0, 298.0, 374.0, 413.0, 415.0, 412.0, 409.0, 406.0, 409.0, 412.0, 352.0, 347.0, 352.0, 352.0, 327.0, 319.0, 311.0, 282.0, 283.0, 377.0, 420.0, 417.0, 412.0, 411.0, 412.0, 353.0, 355.0, 356.0, 353.0, 296.0, 409.0, 325.0, 317.0, 317.0, 365.0, 416.0, 413.0, 413.0, 356.0, 275.0, 316.0, 314.0, 315.0, 316.0, 278.0, 280.0, 280.0, 254.0, 391.0, 362.0, 285.0, 288.0, 388.0, 312.0, 309.0, 313.0, 348.0, 348.0, 361.0, 280.0, 276.0, 275.0, 288.0, 291.0, 289.0, 271.0, 275.0, 275.0, 315.0, 310.0, 315.0, 330.0, 329.0, 329.0, 276.0, 279.0, 281.0, 286.0, 292.0, 285.0, 281.0, 279.0, 276.0, 386.0, 387.0, 328.0, 280.0, 282.0, 285.0, 284.0, 280.0, 366.0, 279.0, 277.0, 273.0, 274.0, 281.0, 330.0, 320.0, 320.0, 330.0, 278.0, 280.0, 276.0, 278.0, 272.0, 275.0, 276.0, 272.0, 280.0, 278.0, 277.0, 279.0, 278.0, 279.0, 302.0, 302.0, 280.0, 279.0, 276.0, 276.0, 282.0, 342.0, 343.0, 310.0, 310.0, 310.0, 315.0, 411.0, 408.0, 410.0, 316.0, 318.0, 318.0, 316.0, 316.0, 312.0, 311.0, 352.0, 171.0, 170.0, 412.0, 411.0, 315.0, 319.0, 321.0, 319.0, 350.0, 121.0, 122.0, 122.0, 173.0, 170.0, 411.0, 313.0, 315.0, 314.0, 370.0, 123.0, 124.0, 124.0, 123.0, 172.0, 171.0, 170.0, 412.0, 350.0, 355.0, 389.0, 314.0, 315.0, 315.0, 125.0, 171.0, 409.0, 316.0, 317.0, 318.0, 316.0, 170.0, 407.0, 399.0, 396.0, 396.0, 399.0, 405.0, 407.0, 162.0, 398.0, 395.0, 393.0, 397.0, 406.0, 163.0, 164.0, 166.0, 163.0, 314.0, 313.0, 314.0, 315.0, 405.0, 406.0, 162.0, 165.0, 165.0, 312.0, 313.0, 392.0, 162.0, 162.0, 165.0, 375.0, 313.0, 313.0, 391.0, 392.0, 163.0, 163.0, 161.0, 164.0, 313.0, 315.0, 316.0, 314.0, 162.0, 164.0, 162.0, 316.0, 316.0, 7.0, 163.0, 162.0, 164.0, 376.0, 316.0, 317.0, 318.0, 317.0, 20.0, 32.0, 20.0, 154.0, 21.0, 364.0, 370.0, 320.0, 155.0, 157.0, 11.0, 21.0, 33.0, 342.0, 368.0, 31.0, 154.0, 20.0, 20.0, 31.0, 29.0, 22.0, 369.0, 159.0, 160.0, 498.0, 30.0, 32.0, 159.0, 155.0, 156.0, 155.0, 155.0, 151.0, 33.0, 32.0, 30.0, 161.0, 31.0, 162.0, 31.0, 31.0, 366.0, 157.0, 157.0, 156.0, 157.0, 153.0, 153.0, 151.0, 30.0, 32.0, 29.0, 364.0, 159.0, 158.0, 158.0, 159.0, 159.0, 29.0, 31.0, 370.0, 160.0, 156.0, 155.0, 345.0, 351.0, 359.0, 350.0, 345.0, 534.0, 489.0, 159.0, 157.0, 538.0, 551.0, 553.0, 541.0, 347.0, 350.0, 349.0, 347.0, 343.0, 388.0, 534.0, 548.0, 166.0, 172.0, 544.0, 549.0, 545.0, 342.0, 450.0, 163.0, 386.0, 385.0, 342.0, 343.0, 169.0, 453.0, 454.0, 419.0, 413.0, 414.0, 418.0, 550.0, 341.0, 343.0, 167.0, 172.0, 167.0, 451.0, 452.0, 413.0, 564.0, 565.0, 563.0, 552.0, 465.0, 455.0, 170.0, 456.0, 450.0, 456.0, 419.0, 343.0, 461.0, 457.0, 454.0, 455.0, 450.0, 455.0, 454.0, 419.0, 421.0, 419.0, 452.0, 400.0, 567.0, 457.0, 457.0, 458.0, 453.0, 453.0, 451.0, 420.0, 562.0, 478.0, 164.0, 403.0, 453.0, 451.0, 399.0, 401.0, 456.0, 455.0, 456.0, 459.0, 417.0, 417.0, 422.0, 422.0, 422.0, 563.0, 461.0, 472.0, 164.0, 392.0, 401.0, 399.0, 458.0, 419.0, 421.0, 424.0, 565.0, 451.0, 166.0, 166.0, 453.0, 451.0, 400.0, 458.0, 453.0, 415.0, 451.0, 402.0, 398.0, 405.0, 462.0, 452.0, 452.0, 414.0, 415.0, 470.0, 411.0, 408.0, 461.0, 463.0, 456.0, 453.0, 435.0, 448.0, 446.0, 446.0, 463.0, 461.0, 412.0, 483.0, 484.0, 437.0, 445.0, 444.0, 445.0, 462.0, 425.0, 433.0, 465.0, 406.0, 434.0, 438.0, 439.0, 622.0, 460.0, 414.0, 411.0, 457.0, 166.0, 456.0, 458.0, 433.0, 435.0, 407.0, 406.0, 435.0, 440.0, 441.0, 477.0, 634.0, 456.0, 458.0, 165.0, 167.0, 461.0, 458.0, 434.0, 405.0, 435.0, 452.0, 165.0, 633.0, 635.0, 457.0, 166.0, 456.0, 461.0, 460.0, 459.0, 405.0, 405.0, 443.0, 598.0, 414.0, 469.0, 471.0, 633.0, 635.0, 636.0, 404.0, 405.0, 442.0, 437.0, 672.0, 467.0, 632.0, 404.0, 404.0, 591.0, 638.0, 634.0, 633.0, 403.0, 402.0, 402.0, 404.0, 431.0, 637.0, 635.0, 401.0, 400.0, 401.0, 418.0, 166.0, 118.0, 430.0, 125.0, 119.0, 645.0, 121.0, 117.0, 117.0, 121.0, 627.0, 636.0, 626.0, 117.0, 735.0, 735.0, 640.0, 118.0, 118.0, 642.0, 115.0, 700.0, 642.0, 117.0, 113.0, 638.0, 642.0, 617.0, 617.0, 639.0, 634.0, 635.0, 111.0, 114.0, 114.0, 389.0, 388.0, 389.0, 638.0, 111.0, 115.0, 388.0, 390.0, 390.0, 634.0, 637.0, 112.0, 110.0, 112.0, 112.0, 389.0, 388.0, 387.0, 386.0, 388.0, 388.0, 111.0, 112.0, 389.0, 624.0, 630.0, 632.0, 826.0, 830.0, 818.0, 814.0, 814.0, 827.0, 828.0, 826.0, 830.0, 816.0, 810.0, 816.0, 828.0, 832.0, 837.0, 832.0, 832.0, 832.0, 833.0, 835.0, 830.0, 836.0, 786.0, 800.0, 835.0, 831.0, 803.0, 830.0, 834.0, 784.0, 817.0, 835.0, 803.0, 815.0, 839.0, 827.0, 819.0, 819.0, 836.0, 765.0, 827.0, 824.0, 816.0, 44.0, 837.0, 806.0, 806.0, 45.0, 45.0, 43.0, 44.0, 44.0, 44.0, 42.0, 45.0, 42.0, 46.0, 321.0, 44.0, 43.0, 43.0, 322.0, 323.0, 324.0, 322.0, 37.0, 325.0, 36.0, 37.0, 41.0, 36.0, 36.0, 38.0, 325.0, 39.0, 37.0, 37.0, 326.0, 327.0, 326.0, 894.0, 898.0, 906.0, 899.0, 894.0, 37.0, 945.0, 958.0, 953.0, 955.0, 884.0, 911.0, 946.0, 946.0, 954.0, 954.0, 958.0, 896.0, 900.0, 916.0, 908.0, 905.0, 900.0, 896.0, 32.0, 945.0, 947.0, 951.0, 32.0, 32.0, 962.0, 959.0, 921.0, 33.0, 953.0, 963.0, 967.0, 955.0, 33.0, 970.0, 924.0, 143.0, 153.0, 154.0, 153.0, 143.0, 974.0, 938.0, 931.0, 139.0, 142.0, 154.0, 150.0, 142.0, 138.0, 972.0, 972.0, 926.0, 929.0, 941.0, 927.0, 150.0, 930.0, 932.0, 28.0, 27.0, 28.0, 980.0, 982.0, 984.0, 988.0, 988.0, 149.0, 151.0, 932.0, 930.0, 146.0, 151.0, 20.0, 139.0, 983.0, 151.0, 149.0, 931.0, 136.0, 148.0, 931.0, 134.0, 133.0, 138.0, 992.0, 150.0, 150.0, 144.0, 146.0, 1052.0, 137.0, 136.0, 133.0, 139.0, 149.0, 28.0, 1027.0, 136.0, 993.0, 996.0, 997.0, 994.0, 149.0, 29.0, 27.0, 1059.0, 136.0, 133.0, 133.0, 1051.0, 133.0, 999.0, 1010.0, 999.0, 132.0, 132.0, 134.0, 134.0, 131.0, 135.0, 1013.0, 1014.0, 133.0, 131.0, 133.0, 28.0, 26.0, 28.0, 1006.0, 1012.0, 1015.0, 1116.0, 1012.0, 133.0, 131.0, 34.0, 131.0, 131.0, 1013.0, 132.0, 1013.0, 130.0, 130.0, 132.0, 132.0, 1117.0, 1120.0, 1118.0, 24.0, 18.0, 23.0, 27.0, 130.0, 132.0, 1125.0, 1126.0, 28.0, 29.0, 1104.0, 1120.0, 25.0, 1098.0, 1090.0, 1118.0, 1094.0, 1118.0, 1096.0, 1099.0, 1096.0, 1097.0, 1121.0, 1128.0, 1128.0, 1122.0, 25.0, 22.0, 22.0, 23.0, 1097.0, 21.0, 21.0, 24.0, 1098.0, 1099.0, 1134.0, 23.0, 22.0, 1097.0, 448.0, 451.0, 452.0, 453.0, 450.0, 1097.0, 450.0, 453.0, 449.0, 25.0, 54.0, 450.0, 53.0, 53.0, 1107.0, 1134.0, 53.0, 1100.0, 1102.0, 1105.0, 1101.0, 22.0, 53.0, 453.0, 453.0, 1108.0, 1104.0, 19.0, 51.0, 50.0, 52.0, 452.0, 452.0, 1104.0, 491.0, 452.0, 1108.0, 1109.0, 1107.0, 19.0, 495.0, 1108.0, 20.0, 18.0, 495.0, 499.0, 501.0, 502.0, 499.0, 1109.0, 20.0, 502.0, 495.0, 18.0, 20.0, 18.0, 496.0, 502.0, 496.0, 1109.0, 1110.0, 17.0, 19.0, 19.0, 495.0, 495.0, 500.0, 500.0, 19.0, 17.0, 496.0, 497.0, 501.0, 502.0, 18.0, 499.0, 17.0, 19.0];
s = size(cliff);
cliff_reshape = reshape(cliff,1,s(1)*s(2))';
subplot(2,1,1)
plot(cliff_reshape)
title('Cliff')
subplot(2,1,2)
cliff_f = 2*abs(fft(cliff_reshape))/1e6;

%normalize until looks good
m=0.011;
cliff_ed = cliff_f + [zeros(1,(length(cliff_f)-length(5*cliff_f(cliff_f>m))))'; 5000000*cliff_f(cliff_f>m)];

plot(cliff_ed)
title('Cliff Freq Domain')

% Filter it
% Wn = 300/500;                   % Normalized cutoff frequency        
% [z,p,k] = butter(9,Wn,'high');  % Butterworth filter
% % [sos] = zp2sos(z,p,k);          % Convert to SOS form
% H = zp2tf(z,p,k);
% sys = tf(z',real(p)',k);
% figure
% impulse(sys)
% % h = fvtool(sos);  
% % 
% % cliff_filter = cliff.* 


% Try multiplying cliff in time domain with audio fft. cliff 
cliff_length = length(cliff_reshape);

%%%%%%%%% This is the important part
cliff_reshape;
padded_cliff = ([cliff_reshape; zeros(length(bb_f)-cliff_length,1)])/10000; %PADDED CLIFF IS THE FILTER
padded_cliff_2 = ([cliff_reshape(1:1000); zeros(length(bb_f)-cliff_length-1000,1)])/10000;
bb_f_two_channel_filt = [bb_f_two_channel(:,1)+bb_f_two_channel(:,1).*padded_cliff; bb_f_two_channel(:,2)+bb_f_two_channel(:,2).*padded_cliff];
%%%%%%%%%

bb_filt_f = bb_f + padded_cliff.*bb_f;
bb_filt_f = bb_f + padded_cliff.*bb_f;
bb_filt_re = abs(bb_filt_f);

figure;
hold on
subplot(2,1,1)
plot(2*bb_filt_re(1:length(bb_filt_re)/2));
title('Cliff Time Shape x FFT')

subplot(2,1,2)
bb_filt = ifft(bb_filt_f);
hold off


bb_two_channel_filt = ifft(bb_f_two_channel_filt);


%% Play back

player = audioplayer(bb_two_channel_filt,Fs);
play(player)