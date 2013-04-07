function Create(oEventManager)
	local super = Component.Create(oEventManager)
	local self = {}
	setmetatable(self, {__index = super})

	local function DrawFrame(oFrameInstructions)
		for _,instruction in pairs(oFrameInstructions) do
			term.setCursorPos(instruction.X, instruction.Y)
			term.setBackgroundColor(instruction.BackgroundColor)
			term.setTextColor(instruction.Color)
			term.write(instruction.Data)
		end
	end

	local function OnRender(oBackgroundFrame, oOverlayFrame)
		DrawFrame(oBackgroundFrame)
		DrawFrame(oOverlayFrame)
	end
	
	function self.Activate()
		super.Activate()
		oEventManager.Bind(ModuleEvents.Render, OnRender)
	end
	
	function self.Deactivate()
		super.Deactivate()
		oEventManager.Unbind(ModuleEvents.Render, OnRender)
	end

	return self
end