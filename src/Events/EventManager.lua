function Create()
	local self = {}
	local eventListeners = {}
	
	function self.Emit(oCaller, oEventType, ...)
		if eventListeners[oEventType] == nil then
			return
		end
		
		for _, handle in ipairs(eventListeners[oEventType]) do
			handle(...)
		end
	end
	
	function self.Bind(oEventType, oHandler)
		if eventListeners[oEventType] == nil then
			eventListeners[oEventType] = {}
		end
		table.insert(eventListeners[oEventType], oHandler)
	end
	
	function self.Unbind(oEventType, oHandler)
		for i,oBoundHandler in ipairs(eventListeners[oEventType]) do
			if oBoundHandler == oHandler then
				table.remove(eventListeners[oEventType], i)
			end
		end
	end
	
	return self
end