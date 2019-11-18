module Game exposing (Game, init, render)

import Html exposing (Html, div)
import Svg exposing (Svg, g, rect, svg)
import Svg.Attributes as A


type alias Hero =
    { x : Float
    , y : Float
    }


type alias Game =
    { hero : Hero
    }


init : Game
init =
    { hero = { x = 300, y = 300 }
    }


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
