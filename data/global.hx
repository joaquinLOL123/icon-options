function new() {
    //initializes the options, just in case
    if (FlxG.save.data.bopToggle == null) 
        FlxG.save.data.bopToggle = true;

    if (FlxG.save.data.bopType == null) 
        FlxG.save.data.bopType = "vanilla";

    if (FlxG.save.data.bopIntensity == null) 
        FlxG.save.data.bopIntensity = 1;

    if (FlxG.save.data.iconPlace == null) 
        FlxG.save.data.iconPlace = "vanilla";

    FlxG.save.flush();
}