local function main()
	if ContructionCrew == nil then
		os.run({}, "load", "install")
	end
	
	-- Init core classes
	local eventManager = EventManager.Create()
	local componentExecutionManager = ComponentExecutionManager.Create()
	local moduleManager = ModuleManager.Create(eventManager, componentExecutionManager)
	
	-- Init models
	local menuModel = {
		CurrentModule = 1,
		Modules = {
			"Test Module",
			"Fluff",
			"Moar Fluff"
		}
	}
	
	local testModel = {
		lastEvent = ""
	}
	
	-- Init views
	local testView = TestView.Create(menuModel, testModel)
	
	-- Init components
	local keyListener = KeyboardListener.Create(eventManager)
	local mouseListener = MouseListener.Create(eventManager)
	
	-- Init controllers
	local testController = TestController.Create(eventManager, testView, menuModel, testModel)
	
	-- Wire Components to modules
	moduleManager.RegisterComponent(menuModel.Modules[1], keyListener)
	moduleManager.RegisterComponent(menuModel.Modules[1], mouseListener)
	moduleManager.RegisterComponent(menuModel.Modules[1], testController)
	
	moduleManager.ActivateModule(menuModel.Modules[menuModel.CurrentModule])
end
main()
