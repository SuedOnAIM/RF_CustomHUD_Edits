-- Register the behaviour
behaviour("CustomHUD_AmmoMinimalist")

function CustomHUD_AmmoMinimalist:Start()
	self.script.AddValueMonitor("monitorAmmo", "onAmmoChange")
	self.script.AddValueMonitor("monitorSpareAmmo", "onSpareAmmoChange")
end

function CustomHUD_AmmoMinimalist:monitorAmmo()
	if Player.actor.activeWeapon == nil then
		return nil
	end
	return Player.actor.activeWeapon.activeSubWeapon.ammo
end

function CustomHUD_AmmoMinimalist:onAmmoChange(ammo)
	if ammo == nil then
		return
	end
	
	local ammoPercentage = ammo/Player.actor.activeWeapon.activeSubWeapon.maxAmmo

	if ammoPercentage >= 0.9 then
		self.targets.currentAmmo.text = "Full"
	elseif ammoPercentage < 0.9 and ammoPercentage >= 0.7 then
		self.targets.currentAmmo.text = "Almost Full"
	elseif ammoPercentage < 0.7 and ammoPercentage >= 0.35 then
		self.targets.currentAmmo.text = "Half"
	elseif ammoPercentage < 0.35 and ammoPercentage > 0 then
		self.targets.currentAmmo.text = "Almost Empty"
	elseif ammoPercentage <= 0 then
		self.targets.currentAmmo.text = "Empty"
	end
end

function CustomHUD_AmmoMinimalist:monitorSpareAmmo()
	if Player.actor.activeWeapon == nil then
		return nil
	end
	return Player.actor.activeWeapon.activeSubWeapon.spareAmmo
end

function CustomHUD_AmmoMinimalist:onSpareAmmoChange(spareAmmo)
	if spareAmmo == nil then
		return
	end

	if Player.actor.activeWeapon.activeSubWeapon.maxSpareAmmo >= 0 then
		self.targets.spareAmmo.gameObject.SetActive(true)
	elseif Player.actor.activeWeapon.activeSubWeapon.maxSpareAmmo < 0 then
		self.targets.spareAmmo.gameObject.SetActive(false)
	end

	local spareAmmoPercentage = (spareAmmo/Player.actor.activeWeapon.activeSubWeapon.maxAmmo)
	spareAmmoPercentage = Mathf.Round(spareAmmoPercentage)
	if spareAmmoPercentage >1 or spareAmmoPercentage <=0 then
		self.targets.spareAmmo.text = spareAmmoPercentage .. " Magazines"
	elseif spareAmmoPercentage == 1 then
		self.targets.spareAmmo.text = spareAmmoPercentage .. " Magazine"
	end
end
