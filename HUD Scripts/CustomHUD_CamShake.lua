﻿-- Register the behaviour
behaviour("CustomHUD_CamShake")
function CustomHUD_CamShake:Update()
    self.jiggleAmount = self.script.mutator.GetConfigurationRange("jiggleAmount")
    local cam = PlayerCamera.fpCameraLocalRotation.eulerAngles    
    self.transform.localRotation = Quaternion.Euler(Vector3(cam.x * self.jiggleAmount, cam.y * self.jiggleAmount, cam.z * self.jiggleAmount))
end