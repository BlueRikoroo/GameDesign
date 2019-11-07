/// @description 
// README: Any value that is a VAR is editable

var totalLevels = 10
levelData = noone;
//Level Data is a double array.
//[x, ] = the level, 0->totalLevels
//[, x] = the value, 0=cleared(0 or 1), 1=clearTime, 2=coinArray, 
var coinsAvailable = noone;
//[x] = how many coins are available in each level
for(var i = 0; i < totalLevels; i++)
	coinsAvailable[i] = 0 //Default Value
#region Get Coins Available

coinsAvailable[0] = 2
//....
//....

#endregion



//Load Data from File
ini_open("levelData.ini")

for(var i = 0; i < totalLevels; i++){
	var levString = "Level-"+string(i)
	levelData[i, 0] = ini_read_real(levString, "Cleared", 0)
	levelData[i, 1] = ini_read_real(levString, "ClearTime", 0)
	var coins = []
	for(var c = 0; c < coinsAvailable[i]; c++){
		coins[c] = ini_read_real(levString, "Collected:"+string(c), 0) 
	}
	levelData[i,2] = coins	
}

ini_close()

var c = levelData[0,2]
show_message(c[0])