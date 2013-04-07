function Create(oEventManager, oModuleManager, oView, oMenuModel, oTestModel)
	local super = Controller.Create(oEventManager, oModuleManager, oView, oMenuModel)
	local self = {}
	setmetatable(self, {__index = super})
	
	local function OnKeyDown(ivKeyCode)
		oTestModel.LastEvent = "Keydown! KeyCode: "..ivKeyCode
		oEventManager.Emit(self, ModuleEvents.Render, oView.Render())
	end
	
	local function OnClick(ivButton, ivXCoord, ivYCoord)
		oTestModel.LastEvent = "Mouse click! Button: "..ivButton..", X: "..ivXCoord..", Y: "..ivYCoord
		oEventManager.Emit(self, ModuleEvents.Render, oView.Render())
	end
	
	local function OnDrag(ivButton, ivXCoord, ivYCoord)
		oTestModel.LastEvent = "Mouse Drag! Button: "..ivButton..", X: "..ivXCoord..", Y: "..ivYCoord
		oEventManager.Emit(self, ModuleEvents.Render, oView.Render())
	end
	
	local function OnScroll(ivDirection, ivXCoord, ivYCoord)
		oTestModel.LastEvent = "Mouse Scroll! Direction: "..ivDirection..", X: "..ivXCoord..", Y: "..ivYCoord
		oEventManager.Emit(self, ModuleEvents.Render, oView.Render())
	end
	
	function self.Activate()
		super.Activate()
		oEventManager.Bind(KeyEvents.KeyDown, OnKeyDown)
		oEventManager.Bind(MouseEvents.Click, OnClick)
		oEventManager.Bind(MouseEvents.Drag, OnDrag)
		oEventManager.Bind(MouseEvents.Scroll, OnScroll)
	end
	
	function self.Deactivate()
		super.Deactivate()
		oEventManager.Unbind(KeyEvents.KeyDown, OnKeyDown)
		oEventManager.Unbind(MouseEvents.Click, OnClick)
		oEventManager.Unbind(MouseEvents.Drag, OnDrag)
		oEventManager.Unbind(MouseEvents.Scroll, OnScroll)
	end
	
	return self
end