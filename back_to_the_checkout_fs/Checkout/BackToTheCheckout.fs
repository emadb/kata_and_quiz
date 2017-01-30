module BackToTheCheckout


open Expecto

[<Tests>]
let tests =
    testList "bar" [
        testCase "foo" <| fun () ->
            Expect.equal 1 1 "without commands should stay in current position"
                
    ]

[<EntryPoint>]
let main args =
    runTestsInAssembly defaultConfig args
