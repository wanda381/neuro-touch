**Modelling Tactile Afferent Responses using TouchSim** 


*Introduction*

Tactile perception plays a crucial role in how humans interact with their environment. The multiple stimuli sensed by the skin is processed through complex neural processes. There are mainly 3 types of tactile neurons: slowly adapting type I (SA1), rapidly adapting (RA), and Pacinian corpuscles (PC). They are responsible in encoding features of touch such as pressure, vibration and texture. Computational modelling of these neurons provides a valuable tool to investigate the mechanisms of somatosensory processing without the constraints of invasive experiments (Saal et al., 2017).
In this study we use TouchSim a simulation environment that replicates the spiking behaviour of tactile afferents in response to mechanical skin stimulation on the finger. It explores how varying a specific parameter like frequency affects the firing response of these afferents. By doing so, we aim to gain deeper insights into how different types of tactile information are encoded. The research question we ask is how does the temporal profile of an indented tactile stimulus: sine wave Vs, ramp affect the firing rate of SA1, RA and PC afferents, while we vary the parameter? Based on prior studies we hypothesise that PC afferents sensitive to high-frequency vibrations, will exhibit significantly stronger responses to the sine wave than the ramp. SA1 afferents on the other hand are tuned to sustained pressure. This will respond more strongly to the ramp stimulus. RA afferents are expected to respond to both but with varied intensity as they adapt fast.

*Methodology*

The afferents were populated in a varied meshgrid giving it a random direction and angle. The Ra had 0.8mm spacing, while the SA1 had 0.6mm spacing , and PC was spaced at 1.2mm, this is shown in figure 1.  They were randomised by 0.1 to 0.5mm to stimulate more realistic, irregular real hand sensor placement. We assume that the real shin afferent distribution is not uniform or perfectly random, thus the model is quite simplified based on this.

Figure 1
Created population of virtual neurons
<img width="1363" height="629" alt="image" src="https://github.com/user-attachments/assets/5f2b0af2-482b-4636-84b2-e44220ed13f5" />

 

The letter stimuli chosen by this study is the M. Two temporal profiles were created, the first one is s_letter_M indentation using a ramp stimulus and s_letter_M2 using a sine stimuli. We simplify the model by assuming that indentation is uniform across the letter shape.
The figures below show the stimulation of the finger how it senses different stimuli. Figure 2 and 3 shows the reaction from a single pin. Figure 4 is the letter M stimuli. And figure 5 shows how the stimuli from letter M generates sensation in different parts of the finger.

Figure 2
Shows the parameters from one pin location
<img width="840" height="381" alt="image" src="https://github.com/user-attachments/assets/9d8b27ab-6fa0-4d97-88c3-093f6822c7a2" />

Figure 3
Shows the amplitude from a single pin
<img width="814" height="370" alt="image" src="https://github.com/user-attachments/assets/e1b1fbca-29e5-492d-9e27-ee790a34c6a4" />


Figure 4 
Shows the stimuli letter M applied to the figure tip
<img width="513" height="396" alt="image" src="https://github.com/user-attachments/assets/93fb6a24-c0db-45db-83a0-634fa3cc1e63" />
 



Figure 5
Shows the sensation from two different pin points when sensing the letter M
<img width="656" height="307" alt="image" src="https://github.com/user-attachments/assets/a987f3e8-d920-4e7e-8a31-ae4b7a6ae5c3" />
<img width="564" height="307" alt="image" src="https://github.com/user-attachments/assets/bdbc1787-6a8f-44d2-a9f1-3edce53dc003" />
<img width="645" height="310" alt="image" src="https://github.com/user-attachments/assets/70b57024-fa84-4006-9f81-aec05d1928cb" />
<img width="566" height="310" alt="image" src="https://github.com/user-attachments/assets/c8b869e3-6af2-40e3-9a27-6e25b0cc387b" />
 	 
 	 

 
*Results*

Version 1: Ramp

Figure 6
Activation of the simulated neurons for version 1
<img width="1334" height="620" alt="image" src="https://github.com/user-attachments/assets/0bd7a1b9-8270-4862-b44d-7ebdd139e6f9" />
 
Figure 7
Shows the Neuron activation plotted against time for version 1
<img width="1172" height="600" alt="image" src="https://github.com/user-attachments/assets/a9d7c44d-7a74-484b-8c96-4a70b9616e1c" />

Figure 8
Shows the spikes for different neurons : PC, RA, SA1 for version 1
<img width="1225" height="610" alt="image" src="https://github.com/user-attachments/assets/6ef4f502-8ed1-4e24-abc1-50f040602b93" />


 
Version 2: Sine

Figure 9
Activation of the simulated neurons for version 2
<img width="1295" height="564" alt="image" src="https://github.com/user-attachments/assets/f1b30714-9003-4691-8fcf-c9372e2b044c" />
 
Figure 10
Shows the Neuron activation plotted against time for version 2
<img width="1173" height="619" alt="image" src="https://github.com/user-attachments/assets/814e2a07-2225-4e45-b71b-570a04de1853" />

Figure 11
Shows the spikes for different neurons: PC, RA, SA1 for version 2
<img width="1206" height="601" alt="image" src="https://github.com/user-attachments/assets/9251564b-a972-442a-9c66-22f113c6f225" />

*Discussion*

For Version 1 of ramp waves, we can see slow changes in the neurons. The RA is more stimulated than than the other ones, with more spikes in the middle. The PC is stimulated but less than RA and more uniform. SA1 is the least stimulated but with some sharp spikes. (Figures 6,7,8) 

For Version 2 of sine waves, we can see fast changes with all neurons being almost evenly stimulated. RA seems to have some sharp spikes in the middle while being evenly stimulated. PC seems to be uniformly stimulated with no sharp spikes. SA1 also seems to have sharp spikes in the middle but uniformly less stimulated than RA.

Thus, our results support is hypothesis that RA and PC will show more reaction to sine waves compared to ramp waves due to stimuli dynamics and vibrations.  SA1 afferents which are slowly adaptive and more sensitive to sustained pressure responds almost similar in both versions but with sharper spikes in version 1, due to continuous increase in pressure. The model stimulation shows how the afferents function differently yet together to provide sensation. Even though it gives a deeper view of how sensation works its not with its limitations. The virtual skin is considered to be of uniform thickness and lacks curvature or dynamic hand movements. Noise is not modelled in this environment and assumes pin-based indentation mimic real-word texture and motion. In future we can test other stimulus parameter varying not just frequency but pin size, shape curvature etc. The model can explore combined stimuli as well.
 

*Reference*


Saal, H. P., Delhaye, B. P., Rayhaun, B. C., & Bensmaia, S. J. (2017). Simulating tactile signals from the whole hand with millisecond precision. Proceedings of the National Academy of Sciences, 114(28). https://doi.org/10.1073/pnas.1704856114

