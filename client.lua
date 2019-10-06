
rotation = 1.3 -- rotate / sync

function TXDFile()
	TXD = engineLoadTXD("Kuda.txd")
	engineImportTXD(TXD,30)
end
addEventHandler("onClientResourceStart",resourceRoot,TXDFile)


function DFFFile()
		DFF=engineLoadDFF("Kuda.dff")
		engineReplaceModel(DFF,30)
end
addEventHandler("onClientResourceStart",resourceRoot,DFFFile)


-- animation names
-- [10] = { friendlyName = "Horse", blockName = "HORSE_ANIMATION", path = "Animations/horse_animation.ifp", animations = { 'HORSE_IDLE_1' , 'JUMP_ON_RIGHT' , 'SIT' , 'EXIT_RIGHT' , 'HORSE_RUN' , 'HORSE_SPRINT' , 'HORSE_IDLE_1' , 'SIT_GALOP' , 'HORSE_WALK' , 'SIT_WALK' , 'HORSE_KICK_FORWARD' } }

-- create horse, and bind keys
function horseCreator()
if getElementData(localPlayer, "onHorse", true) then
bindKey ( "a", "down", moveHorse_RotateLeft )
bindKey ( "d", "down", moveHorse_RotateRight )
bindKey ( "w", "down", moveHorse_go )
bindKey ( "w", "up", moveHorse_stop )
bindKey ( "a", "up", moveHorse_RotateLeftEnd )
bindKey ( "d", "up", moveHorse_RotateRightEnd )
bindKey ( "n", "down", moveHorse_kick )
end
customIfp = engineLoadIFP ("horse_animation.ifp", "HORSE_ANIMATION")
end
function horseDestroyer()
unbindKey ( "a", "down", moveHorse_RotateLeft )
unbindKey ( "d", "down", moveHorse_RotateRight )
unbindKey ( "w", "down", moveHorse_go )
unbindKey ( "w", "up", moveHorse_stop )
unbindKey ( "a", "up", moveHorse_RotateLeftEnd )
unbindKey ( "d", "up", moveHorse_RotateRightEnd )
unbindKey ( "n", "down", moveHorse_kick)
end
addEventHandler("onClientResourceStart",resourceRoot,horseCreator)
addEventHandler("onClientResourceStop",resourceRoot,horseDestroyer)

-- Attach 
function horse_Attach()
if getElementData(localPlayer, "onHorse", true) then
triggerServerEvent("attachPlayerToHorseServer", localPlayer, localPlayer)
end
end

-- Move
function moveHorse_RotateLeft()
addEventHandler("onClientRender", root, moveHorse_RotateLeft)
triggerServerEvent ( "rotateServerPlus", localPlayer, localPlayer, forgatasLepteke )
triggerServerEvent ( "rotateServerPlus", localPlayer, "lo", forgatasLepteke )
end

function moveHorse_RotateLeftEnd()
removeEventHandler("onClientRender", root, moveHorse_RotateLeft)
end

function moveHorse_RotateRight()
addEventHandler("onClientRender", root, moveHorse_RotateRight)

triggerServerEvent ( "rotateServerMinus", localPlayer, localPlayer, forgatasLepteke )
triggerServerEvent ( "rotateServerMinus", localPlayer, "lo", forgatasLepteke )
end

function moveHorse_RotateRightEnd()
removeEventHandler("onClientRender", root, moveHorse_RotateRight)
end

function moveHorse_go()
triggerServerEvent ( "setAnimationOnServer", localPlayer, localPlayer, "HORSE_SPRINT", "SIT_GALOP" )
end

function moveHorse_stop()
triggerServerEvent ( "setAnimationOnServer", localPlayer, localPlayer, "HORSE_IDLE_1", "SIT" )
end

function moveHorse_kick()
triggerServerEvent ( "setAnimationOnServer", localPlayer, localPlayer, "HORSE_KICK_FORWARD", "SIT_GALOP" )
end

-- Call from server
function setAnimationOnClient(elementa, animation)
setPedAnimation(elementa, "HORSE_ANIMATION", animation)
end
addEvent("setAnimationOnClient", true)
addEventHandler("setAnimationOnClient", getRootElement(), setAnimationOnClient)