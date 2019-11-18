module Game exposing (Game, init, render, update, updateKeyboard)

import Html exposing (Html, div)
import Keyboard exposing (Keyboard)
import Svg exposing (Svg, g, rect, svg)
import Svg.Attributes as A


type alias Hero =
    { x : Float
    , y : Float
    }


type alias Game =
    { hero : Hero
    , keyboard : Keyboard
    }


init : Game
init =
    { hero = { x = 300, y = 300 }
    , keyboard = Keyboard.init
    }


update : Float -> Game -> Game
update deltaMs game =
    { game | hero = moveHero deltaMs game.keyboard game.hero }


updateKeyboard : Keyboard -> Game -> Game
updateKeyboard keyboard game =
    { game | keyboard = keyboard }


moveHero : Float -> Keyboard -> Hero -> Hero
moveHero deltaMs keyboard hero =
    let
        speed =
            if keyboard.rightArrowPressed then
                0.1 * deltaMs

            else if keyboard.leftArrowPressed then
                -0.1 * deltaMs

            else
                0
    in
    { hero | x = hero.x + speed }


backgroundSize : String
backgroundSize =
    "600px"


render : Game -> Html a
render game =
    div []
        [ svg
            [ A.width backgroundSize
            , A.height backgroundSize
            ]
            [ drawBackground, drawHero game.hero ]
        ]


drawBackground : Svg a
drawBackground =
    rect [ A.width backgroundSize, A.height backgroundSize, A.fill "#aaa" ] []


drawHero : Hero -> Svg a
drawHero hero =
    let
        heroX =
            String.fromInt (round hero.x)

        heroY =
            String.fromInt (round hero.y)

        translation =
            "translate(" ++ heroX ++ ", " ++ heroY ++ ")"
    in
    g [ A.transform translation ]
        [ rect [ A.x "0", A.y "0", A.width "20px", A.height "5px", A.fill "#c0c0c0" ] []
        , rect [ A.x "0", A.y "5px", A.width "20px", A.height "15px", A.fill "#B5651D" ] []
        , rect [ A.x "3px", A.y "9px", A.width "2px", A.height "3px", A.fill "#666" ] []
        , rect [ A.x "14px", A.y "9px", A.width "2px", A.height "3px", A.fill "#666" ] []
        , rect [ A.x "5px", A.y "15px", A.width "9px", A.height "2px", A.fill "#666" ] []
        ]
