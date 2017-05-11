if(wasClicked)
{
    with(oEnemy.id)
	{
		oPlayerArms.deadEnemyX = x;
		oPlayerArms.deadEnemyY = y;
        instance_destroy();
	}
audio_play_sound(aHit,1,false)
	
	for(var i=0; i<particleBloodMaxAmount; i++)
	{
		var xx = deadEnemyX + random_range(-particleBloodMaxOriginDeviation, particleBloodMaxOriginDeviation);
		var yy = deadEnemyY + random_range(-particleBloodMaxOriginDeviation, particleBloodMaxOriginDeviation);
		particleBloodInstance = instance_create(xx, yy, oParticleBlood);
	}
	

}

