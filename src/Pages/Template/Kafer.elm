module Pages.Template.Kafer exposing (Model, Msg, page)

import Gen.Params.Template.Kafer exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, button, div, header, li, nav, text, ul)
import Page
import Request
import Shared
import UI exposing (pageConfig)
import View exposing (View)


page : Shared.Model -> Request.With Params -> Page.With Model Msg
page shared req =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    {}


init : Model
init =
    {}



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> Model
update msg model =
    case msg of
        ReplaceMe ->
            model



-- VIEW


view : Model -> View Msg
view model =
    { title = "Käfer"
    , body =
        UI.layout
            { pageConfig
                | route = Route.Template__Kafer
                , pageSandbox = Just <| viewPage model
            }
    }


viewPage : Model -> List (Html Msg)
viewPage model =
    [ header []
        [ div [] []
        , nav []
            [ ul []
                [ li []
                    [ a [] [ text "amo besouros" ] ]
                ]
            , li []
                [ a [] [ text "besouros são demais" ]
                ]
            , li
                []
                [ a [] [ text "mentira tenho medo|" ]
                ]
            ]
        , div []
            [ button [] [ text "sing in" ]
            , button [] [ text "sing out" ]
            ]
        ]
    ]
