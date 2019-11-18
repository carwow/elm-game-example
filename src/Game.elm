module Game exposing (Game, init, render)

import Html exposing (Html, div)
import Svg exposing (Svg, rect, svg)
import Svg.Attributes as A


type alias Game =
    {}


init : Game
init =
    {}


backgroundSize =
    "600"


render : Game -> Html a
render game =
    div []
        [ svg
            [ A.width backgroundSize
            , A.height backgroundSize
            ]
            [ drawBackground ]
        ]


drawBackground : Svg a
drawBackground =
    rect [ A.width backgroundSize, A.height backgroundSize, A.fill "#ccc" ] []
