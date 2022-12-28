-- Register the behaviour
behaviour("CustomHUD_TeamSprite")

function CustomHUD_TeamSprite:Start()
	-- Run when behaviour is created
	self.teamColorSprite = self.script.mutator.GetConfigurationBool("teamColorSprite")
	self.dataContainer = self.gameObject.GetComponent(DataContainer)

	if self.teamColorSprite == true then
				if Player.actor.team == Team.Blue then
					colorVector = self.dataContainer.GetVector("blueTeamColor")
				elseif Player.actor.team == Team.Red then
					colorVector = self.dataContainer.GetVector("redTeamColor")
				
				elseif self.teamColorSprite == false then
                end
					self.targets.teamImage.color = Color(colorVector.x/255, colorVector.y/255, colorVector.z/255, 1)

			end
		end