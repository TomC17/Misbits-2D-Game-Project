--music from https://incompetech.com/music/royalty-free/index.html?isrc=USUAN1300012
local composer = require("composer")

local scene = composer.newScene()
display.setDefault("background", 0, 0, 0)

audio.reserveChannels(1)
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local function gotoGame()
  composer.gotoScene("game")
end

local function gotoShop()
  composer.gotoScene("shop", {time = 800, effect = "slideDown"})
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create(event)
  local sceneGroup = self.view
  -- Code here runs when the scene is first created but has not yet appeared on screen
  local background = display.newImageRect(sceneGroup, "images/menuBackgroundWIP.png", 1920, 1080)
  background.x = display.contentCenterX
  background.y = display.contentCenterY

  local title = display.newImageRect(sceneGroup, "images/title.png", 1000, 600)
  title.x = display.contentCenterX
  title.y = 300

  local gameButton = display.newImageRect(sceneGroup, "images/shop button template.png", 500, 100)
  gameButton.x = display.contentCenterX
  gameButton.y = 800
  local gameButtonText =
  display.newText(sceneGroup, "Start the Game", display.contentCenterX, 800, native.newFont "Emulogic.ttf", 20)
  gameButtonText:setFillColor(1, 1, 1)

  local shopButton = display.newImageRect(sceneGroup, "images/shop button template.png", 500, 100)
  shopButton.x = display.contentCenterX
  shopButton.y = 910
  local shopButtonText =
  display.newText(sceneGroup, "High Scores", display.contentCenterX, 910, native.newFont "Emulogic.ttf", 20)
  shopButtonText:setFillColor(1, 1, 1)

  gameButton:addEventListener("tap", gotoGame)
  shopButton:addEventListener("tap", gotoShop)
end

  mainBackgroundMusic = audio.loadSound("sound/bgm3.mp3")
-- show()
function scene:show(event)
  local sceneGroup = self.view
  local phase = event.phase

  if (phase == "will") then
    -- Code here runs when the scene is still off screen (but is about to come on screen)

  elseif (phase == "did") then
        audio.play(mainBackgroundMusic, {channel = 1, loops = -1})
    -- Code here runs when the scene is entirely on screen
  end
end

-- hide()
function scene:hide(event)
  local sceneGroup = self.view
  local phase = event.phase

  if (phase == "will") then
        audio.stop()
    -- Code here runs when the scene is on screen (but is about to go off screen)
  elseif (phase == "did") then
    -- Code here runs immediately after the scene goes entirely off screen
        composer.removeScene("menu")
  end
end

-- destroy()
function scene:destroy(event)
  local sceneGroup = self.view
  -- Code here runs prior to the removal of scene's view
    audio.dispose(mainBackgroundMusic)
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
-- -----------------------------------------------------------------------------------

return scene
