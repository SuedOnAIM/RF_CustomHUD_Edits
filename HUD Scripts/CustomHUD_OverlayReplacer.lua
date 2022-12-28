-- Register the behaviour
behaviour("CustomHUD_OverlayReplacer")

function CustomHUD_OverlayReplacer:Start()
	GameObject.Find("Overlay Text").gameObject.SetActive(false)
end
	--[[
	self.dataContainer = self.gameObject.GetComponent(DataContainer)

	local overlayGO = GameObject.Find("Overlay Text").gameObject

	self.overlayText = overlayGO.GetComponentInChildren(Text)
	self.overlayText.color = Color(0,0,0,0)
	self.overlayText.supportRichText = false

	self.hasSpawned = false

	self.lifeTime = 1

	local bString = self.script.mutator.GetConfigurationString("blueTeamName")
	local rString = self.script.mutator.GetConfigurationString("redTeamName")

	if bString == "" then
		self.blueTeamName = "<color=white>The</color> Eagles"
	else
		self.blueTeamName = bString
	end
	
	if rString == "" then
		self.redTeamName = "<color=white>The</color> Ravens"
	else
		self.redTeamName = rString
	end 

	self.script.AddValueMonitor("monitorOverlayText", "onOverlayTextChange")

	self.blueTeamHexCode = self.dataContainer.GetString("blueTeamHex")
	self.redTeamHexCode = self.dataContainer.GetString("redTeamHex")
	
	self.blueTeamColor = self.dataContainer.GetColor("blueTeamColor")
	self.redTeamColor = self.dataContainer.GetColor("redTeamColor")

	self.blueTeamText = "<color=" .. self.blueTeamHexCode .. ">" .. self.blueTeamName .. "</color>"
	self.redTeamText = "<color=" .. self.redTeamHexCode .. ">" .. self.redTeamName .. "</color>"

	self.alpha = 1

	self.isValid = true

	GameEvents.onActorSpawn.AddListener(self,"onActorSpawn")
	GameEvents.onCapturePointNeutralized.AddListener(self,"onCapturePointNeutralized")
end

function CustomHUD_OverlayReplacer:OnDisable()
	self.isValid = false
end

function CustomHUD_OverlayReplacer:monitorOverlayText()
	return self.overlayText.text
end

function CustomHUD_OverlayReplacer:onOverlayTextChange()
	self:UpdateText(self.overlayText.text)
end

function CustomHUD_OverlayReplacer:UpdateText(text)
	self.lifeTime = 3
	print(text)
end

function CustomHUD_OverlayReplacer:onCapturePointNeutralized(capturePoint, previousOwner)
	if self.isValid and self.hasSpawnedOnce or Player.actor.team == Team.Neutral then
		local capturePointText = capturePoint.name
		if previousOwner == Team.Red then
			Overlay.ShowMessage("<color=#0000FF>EAGLE</color> NEUTRALIZED " .. capturePointText)
		else
			Overlay.ShowMessage("<color=#FF0000>RAVEN</color> NEUTRALIZED " .. capturePointText)
		end
	end
end

function CustomHUD_OverlayReplacer:onActorSpawn(actor)
	if(actor == Player.actor) then
		self.hasSpawnedOnce = true
	end
end --]]