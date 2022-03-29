module Pages.Gaslur exposing (Model, Msg, page)

import Gen.Params.Gaslur exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, button, nav, text)
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
    { title = "Gaslur - Home"
    , body =
        UI.layout
            { pageConfig
                | route = Route.Gaslur
                , headerContent = viewHeader
                , mainContent = viewMain
            }
    }


viewHeader : List (Html Msg)
viewHeader =
    let
        linksToUpper : String -> Html msg
        linksToUpper str =
            text <| String.toUpper str
    in
    [ nav [ class "nav" ]
        [ a [ class "nav__link nav__link--current", href "#" ] [ linksToUpper "Home" ]
        , a [ class "nav__link", href "#" ] [ linksToUpper "My profile" ]
        , a [ class "nav__link", href "#" ] [ linksToUpper "activity" ]
        , a [ class "nav__link", href "#" ] [ linksToUpper "how it works" ]
        ]
    , nav [ class "login" ]
        [ button [ class "login__link login__link--border" ] [ linksToUpper "create" ]
        , button [ class "login__link" ] [ linksToUpper "sign in" ]
        ]
    ]


viewMain : List (Html Msg)
viewMain =
    []
