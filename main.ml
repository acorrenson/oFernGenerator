
open Graphics

let _ =
  open_graph " 400x400";
  set_color black;
  fill_rect 0 0 400 400;
  set_color white;
  read_line ()