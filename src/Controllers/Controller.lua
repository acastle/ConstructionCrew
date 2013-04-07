function Create(oEventManager, oModuleManager, oView, oMenuModel)
	local super = Component.Create(oEventManager)
	local self = {}
	setmetatable(self, {__index = super})

	local function OnClick(ivButton, ivXCoord, ivYCoord)
		local element, p1, p2, p3 = oView.GetElement(ivXCoord, ivYCoord)
		if element == ViewComponents.Menu_Button or (element == nil and oView.MenuShowing()) then
			oView.ToggleMenu()
			oEventManager.Emit(self, ModuleEvents.Render, oView.Render())
		elseif element == ViewComponents.Menu_Item then
			oView.ToggleMenu()
			oModuleManager.ActivateModule(oMenuModel.Modules[p1])
		end
	end

	function self.Activate()
		super.Activate()
		oEventManager.Bind(MouseEvents.Click, OnClick)
	end
	
	function self.Deactivate()
		super.Deactivate()
		oEventManager.Unbind(MouseEvents.Click, OnClick)
	end

	function self.Run()
		oEventManager.Emit(self, ModuleEvents.Render, oView.Render())
	end
	
	return self
end