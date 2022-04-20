module Components.Svg exposing (..)

import Html exposing (Html)
import Html.Attributes as HA
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
import Svg.Attributes as SA exposing (..)


type Gaslur
    = GlassCard
    | Heart
    | Arrow
    | Shield
    | Archive
    | Gallery
    | Rocket
    | ListToTop
    | SimpleArrow
    | Filter
    | Instagram
    | Facebook
    | Twitter


type District
    = Test


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

        Shield ->
            svg [ width "48", height "53", viewBox "0 0 48 53", fill "none" ]
                [ Svg.path [ d "M34.5708 21.8208C35.2542 21.1374 35.2542 20.0293 34.5708 19.3459C33.8873 18.6625 32.7793 18.6625 32.0959 19.3459L21.6667 29.7751L17.0708 25.1792C16.3873 24.4958 15.2793 24.4958 14.5959 25.1792C13.9125 25.8627 13.9125 26.9707 14.5959 27.6541L20.4292 33.4874C21.1126 34.1709 22.2207 34.1709 22.9041 33.4874L34.5708 21.8208Z", fill "#E0E0E0" ] []
                , Svg.path [ fillRule "evenodd", clipRule "evenodd", d "M25.2597 0.485474C24.4409 0.21991 23.5591 0.219909 22.7403 0.485474L3.49026 6.72872C1.80876 7.27407 0.666656 8.83861 0.666656 10.6105V22.3333C0.666669 36.7751 9.46518 47.3114 22.6023 52.2684C23.5022 52.608 24.4978 52.608 25.3977 52.2684C38.5348 47.3114 47.3333 36.7751 47.3333 22.3333V10.6112C47.3333 8.83985 46.1918 7.27425 44.5097 6.72872L25.2597 0.485474ZM23.82 3.81475C23.937 3.77682 24.063 3.77682 24.18 3.81475L43.43 10.058C43.6719 10.1365 43.8333 10.3598 43.8333 10.6112V22.3333C43.8333 35.0765 36.1782 44.4597 24.1621 48.9938C24.0585 49.0328 23.9414 49.0328 23.8379 48.9938C11.8217 44.4597 4.16667 35.0765 4.16666 22.3333L4.16666 10.6105C4.16666 10.3598 4.32755 10.1366 4.57003 10.058L23.82 3.81475Z", fill "#E0E0E0" ] []
                ]

        Archive ->
            svg [ width "52", height "48", viewBox "0 0 52 48", fill "none" ]
                [ Svg.path [ fillRule "evenodd", clipRule "evenodd", d "M4.41666 0.666672C2.1615 0.666672 0.333328 2.49484 0.333328 4.75001V12.9167C0.333328 15.1718 2.1615 17 4.41666 17H47.5833C49.8385 17 51.6667 15.1718 51.6667 12.9167V4.75001C51.6667 2.49484 49.8385 0.666672 47.5833 0.666672H4.41666ZM47.5833 4.16667H4.41666C4.0945 4.16667 3.83333 4.42784 3.83333 4.75001V12.9167C3.83333 13.2388 4.0945 13.5 4.41666 13.5H47.5833C47.9055 13.5 48.1667 13.2388 48.1667 12.9167V4.75001C48.1667 4.42784 47.9055 4.16667 47.5833 4.16667Z", fill "#BDBDBD" ] []
                , Svg.path [ d "M4.41666 19.3333C5.38316 19.3333 6.16666 20.1168 6.16666 21.0833V43.25C6.16666 43.5722 6.42783 43.8333 6.74999 43.8333H45.25C45.5722 43.8333 45.8333 43.5722 45.8333 43.25V21.0833C45.8333 20.1168 46.6168 19.3333 47.5833 19.3333C48.5498 19.3333 49.3333 20.1168 49.3333 21.0833V43.25C49.3333 45.5052 47.5052 47.3333 45.25 47.3333H6.74999C4.49483 47.3333 2.66666 45.5052 2.66666 43.25V21.0833C2.66666 20.1168 3.45016 19.3333 4.41666 19.3333Z", fill "#BDBDBD" ] []
                , Svg.path [ d "M20.75 22.8333C19.7835 22.8333 19 23.6168 19 24.5833C19 25.5498 19.7835 26.3333 20.75 26.3333H31.25C32.2165 26.3333 33 25.5498 33 24.5833C33 23.6168 32.2165 22.8333 31.25 22.8333H20.75Z", fill "#BDBDBD" ] []
                ]

        Gallery ->
            svg [ width "54", height "46", viewBox "0 0 54 46", fill "none" ]
                [ Svg.path [ fillRule "evenodd", clipRule "evenodd", d "M4.25 4.33333C3.92783 4.33333 3.66666 4.5945 3.66666 4.91666V41.0833C3.66666 41.4055 3.92783 41.6667 4.25 41.6667H11.6654L31.6658 20.6136C33.2472 18.9489 35.8899 18.9151 37.5135 20.5387L50.3333 33.3585V4.91666C50.3333 4.5945 50.0722 4.33333 49.75 4.33333H4.25ZM49.75 45.1667H12.4265H12.4063H4.25C1.99484 45.1667 0.166664 43.3385 0.166664 41.0833V4.91666C0.166664 2.6615 1.99484 0.833328 4.25 0.833328H49.75C52.0052 0.833328 53.8333 2.6615 53.8333 4.91666V41.0833C53.8333 43.3385 52.0052 45.1667 49.75 45.1667ZM34.2033 23.0243L16.493 41.6667H49.75C50.0722 41.6667 50.3333 41.4055 50.3333 41.0833V38.3082L35.0387 23.0136C34.8067 22.7816 34.4292 22.7864 34.2033 23.0243ZM20 16.5833C20 18.8385 18.1718 20.6667 15.9167 20.6667C13.6615 20.6667 11.8333 18.8385 11.8333 16.5833C11.8333 14.3282 13.6615 12.5 15.9167 12.5C18.1718 12.5 20 14.3282 20 16.5833ZM23.5 16.5833C23.5 20.7715 20.1048 24.1667 15.9167 24.1667C11.7285 24.1667 8.33333 20.7715 8.33333 16.5833C8.33333 12.3952 11.7285 9 15.9167 9C20.1048 9 23.5 12.3952 23.5 16.5833Z", fill "#BDBDBD" ] []
                ]

        Rocket ->
            svg [ width "54", height "54", viewBox "0 0 54 54", fill "none" ]
                [ Svg.path [ fillRule "evenodd", clipRule "evenodd", d "M46.4168 0.75C40.0223 0.75 33.8692 3.19223 29.2152 7.5775L26.1713 10.4456C24.914 11.6303 23.7138 12.8722 22.5743 14.167H10.8211C9.38679 14.167 8.05764 14.9195 7.31968 16.1494L0.99939 26.6833C0.708198 27.1686 0.669697 27.7648 0.896048 28.2835C1.1224 28.8022 1.58565 29.1795 2.13948 29.2961L12.8068 31.5418C12.897 31.6567 12.9969 31.7661 13.1062 31.8687L17.7635 36.2393L22.1314 40.8939C22.2341 41.0033 22.3435 41.1032 22.4584 41.1935L24.7042 51.8608C24.8208 52.4146 25.198 52.8779 25.7168 53.1042C26.2355 53.3306 26.8317 53.2921 27.317 53.0009L37.8509 46.6806C39.0808 45.9426 39.8333 44.6135 39.8333 43.1792V31.4251C41.1287 30.285 42.3711 29.0841 43.5562 27.8261L46.4217 24.7843C50.8076 20.1287 53.2492 13.9734 53.2474 7.57724L53.2466 4.83214C53.2459 2.57744 51.4179 0.75 49.1632 0.75H46.4168ZM36.3333 34.2618C35.5571 34.8402 34.7655 35.3986 33.9591 35.9361L26.0398 41.2156L27.623 48.7356L36.0501 43.6794C36.2258 43.574 36.3333 43.3841 36.3333 43.1792V34.2618ZM12.7844 27.9604L18.0656 20.0386C18.6026 19.2331 19.1603 18.4423 19.738 17.667H10.8211C10.6162 17.667 10.4263 17.7745 10.3209 17.9502L5.26464 26.3773L12.7844 27.9604ZM31.6154 10.1248C35.62 6.35145 40.9146 4.25 46.4168 4.25H49.1632C49.4853 4.25 49.7465 4.51106 49.7466 4.83316L49.7474 7.57827C49.749 13.0819 47.648 18.3783 43.8741 22.3844L41.0086 25.4261C38.3093 28.2914 35.293 30.8404 32.0176 33.024L24.3456 38.1387L20.2777 33.8038C20.2523 33.7768 20.2261 33.7505 20.1991 33.7252L15.8615 29.6545L20.9778 21.9801C23.1603 18.7063 25.7079 15.6912 28.5715 12.9929L31.6154 10.1248ZM39.8333 17.6667C39.8333 19.5997 38.2663 21.1667 36.3333 21.1667C34.4003 21.1667 32.8333 19.5997 32.8333 17.6667C32.8333 15.7337 34.4003 14.1667 36.3333 14.1667C38.2663 14.1667 39.8333 15.7337 39.8333 17.6667ZM14.1666 48C16.2662 45.9004 16.2663 41.9331 14.1667 39.8334C12.0671 37.7338 8.09958 37.7338 5.99995 39.8334C3.17943 42.6539 2.62831 48.9363 2.52372 50.9009C2.5062 51.23 2.77002 51.4938 3.09907 51.4762C5.0638 51.3715 11.3466 50.8201 14.1666 48Z", fill "#BDBDBD" ] []
                ]

        ListToTop ->
            svg [ width "26", height "24", viewBox "0 0 26 24", fill "none" ]
                [ Svg.path [ d "M3.73097 4H16.927M3.73097 8H12.8667M3.73097 12H9.82144M13.8818 12L17.9421 8M17.9421 8L22.0024 12M17.9421 8V20", stroke "#F2F2F2", strokeWidth "2", strokeLinecap "round", strokeLinejoin "round" ] []
                ]

        SimpleArrow ->
            svg [ width "25", height "24", viewBox "0 0 25 24", fill "none" ]
                [ Svg.path [ d "M19.4811 9L12.3756 16L5.27002 9", stroke "#F2F2F2", strokeWidth "2", strokeLinecap "round", strokeLinejoin "round" ] []
                ]

        Filter ->
            svg [ width "25", height "24", viewBox "0 0 25 24", fill "none" ]
                [ Svg.path [ d "M3.16052 4C3.16052 3.44772 3.60824 3 4.16052 3H20.4319C20.9842 3 21.4319 3.44772 21.4319 4V6.5814C21.4319 6.84921 21.3245 7.10583 21.1337 7.29377L14.6246 13.7062C14.4338 13.8942 14.3264 14.1508 14.3264 14.4186V17L10.2661 21V14.4186C10.2661 14.1508 10.1587 13.8942 9.96787 13.7062L3.45873 7.29377C3.26794 7.10583 3.16052 6.84921 3.16052 6.5814V4Z", stroke "white", strokeWidth "2", strokeLinecap "round", strokeLinejoin "round" ] []
                ]

        Instagram ->
            svg [ width "26", height "26", viewBox "0 0 26 26", fill "none" ]
                [ rect [ x "2.05609", y "1.87231", width "22", height "22", rx "4.5", stroke "#C4C4C4", strokeWidth "3" ] []
                , circle [ cx "19.7787", cy "6.34131", r "2", fill "#C4C4C4" ] []
                , circle [ cx "13.3541", cy "12.8478", r "5.5", stroke "#C4C4C4", strokeWidth "3" ] []
                ]

        Facebook ->
            svg [ width "26", height "26", viewBox "0 0 26 26", fill "none" ]
                [ Svg.path [ d "M14.68 22.936V10.4458C14.8863 9.28307 16.064 7.02512 19.1247 7.29517", stroke "#C4C4C4", strokeWidth "3", strokeLinecap "round" ] []
                , Svg.path [ d "M11.1157 14.9939H18.1157", stroke "#C4C4C4", strokeWidth "3", strokeLinecap "round" ] []
                , rect [ x "2.10315", y "1.87036", width "22", height "22", rx "4.5", stroke "#C4C4C4", strokeWidth "3" ] []
                ]

        Twitter ->
            svg [ class "svg-icon", style "width: 2.125rem; height: 2.125rem;vertical-align: middle;fill: currentColor;overflow: hidden;", viewBox "0 0 1024 1024", version "1.1" ]
                [ Svg.path [ fill "#C4C4C4", d "M363.093333 853.333333h-3.413333a463.786667 463.786667 0 0 1-198.4-46.506666A58.88 58.88 0 0 1 128 745.386667a60.16 60.16 0 0 1 49.493333-50.346667 282.88 282.88 0 0 0 108.373334-37.973333 404.906667 404.906667 0 0 1-149.76-386.986667 60.16 60.16 0 0 1 42.666666-49.066667 57.6 57.6 0 0 1 61.013334 17.493334 302.506667 302.506667 0 0 0 208.213333 117.333333 192 192 0 0 1 60.16-132.266667 190.72 190.72 0 0 1 271.786667 8.106667 29.866667 29.866667 0 0 0 33.28 4.266667A59.306667 59.306667 0 0 1 896 304.213333a284.16 284.16 0 0 1-54.613333 110.933334A460.373333 460.373333 0 0 1 363.093333 853.333333z m0-85.333333h3.413334a375.04 375.04 0 0 0 387.84-366.506667 56.32 56.32 0 0 1 15.786666-36.266666 221.44 221.44 0 0 0 26.453334-42.666667 109.226667 109.226667 0 0 1-81.493334-36.266667A104.533333 104.533333 0 0 0 640 256a106.666667 106.666667 0 0 0-76.373333 29.44 107.946667 107.946667 0 0 0-30.72 103.253333l11.093333 48.64-49.92 3.413334a354.133333 354.133333 0 0 1-279.04-102.4 303.786667 303.786667 0 0 0 159.146667 275.626666l40.533333 23.04-26.88 38.4a239.786667 239.786667 0 0 1-114.346667 81.92A355.84 355.84 0 0 0 362.666667 768zM810.666667 283.733333z" ] []
                ]


district : District -> Html msg
district svgToUse =
    case svgToUse of
        Test ->
            svg [ width "0", height "0" ]
                [ defs []
                    [ Svg.clipPath [ HA.id "clipped" ]
                        [ circle [ cx "var(--myRad)", cy "var(--myRad)", r "var(--myRad)" ] []
                        , circle [ cx "var(--myRad)", cy "calc(var(--myHeight) - var(--myRad))", r "var(--myRad)" ] []
                        , circle [ cx "calc(var(--myWidth) - var(--myRad))", cy "calc(var(--myHeight) - var(--myRad))", r "var(--myRad)" ] []
                        , circle [ cx "calc(var(--myWidth) - var(--myRad))", cy "var(--myRad)", r "var(--myRad)" ] []
                        , rect [ y "var(--myRad)", width "var(--myWidth)", height "calc(var(--myHeight) - (2 * var(--myRad)))" ] []
                        , rect [ x "var(--myRad)", width "calc(var(--myWidth) - (2 * var(--myRad)))", height "var(--myHeight)" ] []
                        ]
                    ]
                ]
