function Create(oEventManager)
	local super = Component.Create(oEventManager)
	local self = {}
	setmetatable(self, {__index = super})
	
	function self.Run()
		while true do
			local event, p1, p2, p3 = os.pullEventRaw()
			if self.IsActive() == false then
				return
			end
			if event == "mouse_click" then
				oEventManager.Emit(self, MouseEvents.Click, p1, p2, p3)
			elseif event == "mouse_scroll" then
				oEventManager.Emit(self, MouseEvents.Scroll, p1, p2, p3)
			elseif event == "mouse_drag" then
				oEventManager.Emit(self, MouseEvents.Drag, p1, p2, p3)
			end
		end
	end
	
	return self
end