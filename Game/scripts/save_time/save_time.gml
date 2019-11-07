///@param level
///@param min
///@param sec
//Perminently saves the coin as collected
ini_open("levelData.ini")

var levString = "Level-"+string(argument0)
ini_write_real(levString, "ClearTimeMin", argument1)
ini_write_real(levString, "ClearTimeSec", argument2) 

ini_close()