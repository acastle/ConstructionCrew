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
			"Designer",
			"Moar Fluff"
		}
	}
	
	local testModel = {
		LastEvent = ""
	}

	local designModel = {
		CurrentLayer = 1,
		Design = {}
	}
	
	-- Init views
	local testView = TestView.Create(menuModel, testModel)
	local designView = DesignerView.Create(menuModel, designModel)
	
	-- Init components
	local keyListener = KeyboardListener.Create(eventManager)
	local mouseListener = MouseListener.Create(eventManager)
	local viewRenderer = ViewRenderer.Create(eventManager)
	
	-- Init controllers
	local testController = TestController.Create(eventManager, moduleManager, testView, menuModel, testModel)
	local designerController = DesignerController.Create(eventManager, moduleManager, designView, menuModel, designModel)
	
	-- Wire Components to modules
	moduleManager.RegisterComponent(menuModel.Modules[1], viewRenderer)
	moduleManager.RegisterComponent(menuModel.Modules[1], keyListener)
	moduleManager.RegisterComponent(menuModel.Modules[1], mouseListener)
	moduleManager.RegisterComponent(menuModel.Modules[1], testController)
	
	moduleManager.RegisterComponent(menuModel.Modules[2], viewRenderer)
	moduleManager.RegisterComponent(menuModel.Modules[2], keyListener)
	moduleManager.RegisterComponent(menuModel.Modules[2], mouseListener)
	moduleManager.RegisterComponent(menuModel.Modules[2], designerController)

	moduleManager.ActivateModule(menuModel.Modules[menuModel.CurrentModule])
end
main()
