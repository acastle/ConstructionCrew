function Create(oEventManager, oModuleManager, oView, oMenuModel, oDesignModel)
	local super = Controller.Create(oEventManager, oModuleManager, oView, oMenuModel)
	local self = {}
	setmetatable(self, {__index = super})

	return self
end