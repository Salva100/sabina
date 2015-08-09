local composer = require( "composer" )
local physics = require("physics")
local scene = composer.newScene()
 local sabina
 local fondo
 local fondo2
 local piso1
 local toco=false
	local piso2
	local piso3
	local piso11
	local piso22
	local piso33
	local piedra
 local pisogravedad
 local arboles
 local salto
local toque
local SpriteNuevo={}
local spritePaja={}
local posiniy
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



function CrearSprites(xSprite, ySprite, wSprite, hSprite, numberFrames,wColision,hColision, sequenceDataSprite, imagenSprite, grupo )
		
		spriteTam = { width=wSprite, height=hSprite,  numFrames=numberFrames }
		spriteImag = graphics.newImageSheet( imagenSprite, spriteTam )
		SpriteNuevo = display.newSprite( spriteImag, sequenceDataSprite )
		SpriteNuevo.x = xSprite
		SpriteNuevo.y = ySprite

	
		SpriteNuevo.w = wColision*0.5
		SpriteNuevo.h = hColision*0.5
		
		grupo:insert(SpriteNuevo)
		
		return SpriteNuevo
	end
function mover(event) --controles del personaje

	if (event.y==event.yStart) then
	end

	if (event.y>event.yStart) then
		
	sabina:setSequence( "abajo" )
	sabina:play()
	timer.performWithDelay( 1500, function() sabina:setSequence( "corriendo" )
	sabina:play() end ,1)
	end

	if (event.y<event.yStart) then
	--physics.pause()
	sabina:setSequence( "saltando" )
	 sabina:play()
	timer.performWithDelay( 1, function() 
	sabina:play() transition.to(sabina, {y=sabina.y-100})end ,1)
	
	
	--timer.performWithDelay( 1000, function() physics.start()	
	--print("salta") end ,1)
	
	timer.performWithDelay( 1000, function() transition.to(sabina, {y=sabina.y+100} ) sabina:setSequence( "corriendo" ) sabina:play() end ,1)
	salto=true
	
 	end
	
   
end

--[[local function onLocalCollision( self, event )
	if ( event.phase == "began" ) then

		print( "tocando piso"  )
	sabina:setSequence( "corriendo" )
	sabina:play()
	elseif ( event.phase == "ended" ) then

		print( "dejo" )

	end
end]]--
function piedras( )
	 piedra.x=piedra.x-5
	 if(piedra.x<=-10) then
	 	posiy=math.random(centerY*1.5,centerY*1.65)
	 	piedra.x=centerX*2
	 	piedra.y=posiy
	 end
	
end
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
function plataformas( ... )
	piso1.x=piso1.x-5
	piso2.x=piso2.x-5
	piso3.x=piso3.x-5
	piso11.x=piso11.x-5
	piso22.x=piso22.x-5
	piso33.x=piso33.x-5

	if(piso1.x<= -centerX) then
		piso1.x=centerX*2.5
	end
	if(piso2.x<= -centerX) then
		piso2.x=centerX*2.5
	end
	if(piso3.x<= -centerX) then
		piso3.x=centerX*2.5
	end
	if(piso11.x<= -centerX) then
		piso11.x=centerX*2.5
	end
	if(piso22.x<= -centerX) then
		piso22.x=centerX*2.5
	end
	if(piso33.x<= -centerX) then
		piso33.x=centerX*2.5
	end
end
function scene:create( event )
    local group = self.view
 
    --physics.start()

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
     piso11= display.newImage("images/SABINA-artico-01/artico-plataforma-363x177.png",centerX*2.3,centerY*2,group)
    piso11:toBack()
    
   piso22= display.newImage("images/SABINA-artico-01/artico-plataforma-363x177.png",centerX*2.8,centerY*2,group)
    piso22:toBack()
     --physics.addBody( piso2, "static", { friction=0.5, bounce=0.3 } )
    piso33= display.newImage("images/SABINA-artico-01/artico-plataforma-363x177.png",centerX*3.3,centerY*2,group)
    piso33:toBack()
    -- physics.addBody( piso2, "static", { friction=0.5, bounce=0.3 } )
    fondo= display.newImage("images/SABINA-artico-01/artico-bg-2011x600.png",centerX*2,centerY,group)
    fondo:toBack( )
    fondo:addEventListener("touch", mover)
    fondo2= display.newImage("images/SABINA-artico-01/artico-bg-2011x600.png",centerX*5.92,centerY,group)
    fondo2:toBack( )
    fondo2:addEventListener("touch", mover)
    piedra=display.newImage("images/SABINA-artico-01/artico-bloque2-87x63.png",centerX*2,centerY*1.65,group)
    physics.addBody( piedra, "static", { friction=0, bounce=0 } )
    --[[ piedra.collision = onLocalCollision
   piedra:addEventListener( "collision" )]]--


   sabina= CrearSprites(centerX/8*4,centerY*1.65,87,120,18,87,120,sequenceDataSpriteSabina,"images/SABINA-artico-01/artico-sabina-87x120.png",group)
  	
   	sabina:play()
   	posiniy=sabina.y 
    paja1=CrearSprites(centerX,centerY,54,57,6,54,57,sequenceDataSpritePaja,"images/SABINA-artico-01/artico-pajaro-54x57.png",group)
	paja1:play()

	paja2=CrearSprites(centerX,centerY*1.65,54,57,6,54,57,sequenceDataSpritePaja,"images/SABINA-artico-01/artico-pajaro-54x57.png",group)
	paja2:setSequence( "suelo" )
	paja2:play()

   --[[physics.addBody( sabina, "dynamic",{ density=1.0, friction=0.3, bounce=0} )
    sabina.collision = onLocalCollision]]--
    pisogravedad= display.newRect (centerX/3*2,centerY*2, 363, 100) 
    pisogravedad:toBack()

  --[[ physics.addBody( pisogravedad, "static", { friction=0, bounce=0 } )
   pisogravedad.collision = onLocalCollision
   pisogravedad:addEventListener( "collision" )]]--

--Runtime:addEventListener("enterFrame",  corre)
Runtime:addEventListener("enterFrame",  plataformas)
Runtime:addEventListener("enterFrame", mueveEnParalax)

end
 
-- Called immediately after scene has moved onscreen:
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
