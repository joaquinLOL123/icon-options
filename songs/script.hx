var Intensity:Int;

function create() {
    Intensity = FlxG.save.data.bopIntensity;
}

function update() {
    if (!FlxG.save.data.bopToggle) {
        iconP1.scale.set(1.0, 1.0);
        iconP2.scale.set(1.0, 1.0); 
    }
}

function postUpdate(elapsed) {
    if (FlxG.save.data.iconPlace == "ourple") {
        iconP1.x = healthBar.getGraphicMidpoint().x + (healthBar.width / 2) - (iconP1.width / 2.5);
	    iconP2.x = healthBar.getGraphicMidpoint().x - (healthBar.width / 2) - (iconP2.width / 2.5);        
    }

}

function beatHit(curBeat) {
    if (FlxG.save.data.bopToggle)
        doCustomBop(curBeat);
}

function doCustomBop(curBeat:Int) {
    switch(FlxG.save.data.bopType) {
        case "daveandbambi":
            var funny:Float = (healthBar.percent * 0.01) + 0.01;

            iconP1.scale.set((1.0 * Intensity) + (0.5 * funny), (1.0 * Intensity) - (0.25 * funny));
            iconP2.scale.set(((1.0 * Intensity) + (0.5 * (1 - funny))) * Intensity, (1.0 * Intensity) - (0.25 * (1 - funny)));

        case "gapple":

            if (curBeat % 2 == 0) {
                iconP1.scale.set(1.1 * Intensity, 0.8 * Intensity);
                iconP2.scale.set(1.1 * Intensity, 1.3 * Intensity);

                FlxTween.angle(iconP1, -15, 0, Conductor.crochet / 1300, {ease: FlxEase.quadOut});
                FlxTween.angle(iconP2, 15, 0, Conductor.crochet / 1300, {ease: FlxEase.quadOut});
            } else {
                iconP1.scale.set(1.1 * Intensity, 1.3 * Intensity);
                iconP2.scale.set(1.1 * Intensity, 0.8 * Intensity);

                FlxTween.angle(iconP1, 15 * Intensity, 0, Conductor.crochet / 1300, {ease: FlxEase.quadOut});
                FlxTween.angle(iconP2, -15 * Intensity, 0, Conductor.crochet / 1300, {ease: FlxEase.quadOut});
            }

            FlxTween.tween(iconP1, {'scale.x': 1, 'scale.y': 1}, Conductor.crochet / 1250, {ease: FlxEase.quadOut});
            FlxTween.tween(iconP2, {'scale.x': 1, 'scale.y': 1}, Conductor.crochet / 1250, {ease: FlxEase.quadOut});

            iconP1.updateHitbox();
            iconP2.updateHitbox();
            
        default:
            iconP1.scale.set(1.2 * Intensity, 1.2 * Intensity);
		    iconP2.scale.set(1.2 * Intensity, 1.2 * Intensity);
    }
}
