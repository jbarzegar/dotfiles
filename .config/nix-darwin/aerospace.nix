{ ... }:
{
  services.aerospace.enable = true;
  services.aerospace.settings = {

    # Start AeroSpace at login
    # start-at-login = true;

    # Normalizations. See: https://nikitabobko.github.io/AeroSpace/guide#normalization
    enable-normalization-flatten-containers = true;
    enable-normalization-opposite-orientation-for-nested-containers = true;

    # See: https://nikitabobko.github.io/AeroSpace/guide#layouts
    # The 'accordion-padding' specifies the size of accordion padding
    # You can set 0 to disable the padding feature
    accordion-padding = 30;

    # Possible values: tiles|accordion
    default-root-container-layout = "tiles";

    # Possible values: horizontal|vertical|auto
    # 'auto' means: wide monitor (anything wider than high) gets horizontal orientation,
    #               tall monitor (anything higher than wide) gets vertical orientation
    default-root-container-orientation = "auto";

    # Mouse follows focus when focused monitor changes
    # Drop it from your config, if you don't like this behavior
    # See https://nikitabobko.github.io/AeroSpace/guide#on-focus-changed-callbacks
    # See https://nikitabobko.github.io/AeroSpace/commands#move-mouse
    # Fallback value (if you omit the key): on-focused-monitor-changed = []
    on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
    on-focus-changed = [ "move-mouse window-lazy-center" ];
    on-window-detected = [
      {
        "if" = {
          app-id = "com.mitchellh.ghostty";
        };
        run = [ "layout tiling" ];
      }
    ];

    # You can effectively turn off macOS "Hide application" (cmd-h) feature by toggling this flag
    # Useful if you don't use this macOS feature, but accidentally hit cmd-h or cmd-alt-h key
    # Also see: https://nikitabobko.github.io/AeroSpace/goodies#disable-hide-app
    automatically-unhide-macos-hidden-apps = false;

    # Possible values: (qwerty|dvorak|colemak)
    # See https://nikitabobko.github.io/AeroSpace/guide#key-mapping
    key-mapping.preset = "qwerty";

    # See: https://nikitabobko.github.io/AeroSpace/guide#assign-workspaces-to-monitors
    gaps = {
      inner.horizontal = 15;
      inner.vertical = 15;
      outer.left = 15;
      outer.bottom = 15;
      outer.top = 15;
      outer.right = 15;
    };

    # 'main' binding mode declaration
    # See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
    # 'main' binding mode must be always presented
    # Fallback value (if you omit the key): mode.main.binding = {}
    mode.main.binding = {
      # See: https://nikitabobko.github.io/AeroSpace/commands#layout
      alt-slash = "layout tiles horizontal vertical";
      alt-comma = "layout accordion horizontal vertical";

      # See: https://nikitabobko.github.io/AeroSpace/commands#focus
      alt-h = "focus left";
      alt-j = "focus down";
      alt-k = "focus up";
      alt-l = "focus right";

      # See: https://nikitabobko.github.io/AeroSpace/commands#move
      alt-shift-h = "move left";
      alt-shift-j = "move down";
      alt-shift-k = "move up";
      alt-shift-l = "move right";

      # See: https://nikitabobko.github.io/AeroSpace/commands#resize
      alt-shift-minus = "resize smart -50";
      alt-shift-equal = "resize smart +50";

      # See: https://nikitabobko.github.io/AeroSpace/commands#workspace
      alt-d = "workspace dev";
      alt-w = "workspace web";
      alt-r = "workspace rec";

      # See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
      alt-shift-d = "move-node-to-workspace dev";
      alt-shift-w = "move-node-to-workspace web";
      alt-shift-r = "move-node-to-workspace rec";
      # See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
      alt-tab = "workspace-back-and-forth";
      # See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
      alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

      # See: https://nikitabobko.github.io/AeroSpace/commands#mode
      alt-shift-semicolon = "mode service";
    };
    # 'service' binding mode declaration.
    # See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
    mode.service.binding = {
      esc = [
        "reload-config"
        "mode main"
      ];
      r = [
        "flatten-workspace-tree"
        "mode main"
      ]; # reset layout
      f = [
        "layout floating tiling"
        "mode main"
      ]; # Toggle between floating and tiling layout
      backspace = [
        "close-all-windows-but-current"
        "mode main"
      ];

      # sticky is not yet supported https://github.com/nikitabobko/AeroSpace/issues/2
      #s = ["layout sticky tiling" "mode main"]

      alt-shift-h = [
        "join-with left"
        "mode main"
      ];
      alt-shift-j = [
        "join-with down"
        "mode main"
      ];
      alt-shift-k = [
        "join-with up"
        "mode main"
      ];
      alt-shift-l = [
        "join-with right"
        "mode main"
      ];
    };
  };

}
