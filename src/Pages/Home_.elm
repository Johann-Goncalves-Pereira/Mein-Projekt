module Pages.Home_ exposing (Model, Msg, page)

import Gen.Params.Home_ exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, button, div, h1, h2, h5, p, section, text)
import Html.Attributes exposing (alt, attribute, class, href, id, rel, src, style, tabindex, target)
import Html.Attributes.Aria exposing (ariaLabel, ariaLabelledby)
import Page
import Request
import Shared
import Svg exposing (desc)
import UI exposing (pageConfig)
import View exposing (View, placeholder)


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
    { title = "Revex - Home"
    , body =
        UI.layout
            { pageConfig
                | route = Route.Home_
                , mainContent = viewMain model
            }
    }


viewMain : Model -> List (Html Msg)
viewMain model =
    [ viewTemplates model ]


viewTemplates : Model -> Html Msg
viewTemplates model =
    section [ class "templates" ]
        [ a [ class "templates__container col-span-2", href <| Route.toHref Route.Template__Gaslur ] [ text "Gaslur" ]
        , a [ class "templates__container row-span-2 ", href <| Route.toHref Route.Template__Kafer ] [ text "Käfer" ]
        , a [ class "templates__container row-span-2", href <| Route.toHref Route.Template__Kafer ] [ text "3" ]
        , a [ class "templates__container ", href <| Route.toHref Route.Template__Kafer ] [ text "4" ]
        , a [ class "templates__container col-span-2", href <| Route.toHref Route.Template__Kafer ] [ text "5" ]
        , a [ class "templates__container col-span-3", href <| Route.toHref Route.Template__Kafer ] [ text "6" ]
        ]
