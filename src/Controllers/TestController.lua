function Create(oEventManager, oView, oMenuModel, oTestModel)
	local super = Controller.Create(oEventManager, oView)
	local self = {}
	setmetatable(self, {__index = super})
	
	local lastEvent = ""
	
	local function OnKeyDown(ivKeyCode)
		oTestModel.lastEvent = "Keydown! KeyCode: "..ivKeyCode
		oEventManager.Emit(self, ModuleEvents.Render)
	end
	
	local function OnClick(ivButton, ivXCoord, ivYCoord)
		oTestModel.lastEvent = "Mouse click! Button: "..ivButton..", X: "..ivXCoord..", Y: "..ivYCoord
	end
	
	local function OnDrag(ivButton, ivXCoord, ivYCoord)
		oTestModel.lastEvent = "Mouse Drag! Button: "..ivButton..", X: "..ivXCoord..", Y: "..ivYCoord
		oEventManager.Emit(self, ModuleEvents.Render)
	end
	
	local function OnScroll(ivDirection, ivXCoord, ivYCoord)
		oTestModel.lastEvent = "Mouse Scroll! Direction: "..ivDirection..", X: "..ivXCoord..", Y: "..ivYCoord
		oEventManager.Emit(self, ModuleEvents.Render)
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