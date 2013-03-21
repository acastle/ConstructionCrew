function Create(oEventManager)
	local self = {}
	local events = {}
	local active = false
	
	function self.Activate()
		active = true
	end
	
	function self.Deactivate()
		active = false
	end
	
	function self.Run()
	end
	
	function self.IsActive()
		return active == true
	end
	
	return self
end