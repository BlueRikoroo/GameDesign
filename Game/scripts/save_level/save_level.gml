///@param level
//Perminently saves the coin as collected
ini_open("levelData.ini")

var levString = "Level-"+string(argument0)
ini_write_real(levString, "Cleared", 1) 

ini_close()