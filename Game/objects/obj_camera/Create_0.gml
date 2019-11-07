//Camera Width
currentWidth = 1920
currentHeight = 1080

//The position the camera is going to
goToX = 0
goToY = 0

//The position the camera is currently in
currentX = 0
currentY = 0

//Character Tracking. There are two characters, these will track which ones to follow
character1 = noone
character2 = noone

camera = camera_create()
view_camera[0] = camera
camera_set_view_size(camera, 1920, 1080)

char1X = 0
char1Y = 0
char2X = 0
char2Y = 0