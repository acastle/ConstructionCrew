function table.map(oTable, oFunction)
	local oReturnTable = {}
	for oIndex,oElement in pairs(oTable) do
		oReturnTable[oIndex] = oFunction(oElement)
	end
	
	return oReturnTable
end