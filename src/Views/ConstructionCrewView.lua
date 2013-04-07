function Create(oMenuModel)
	local super = View.Create()
	local self = {}
	setmetatable(self, {__index = super})
	
	local showMenu = false
	
	function self.Render()
		local mX, mY = term.getSize()
		local backgroundFrame = {}
		local overlayFrame = {}
		local x, y
		local currentRow
		local currentInstruction

		-- Draw top bar
		currentRow = ""
		for x = 1, mX do
			currentRow = currentRow.." "
		end
		currentInstruction = {
			X = 1,
			Y = 1,
			BackgroundColor = colors.lightBlue,
			Color = colors.black,
			Data = currentRow
		}
		table.insert(backgroundFrame, currentInstruction)
		
		currentRow = " Menu "
		currentInstruction = {
			X = 1,
			Y = 1,
			Data = currentRow
		}
		if showMenu then
			currentInstruction.BackgroundColor = colors.blue
			currentInstruction.Color = colors.white
		else
			currentInstruction.BackgroundColor = colors.lightBlue
			currentInstruction.Color = colors.black
		end
		table.insert(backgroundFrame, currentInstruction)
		
		-- Draw content area
		for y = 2, mY do
			currentRow = ""
			for x = 1, mX do
				currentRow = currentRow.." "
			end
			currentInstruction = {
				X = 1,
				Y = y,
				BackgroundColor = colors.white,
				Color = colors.black,
				Data = currentRow
			}
			table.insert(backgroundFrame, currentInstruction)
		end
		
		-- Draw the menu
		if showMenu then
			for moduleId = 1, #oMenuModel.Modules do
				local moduleName = oMenuModel.Modules[moduleId]
				currentRow = " "..moduleName
				for x = 2, 20 - string.len(moduleName) do
					currentRow = currentRow.." "
				end
				currentInstruction = {
					X = 1,
					Y = moduleId + 1,
					BackgroundColor = colors.lightGray,
					Color = colors.black,
					Data = currentRow
				}
				table.insert(overlayFrame, currentInstruction)
			end
		end
		
		return backgroundFrame, overlayFrame
	end
	
	function self.ToggleMenu()
		showMenu = not showMenu
	end

	function self.MenuShowing()
		return showMenu
	end
	
	function self.GetElement(ivX, ivY)
		if ivY == 1 and ivX <= 6 then
			return ViewComponents.Menu_Button
		end
		if showMenu and ivY <= #oMenuModel.Modules + 1 and ivY > 1 and ivX <= 20 then
			return ViewComponents.Menu_Item, ivY - 1
		end
	end
	
	return self
end