-- Register the behaviour
behaviour("CustomHUD_NumericalBalance")

function CustomHUD_NumericalBalance:Start()
	GameEvents.onActorDied.AddListener(self,"onActorDied")
	GameEvents.onActorSpawn.AddListener(self,"onActorSpawn")
    self.targets.Canvas.enabled = false

	self.script.AddValueMonitor("monitorCurrentBalance","updateBalanceUI")
	
	self.balanceBarVisibility = self.script.mutator.GetConfigurationBool("balanceBarVisibility")

	self.script.AddValueMonitor("monitorHUDVisibility", "onHUDVisibilityChange")
end

function CustomHUD_NumericalBalance:monitorHUDVisibility()
	return PlayerHud.hudPlayerEnabled
end

function CustomHUD_NumericalBalance:onHUDVisibilityChange()
	self.targets.Canvas.enabled = not Player.actor.isDead and GameManager.hudPlayerEnabled and self.balanceBarVisibility
end

function CustomHUD_NumericalBalance:monitorCurrentBalance()
	return Player.actor.balance
end

function CustomHUD_NumericalBalance:updateBalanceUI()
    local balance = Mathf.Ceil(Player.actor.balance)
	balance = Mathf.Clamp(balance,0,999)
    self.targets.BalanceText.text = balance
end

function CustomHUD_NumericalBalance:onActorSpawn(actor)
	if actor.isPlayer then
		self.targets.Canvas.enabled = GameManager.hudPlayerEnabled and self.balanceBarVisibility
	end
end

function CustomHUD_NumericalBalance:onActorDied(actor,source,isSilent)
	if actor.isPlayer then
		self.targets.Canvas.enabled = false
	end
end