# Brain Computer Interfaces

## Using machine learning to classify the words based on EEG data

#### In this dissertation, the main aim is to utilize machine learning models to conduct classification of the 4 words based on the mode of stimulus perceived by the participant. With the use of the EPOC+ device and OpenViBE software, this study was able to obtain EEG data from 10 willing participants. With the use of a Convolutional Neural Network, a Support Vector Machine and a Random Forest, accuracies for the 4-way classification range from 24% up to 39%, well above-chance level.

#### The main idea behind the project titled “Brain computer interfaces: using Machine Learning to ‘translate your thoughts” is essentially one that deals in understanding how machine learning techniques can be used to predict the words used in healthcare.

##### To run this code, please follow the following steps:

1. main.ipynb is the main code for this project. All instructions to run code are present in notebook with comments.
2. To run OpenViBE software, Emotiv device required (EPOC+ was used for this project), CyKit is used to connect Bluetooth dongle of device to PC.
3. OpenViBE designer, acquisition server, CyKit downloaded from https://github.com/scottwellington/FEIS/tree/v1.1 packages.
4. Emotiv applications downloaded from https://www.emotiv.com/emotiv-launcher/ .

##### handle_headers.py is used to change CSV files to required format by labelling columns and data.
##### Randomise_sequence.py is used to create random sequence for Lua script.


##### All data can be found here: https://drive.google.com/drive/folders/1yOWKGGSMLYj_K_Vaq0wTx6WtS_0xOEDg?usp=sharing until September 9th, 2027.
