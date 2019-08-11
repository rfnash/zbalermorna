# Zbalermorna in lessons

You can easily translate all of the Lojban in [la gleki's The Crash Course](https://mw.lojban.org/papri/The_Crash_Course_(a_draft)) with [this extension](https://chrome.google.com/webstore/detail/custom-javascript-for-web/ddbjnfjiigjmcpcpkmhogomapikjbjdk) and this javascript:

```js
function formatUnicode (point) {
  return String.fromCodePoint(point);
}

const UNICODE_RANGE_START = 0xE2300;
const UNICODE_FULL_VOWEL_START = 0xE24F1;
const lerfu = ".'ptkflscmxbdgvrzjnqwaeiouy";
const fullVowels = "AEIOUY";

function latinToZbalermorna(c) {
  if (c.codePointAt(0) >= 0xe2300) {
    return c;
  }
  if (c == " ")
    return " ";
  if (c == "h" || c == "H")
    c = "'";
  if (c == ",")
    return formatUnicode(0xe230f); // ZLM_SLAKABU
  if (c == "~")
    return formatUnicode(0xe238f); // ZLM_STRETCH
  if (c == "-")
    return formatUnicode(0xe23af); // ZLM_DASH_MEDI (smajibu)
  if (c == "!")
    return formatUnicode(0xe235f); // ZLM_BAHEBU
  // if (c == ":" || c == "\"")
  //   return formatUnicode(0xe24f0)); // these ligatures aren't supported by the font standard yet
  if (c == "1")
    return formatUnicode(0xe231F); // ZLM_TONE_UP
  if (c == "2")
    return formatUnicode(0xe232F); // ZLM_TONE_DOWN
  if (c == "3")
    return formatUnicode(0xe233F); // ZLM_TONE_UP_DOWN
  if (c == "4")
    return formatUnicode(0xe234F); // ZLM_TONE_DOWN_UP
  if (fullVowels.indexOf(c) >= 0)
    return formatUnicode(UNICODE_FULL_VOWEL_START + fullVowels.indexOf(c));
  else if (lerfu.indexOf(c.toLowerCase()) >= 0)
    return formatUnicode(UNICODE_RANGE_START + lerfu.indexOf(c.toLowerCase()) * 16);
  if (c == "\n")
    return "\n";
  if (c == "\t")
    return "\t";
  return "";
}

function zlmArray(s) {
  var zlm = "", latin = "", tag = false;
  for (const c of s) {
    if (c == "<")
      tag = true;
    
    if (tag) {
     zlm += c; 
    } else {
      zlm += latinToZbalermorna(c);
      latin += c;
    }
    
    if (c == ">")
      tag = false;
  };
  return {
    "latin": latin,
    "zlm": zlm,
  };
}

document.querySelectorAll("b").forEach(function(b) {
  var t = zlmArray(b.innerHTML);
  b.innerHTML = "<span title=\"" + t.latin + "\" style='font-weight: 400; font-family: \"Lato-ZLM\"; font-size: 24px;'>" + t.zlm + "</span>";
});

```