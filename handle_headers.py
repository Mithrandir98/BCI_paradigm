from pathlib import Path
import pandas as pd
import warnings


# set variables with matching strings corresponding to all the stimulation id labels in OpenVibe paradigm
OVTK_StimulationId_Label_0A = "OVTK_StimulationId_Label_0A"
OVTK_StimulationId_Label_0B = "OVTK_StimulationId_Label_0B"
OVTK_StimulationId_Label_0C = "OVTK_StimulationId_Label_0C"
OVTK_StimulationId_Label_1A = "OVTK_StimulationId_Label_1A"
OVTK_StimulationId_Label_1B = "OVTK_StimulationId_Label_1B"
OVTK_StimulationId_Label_1C = "OVTK_StimulationId_Label_1C"
OVTK_StimulationId_Label_01 = "OVTK_StimulationId_Label_01"
OVTK_StimulationId_Label_02 = "OVTK_StimulationId_Label_02"
OVTK_StimulationId_Label_03 = "OVTK_StimulationId_Label_03"
            
OVTK_StimulationId_Target = "OVTK_StimulationId_Target"

# use dictionary to match Stim ID labels to phone labels


# copy sequence from OpenVibe designer Lua script and change curly brackets to parentheses
sequence = (
        OVTK_StimulationId_Label_0A,
        OVTK_StimulationId_Label_0B,
        OVTK_StimulationId_Label_0C,
        OVTK_StimulationId_Label_1A,
        OVTK_StimulationId_Label_1B,
        OVTK_StimulationId_Label_1C,
        OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_03,

		    OVTK_StimulationId_Label_0A,
        OVTK_StimulationId_Label_0B,
        OVTK_StimulationId_Label_0C,
        OVTK_StimulationId_Label_1A,
        OVTK_StimulationId_Label_1B,
        OVTK_StimulationId_Label_1C,
        OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_03,
        
        OVTK_StimulationId_Target,

		    OVTK_StimulationId_Label_0A,
        OVTK_StimulationId_Label_0B,
        OVTK_StimulationId_Label_0C,
        OVTK_StimulationId_Label_1A,
        OVTK_StimulationId_Label_1B,
        OVTK_StimulationId_Label_1C,
        OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_03,

		    OVTK_StimulationId_Label_0A,
        OVTK_StimulationId_Label_0B,
        OVTK_StimulationId_Label_0C,
        OVTK_StimulationId_Label_1A,
        OVTK_StimulationId_Label_1B,
        OVTK_StimulationId_Label_1C,
        OVTK_StimulationId_Label_01,
        OVTK_StimulationId_Label_02,
        OVTK_StimulationId_Label_03,
        
        OVTK_StimulationId_Target,

)

labels = {"OVTK_StimulationId_Label_0A" : 'apple',
                      "OVTK_StimulationId_Label_0B" : 'dog',
                      "OVTK_StimulationId_Label_0C" : 'pencil',
                      "OVTK_StimulationId_Label_1A" : 'apple',
                      "OVTK_StimulationId_Label_1B" : 'dog',
                      "OVTK_StimulationId_Label_1C" : 'pencil',
                      "OVTK_StimulationId_Label_01" : 'apple',
                      "OVTK_StimulationId_Label_02" : 'dog',
                      "OVTK_StimulationId_Label_03" : 'pencil',
                      "OVTK_StimulationId_Target" : 'break'}

modes = {"OVTK_StimulationId_Label_0A" : 'text',
                      "OVTK_StimulationId_Label_0B" : 'visual',
                      "OVTK_StimulationId_Label_0C" : 'audio',
                      "OVTK_StimulationId_Label_1A" : 'text',
                      "OVTK_StimulationId_Label_1B" : 'visual',
                      "OVTK_StimulationId_Label_1C" : 'audio',
                      "OVTK_StimulationId_Label_01" : 'text',
                      "OVTK_StimulationId_Label_02" : 'visual',
                      "OVTK_StimulationId_Label_03" : 'audio',
                      "OVTK_StimulationId_Target" : "None"}


# set the path to directory for the csv files output from OpenVibe
directory = Path("C:/Users/willa/Documents/Diss/BCI_paradigm-main/experiments/")
dfs = []

# keep in mind that this code will read all csv files in the chosen directory
# so make sure no other csv files exist in the chosen directory
for file in directory.glob('*.csv'):
    file_df = pd.read_csv(file)  # create pandas dataframe
    # remove garbage columns, change the headers if necessary
    try:
        file_df = file_df.drop(labels=['Event Id', 'Event Date', 'Event Duration'], axis=1)
    except KeyError as e:
        warnings.warn(f"{e}. Garbage columns were not removed from dataframe.")

    # create columns for label and stage
    file_df['Label'] = ""
    file_df['Mode of Stimulus'] = ""
    file_df['Stage'] = file.stem

    # use epochs to set the labels, since the label is consistent throughout an epoch
    for epoch in range(max(file_df['Epoch'])+1):
        file_df.loc[file_df['Epoch'] == epoch, 'Label'] = labels[sequence[epoch]]

    # use epochs to set the modes, since the mode is consistent throughout an epoch
    for epoch in range(max(file_df['Epoch'])+1):
        file_df.loc[file_df['Epoch'] == epoch, 'Mode of Stimulus'] = modes[sequence[epoch]]

    #dfs.append(file_df)  # add the completed dataframe to a list of dataframes for concatenation

    file_df.to_csv("Labelled/" + file.stem + "_labelled.csv", index=False)  # save dataframe as csv
