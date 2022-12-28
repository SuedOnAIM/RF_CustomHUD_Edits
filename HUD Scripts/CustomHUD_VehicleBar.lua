-- Register the behaviour
behaviour("CustomHUD_VehicleBar")

function CustomHUD_VehicleBar:Start()
	self.script.AddValueMonitor("monitorVehicle","updateVehicleHUD")
	self.script.AddValueMonitor("monitorVehicleHealth", "updateVehicleHealth")

	self.vehicleHUDVisibility = self.script.mutator.GetConfigurationBool("vehicleHUDVisibility")

	self.targets.Canvas.enabled = false

	self.script.AddValueMonitor("monitorHUDVisibility", "onHUDVisibilityChange")

	print("<color=lightblue>[Custom HUD]Initialized Vehicle Bar Module v1.0 </color>")
end

function CustomHUD_VehicleBar:monitorHUDVisibility()
	return PlayerHud.hudPlayerEnabled
end

function CustomHUD_VehicleBar:onHUDVisibilityChange()
	self.targets.Canvas.enabled = not Player.actor.isDead and GameManager.hudPlayerEnabled and self.vehicleHUDVisibility and not Player.actor.activeVehicle == nil
end

function CustomHUD_VehicleBar:monitorVehicle()
	return Player.actor.activeVehicle
end

function CustomHUD_VehicleBar:updateVehicleHUD()
	if Player.actor.activeVehicle and self.vehicleHUDVisibility then
		self.targets.Canvas.enabled = true
		self:updateVehicleHealth()
	else
		self.targets.Canvas.enabled = false
	end
end

function CustomHUD_VehicleBar:monitorVehicleHealth()
	if Player.actor.activeVehicle == nil then
		return
	end
	return Player.actor.activeVehicle.health
end

function CustomHUD_VehicleBar:updateVehicleHealth()
	if Player.actor.activeVehicle == nil then
		return
	end
		if self.targets.vehicleBar then
			local vehScale = Player.actor.activeVehicle.health/Player.actor.activeVehicle.maxHealth
			self.targets.vehicleBar.fillAmount = vehScale
	end
end