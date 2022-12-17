%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author:   Tim Holden
% School:   University of Colorado Colorado Springs (UCCS)
% Course:   ECE5965 - Intro to Satellite Communications
% Semester: Fall 2022
% Date:     12/14/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear ; clc

% The following is the UTF-8 binary representation of string "My name is Tim"
inputMsg = [0 1 0 0 1 1 0 1 0 1 1 1 1 0 0 1 0 0 1 0 0 0 0 0 0 1 1 0 1 1 1 0 ...
            0 1 1 0 0 0 0 1 0 1 1 0 1 1 0 1 0 1 1 0 0 1 0 1 0 0 1 0 0 0 0 0 ...
            0 1 1 0 1 0 0 1 0 1 1 1 0 0 1 1 0 0 1 0 0 0 0 0 0 1 0 1 0 1 0 0 ...
            0 1 1 0 1 0 0 1 0 1 1 0 1 1 0 1];


constraintLenth = 9;
% constraintLenth = 8;
% constraintLenth = 7;
% constraintLenth = 6;
% constraintLenth = 5;
% constraintLenth = 4;
% constraintLenth = 3;
k = 1; % Number of input bits per each discrete iteration/shift
n = 2; % Number of output bits streams (implies we need two generators)
codeRate = k/n;
EbNo = 1:0.1:10;

% The following are arrays containing eight generator configurations for a
% constraint length of 3
% gen1 = [5 4 5 7 6 7 7 6];
% gen2 = [7 5 4 5 7 6 4 5];

% The following are arrays containing eight generator configurations for a
% constraint length of 4
% gen1 = [15 13 15 17 10 15 12 13];
% gen2 = [17 10 10 10 11 11 11 11];

% The following are arrays containing eight generator configurations for a
% constraint length of 5
% gen1 = [23 25 31 36 25 34 21 26];
% gen2 = [35 31 25 25 36 23 20 21];

% The following are arrays containing eight generator configurations for a
% constraint length of 6
% gen1 = [53 73 56 43 63 43 76 65];
% gen2 = [75 65 67 65 54 72 65 76];

% The following are arrays containing eight generator configurations for a
% constraint length of 7
% gen1 = [133 176 171 177 171 126 177 162];
% gen2 = [171 135 131 133 133 145 131 145];

% The following are arrays containing eight generator configurations for a
% constraint length of 8
% gen1 = [247 267 337 216 377 315 275 225];
% gen2 = [371 363 216 337 225 210 356 377];

% The following are arrays containing eight generator configurations for a
% constraint length of 9
gen1 = [561 670 715 453 572 735 547 746];
gen2 = [753 715 670 572 453 534 746 547];

% The following are arrays containing eight generator configurations for a
% constraint length of 10
%gen1 = [1563 1631 1035 1276 1625 1437 1356 1562];
%gen2 = [1631 1563 1276 1035 1437 1625 1163 1347];

trellis = poly2trellis(constraintLenth,[gen1(1) gen2(1)]);
coded = convenc(inputMsg,trellis);
tblen = length(inputMsg);
decoded = vitdec(coded,trellis,tblen,'trunc','hard');

if all(inputMsg == decoded)
    disp("Input message equals decoded message so we're good to go!")
else
    disp([" " newline "Somethings wrong...?"])
end

% The following calculates the minimum free distance
dspec = distspec(trellis,9);
out = sprintf('The minimum free distance is: %s', num2str(dspec.dfree));
disp(out)

% BER coding function to return upper bound or approx. BER for signal
berub = bercoding(EbNo, 'conv', 'hard', codeRate, dspec);

% Plot of the Bit Error Probability
%figure(1)
figure('Name', 'Constraint Length = 9, Generators (561,753)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 8, Generators (247,371)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 7, Generators (133,171)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 6, Generators (53,75)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 5, Generators (23,35)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 4, Generators (15,17)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 3, Generators (5,7)', 'NumberTitle','off')
berfit(EbNo, berub)
xlim([1 10])
ylabel('Bit Error Probability')
title('BER Probability vs Eb/No')

% The following calculates the error probability of one error, over 1,000
% trials, at a 95 percent confidence interval, and returns the BER
% probability and the lower & upper bounds of the confidence interval
nerrs = 1;
ntrials = 10^3;
level = 0.95;
[bitErrorRate,interval] = berconfint(nerrs,ntrials,level);
berOut = sprintf('The calculated BER is: %s', num2str(bitErrorRate));
disp(berOut)

% This function evaluates the BER upper bound array returning an array
% containing the index values for BER between 0.001 and 0.002, and the
% first index value is then used as the corresponding index of the SNR
% value below
idx = find(berub < 0.002 & berub >= 0.001);

% Calculate SNR and plot BER probability against SNR
snr = EbNo + 10*log10(2*codeRate)-10*log10(0.5);
snrOut = sprintf('Signal-to-Noise Ratio (SNR) at BER 0.001 is: %s', num2str(snr(idx(1))));
disp(snrOut)
%figure(2)
figure('Name', 'Constraint Length = 9, Generators (561,753)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 8, Generators (247,371)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 7, Generators (133,171)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 6, Generators (53,75)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 5, Generators (23,35)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 4, Generators (15,17)', 'NumberTitle','off')
% figure('Name', 'Constraint Length = 3, Generators (5,7)', 'NumberTitle','off')
plot(snr, berub)
xlim([5.3 7.5])
ylabel('Bit Error Probability')
xlabel('Signal-to-Noise (SNR) Ratio')
title('BER Probability against SNR')
