-- Made by CYBERVIKINGTV

local uid = "empty"

local fullmygmenge = "updating.."

local gesetzt = false

Citizen.CreateThread(function()
	

local cnt = 0

    while true do

-- loop um serverauslastung gering zu halten
if cnt == 100 then
cnt = 0
end

	Citizen.Wait(1)
			
				if IsPauseMenuActive() then
					
					display = false
					TriggerEvent('logo:display', false)
				
				
				--
				-- VERKAUFEN DEBUG TriggerServerEvent("mygverkauf",126)
				--
				
				
				elseif IsPauseMenuActive() == false then

					cnt = cnt + 1
				-- DEBUG	print("count cnt: " .. cnt)
					if cnt == 100 then
						TriggerServerEvent('mygamount', GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))))
					cnt = 0
				-- DEBUG	print("in loop: " .. cnt)
					end
					
						display = true	  
						TriggerEvent('logo:display', true)
						
					
						txtprinter(1.410, 0.795, 1.0,1.0,0.45, "~b~MYG Coins:~r~  ".. fullmygmenge .. '', 255, 255, 255, 255)
						
											
				end
				

    end

	
end)




function txtprinter(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(scale, scale)
	SetTextColour( 0,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)

end



  

AddEventHandler('onClientMapStart', function()
Citizen.CreateThread(function()
  local display = false
TriggerEvent('logo:display', false)

end)
end)


RegisterNetEvent('logo:display')
AddEventHandler('logo:display', function(value)
SendNUIMessage({
 type = "logo",
display = value
})
end)

RegisterNetEvent('setmygamount')
AddEventHandler('setmygamount', function(mygmenge)
 

 fullmygmenge = mygmenge
  

end)
