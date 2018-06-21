
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

let next x y =
  let () = Random.self_init () in
  let r = Random.int 4 in
  match r with
    | 0 -> f x y; print_int 0
    | 1 -> g x y; print_int 1
    | 2 -> h x y; print_int 2
    | 3 -> i x y; print_int 3

let _ =
  open_graph " 400x400";
  set_color black;
  fill_rect 0 0 400 400;
  set_color white;

  let px = ref 0. in
  let py = ref 0. in
  
  for j = 0 to 1000 do
    next px py;
    (* print_float !px; print_newline (); *)
    (* print_float !py; print_newline (); *)
    fill_circle (int_of_float !px) (int_of_float !py) 2;
  done;
  
  read_line ()