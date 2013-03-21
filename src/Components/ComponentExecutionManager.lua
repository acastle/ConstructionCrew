function Create()
	local self = {}
	
	function self.Run(oComponents)
		local oTasks = {}
		for _,oComponent in pairs(oComponents) do
			table.insert(oTasks, oComponent.Run)
		end
		
		parallel.waitForAll(unpack(oTasks))
	end
	
	return self
end
