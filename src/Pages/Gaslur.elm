module Pages.Gaslur exposing (Model, Msg, page)

import Components.Svg as SVG
import Gen.Params.Gaslur exposing (Params)
import Gen.Route as Route
import Html exposing (Html, a, button, div, h1, header, img, li, nav, p, section, span, strong, text, ul)
import Html.Attributes exposing (attribute, class, href, id, src)
import Html.Attributes.Aria exposing (ariaLabelledby)
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


textToUpper : String -> Html msg
textToUpper str =
    text <| String.toUpper str


viewHeader : List (Html Msg)
viewHeader =
    [ nav [ class "nav" ]
        [ a [ class "nav__link nav__link--current", href "#" ] [ textToUpper "Home" ]
        , a [ class "nav__link", href "#" ] [ textToUpper "My profile" ]
        , a [ class "nav__link", href "#" ] [ textToUpper "activity" ]
        , a [ class "nav__link", href "#" ] [ textToUpper "how it works" ]
        ]
    , nav [ class "login" ]
        [ button [ class "login__link login__link--border" ] [ textToUpper "create" ]
        , button [ class "login__link" ] [ textToUpper "sign in" ]
        ]
    ]


viewMain : List (Html Msg)
viewMain =
    [ viewMainSection
    , viewHotActions
    ]


viewMainSection : Html Msg
viewMainSection =
    section [ class "main", ariaLabelledby "heading" ]
        [ header [ class "main__ctnr" ]
            [ h1 [ class "text-7xl tracking-[-2px] mb-5", id "heading" ] [ text "Discover, collect,  and charity in extraordinary NFT marketplace" ]
            , p [ class "text-2xl font-light" ] [ textToUpper """In aenean posuere lorem risus nec. Tempor tincidunt
             aenean purus purus vestibulum nibh mi venenatis""" ]
            , div [ class "flex gap-7 items-center py-4" ]
                [ button [ class "btm" ] [ text "Explore" ]
                , button [ class "btm btm--border" ] [ text "Create" ]
                ]
            ]
        , div [ class "main__ctnr" ]
            [ div [ class "glass-card" ]
                [ img [ class "glass-card__image", src "https://picsum.photos/800" ] []
                , div [ class "glass-card__bottom gap-2" ]
                    [ img [ class "row-span-2 rounded-[50%] w-14", src "https://picsum.photos/600" ] []
                    , strong [] [ text "Laura" ]
                    , span [] [ text <| String.fromFloat 0.21 ++ " Weth" ]
                    , strong [ class "col-start-3 row-start-1 ml-auto" ] [ textToUpper "WE ARE HERE" ]
                    , span [ class "flex gap-2 ml-auto" ] [ SVG.gaslur SVG.Heart, text <| String.fromInt 25 ]
                    ]
                , SVG.gaslur SVG.GlassCard
                ]
            ]
        ]


viewHotActions : Html Msg
viewHotActions =
    section []
        [ header [] []
        , List.map
            (\{ image, price, endDate } ->
                li [] []
            )
            []
            |> ul []
        ]
