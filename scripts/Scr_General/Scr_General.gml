function DrawText(_x, _y, _string, _hAlign, _vAlign){
	draw_set_color(c_black)
	draw_set_halign(_hAlign)
	draw_set_valign(_vAlign)
	draw_text(_x, _y, _string)
}

function CheckDebug() {
	return instance_exists(Obj_Debug) && Obj_Debug.debug
}