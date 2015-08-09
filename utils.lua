local composer = require( "composer" )
local utils={}

function utils.CrearSprites(xSprite, ySprite, wSprite, hSprite, numberFrames,wColision,hColision, sequenceDataSprite, imagenSprite, grupo )
		
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

	function utils.Mover(event) --controles del personaje

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

	return utils