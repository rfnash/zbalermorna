# Zbalermorna in Chrome

It's possible to programmatically add a back-up font to all `font-family` css rules in chrome with [this extension](https://chrome.google.com/webstore/detail/custom-javascript-for-web/ddbjnfjiigjmcpcpkmhogomapikjbjdk), and the following block of code with the `.*` (all sites):

```js
document.querySelectorAll("body")[0].innerHTML += 
  "<style>" +
  "  @import url(//jackhumbert.github.io/zbalermorna/test/css/lato-zlm-extended.css);" +
  "  @import url(//jackhumbert.github.io/zbalermorna/test/css/fira-code.css);" +
  "</style>";
  
for (var i = 0; i < document.styleSheets.length; i++) {
    for (var j = 0; j < document.styleSheets[i].cssRules.length; j++) {
        if (document.styleSheets[i].cssRules[j].cssText.match(/[^@]*font-family.?:[^;]+;/) && document.styleSheets[i].cssRules[j].style)
          if (document.styleSheets[i].cssRules[j].style.fontFamily.match(/monospace/))
            document.styleSheets[i].cssRules[j].style.fontFamily += ", \"fira-code-zlm\"";
          else
            document.styleSheets[i].cssRules[j].style.fontFamily += ", \"lato-zlm-extended\"";
    }
}

```