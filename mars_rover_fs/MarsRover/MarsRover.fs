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
    
open Expecto

[<Tests>]
let tests =
    testList "Move to..." [
        testCase "Setup initial position" <| fun () ->
            let position = move { X = 10; Y = 10; Direction = N} []  
            Expect.equal {X =10; Y=10; Direction = N} position
                        "without commands should stay in current position"

        testCase "move forward" <| fun() ->
            let position = move { X = 10; Y = 10; Direction = N} [ Forward ]
            Expect.equal {X=10; Y=11; Direction = N} position
                        "with forward"

        testCase "move forward twice" <| fun() ->
            let position = move { X = 10; Y = 10; Direction = N} [ Forward; Forward ]
            Expect.equal {X=10; Y=12; Direction = N} position
                        "with forward 2"

        testCase "move backward" <| fun() ->
            let position = move { X = 10; Y = 10; Direction = N} [ Backward ]
            Expect.equal {X=10; Y=9; Direction = N} position
                        "with backward"
        testCase "move backward twice" <| fun() ->
            let position = move { X = 10; Y = 10; Direction = N} [ Backward; Backward ]
            Expect.equal {X=10; Y=8; Direction = N} position
                        "with backward"
        testCase "move backward and Forward" <| fun() ->
            let position = move { X = 10; Y = 10; Direction = N} [ Backward; Forward ]
            Expect.equal {X=10; Y=10; Direction = N} position
                        "with backward"
        
        testCase "move Forward to W" <| fun() ->
            let position = move { X = 10; Y = 10; Direction = W} [ Forward ]
            Expect.equal {X=9; Y=10; Direction = W} position
                        "with backward"
        testCase "move twice Forward to S" <| fun() ->
            let position = move { X = 10; Y = 10; Direction = S} [ Forward; Forward ]
            Expect.equal {X=10; Y=8; Direction = S} position
                        "with backward"
        testCase "turn left" <| fun() ->
            let position = move { X = 10; Y = 10; Direction = N} [ Left ]
            Expect.equal {X=10; Y=10; Direction = W} position
                        "with backward"
        testCase "more commands" <| fun() ->
            let position = move { X = 10; Y = 10; Direction = N} [ Left; Forward; Forward; Left; Forward; Forward; Left ]
            Expect.equal {X=8; Y=8; Direction = E} position
                        "with backward"                        
                        
    ]

[<EntryPoint>]
let main args =
    runTestsInAssembly defaultConfig args
