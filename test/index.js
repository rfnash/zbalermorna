// Public Domain 2016 la kmir, 2019 Jack Humbert
//
// This is free and unencumbered software released into the public domain.

// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.

// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.

// For more information, please refer to <http://unlicense.org>

// Global Helpers

var log = console.log.bind(console);

function toArray (list) {
  return Array.prototype.slice.apply(list);
}

function Q (sel, parent) {
  return toArray((parent || document).querySelectorAll(sel));
};

function translate (text) {
  if (window.location.hash.match(/unicode/))
    return toArray(text).map(latinToZbalermornaUnicode).join('');
  else
    return toArray(text).map(latinToZbalermorna).join('');
}

// Translate test cases into appropriate unicode

Q('[data-zlm-translate]').forEach(function (phrase) {
    phrase.innerHTML = 
      "<div class='ucsur-zlm'>" + toArray(phrase.innerHTML).map(latinToZbalermornaUnicode).join('') + "</div>" + 
      "<div class='old-zlm'>" + toArray(phrase.innerHTML).map(latinToZbalermorna).join('') + "</dd>";
    return;
});

const font_selector = document.getElementById('font-selector');
const ime_link = document.getElementById('ime-link');

var ed = lining(document.getElementById("eye-doctor").querySelector('.ucsur-zlm'), {'autoResize': true});
var edu = lining(document.getElementById("eye-doctor").querySelector('.old-zlm'), {'autoResize': true});

function updateFont(value) {
  if (value.match(/unicode/)) {
    Q('.ucsur-zlm').forEach(function (element) { element.className = 'ucsur-zlm'; });
    Q('.old-zlm').forEach(function (element) { element.className = 'old-zlm hide'; });
  } else {
    Q('.ucsur-zlm').forEach(function (element) { element.className = 'ucsur-zlm hide'; });
    Q('.old-zlm').forEach(function (element) { element.className = 'old-zlm'; });
  }
  for (var i = 0; i < document.getElementsByClassName('reference').length; i++) {
    document.getElementsByClassName('reference')[i].style["font-family"] = value;
  }
  document.fonts.ready.then(function() {
    ed.relining(true);
    edu.relining(true);
  });
}
font_selector.addEventListener('change', (event) => {
  window.location.hash = event.target.value;
  ime_link.href = "ime.html" + window.location.hash;
  updateFont(event.target.value);
});


if (window.location.hash) {
  font_selector.value = window.location.hash.substring(1);
  ime_link.href = "ime.html" + window.location.hash;
} else {
  font_selector.value = "lato-zlm";
  window.location.hash = font_selector.value;
  ime_link.href = "ime.html" + window.location.hash;
}

updateFont(font_selector.value);