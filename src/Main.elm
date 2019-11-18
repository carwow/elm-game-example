module Main exposing (main)

import Browser
import Browser.Events exposing (onAnimationFrameDelta, onKeyDown, onKeyUp)
import Game exposing (Game)


type Msg
    = FrameUpdate Float


main : Program () Game Msg
main =
    Browser.element
        { view = Game.render
        , init = \_ -> init
        , update = update
        , subscriptions = subscriptions
        }


update : Msg -> Game -> ( Game, Cmd Msg )
update msg game =
    case msg of
        FrameUpdate deltaMs ->
            ( Game.update deltaMs game, Cmd.none )


init : ( Game, Cmd Msg )
init =
    ( Game.init, Cmd.none )


subscriptions : Game -> Sub Msg
subscriptions _ =
    Sub.batch
        [ onAnimationFrameDelta FrameUpdate ]
