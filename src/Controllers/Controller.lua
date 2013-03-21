function Create(oEventManager, oView)
	local super = Component.Create(oEventManager)
	local self = {}
	setmetatable(self, {__index = super})
	
	function self.Activate()
		super.Activate()
		oEventManager.Bind(ModuleEvents.Render, oView.Render)
	end
	
	function self.Deactivate()
		super.Deactivate()
		oEventManager.Unbind(ModuleEvents.Render, oView.Render)
	end

	function self.Run()
		oView.Render()
	end
	
	return self
end