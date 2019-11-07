///@param level
///@param coinID
//Perminently saves the coin as collected
ini_open("levelData.ini")

var levString = "Level-"+string(argument0)
ini_write_real(levString, "Collected:"+string(argument1), 1) 

ini_close()