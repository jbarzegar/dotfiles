{
  ...
}:
{
  system.defaults.controlcenter = {
    BatteryShowPercentage = true;
  };

  system.defaults.dock = {
    autohide = true;
    autohide-time-modifier = 0.8;
    mru-spaces = false;
    orientation = "bottom";
    showhidden = true;
  };

  system.defaults.finder = {
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    NewWindowTarget = "Home";
    ShowPathbar = true;
    ShowStatusBar = true;
  };

  system.defaults.NSGlobalDomain = {
    "com.apple.mouse.tapBehavior" = 1; # tap to click
    "com.apple.swipescrolldirection" = true; # natural scroll
    ApplePressAndHoldEnabled = false; # disable press & hold
    AppleShowAllExtensions = true;
    AppleShowAllFiles = true;
    AppleTemperatureUnit = "Celsius";
    # disable auto captialize
    NSAutomaticCapitalizationEnabled = false;
    NSAutomaticInlinePredictionEnabled = false;
    # disable smart dashes
    NSAutomaticDashSubstitutionEnabled = false;
    # disable smart quotes
    NSAutomaticQuoteSubstitutionEnabled = false;
    NSAutomaticSpellingCorrectionEnabled = true;
    NSDocumentSaveNewDocumentsToCloud = false;
    NSNavPanelExpandedStateForSaveMode = true;
    NSNavPanelExpandedStateForSaveMode2 = true;
  };

  system.defaults.screencapture = {
    target = "clipboard";
    type = "png";
  };
  system.defaults.spaces.spans-displays = false;

  system.defaults.trackpad = {
    Clicking = true;
    Dragging = true;
    TrackpadThreeFingerDrag = true;
    TrackpadThreeFingerTapGesture = 0;
  };

  system.defaults.WindowManager = {
    EnableStandardClickToShowDesktop = false;
  };

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  system.startup.chime = true;

  # Enable sudo with touch id
  security.pam.services.sudo_local.touchIdAuth = true;
}
