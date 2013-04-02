function Create(oEventManager, oView)
	local super = Component.Create(oEventManager)
	local self = {}
	setmetatable(self, {__index = super})
	
	local function OnClick(ivButton, ivXCoord, ivYCoord)
		if oView.IsInsideMenu(ivXCoord, ivYCoord)) then
			oView.ToggleMenu()
		end
		oEventManager.Emit(self, ModuleEvents.Render)
	end

	function self.Activate()
		super.Activate()
		oEventManager.Bind(MouseEvents.Click, OnClick)
		oEventManager.Bind(ModuleEvents.Render, oView.Render)
	end
	
	function self.Deactivate()
		super.Deactivate()
		oEventManager.Unbind(MouseEvents.Click, OnClick)
		oEventManager.Unbind(ModuleEvents.Render, oView.Render)
	end

	function self.Run()
		oView.Render()
	end
	
	return self
end