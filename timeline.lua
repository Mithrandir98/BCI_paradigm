

function initialize(box)

	dofile(box:get_config("${Path_Data}") .. "/plugins/stimulation/lua-stimulator-stim-codes.lua")

	-- each stimulation sent that gets rendered by Display Cue Image box 
	-- should probably have a little period of time before the next one or the box wont be happy
	
	baseline_duration = 5
	speaking_duration = 2
	blank_duration = 1
    cue_duration = 2
	rest_duration = 5
    break_duration = 110
	get_ready_duration = 10
	post_trial_duration = 1
	buffer_duration = 1
	start_slide_duration = 10
	
	sequence = {
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_0A,
		OVTK_StimulationId_Label_0A,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_0D,
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_0B,
		OVTK_StimulationId_Label_0A,
		OVTK_StimulationId_Label_0A,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Label_1C,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Target,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Label_0B,
		OVTK_StimulationId_Label_0C,
		OVTK_StimulationId_Label_03,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_0D,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_0D,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_0C,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Target,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_1C,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_0D,
		OVTK_StimulationId_Label_0A,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_0D,
		OVTK_StimulationId_Label_0D,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_0D,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_0A,
		OVTK_StimulationId_Label_0C,
		OVTK_StimulationId_Label_1C,
		OVTK_StimulationId_Target,
		OVTK_StimulationId_Label_0B,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_0C,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_0C,
		OVTK_StimulationId_Label_1C,
		OVTK_StimulationId_Label_0A,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_1C,
		OVTK_StimulationId_Label_0B,
		OVTK_StimulationId_Label_0D,
		OVTK_StimulationId_Label_0A,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_0C,
		OVTK_StimulationId_Target,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_0B,
		OVTK_StimulationId_Label_0A,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_02,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_0B,
		OVTK_StimulationId_Label_0B,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Target,
		OVTK_StimulationId_Label_1C,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_1C,
		OVTK_StimulationId_Label_1A,
		OVTK_StimulationId_Label_02,
		OVTK_StimulationId_Label_0C,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_0B,
		OVTK_StimulationId_Label_1C,
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_0D,
		OVTK_StimulationId_Label_1C,
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_0C,
		OVTK_StimulationId_Label_0C,
		OVTK_StimulationId_Target,
		OVTK_StimulationId_Label_03,
		OVTK_StimulationId_Label_1C,
		OVTK_StimulationId_Label_0A,
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_0D,
		OVTK_StimulationId_Label_01,
		OVTK_StimulationId_Label_0C,
		OVTK_StimulationId_Label_04,
		OVTK_StimulationId_Label_0B,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_1D,
		OVTK_StimulationId_Label_03,
		OVTK_GDF_Cue_Unknown_Undefined,
		OVTK_StimulationId_Label_1B,
		OVTK_StimulationId_Label_0B
	}

end

function process(box)

	local t = 0

	-- Delays before the trial sequence starts

	box:send_stimulation(1, OVTK_StimulationId_BaselineStart, t, 0)
	t = t + baseline_duration

	box:send_stimulation(1, OVTK_GDF_AEP, t, 0)
	t = t + start_slide_duration

	-- creates each trial
	for i = 1, #sequence do

		box:send_stimulation(1, OVTK_GDF_Start_Of_Trial, t, 0)
		

		--break
		if sequence[i] == OVTK_StimulationId_Target then
			box:send_stimulation(1, OVTK_StimulationId_Target, t, 0)
			t = t + break_duration

			box:send_stimulation(1, OVTK_StimulationId_TrialStart, t, 0)
			t = t + get_ready_duration
		
		else
			--rest
			box:send_stimulation(1, OVTK_StimulationId_RestStart, t, 0)
			t = t + rest_duration
			
			--stimuli
			box:send_stimulation(1, OVTK_StimulationId_Label_00, t, 0)
			box:send_stimulation(1, sequence[i], t, 0)
			t = t + cue_duration


			--buffer
			box:send_stimulation(1, OVTK_GDF_Calibration, t, 0)
			t = t + buffer_duration

			--speaking
			box:send_stimulation(1, OVTK_GDF_Tongue, t, 0)
			t = t + speaking_duration

			-- box:send_stimulation(1, OVTK_GDF_VEP, t, 0)
			-- t = t + blank_duration

			box:send_stimulation(1, OVTK_GDF_Stage_1, t, 0)
			t = t + speaking_duration

			-- box:send_stimulation(1, OVTK_GDF_VEP, t, 0)
			-- t = t + blank_duration

			box:send_stimulation(1, OVTK_GDF_Stage_2, t, 0)
			t = t + speaking_duration

			-- box:send_stimulation(1, OVTK_GDF_VEP, t, 0)
			-- t = t + blank_duration

			box:send_stimulation(1, OVTK_GDF_Stage_3, t, 0)
			t = t + speaking_duration

			-- box:send_stimulation(1, OVTK_GDF_VEP, t, 0)
			-- t = t + blank_duration

			box:send_stimulation(1, OVTK_GDF_Stage_4, t, 0)
			t = t + speaking_duration

			box:send_stimulation(1, OVTK_GDF_class7, t, 0)
			t = t + speaking_duration

			box:send_stimulation(1, OVTK_GDF_class8, t, 0)
			t = t + speaking_duration

			box:send_stimulation(1, OVTK_GDF_class9, t, 0)
			t = t + speaking_duration

			box:send_stimulation(1, OVTK_GDF_class10, t, 0)
			t = t + speaking_duration

			box:send_stimulation(1, OVTK_GDF_class11, t, 0)
			t = t + speaking_duration
			

			
			-- end of thinking epoch and trial
			box:send_stimulation(1, OVTK_StimulationId_VisualStimulationStop, t, 0)
			box:send_stimulation(1, OVTK_StimulationId_RestStop, t, 0)
			t = t + post_trial_duration
			box:send_stimulation(1, OVTK_GDF_End_Of_Trial, t, 0)	
		end
		
	end
	-- send end for completeness	
	box:send_stimulation(1, OVTK_GDF_End_Of_Session, t, 0)
	t = t + 5

	-- used to cause the acquisition scenario to stop and denote final end of file
	-- box:send_stimulation(1, OVTK_StimulationId_ExperimentStop, t, 0)
		
end
