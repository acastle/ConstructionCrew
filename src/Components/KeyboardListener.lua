function Create(oEventManager)
	local super = Component.Create(oEventManager)
	local self = {}
	setmetatable(self, {__index = super})

	function self.Run()
		while true do
			local _, oKeycode = os.pullEvent("key")
			if self.IsActive() == false then
				return
			end
			
			oEventManager.Emit(self, KeyEvents.KeyDown, oKeycode)
		end
	end
	
	return self
end