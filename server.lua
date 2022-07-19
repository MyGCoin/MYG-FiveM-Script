-- Made by CYBERVIKINGTV

local uid = "empty"

local function holeid()
    local player = source
    local licenseidentifier
    local identifiers = GetPlayerIdentifiers(player)

    for _, v in pairs(identifiers) do
        if string.find(v, "license") then
            licenseidentifier = v
            break
        end
    end

licenseidentifier = licenseidentifier:gsub("%license:", "")
uid = licenseidentifier
-- DEBUG print("idented: ".. licenseidentifier)
   
end


local lic =""

Citizen.CreateThread(function(source)
    Wait(50)
		
		
		  local license
   for k, v in ipairs(GetPlayerIdentifiers(source)) do
      if string.match(v, "license:") then
         license = v
         break
      end
   
    
	Citizen.Wait(1000)

	
end
end)



-- RegisterNetEvent('mygverkauf')
RegisterNetEvent('mygverkauf')
AddEventHandler('mygverkauf', function(dat)
     local dats =  dat
	 
holeid()

local license = uid
   -- DEBUG   print("empfangen: " .. dats .." mit uid:" .. uid )
	
	
	MySQL.Async.fetchAll('SELECT MYGcoin FROM users WHERE identifier = @license', {['@license'] = license}, function(result)
		MYGAmount = result[1].MYGcoin
-- DEBUG		print("MYG Coin amount: ", MYGAmount)
		
	end)
		
 
 
 
 
end)

RegisterServerEvent('mygamount')
AddEventHandler('mygamount', function(playerid)
     
	 
holeid()

local license = uid
  -- DEBUG    print("aus mygamount uid:" .. uid )
	
	local MYGAmount = "0"
	
	MySQL.Async.fetchAll('SELECT MYGcoin FROM users WHERE identifier = @license', {['@license'] = license}, function(result)
		MYGAmount = result[1].MYGcoin
-- DEBUG		print("MYG Coin amount: ", MYGAmount)
	TriggerClientEvent("setmygamount", playerid, MYGAmount)
  	
	end)
	
	 
 
end)