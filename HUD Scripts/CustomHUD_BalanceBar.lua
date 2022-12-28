-- Register the behaviour
behaviour("CustomHUD_BalanceBar")

function CustomHUD_BalanceBar:Start()
	GameEvents.onActorDied.AddListener(self,"onActorDied")
	GameEvents.onActorSpawn.AddListener(self,"onActorSpawn")

	self.targets.Canvas.enabled = false

	self.script.AddValueMonitor("monitorCurrentBalance","updateBalanceUI")
	self.script.AddValueMonitor("monitorCurrentMaxBalance", "updateBalanceUI")
	
	self.balanceBarVisibility = self.script.mutator.GetConfigurationBool("balanceBarVisibility")

	self.script.AddValueMonitor("monitorHUDVisibility", "onHUDVisibilityChange")

	print("<color=lightblue>[Custom HUD]Initialized Balance Bar Module v1.0 </color>")
end

function CustomHUD_BalanceBar:monitorHUDVisibility()
	return PlayerHud.hudPlayerEnabled
end

function CustomHUD_BalanceBar:onHUDVisibilityChange()
	self.targets.Canvas.enabled = not Player.actor.isDead and GameManager.hudPlayerEnabled and self.balanceBarVisibility
end

function CustomHUD_BalanceBar:monitorCurrentBalance()
	return Player.actor.balance
end

function CustomHUD_BalanceBar:monitorCurrentMaxBalance()
	return Player.actor.maxBalance
end

function CustomHUD_BalanceBar:updateBalanceUI()
	if Player.actor then
		if self.targets.balanceBar then
			local balScale = Player.actor.balance/Player.actor.maxBalance
			self.targets.balanceBar.fillAmount = balScale
			if self.targets.animator then
				if balScale <= 0.5 then
					self.targets.animator.SetBool("lowHealth", true)
				else
					self.targets.animator.SetBool("lowHealth", false)
					self.targets.redFlash.color = Color(1,0,0,0)
				end
			end
		end
	end
end

function CustomHUD_BalanceBar:onActorSpawn(actor)
	if actor.isPlayer then
		self.targets.redFlash.color = Color(1,0,0,0)
		self.targets.Canvas.enabled = GameManager.hudPlayerEnabled and self.balanceBarVisibility
	end
end

function CustomHUD_BalanceBar:onActorDied(actor,source,isSilent)
	if actor.isPlayer then
		self.targets.Canvas.enabled = false
	end
end