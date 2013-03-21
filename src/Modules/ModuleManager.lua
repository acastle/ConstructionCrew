function Create(oEventManager, oComponentExecutionManager)
	local self = {}
	
	local modules = {}
	local activeComponents = {}
	
	local function ActivateComponent(oComponent)
		if oComponent.IsActive() == false then
			oComponent.Activate()
		end
	end
	
	local function DeactivateUnsharedModules(svNewModuleName)
		local currentComponents  = activeComponents
		local newComponents = modules[svNewModuleName]
		
		local function DeactivateIfUnshared(oComponent)
			if newComponents[oComponent] == nil then
				oComponent.Deactivate()
			end
		end
		
		table.map(currentComponents, DeactivateIfUnshared)
	end
	
	function self.RegisterComponent(svModuleName, oModuleInstance)
		if modules[svModuleName] == nil then
			modules[svModuleName] = {}
		end
		modules[svModuleName][oModuleInstance] = oModuleInstance
	end
	
	function self.ActivateModule(svModuleName)
		oEventManager.Emit(self, ModuleEvents.Deactivate, svModuleName)
		DeactivateUnsharedModules(svModuleName)
		activeComponents = modules[svModuleName]
		
		table.map(activeComponents, ActivateComponent)
		oEventManager.Emit(self, ModuleEvents.Activate, svModuleName)
		oComponentExecutionManager.Run(activeComponents)
	end

	function self.GetActiveComponents()
		return activeComponents
	end
	
	function self.GetModules()
		local moduleNames = {}
		for svModuleName,_ in pairs(modules[svModuleName]) do
			table.insert(moduleNames, svModuleName)
		end
		
		return moduleNames
	end
	
	return self
end
