# Zbalermorna on Discord

In the future, once ZLM-compatible fonts are more easily distributed/available, it might be desirable to use these fonts on Discord to communicate with other people that have these fonts (hopefully a separate ZLM channel). This is possible with [BeautifulDiscord, a css injector](https://github.com/leovoel/BeautifulDiscord). Once you have it installed and are editing your css file, you can use something like this to make the input area, messages, and code blocks render using ZLM-compatible fonts:

```
body {
    font-family: Whitney, "Helvetica Neue", Helvetica, Arial, sans-serif, Lato-ZLM;
}
code {
    font-family: Consolas, "Liberation Mono", Menlo, Courier, monospace, "Fira Code";
}
::placeholder, body, button, input, select, textarea {
    font-family: Whitney, "Helvetica Neue", Helvetica, Arial, sans-serif, Lato-ZLM;
}
```

These use the default Discord fonts, and define a ZLM-compatible font as the back-up, so the general look of Discord doesn't change.