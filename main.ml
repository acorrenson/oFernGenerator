
open Graphics

let f x y =
  x := 0.;
  y := 0.16 *. !y

let g x y =
  x := 0.85 *. !x +. 0.04 *. !y;
  y := -0.0 *. !x +. 0.85 *. !y +. 1.6 

let h x y =
  x := 0.2 *. !x -. 0.26 *. !y;
  y := 0.23 *. !x +. 0.22 *. !y +. 1.6

let i x y =
  x := -0.15 *. !x +. 0.28 *. !y;
  y := -0.26 *. !x +. 0.24 *. !y +. 0.44

let m x a b c d =
  let slope = (d -. c) /. (b -. a) in
  x *. slope +. c

let rec next x y =
  let () = Random.self_init () in
  let r = Random.int 4 in
  if r == 0 then 
    f x y
  else if r == 1 then
    g x y
  else if r == 2 then
    h x y
  else if r == 3 then
    i x y;
  let px = m !x (-2.18) 2.65 0. 800. in
  let py = m !y 0. 9.99 0. 800. in
  let fx = (int_of_float px) + size_x () /2 in
  let fy = (int_of_float py) in
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