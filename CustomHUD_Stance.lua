-- Register the behaviour
behaviour("CustomHUD_Stance")

function CustomHUD_Stance:Start()
	-- Run when behaviour is created
	self.dataContainer = self.gameObject.GetComponent(DataContainer)
	self.script.AddValueMonitor("MonitorProne", "UpdateStance")
	self.script.AddValueMonitor("MonitorCrouch", "UpdateStance")
	self.script.AddValueMonitor("MonitorSprint", "UpdateStance")
	self.script.AddValueMonitor("MonitorOnLadder", "UpdateStance")
	self.script.AddValueMonitor("MonitorSwimming", "UpdateStance")
	self.script.AddValueMonitor("MonitorDriver", "UpdateStance")
	self.script.AddValueMonitor("MonitorPassenger", "UpdateStance")
	self.script.AddValueMonitor("MonitorFalling", "UpdateStance")
	self.script.AddValueMonitor("monitorHUDVisibility", "onHUDVisibilityChange")
	GameEvents.onActorDied.AddListener(self,"onActorDied")
	GameEvents.onActorSpawn.AddListener(self,"onActorSpawn")

	self.targets.Canvas.enabled = false
	self.stanceVisibility = self.script.mutator.GetConfigurationBool("stanceVisibility")

	if self.dataContainer and Player.actor.team ~= Team.Neutral then
		if self.dataContainer.GetBool("useTeamColors") then
			local colorVector = nil
			if Player.actor.team == Team.Blue then
				colorVector = self.dataContainer.GetVector("blueTeamColor")
			elseif Player.actor.team == Team.Red then
				colorVector = self.dataContainer.GetVector("redTeamColor")
			end
			self.targets.stanceImage.color = Color(colorVector.x/255, colorVector.y/255, colorVector.z/255, 1)
		end
	end
	print("<color=lightblue>[Custom HUD]Initialized Stance Module v1.0.0 </color>")
end

function CustomHUD_Stance:MonitorProne()
	return Player.actor.isProne
end

function CustomHUD_Stance:MonitorCrouch()
	return Player.actor.isCrouching
end

function CustomHUD_Stance:MonitorSprint()
	return Player.actor.isSprinting
end

function CustomHUD_Stance:MonitorOnLadder()
	return Player.actor.isOnLadder
end

function CustomHUD_Stance:MonitorSwimming()
	return Player.actor.isSwimming
end

function CustomHUD_Stance:MonitorDriver()
	return Player.actor.isDriver
end

function CustomHUD_Stance:MonitorPassenger()
	return Player.actor.isPassenger
end

function CustomHUD_Stance:MonitorFalling()
	return Player.actor.isFallenOver
end

function CustomHUD_Stance:UpdateStance()
	if Player.actor.isProne then
		self.targets.stanceImage.sprite = self.dataContainer.GetSprite("proning")
	elseif Player.actor.isCrouching then
		self.targets.stanceImage.sprite = self.dataContainer.GetSprite("crouching")
	elseif Player.actor.isSprinting then
		self.targets.stanceImage.sprite = self.dataContainer.GetSprite("sprinting")
	elseif Player.actor.isOnLadder then
		self.targets.stanceImage.sprite = self.dataContainer.GetSprite("laddering")
	elseif Player.actor.isSwimming then
		self.targets.stanceImage.sprite = self.dataContainer.GetSprite("swimming")
	elseif Player.actor.isDriver then
		self.targets.stanceImage.sprite = self.dataContainer.GetSprite("driving")
	elseif Player.actor.isPassenger then
		self.targets.stanceImage.sprite = self.dataContainer.GetSprite("sitting")
	elseif Player.actor.isFallenOver then
		self.targets.stanceImage.sprite = self.dataContainer.GetSprite("falling")
	else
		self.targets.stanceImage.sprite = self.dataContainer.GetSprite("standing")
	end

end

function CustomHUD_Stance:onActorDied(actor,source,isSilent)
	if actor.isPlayer then
		self.targets.Canvas.enabled = false
	end
end

function CustomHUD_Stance:onActorSpawn(actor)
	if actor.isPlayer then
		self.targets.Canvas.enabled = GameManager.hudPlayerEnabled and self.stanceVisibility
	end
end

function CustomHUD_Stance:monitorHUDVisibility()
	return PlayerHud.hudPlayerEnabled
end

function CustomHUD_Stance:onHUDVisibilityChange()
	self.targets.Canvas.enabled = not Player.actor.isDead and GameManager.hudPlayerEnabled and self.stanceVisibility
end