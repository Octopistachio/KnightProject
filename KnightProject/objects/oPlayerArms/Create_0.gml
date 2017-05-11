swing = 75; //The max angle of the sword
left =  swing;
right = -swing;
side = left; //Direction sword is resting relative to the player
sideStep = 75; //The angle the sword is currently at
sideVarition = sideStep/5; //How many degrees the sword moves
wasClicked = false;


onSwingCoolDown = false;
swingCoolDownTime = 25;

/* Blood Splatter */
deadEnemyX = 0;
deadEnemyY = 0;
particleBloodMaxAmount = 15;
particleBloodMaxOriginDeviation = 25; //Max distance away from where the enemy died