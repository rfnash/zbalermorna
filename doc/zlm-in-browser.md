# Zbalermorna in Chrome

It's possible to programmatically add a back-up font to all `font-family` css rules in chrome with [this extension](https://chrome.google.com/webstore/detail/custom-javascript-for-web/ddbjnfjiigjmcpcpkmhogomapikjbjdk), and the following block of code with the `.*` (all sites), where `Lato-ZLM` is the name of your Zbalermorna-supported font installed on your system:

```js
for (var i = 0; i < document.styleSheets.length; i++) {
    for (var j = 0; j < document.styleSheets[i].cssRules.length; j++) {
        if (document.styleSheets[i].cssRules[j].cssText.match(/[^@]*font-family.?:[^;]+;/))
            document.styleSheets[i].cssRules[j].style.fontFamily += ", \"Lato-ZLM\"";
    }
}
```