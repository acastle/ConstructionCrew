function Create(oMenuModel, oTestModel)
	local super = ConstructionCrewView.Create(oMenuModel)
	local self = {}
	setmetatable(self, {__index = super})
	
	function self.Render()
		super.Render()
		if not self.IsMenuShowing() then
			term.setCursorPos(2, 2)
			term.setTextColor(colors.gray)
			term.setBackgroundColor(colors.white)
			term.write(oTestModel.lastEvent)
		end
	end
	
	return self
end