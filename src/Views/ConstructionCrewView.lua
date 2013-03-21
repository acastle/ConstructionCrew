function Create(oMenuModel)
	local super = View.Create()
	local self = {}
	setmetatable(self, {__index = super})
	
	local showMenu = false
	
	function self.Render()
		local mX, mY = term.getSize()
		local x, y
		
		-- Draw top bar
		term.setBackgroundColor(colors.lightBlue)
		y = 1
		for x = 1, mX do
			term.setCursorPos(x, y)
			term.write(" ")
		end
		term.setCursorPos(1, 1)
		
		if showMenu then 
			term.setBackgroundColor(colors.gray) 
			term.setTextColor(colors.white)
		else
			term.setTextColor(colors.gray)
		end
		term.write(" Menu ")
		
		-- Draw content area
		term.setBackgroundColor(colors.white)
		for y = 2, mY do
			for x = 1, mX do
				term.setCursorPos(x, y)
				term.write(" ")
			end
		end
		
		-- Draw the menu
		if showMenu then
			term.setBackgroundColor(colors.lightGray)
			term.setTextColor(colors.black)
			for moduleId = 1, #oMenuModel.Modules do
				local moduleName = oMenuModel.Modules[moduleId]
				term.setCursorPos(1, moduleId + 1)
				term.write(" "..moduleName)
				for x = 2, 20 - string.len(moduleName) do
					term.write(" ")
				end
			end
		end
		
		term.setCursorPos(1, 1)
	end
	
	function self.ToggleMenu()
		showMenu = not showMenu
	end
	
	function self.IsMenuShowing()
		return showMenu
	end
	
	function self.IsInsideMenu(ivX, ivY)
		if ivY == 1 then
			return false
		end
		if ivX > 20 then
			return false
		end
		if ivY > #oMenuModel.Modules + 1 then
			return false
		end
		return true
	end
	
	return self
end