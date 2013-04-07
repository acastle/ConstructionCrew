function Create(oMenuModel, oTestModel)
	local super = ConstructionCrewView.Create(oMenuModel)
	local self = {}
	setmetatable(self, {__index = super})
	
	function self.Render()
		local frame, ovFrame = super.Render()

		table.insert(frame, {
			X = 2,
			Y = 2,
			BackgroundColor = colors.lightGray,
			Color = colors.white,
			Data = oTestModel.LastEvent
		})

		return frame, ovFrame
	end
	
	return self
end