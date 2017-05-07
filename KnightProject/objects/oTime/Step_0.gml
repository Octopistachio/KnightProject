if(global.time<global.dayEnd){
    global.time++;
    global.isDay = true;
}
if (global.time>=global.nightEnd && global.time<=global.nightEnd+global.dayEnd){
    global.isDay = false;
    global.time++;
}
if(global.time>global.nightEnd+global.dayEnd)
    global.time = 0;

