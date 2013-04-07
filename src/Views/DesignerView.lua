function Create(oMenuModel, oDesignModel)
	local super = ConstructionCrewView.Create(oMenuModel)
	local self = {}
	setmetatable(self, {__index = super})

	function self.Render()
		local bg, overlay = super.Render()
		local mX, mY = term.getSize()
		local x,y
		local currentRow
		local currentInstruction

		for y = 2, mY-1 do
			if y % 2 == 0 then
				currentRow = ((y-2)%10)..""
			else
				currentRow = " "
			end
			for x = 2, mX do
				if y == 2 then
					if (x-1) % 2 == 0 then
						currentRow = currentRow..((x-1)%10)
					else
						currentRow = currentRow.." "
					end
				elseif y > 2 then
					if y % 2 == 0 and (x-1) % 2 == 0 then
						currentRow = currentRow.."+"
					elseif (x-1) % 2 == 0 then
						currentRow = currentRow.."|"
					elseif y % 2 == 0 then
						currentRow = currentRow.."-"
					else
						currentRow = currentRow.." "
					end
				end
			end

			currentInstruction = {
				X = 1,
				Y = y,
				BackgroundColor = colors.white,
				Color = colors.black,
				Data = currentRow
			}
			table.insert(bg, currentInstruction)
		end

		currentRow = " Layer: "..oDesignModel.CurrentLayer.." Active Brush: "
		for x = 20, mX do
			currentRow = currentRow.." "
		end
		currentInstruction = {
			X = 1,
			Y = mY,
			BackgroundColor = colors.lightGray,
			Color = colors.black,
			Data = currentRow
		}
		table.insert(bg, currentInstruction)

		return bg, overlay
	end

	return self
end