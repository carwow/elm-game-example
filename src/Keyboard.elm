module Keyboard exposing (Keyboard, KeyboardAction(..), init, update)


type alias Keyboard =
    { leftArrowPressed : Bool
    , rightArrowPressed : Bool
    }


type KeyboardAction
    = Pressed
    | Released


init : Keyboard
init =
    { leftArrowPressed = False
    , rightArrowPressed = False
    }


update : String -> Keyboard -> KeyboardAction -> Keyboard
update code keyboard action =
    let
        isPressed =
            case action of
                Pressed ->
                    True

                Released ->
                    False
    in
    keyboard
        |> updateArrowState code isPressed


updateArrowState : String -> Bool -> Keyboard -> Keyboard
updateArrowState code isPressed keyboard =
    case code of
        "ArrowLeft" ->
            { keyboard | leftArrowPressed = isPressed }

        "ArrowRight" ->
            { keyboard | rightArrowPressed = isPressed }

        _ ->
            keyboard
