module Pages.Template.Kafer exposing (Model, Msg, page)

import Gen.Params.Template.Kafer exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, button, div, h1, header, li, main_, nav, text, ul)
import Html.Attributes exposing (class)
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
    [ viewHeader model, viewMain model ]


viewHeader : Model -> Html Msg
viewHeader model =
    header [ class "main-header-jd2398" ]
        [ h1 [ class "title" ] [ text "Käfer" ]
        , nav [ class "nav" ]
            [ ul [ class "nav__list" ]
                [ li [ class "nav__list__item" ] [ a [] [ text "About" ] ]
                , li [ class "nav__list__item" ] [ a [] [ text "Menu" ] ]
                , li [ class "nav__list__item" ] [ a [] [ text "Places" ] ]
                ]
            ]
        , div [ class "sign" ]
            [ button [ class "sign__btm sign__btm--full" ] [ text "sing in" ]
            , button [ class "sign__btm" ] [ text "sing out" ]
            ]
        ]


viewMain : Model -> Html Msg
viewMain mode =
    main_ [ class "main-20jfm30s" ]
        []
