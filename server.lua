-- created by Zsemle /https://github.com/preilakos/
-- create horse
-- syntax (playerData player, command command, string x, string y, string z)
function horseCreator(p, c, x, y, z)
alapLo = createPed ( 30, x, y, z )
setPedAnimation(alapLo, "HORSE_ANIMATION", "HORSE_IDLE_1")
end

function attachServer(player, element)
attachElements(player, element, 0, 0 - 0.5, 0)
end
addEvent("attachPlayerToHorseServer", true)
addEventHandler("attachPlayerToHorseServer", getRootElement(), attachServer)

function setAnimationOnServer(player, animation, animation2)
local x, y, z = getElementPosition(alapLo)
triggerClientEvent ( getRootElement(), "setAnimationOnClient", player, alapLo, animation)
triggerClientEvent ( getRootElement(), "setAnimationOnClient", player, player, animation2)
end
addEvent("setAnimationOnServer", true)
addEventHandler("setAnimationOnServer", getRootElement(), setAnimationOnServer)

function rotateServerPlus(elementg, rot)
if elementg == "lo" then
local rotX, rotY, rotZ = getElementRotation(alapLo)
setElementRotation(alapLo,rotX,rotY,rotZ+rot)
else
local rotX, rotY, rotZ = getElementRotation(alapLo)
setElementRotation(elementg,rotX,rotY,rotZ+rot)
end
end
addEvent("rotateServerPlus", true)
addEventHandler("rotateServerPlus", getRootElement(), rotateServerPlus)

function rotateServerMinus(elementg, rot)
if elementg == "lo" then
local rotX, rotY, rotZ = getElementRotation(alapLo)
setElementRotation(alapLo,rotX,rotY,rotZ-rot)
else
local rotX, rotY, rotZ = getElementRotation(alapLo)
setElementRotation(elementg,rotX,rotY,rotZ-rot)
end
end
addEvent("rotateServerMinus", true)
addEventHandler("rotateServerMinus", getRootElement(), rotateServerMinus)
