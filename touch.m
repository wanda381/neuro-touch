
%labtouch - Modeling First-Order tactile neurons with TouchSim (Saal et al., 2017)
% Used in MBM to demonstrate scripting for workshop on touch neurons
%
%
% Description:
% labtouch uses TouchSim_v1 to model the activity of first-order neurons
% in response to virtual stimuli. The main task is to test how
% the manipulation of a single stimulus parameter affects
% the firing rate of virtual neurons
% Come up with a simple research question
% and run a virtual experiment to test it
%
% Other m-files required: TouchSim_v1 package
% MAT-files required: none
%
% Author: Davide Deflorio
% email: *************
% Date: 28/03/2022
%

% Revision: $date, Author, Changes
% 3/3/2025 Max Di Luca, check that Touchsim is downloaded and in path

% Last Revision: $date, Author, Changes
% 4/6/2025 Ann Johnson, the parameters are changed

%% 1. Create population of virtual neurons

clear;

if exist('affpop_hand', 'file')

else

    error('download and install https://github.com/maxdiluca/touchSim/archive/refs/heads/master.zip')

end

hand = affpop_hand('D2d');

%%

% grid for afferent location (based on literature):

% spacing for SA1 = ~ 1.2 mm

% spacing for RA = ~ 0.8

% spacing for PC = ~ 2

[xRA,yRA] = meshgrid(-5:0.8:5,-5:0.8:5);
 
hand = AfferentPopulation();

hand.add_afferents('RA',[xRA(:) yRA(:)]);

n_SA1 = sum(hand.iSA1);

n_RA = sum(hand.iRA);

n_PC = sum(hand.iPC);

n_aff = n_SA1 + n_RA + n_PC;

figure(1)

plot(hand,[],'region','D2d') % region D2d only (tip of index finger)

% plot(a) % whole hand

%% 2. Create virtual stimulus

% stim_sine

% s = stim_sine(freq,amp,phase,len,loc,samp_freq,ramp_len,pin_size,pre_indent)

%

% freq: Vector of frequencies in Hz.

% amp: Vector of amplitudes in mm.

% phase: Vector of phases in degrees.

% len: Stimulus duration in s, default: 1

% loc: Stimulus location in mm, default |[0 0]|.

% samp_freq: Sampling frequency in Hz, default 5000.

% ramp_len: Duration of on and off ramps in s, default 0.05.

% pin_size: Probe radius in mm.

% pre_indent: Static indentation throughout trial, default: 0

s_sine = stim_sine(100, 1, 0, 1, [0 0], 2500, 0.1, 0.5);

figure(2)

plot(s_sine)

%% stim_ramp

% s = stim_ramp(amp,len,loc,samp_freq,ramp_len,ramp_type,pin_size,pre_indent)

% ramp_type: 'sine' or 'lin'

s_ramp = stim_ramp(2,1,[0 0],2500,[],'sine',1);

figure(3)

plot(s_ramp)

%% shape_bar

% shape = shape_bar(width,height,angle,pins_per_mm);

%

% width: width of the bar in mm, default 5 mm.

% height: height of the bar in mm, default 0.5 mm

% angle: Rotation angle of bar in degrees, default 0.

% pins_per_mm: Number of pins per mm, default 10.

shape = shape_bar(5, 1, 45, 20);

figure(4)

plot(shape(:,1), shape(:,2),'o')

s_shape = stim_indent_shape(shape, s_ramp);

figure(5)

plot(s_shape)

%% shape_letter

% shape = shape_letter(letter, width, pins_per_mm)

% letter: string, e.g. 'A'

% width: width of letter in mm, default = 5 mm

% pins_per_mm: Number of pins per mm, default 10.

shape = shape_letter('O',20);

figure(6)

plot(shape(:,1), shape(:,2),'o')

s_letter = stim_indent_shape(shape, s_ramp);

figure(7)

plot(s_letter)

%% 3. Simulate response

% ramp stimulus, single pin

r_letter = hand.response(s_letter);

plot(r_letter) % raster plot

% extract absolute firing rate

rates = r_letter.rate; % all

rates_RA = rates(hand.iRA); % RA

rates_SA1 = rates(hand.iSA1); % SA1

rates_PC = rates(hand.iPC); % PC

% compute adjusted rate wrt max rate for each afferent type

rates(hand.iRA) = rates(hand.iRA)/max(rates(hand.iRA));

rates(hand.iSA1) = rates(hand.iSA1)/max(rates(hand.iSA1));

rates(hand.iPC) = rates(hand.iPC)/max(rates(hand.iPC));

% plot adjusted firing rate on virtual hand

figure(8)

plot(hand,[],'rate',rates)

% bar plot spikes/neurons

figure(9)

subplot(3,1,1)

b = bar(rates_SA1,'FaceColor','flat');

b.CData = [0.4 0.6 0.2];

ylabel('# spikes','FontSize',15)

title('SA1','FontSize',15)

subplot(3,1,2)

b = bar(rates_RA,'FaceColor','flat');

b.CData = [0 0.4 0.8];

ylabel('# spikes','FontSize',15)

title('RA','FontSize',15)

subplot(3,1,3)

b = bar(rates_PC,'FaceColor','flat');

b.CData = [0.8 0.5 0.1];

xlabel('Neuron ID','FontSize',15)

ylabel('# spikes','FontSize',15)

title('PC','FontSize',15)

%% 4. Examples

% Simulation with 2 frequencies 100 and 50 Hz

% - Which type of afferent is more tuned to the change of frequency?

clc

clear

% 4.1 Create hand/finger model

[xRA,yRA] = meshgrid(-5:0.8:5,-5:0.8:5);

[xSA1,ySA1] = meshgrid(-5:1.2:5,-5:1.2:5);

[xPC,yPC] = meshgrid(-5:2:5,-5:2:5);

hand = AfferentPopulation();

hand.add_afferents('RA',[xRA(:) yRA(:)]);

hand.add_afferents('SA1',[xSA1(:) ySA1(:)]);

hand.add_afferents('PC',[xPC(:) yPC(:)]);

% 4.2 Create stimulus, single pin, two frequencies

s_sine100 = stim_sine(100, 1, 0, 1, [0 0], 2500, 0.1, 1); % 100

s_sine50 = stim_sine(50, 1, 0, 1, [0 0], 2500, 0.1, 1); % 50

% 4.3 Simulate response

% sine stimulus, single pin, 100Hz

r_sine100 = hand.response(s_sine100);

figure(10)

plot(r_sine100) % raster plot

% sine stimulus, single pin, 50Hz

r_sine50 = hand.response(s_sine50);

figure(11)

plot(r_sine50) % raster plot

% extract absolute firing rate

rates100 = r_sine100.rate; % all units

rates50 = r_sine50.rate;

rates_SA1_100 = rates100(hand.iSA1); % SA1

rates_SA1_50 = rates50(hand.iSA1); % SA1

rates_RA_100 = rates100(hand.iRA); % RA

rates_RA_50 = rates50(hand.iRA); % RA

rates_PC_100 = rates100(hand.iPC); % PC

rates_PC_50 = rates50(hand.iPC); % PC

figure(12)

subplot(3,1,1)

plot(rates_SA1_100); hold on

plot(rates_SA1_50)

title('SA1','FontSize',15)

ylabel('# spikes','FontSize',15)

subplot(3,1,2)

plot(rates_RA_100); hold on

plot(rates_RA_50)

title('RA','FontSize',15)

legend({'100 Hz','50 Hz'})

ylabel('# spikes','FontSize',15)

subplot(3,1,3)

plot(rates_PC_100); hold on

plot(rates_PC_50)

title('PC','FontSize',15)

xlabel('Neuron ID','FontSize',15)

ylabel('# spikes','FontSize',15)

