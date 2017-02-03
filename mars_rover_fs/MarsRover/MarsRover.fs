module MarsRover

type Direction = 
| N
| S 
| E
| W

type Command =
| Forward
| Backward
| Left
| Right

type Position = {
    X: int
    Y: int
    Direction : Direction
}

let moveN position command =
    match command with
    | Forward ->  { position with Y = position.Y + 1}
    | Backward -> { position with Y = position.Y - 1}
    | Left -> { position with Direction = W}
    | Right -> { position with Direction = E}

let moveE position command =
    match command with
    | Forward ->  { position with X = position.X + 1}
    | Backward -> { position with X = position.X - 1}
    | Left -> { position with Direction = N}
    | Right -> { position with Direction = S}

let moveS position command =
    match command with
    | Forward ->  { position with Y = position.Y - 1}
    | Backward -> { position with Y = position.Y + 1}
    | Left -> { position with Direction = E}
    | Right -> { position with Direction = W}

let moveW position command =
    match command with
    | Forward ->  { position with X = position.X - 1}
    | Backward -> { position with X = position.X + 1}
    | Left -> { position with Direction = S}
    | Right -> { position with Direction = N}
    
let moveSingle position command = 
    match position.Direction, command with
    | N, _ -> moveN position command
    | E, _ -> moveE position command
    | S, _ -> moveS position command
    | W, _ -> moveW position command

let rec move position (commands : Command list) =
    match commands with
    | head::tail -> move (moveSingle position head) tail
    | [] -> position 
    
