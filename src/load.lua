local apis = {
	"Utilities/Enum",
	"Utilities/TableUtilities",
	"Events/KeyEvents",
	"Events/MouseEvents",
	"Events/ModuleEvents",
	"Events/EventManager",
	"Modules/ModuleManager",
	"Modules/ConstructionCrew",
	"Components/Component",
	"Components/KeyboardListener",
	"Components/MouseListener",
	"Components/ComponentExecutionManager",
	"Components/ViewRenderer",
	"Controllers/Controller",
	"Controllers/TestController",
	"Controllers/DesignerController",
	"Views/ViewComponents",
	"Views/ConstructionCrewView",
	"Views/View",
	"Views/TestView",
	"Views/DesignerView"
}

function Install(apis)
	local loadedApis = {}
	local success = true
	for i = 1, #apis do
		if os.loadAPI(apis[i]) then
			print("Installing api: "..GetApiName(apis[i]))
			table.insert(loadedApis, apis[i])
		else
			print("Failed to install api: "..GetApiName(apis[i]))
			success = false
			break
		end
	end
	
	if success then
		print("Install complete.")
	else
		Uninstall(loadedApis)
		print("Install finished with errors.")
	end
end

function Uninstall(apis)
	for i = 1, #apis do
		os.unloadAPI(GetApiName(apis[i]))
	end
end

function GetApiName(apiPath)
	return string.gmatch(apiPath, "[a-zA-Z]+$")()
end

local args = { ... }
if args[1] == "install" then
	Install(apis)
elseif args[1] == "uninstall" then
	Uninstall(apis)
else
	print("Unexpected argument, run with 'install' or 'uninstall'")
end