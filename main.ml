
(* open graphics lib *)
open Graphics

(* transformation 1 *)
let f x y =
  let py = !y in
  x := 0.;
  y := 0.16 *. py

(* transformation 2 *)
let g x y =
  let px = !x in
  let py = !y in
  x := 0.85 *. px +. 0.04 *. py;
  y := -0.04 *. px +. 0.85 *. py +. 1.6

(* transformation 3 *)
let h x y =
  let px = !x in
  let py = !y in
  x := 0.2 *. px -. 0.26 *. py;
  y := 0.23 *. px +. 0.22 *. py +. 1.6

(* transformation 4 *)
let i x y =
  let px = !x in
  let py = !y in
  x := -0.15 *. px +. 0.28 *. py;
  y := 0.26 *. px +. 0.24 *. py +. 0.44

(* map a value from a range to an other *)
let map x a b c d =
  let slope = (d -. c) /. (b -. a) in
  x *. slope +. c

(* get next point *)
let rec next x y =
  let () = Random.self_init () in
  let r = Random.float 1. in
  
  if r < 0.01 then
    f x y
  else if r < 0.85 then
    g x y
  else if r < 0.93 then
    h x y
  else
    i x y;

  let mx = map !x (-2.18) 2.65 0. 800. in
  let my = map !y 0. 9.99 0. 800. in
  let fx = (int_of_float mx) + size_x () / 2 in
  let fy = (int_of_float my) in
  fill_circle fx fy 2;
  next x y

let _ =
  open_graph " 800x800";
  set_color black;
  fill_rect 0 0 800 800;
  set_color white;

  let px = ref 0. in
  let py = ref 0. in
  
  next px py;
    
  print_endline "done";
  read_line ()