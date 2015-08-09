local composer = require( "composer" )

display.setStatusBar( display.HiddenStatusBar )
system.setIdleTimer( false ) -- para no apagar la pantalla

centerX = display.contentWidth/2
centerY = display.contentHeight/2

path = ""

  optionsTextMenu = 
        {
            --parent = group,
            text = "",
            width = 300,
            x=centerX,
            y=centerY/3.5,
            align = "center",--required for multi-line and alignment
            font = "fonts/GothamNarrow-Book",
            fontSize = 25
        }

--[[

TRY CATH con la funcion pcall()

function foo () 
  if unexpected_condition then error() end
  print( "pathBaseResource: "..pathBaseResource )
end

  
if pcall(foo) then
      -- no errors while running `foo'      
  else
      -- `foo' raised an error: take appropriate actions
end

]]

composer.gotoScene ( "nivelArtico", { effect = "fade"} )

------HANDLE SYSTEM EVENTS------
function systemEvents(event)
   print("systemEvent " .. event.type)
   if ( event.type == "applicationSuspend" ) then
      print( "suspending..........................." )
   elseif ( event.type == "applicationResume" ) then
      print( "resuming............................." )
   elseif ( event.type == "applicationExit" ) then
      --Cerrar la base de datos
     
      print( "exiting.............................." )
   elseif ( event.type == "applicationStart" ) then
     
            
   end
   return true
end

Runtime:addEventListener( "system", systemEvents )
