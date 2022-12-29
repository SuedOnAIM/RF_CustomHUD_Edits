-- Register the behaviour
behaviour("CustomHUD_WeaponMC")

function CustomHUD_WeaponMC:Awake()
	self.sightText = GameObject.Find("Sight Text").GetComponent(Text)
end

function CustomHUD_WeaponMC:Start()
	GameEvents.onActorDied.AddListener(self,"onActorDied")
	GameEvents.onActorSpawn.AddListener(self,"onActorSpawn")

	self.targets.Canvas.enabled = false

	self.script.AddValueMonitor("monitorCurrentWeapon", "onChangeWeapon")
	self.script.AddValueMonitor("monitorHeat", "onHeatChange")
	self.script.AddValueMonitor("monitorFireMode", "onFireModeChange")

	self.script.AddValueMonitor("monitorSightModeText", "onSightModeChange")

	self.weaponHUDVisibility = self.script.mutator.GetConfigurationBool("weaponHUDVisibility")
	
	self.script.AddValueMonitor("monitorHUDVisibility", "onHUDVisibilityChange")
	self.dataContainer = self.gameObject.GetComponent(DataContainer)

	print("<color=lightblue>[Custom HUD]Initialized Weapon Display Module v1.3.1 </color>")
end

function CustomHUD_WeaponMC:monitorCurrentWeapon()
	return Player.actor.activeWeapon
end

function CustomHUD_WeaponMC:onChangeWeapon()
	if Player.actor.activeWeapon == nil then
		return
	end

	local name = ""
	if Player.actor.activeWeapon.weaponEntry then
		self.targets.WeaponSprite1.sprite = Player.selectedLoadout.primary.uiSprite
		self.targets.WeaponSprite2.sprite = Player.selectedLoadout.secondary.uiSprite
		self.targets.WeaponSprite3.sprite = Player.selectedLoadout.gear1.uiSprite
		self.targets.WeaponSprite4.sprite = Player.selectedLoadout.gear2.uiSprite
		if Player.selectedLoadout.gear3 ~= nil then
			--wtf the code from Debil worked earlier then it stopped working and i dont know why so i just brute forced it to render an empty sprite smh
			self.targets.WeaponSprite5.sprite = Player.selectedLoadout.gear3.uiSprite
		else
			self.targets.WeaponSprite5.sprite = self.dataContainer.GetSprite("Empty")
		end
		name = Player.actor.activeWeapon.weaponEntry.name
		name = self:CleanString(name,"EXTAS", "EXTAS%s+-%s")
		name = self:CleanString(name,"RWP2_", "RWP2_")
		name = self:CleanString(name," Suppressed", " Suppressed")
		name = self:CleanString(name," Tactical", " Tactical")
		name = self:CleanString(name,"SPEC_", "SPEC_")
		name = self:CleanString(name,"_LCWP2", "_LCWP2")
		name = self:CleanString(name,"(Secondary)", "%(Secondary%)")
		name = self:CleanString(name,"[SECONDARY]", "%[SECONDARY%]")
		name = self:CleanString(name,"(Primary)", "%(Primary%)")
		name = self:CleanString(name,"[PRIMARY]", "%[PRIMARY]%]")
		name = self:CleanString(name,"(Gear)", "%(Gear%)")
		name = self:CleanString(name,"[GEAR]", "%[GEAR%]")
		name = self:CleanString(name,"[SUP]", "%[SUP%]")
		name = self:CleanString(name,"[Suppressed]", "%[Suppressed%]")
		name = self:CleanString(name,"[PDW]", "%[PDW%]")
		name = self:CleanString(name,"(Mac)", "%(Mac%)")
		name = self:CleanString(name,"TACTICAL", " TACTICAL")
		name = self:CleanString(name,"Taktyčny", " Taktyčny")  
		name = self:CleanString(name,"Taktički", " Taktički")
		name = self:CleanString(name,"EQUIPPED", " EQUIPPED")
		name = self:CleanString(name,"STANDARD ISSUE", " STANDARD ISSUE")
		name = self:CleanString(name,"SOCOM", " SOCOM")
		name = self:CleanString(name,"Suppressor", " Suppressor")
		name = self:CleanString(name,"Red Dot", " Red Dot")
		name = self:CleanString(name,"(Vanilla Scope)", "%(Vanilla Scope%)")
	else
		name = Player.actor.activeWeapon.gameObject.name
		name = self:CleanString(name,"(Clone)", "%(Clone%)")
	end
	
	if name == "Armor" then
		self.targets.WeaponSprite1.sprite = self.dataContainer.GetSprite("Armor")
	end

	if Player.actor.activeWeapon.applyHeat then
		self.targets.heatText.gameObject.SetActive(true)
		self:onHeatChange()
	else
		self.targets.heatText.gameObject.SetActive(false)
	end

	self.targets.AmmoDisplay.self:onAmmoChange(Player.actor.activeWeapon.activeSubWeapon.ammo)
	self.targets.AmmoDisplay.self:onSpareAmmoChange(Player.actor.activeWeapon.activeSubWeapon.spareAmmo)

	self.targets.weaponName.text = name
end


function CustomHUD_WeaponMC:monitorHUDVisibility()
	return GameManager.hudPlayerEnabled
end

function CustomHUD_WeaponMC:onHUDVisibilityChange()
	self.targets.Canvas.enabled = not Player.actor.isDead and GameManager.hudPlayerEnabled and self.weaponHUDVisibility
end

function CustomHUD_WeaponMC:CleanString(str, target, format)
	if string.find(str, target) then
		str = string.gsub(str, format, "")
	end
	return str
end
function CustomHUD_WeaponMC:monitorHeat()
	if Player.actor.activeWeapon == nil then
		return
	end
	return Player.actor.activeWeapon.heat
end

function CustomHUD_WeaponMC:onHeatChange()
	if Player.actor.activeWeapon == nil then
		return
	end
	if Player.actor.activeWeapon.applyHeat then
		local heatPercentage = Player.actor.activeWeapon.heat * 100
		local color = 1 - Player.actor.activeWeapon.heat
		heatPercentage = Mathf.Round(heatPercentage)
		self.targets.heatText.text = "Heat: " .. heatPercentage .. "%"
		self.targets.heatText.color = Color(1, color, color, 1)
	end
end

function CustomHUD_WeaponMC:monitorFireMode()
	if Player.actor.activeWeapon == nil then
		return nil
	end
	return Player.actor.activeWeapon.activeSubWeapon.isAuto
end

function CustomHUD_WeaponMC:onFireModeChange(isAuto)
	if isAuto == nil then
		return
	end

	if isAuto then
		self.targets.fireMode.text = "[AUTO]"
		self.targets.fireSprite.sprite = self.dataContainer.GetSprite("Auto")
	else
		self.targets.fireMode.text = "[SEMI]"
		self.targets.fireSprite.sprite = self.dataContainer.GetSprite("Semi")
	end
end

function CustomHUD_WeaponMC:monitorSightModeText()
	return self.sightText.text
end

function CustomHUD_WeaponMC:onSightModeChange()
	self.targets.SightMode.text = self.sightText.text
end

function CustomHUD_WeaponMC:onActorSpawn(actor)
	if actor.isPlayer then
		self.targets.Canvas.enabled = GameManager.hudPlayerEnabled and self.weaponHUDVisibility
	end
end

function CustomHUD_WeaponMC:onActorDied(actor,source,isSilent)
	if actor.isPlayer then
		self.targets.Canvas.enabled = false
	end
end