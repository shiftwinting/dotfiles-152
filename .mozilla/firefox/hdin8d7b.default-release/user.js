// findbar

// to highlight all without dimming: WORKS
user_pref( "findbar.highlightAll", true );

// allow backspace to take us back
user_pref( "browser.backspace_action", 0 );
user_pref( "browser.tabs.closeWindowWithLastTab", false );

// turn off url dropdown results
user_pref( "browser.urlbar.maxRichResults", 0 );

// turn off suggestions
user_pref( "browser.urlbar.suggest.quicksuggest.sponsored", false );
user_pref( "browser.urlbar.suggest.quicksuggest.nonsponsored", false );
