if(global.time<global.night){
    global.time++;
    global.isDay = true;
}
if (global.time>=global.night && global.time<=global.night+global.day){
    global.isDay = false;
    global.time++;
}
if(global.time>global.night+global.day)
    global.time = 0;

