// findbar

// enable userChrome
user_pref( "toolkit.legacyUserProfileCustomizations.stylesheet", true );

// set homepage
user_pref( "browser.startup.homepage", "https://github.com/" );

// highlight all searches
user_pref( "findbar.highlightAll", true );

// <bs> -> back, <S-bs> -> forward
user_pref( "browser.backspace_action", 0 );

// do not close window when last tab is closed
user_pref( "browser.tabs.closeWindowWithLastTab", false );

// turn off url dropdown results
user_pref( "browser.urlbar.maxRichResults", 0 );

// set page bg
// CHANGES MANY PAGE BG COLORS
// user_pref( "browser.display.background_color", "#1c2128" );
// user_pref( "browser.display.focus_background_color", "#1c2128" );

/* if using rich results
{{{
    // turn off all the extra search engines
    user_pref( "browser.search.hiddenOneOffs", "Google,Amazon.com,Bing,DuckDuckGo,eBay,Wikipedia (en)" )

    // turn off suggestions
    user_pref( "browser.search.suggest.enabled", false )
    user_pref( "browser.urlbar.suggest.quicksuggest.sponsored", false );
    user_pref( "browser.urlbar.suggest.quicksuggest.nonsponsored", false );
}}}
*/
