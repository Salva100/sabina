local composer = require( "composer" )
local scene = composer.newScene()

local utils=require("utils")
local sequenceDataSpritePaja =
					{
						{ name="volando", start=1, count=2,time=500 ,loopCount=0 }, --start = en que frame empiezas
						{ name="suelo", start=4,count=3,time=500 ,loopCount=0 },
					
					}

local sequenceDataSpriteSabina =
					{
						{ name="corriendo", start=3, count=6,time=1500 ,loopCount=0 }, --start = en que frame empiezas
						{ name="saltando", start=11,count=2,time=1000 ,loopCount=0 },
						{ name="abajo", start=14,count=2,time=1000 ,loopCount=0 },
						{ name="cae", start= 17,count=2,time=1000 ,loopCount=0 },
					
					}



local function  mueveEnParalax(event)
	
		
		fondo.x=fondo.x-1
		fondo2.x=fondo2.x-1
		arboles.x=arboles.x-2
		arboles2.x=arboles2.x-2
		if (arboles.x <= -centerX*2)  then
	 		arboles.x = centerX*6
	 	end

	 	if (arboles2.x <= -centerX*2)  then
	 		arboles2.x = centerX*6
	 	end 
		if (fondo.x <= -centerX*2)  then
	 		fondo.x = centerX*5.84
	 	end

	 	if (fondo2.x <= -centerX*2)  then
	 		fondo2.x = centerX*5.84
	 	end 	
	 
	
end
function scene:create( event )
    local group = self.view
    sabina= utils.CrearSprites(centerX/8*4,centerY*1.65,87,120,18,87,120,sequenceDataSpriteSabina,"images/SABINA-artico-01/artico-sabina-87x120.png",group)
  	
   	sabina:play()
 	arboles=display.newImage("images/SABINA-artico-01/artico-arboles-1876x216.png",centerX*2,centerY*1.3,group)
    arboles:toBack()
    arboles2=display.newImage("images/SABINA-artico-01/artico-arboles-1876x216.png",centerX*6,centerY*1.3,group)
    arboles2:toBack()
     piso1= display.newImage("images/SABINA-artico-01/artico-plataforma-363x177.png",centerX/3,centerY*2,group)
    piso1:toBack()
    
   piso2= display.newImage("images/SABINA-artico-01/artico-plataforma-363x177.png",centerX,centerY*2,group)
    piso2:toBack()
     --physics.addBody( piso2, "static", { friction=0.5, bounce=0.3 } )
    piso3= display.newImage("images/SABINA-artico-01/artico-plataforma-363x177.png",centerX*1.7,centerY*2,group)
    piso3:toBack()
   	fondo= display.newImage("images/SABINA-artico-01/artico-bg-2011x600.png",centerX*2,centerY,group)
    fondo:toBack( )
    fondo:addEventListener("touch", utils.Mover)
    fondo2= display.newImage("images/SABINA-artico-01/artico-bg-2011x600.png",centerX*5.92,centerY,group)
    fondo2:toBack( )
    fondo2:addEventListener("touch", utils.Mover)
    paja1=utils.CrearSprites(centerX,centerY,54,57,6,54,57,sequenceDataSpritePaja,"images/SABINA-artico-01/artico-pajaro-54x57.png",group)
	paja1:play()

	paja2=utils.CrearSprites(centerX,centerY*1.75,54,57,6,54,57,sequenceDataSpritePaja,"images/SABINA-artico-01/artico-pajaro-54x57.png",group)
	paja2:setSequence( "suelo" )
	paja2:play()

    Runtime:addEventListener("enterFrame", mueveEnParalax)
end

function scene:show( event )
	local group = self.view
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
        
end
 
-- Called when scene is about to move offscreen:
function scene:hide( event )
	local group = self.view
        
        
        composer.removeScene( composer.getSceneName( "current" ) )
 	collectgarbage()
	-- INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks
 
end
 
-- Called prior to the removal of scene's "view" (display group)
function scene:destroy( event )
	local group = self.view

	-- INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	-- Remove listeners attached to the Runtime, timers, transitions, audio tracks
 
end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene