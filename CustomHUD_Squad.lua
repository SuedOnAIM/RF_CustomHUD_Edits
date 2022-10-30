-- Register the behaviour
behaviour("CustomHUD_Squad")

function CustomHUD_Squad:Awake()
	self.squadText = self.gameObject.Find("Squad Text").GetComponent(Text)
end

function CustomHUD_Squad:Start()
	
	self.squadTextVisibility = self.script.mutator.GetConfigurationBool("squadTextVisibility")
	GameEvents.onActorDied.AddListener(self,"onActorDied")
	GameEvents.onActorSpawn.AddListener(self,"onActorSpawn")
	self.targets.Canvas.enabled = false

	if self.squadTextVisibility then
		self.targets.Canvas.enabled = true
		self.script.AddValueMonitor("monitorSquadText", "updateSquadText")
		self:updateSquadText()
	elseif not self.squadTextVisibility then
		self.targets.Canvas.enabled = false
	end
	
	self.script.AddValueMonitor("monitorHUDVisibility", "onHUDVisibilityChange")

	print("<color=lightblue>[Custom HUD]Initialized Squad Display Module v1.1.0 </color>")
end

function CustomHUD_Squad:monitorHUDVisibility()
	return PlayerHud.hudPlayerEnabled
end

function CustomHUD_Squad:onHUDVisibilityChange()
	self.targets.Canvas.enabled = not Player.actor.isDead and GameManager.hudPlayerEnabled and self.squadTextVisibility
end

function CustomHUD_Squad:monitorSquadText()
	return self.squadText.text
end

function CustomHUD_Squad:updateSquadText()
	self.targets.squadText.text = self.squadText.text
end

function CustomHUD_Squad:onActorSpawn(actor)
	if actor.isPlayer then
		self.targets.Canvas.enabled = GameManager.hudPlayerEnabled and self.squadTextVisibility
	end
end

function CustomHUD_Squad:onActorDied(actor,source,isSilent)
	if actor.isPlayer then
		self.targets.Canvas.enabled = false
	end
end