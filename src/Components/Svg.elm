module Components.Svg exposing (..)

import Html exposing (Html)
import Svg
    exposing
        ( circle
        , defs
        , feBlend
        , feComposite
        , feFlood
        , feGaussianBlur
        , feMorphology
        , feOffset
        , g
        , line
        , linearGradient
        , polygon
        , rect
        , stop
        , svg
        , use
        )
import Svg.Attributes as Sa exposing (..)


type Gaslur
    = GlassCard
    | Heart
    | Arrow


gaslur : Gaslur -> Html msg
gaslur svgToUse =
    case svgToUse of
        GlassCard ->
            svg [ class "glass-card__svg", width "504", height "585", viewBox "0 0 504 585", fill "none" ]
                [ g [ filter "url(#filter0_b_102_22)" ] [ rect [ width "504", height "585", rx "35.0246", fill "url(#paint0_linear_102_22)" ] [], rect [ x "0.437808", y "0.437808", width "503.124", height "584.124", rx "34.5868", stroke "url(#paint1_linear_102_22)", strokeWidth "0.875616" ] [] ]
                , defs []
                    [ Svg.filter [ id "filter0_b_102_22", x "-1110", y "-1110", width "2724", height "2805", filterUnits "userSpaceOnUse", colorInterpolationFilters "sRGB" ] [ feFlood [ floodOpacity "0", result "BackgroundImageFix" ] [], feGaussianBlur [ in_ "BackgroundImage", stdDeviation "555" ] [], feComposite [ in2 "SourceAlpha", operator "in", result "effect1_backgroundBlur_102_22" ] [], feBlend [ mode "normal", in_ "SourceGraphic", in2 "effect1_backgroundBlur_102_22", result "shape" ] [] ]
                    , linearGradient [ id "paint0_linear_102_22", x1 "27.552", y1 "6.84421", x2 "166.562", y2 "649.157", gradientUnits "userSpaceOnUse" ] [ stop [ stopColor "#3A81BF", stopOpacity "0.08" ] [], stop [ offset "1", stopColor "#41305A", stopOpacity "0.08" ] [] ]
                    , linearGradient [ id "paint1_linear_102_22", x1 "26.88", y1 "5.76355", x2 "176.195", y2 "656.792", gradientUnits "userSpaceOnUse" ] [ stop [ stopColor "#FB37FF" ] [], stop [ offset "0.259843", stopColor "#9B6FEE", stopOpacity "0" ] [], stop [ offset "0.609079", stopColor "#7B7FEA", stopOpacity "0" ] [], stop [ offset "1", stopColor "#1BB2DE" ] [] ]
                    ]
                ]

        Heart ->
            svg [ width "24", height "24", viewBox "0 0 24 24", fill "none" ]
                [ Svg.path [ fillRule "evenodd", clipRule "evenodd", d "M6.73649 4C4.65746 4 2.5 5.88043 2.5 8.51351C2.5 11.6209 4.8236 14.4738 7.36118 16.6342C8.60701 17.6948 9.85656 18.5479 10.7965 19.1364C11.2656 19.4301 11.6557 19.6567 11.9269 19.8091C11.9523 19.8234 11.9767 19.837 12 19.85C12.0233 19.837 12.0477 19.8234 12.0731 19.8091C12.3443 19.6567 12.7344 19.4301 13.2035 19.1364C14.1434 18.5479 15.393 17.6948 16.6388 16.6342C19.1764 14.4738 21.5 11.6209 21.5 8.51351C21.5 5.88043 19.3425 4 17.2635 4C15.1581 4 13.4627 5.38899 12.7115 7.64258C12.6094 7.94883 12.3228 8.15541 12 8.15541C11.6772 8.15541 11.3906 7.94883 11.2885 7.64258C10.5373 5.38899 8.84185 4 6.73649 4ZM12 20.7027L12.3426 21.3699C12.1276 21.4803 11.8725 21.4803 11.6574 21.3699L12 20.7027ZM1 8.51351C1 5.052 3.82903 2.5 6.73649 2.5C9.02981 2.5 10.8808 3.72621 12 5.60482C13.1192 3.72621 14.9702 2.5 17.2635 2.5C20.171 2.5 23 5.052 23 8.51351C23 12.3318 20.1986 15.5735 17.6112 17.7763C16.2945 18.8973 14.9816 19.7929 13.9996 20.4077C13.5078 20.7157 13.0971 20.9544 12.8078 21.1169C12.6631 21.1982 12.5486 21.2605 12.4694 21.3029C12.4299 21.3241 12.3991 21.3404 12.3777 21.3516L12.3529 21.3646L12.3459 21.3682L12.3438 21.3693C12.3435 21.3694 12.3426 21.3699 12 20.7027C11.6574 21.3699 11.6576 21.37 11.6574 21.3699L11.6541 21.3682L11.6471 21.3646L11.6223 21.3516C11.6009 21.3404 11.5701 21.3241 11.5306 21.3029C11.4514 21.2605 11.3369 21.1982 11.1922 21.1169C10.9029 20.9544 10.4922 20.7157 10.0004 20.4077C9.01844 19.7929 7.70549 18.8973 6.38882 17.7763C3.80141 15.5735 1 12.3318 1 8.51351Z", fill "#E0E0E0" ] []
                ]

        Arrow ->
            svg [ width "24", height "24", viewBox "0 0 24 24", fill "none" ]
                [ Svg.path [ fillRule "evenodd", clipRule "evenodd", d "M13.2197 19.0303C13.5126 19.3232 13.9874 19.3232 14.2803 19.0303L20.5303 12.7803C20.8232 12.4874 20.8232 12.0126 20.5303 11.7197L14.2803 5.46967C13.9874 5.17678 13.5126 5.17678 13.2197 5.46967C12.9268 5.76256 12.9268 6.23744 13.2197 6.53033L18.1893 11.5L3.75 11.5C3.33579 11.5 3 11.8358 3 12.25C3 12.6642 3.33579 13 3.75 13L18.1893 13L13.2197 17.9697C12.9268 18.2626 12.9268 18.7374 13.2197 19.0303Z", fill "#D7D7D7" ] []
                ]
