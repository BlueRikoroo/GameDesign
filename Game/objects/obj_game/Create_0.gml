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

coinsAvailable[0] = 0
//....
//....

#endregion

ini_open("levelData.ini")

for(var i = 0; i < totalLevels; i++){
		
	
}

ini_close()