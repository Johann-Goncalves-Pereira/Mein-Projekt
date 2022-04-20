module Pages.Template.District exposing (Model, Msg, page)

import Components.Svg as SVG
import Gen.Params.Template.District exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, div, h1, header, main_, section, span, text)
import Html.Attributes exposing (attribute, class, href)
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
    { title = "District X"
    , body =
        UI.layout
            { pageConfig
                | route = Route.Template__District
                , pageSandbox = Just <| viewPage model
            }
    }


viewPage : Model -> List (Html Msg)
viewPage model =
    [ viewHeader model
    , viewLanding model |> main_ [ class "main--skjlj02" ]
    ]


viewHeader : Model -> Html Msg
viewHeader model =
    header [ class "header--02jf02n" ]
        [ a [ href <| Route.toHref Route.Home_ ]
            [ h1 [ class "header__title" ]
                [ text "District"
                , span [] [ text "X" ]
                ]
            ]
        ]


viewLanding : Model -> List (Html Msg)
viewLanding model =
    let
        dataType sec =
            attribute "data-sec" sec

        landingSections sec content =
            section [ class "section", dataType sec ]
                content
    in
    [ SVG.district SVG.Test
    , landingSections "first" []
    , landingSections "second" []
    , landingSections "third" []
    ]
