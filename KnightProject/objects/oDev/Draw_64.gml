//if(keyboard_check(ord("P"))){
    margin = 15;
    
    draw_set_color(c_white);
    draw_set_font(fGame);
    draw_text(64,64,string_hash_to_newline("Time: " + string(global.time)));
    if(global.time>global.day)
        draw_text(64,64+margin,string_hash_to_newline("Night"));
    else
        draw_text(64,64+margin,string_hash_to_newline("Day"));
    
    if(global.playerInsideCastle)
        draw_text(64,64+margin*2,string_hash_to_newline("Player Inside Castle"));
    else
        draw_text(64,64+margin*2,string_hash_to_newline("Player Outside Castle"));
//}

