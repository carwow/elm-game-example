module Main exposing (main)

import Browser
import Browser.Events exposing (onAnimationFrameDelta, onKeyDown, onKeyUp)
import Game exposing (Game)


type Msg
    = NoOp


main : Program () Game Msg
main =
    Browser.element
        { view = Game.render
        , init = \_ -> init
        , update = update
        , subscriptions = subscriptions
        }


update : Msg -> Game -> ( Game, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )


init : ( Game, Cmd Msg )
init =
    ( Game.init, Cmd.none )


subscriptions : Game -> Sub Msg
subscriptions _ =
    Sub.none
