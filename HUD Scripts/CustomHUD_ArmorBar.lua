--register the behaviour
behaviour("CustomHUD_ArmorBar")

function CustomHUD_ArmorBar:Start()
    self.script.StartCoroutine(self:DelayedStart())
end

function CustomHUD_ArmorBar:DelayedStart()
	return function()
		coroutine.yield(WaitForSeconds(0.1))
		local armorObj = self.gameObject.Find("PlayerArmor")
		if armorObj then
			self.playerArmor = armorObj.GetComponent(ScriptedBehaviour)
			self.playerArmor.self:DisableHUD()
		end
	end
end

function CustomHUD_ArmorBar:Update()
	if self.playerArmor then
		armScale = self.playerArmor.self.armorHealth/self.playerArmor.self.maxArmorHealth
		self.targets.armorBar.fillAmount = armScale
	end
end