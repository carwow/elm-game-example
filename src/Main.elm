module Main exposing (main)

import Browser
import Browser.Events exposing (onAnimationFrameDelta, onKeyDown, onKeyUp)
import Game exposing (Game)
import Json.Decode as Decode
import Keyboard exposing (KeyboardAction)


type Msg
    = FrameUpdate Float
    | KeyboardChange KeyboardAction String


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

        KeyboardChange action code ->
            let
                updatedKeyboard =
                    Keyboard.update code game.keyboard action
            in
            ( Game.updateKeyboard updatedKeyboard game, Cmd.none )


init : ( Game, Cmd Msg )
init =
    ( Game.init, Cmd.none )


subscriptions : Game -> Sub Msg
subscriptions _ =
    Sub.batch
        [ onAnimationFrameDelta FrameUpdate
        , onKeyDown (Decode.map (KeyboardChange Keyboard.Pressed) keyDecoder)
        , onKeyUp (Decode.map (KeyboardChange Keyboard.Released) keyDecoder)
        ]


keyDecoder : Decode.Decoder String
keyDecoder =
    Decode.field "key" Decode.string
