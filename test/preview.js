
// Shims

HTMLTextAreaElement.prototype.insertAtCaret = function (text) {
  if (this.selectionStart || this.selectionStart === 0) {
    var startPos = this.selectionStart,
        endPos   = this.selectionEnd,
        before   = this.value.substring(0, startPos),
        after    = this.value.substring(endPos, this.value.length);
    this.value = before + text + after;
    this.selectionStart = startPos + text.length;
    this.selectionEnd   = startPos + text.length;
  } else {
    this.value += text;
  }
};


// Config

const KEY_CODE_APOSTROPHE = 222;
const UNICODE_RANGE_START = 0xE2300;
const UNICODE_FULL_VOWEL_START = 0xE24F1;
const PARSE_MODE_TEXT = 0;
const PARSE_MODE_TAG  = 1;

const lerfu = ".'ptkflscmxbdgvrzjnqwaeiouy";
const fullVowels = "AEIOUY";

// Global Helpers

var log = console.log.bind(console);

function id (x) {
  return x;
}

function trim (str) {
  return str.trim();
}

function toArray (list) {
  return Array.prototype.slice.apply(list);
}

function Q (sel, parent) {
  return toArray((parent || document).querySelectorAll(sel));
};

function comp (a, b) {
  return function (x) { return a(b(x)); }
}

function defer (λ) {
  return setTimeout(λ, 0);
}

function deferOf (λ) {
  return function () { defer(λ); };
}


// Domain Helpers

function formatUnicode (point) {
  return "&#x" + point.toString(16) + ";";
}

function translate (text) {
  return toArray(text).map(comp(formatUnicode, latinToZLM)).join('');
}

function latinToZLM (chr) {
  if (chr === "h" || chr === "'")
    return UNICODE_RANGE_START + 16;
  if (-1 < lerfu.indexOf(chr))
    return UNICODE_RANGE_START + lerfu.indexOf(chr) * 16;
  if (-1 < fullVowels.indexOf(chr))
    return UNICODE_FULL_VOWEL_START + fullVowels.indexOf(chr);
  return chr.codePointAt(0);
}

function keyCodeToZLM (code) {
  if (code === KEY_CODE_APOSTROPHE)
    return UNICODE_RANGE_START + 16;
  if (code > 64 && code < 92)
    return latinToZLM(String.fromCharCode(code).toLowerCase());
  return code;
}


// Translate test cases into appropriate unicode

Q('[data-zlm-translate]').forEach(function (phrase) {
  phrase.innerHTML = translate(phrase.innerHTML);
  return;

  var output = "";
  var chars  = phrase.innerHTML;
  var mode   = PARSE_MODE_TEXT;

  for (var i = 0, max = chars.length - 1; i < max; i++) {
    var c = chars[i];

    if (c === '<') { mode = PARSE_MODE_TAG; }
    if (c === '>') { mode = PARSE_MODE_TEXT; }

    switch (mode) {
      case PARSE_MODE_TEXT: output += translate(c); break;
      case PARSE_MODE_TAG:  output += c; break;
    }
  }

  phrase.innerHTML = output;
});


// Intercept typing in IME zone

Q('[data-ime-emulation]').forEach(function (textarea) {
  output = Q('[data-ime-output]')[0]
  function update () { output.innerHTML = translate( textarea.value ); }
  textarea.addEventListener('keydown', deferOf(update));
  update();
});

const font_selector = document.getElementById('font-selector');
// const liga = document.getElementById('liga');
// const calt = document.getElementById('calt');
// const ss10 = document.getElementById('ss10');
// const ss11 = document.getElementById('ss11');
// const zlm2 = document.getElementById('zlm2');

// function updateFontFeatures() { 
//   for (var i = 0; i < document.getElementsByClassName('reference').length; i++) {
//     document.getElementsByClassName('reference')[i].style["font-feature-settings"] = 
//     "'liga' " + ( liga.checked ? 1 : 0 ) + 
//     ", 'ss10' " + ( ss10.checked ? 1 : 0 )  + 
//     ", 'ss11' " + ( ss11.checked ? 1 : 0 ) + 
//     ", 'zlm2' " + ( zlm2.checked ? 1 : 0 ) + 
//     ", 'calt' " + ( calt.checked ? 1 : 0 );
//   }
// }



font_selector.addEventListener('change', (event) => {
  window.location.hash = event.target.value;
  for (var i = 0; i < document.getElementsByClassName('reference').length; i++) {
    document.getElementsByClassName('reference')[i].style["font-family"] = event.target.value;
  }
})

// liga.addEventListener('change', (event) => {
//   updateFontFeatures();
// })

// calt.addEventListener('change', (event) => {
//   updateFontFeatures();
// })

// ss10.addEventListener('change', (event) => {
//   updateFontFeatures();
// })

// ss11.addEventListener('change', (event) => {
//   updateFontFeatures();
// })


// zlm2.addEventListener('change', (event) => {
//   updateFontFeatures();
// })

if (window.location.hash) {
  font_selector.value = window.location.hash.substring(1);
} else {
  font_selector.value = "lato-zlm";
  window.location.hash = font_selector.value;
}

for (var i = 0; i < document.getElementsByClassName('reference').length; i++) {
  document.getElementsByClassName('reference')[i].style["font-family"] = font_selector.value;
}
// updateFontFeatures();