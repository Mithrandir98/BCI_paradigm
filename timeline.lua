

function initialize(box)

	dofile(box:get_config("${Path_Data}") .. "/plugins/stimulation/lua-stimulator-stim-codes.lua")

	-- each stimulation sent that gets rendered by Display Cue Image box 
	-- should probably have a little period of time before the next one or the box wont be happy
	
	baseline_duration = 5
	speaking_duration = 5
	blank_duration = 1
    cue_duration = 5
	rest_duration = 5
    break_duration = 60
	post_trial_duration = 1
	
	sequence = {
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
        OVTK_StimulationId_Label_1B, --randomize this
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

	}

end

function process(box)

	local t = 0

	-- Delays before the trial sequence starts

	box:send_stimulation(1, OVTK_StimulationId_BaselineStart, t, 0)
	t = t + baseline_duration

	-- creates each trial
	for i = 1, #sequence do

		box:send_stimulation(1, OVTK_GDF_Start_Of_Trial, t, 0)
			
		--stimuli
		box:send_stimulation(1, OVTK_StimulationId_Label_00, t, 0)
		box:send_stimulation(1, sequence[i], t, 0)
		t = t + cue_duration

		--speaking
		box:send_stimulation(1, OVTK_GDF_Tongue, t, 0)
		t = t + speaking_duration

		box:send_stimulation(1, OVTK_GDF_VEP, t, 0)
		t = t + blank_duration

		box:send_stimulation(1, OVTK_GDF_Tongue, t, 0)
		t = t + speaking_duration

		box:send_stimulation(1, OVTK_GDF_VEP, t, 0)
		t = t + blank_duration

		box:send_stimulation(1, OVTK_GDF_Tongue, t, 0)
		t = t + speaking_duration

		box:send_stimulation(1, OVTK_GDF_VEP, t, 0)
		t = t + blank_duration

		box:send_stimulation(1, OVTK_GDF_Tongue, t, 0)
		t = t + speaking_duration

		box:send_stimulation(1, OVTK_GDF_VEP, t, 0)
		t = t + blank_duration

		box:send_stimulation(1, OVTK_GDF_Tongue, t, 0)
		t = t + speaking_duration
		
		--rest
		box:send_stimulation(1, OVTK_StimulationId_RestStart, t, 0)
		t = t + rest_duration

		--break
		if sequence[i] == OVTK_StimulationId_Target then
			box:send_stimulation(1, OVTK_StimulationId_Target, t, 0)
			t = t + break_duration
		end
		
		-- end of thinking epoch and trial
		box:send_stimulation(1, OVTK_StimulationId_VisualStimulationStop, t, 0)
		box:send_stimulation(1, OVTK_StimulationId_RestStop, t, 0)
		t = t + post_trial_duration
		box:send_stimulation(1, OVTK_GDF_End_Of_Trial, t, 0)	
	end

	-- send end for completeness	
	box:send_stimulation(1, OVTK_GDF_End_Of_Session, t, 0)
	t = t + 5

	-- used to cause the acquisition scenario to stop and denote final end of file
	box:send_stimulation(1, OVTK_StimulationId_ExperimentStop, t, 0)
		
end
