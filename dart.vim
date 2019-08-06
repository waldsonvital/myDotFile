"Put it at `~/.vim/after/syntax/dart.vim` to add/override anything in `~/.vim/bundle/dart-vim-plugin/syntax/dart.vim`.
syn match dartFunction "\zs\(\k\w*\)*\s*\ze("
hi! link dartFunction Functioni

syn match myCamelCase '\v(<_*\u\i*>)+'
hi! link myCamelCase Type

syntax keyword flutterConstant immutable kAlwaysCompleteAnimation kAlwaysDismissedAnimation
            \ kBackMouseButton kBottomNavigationBarHeight kDoubleTapMinTime kDoubleTapSlop kDoubleTapTimeout
            \ kDoubleTapTouchSlop kElevationToShadow kFloatingActionButtonMargin kFloatingActionButtonSegue
            \ kFloatingActionButtonTurnInterval kForwardMouseButton kHoverTapSlop kHoverTapTimeout kJumpTapTimeout
            \ kLongPressTimeout kMaterialListPadding kMaxFlingVelocity kMaxUnsignedSMI kMiddleMouseButton
            \ kMinFlingVelocity kNoDefaultValue kPagingTouchSlop kPanSlop kPressTimeout kPrimaryMouseButton
            \ kPrimaryStylusButton kRadialReactionAlpha kRadialReactionDuration kRadialReactionRadius kScaleSlop
            \ kSecondaryMouseButton kSecondaryStylusButton kTabLabelPadding kTabScrollDuration kTextTabBarHeight
            \ kThemeAnimationDuration kThemeChangeDuration kToolbarHeight kTouchSlop kWindowTouchSlop
            \ kZoomControlsTimeout mustCallSuper optionalTypeArgs protected required timelineWhitelistArguments
            \ visibleForTesting

syntax keyword flutterExceptions FlutterError MissingPluginException PlatformException TickerCanceled

highlight default link flutterConstant      Constant
highlight default link flutterExceptions    Exception
