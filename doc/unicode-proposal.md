# Zbalermorna

This is a list of distinct non-ligatured glyphs and potential names with the current Unicode values - Unicode names were chosen based on the [CSUR guide for naming glyphs](http://www.evertype.com/standards/csur/naming.html) and [the proposal for Tengwar](http://std.dkuug.dk/JTC1/SC2/WG2/docs/n1641/n1641.htm), and the glyph names are based on [the Adobe glyph naming standards](http://blogs.adobe.com/typblography/files/typblography/typotechnica2007/Glyph%20names.pdf). The unicode values currently fall outside of the CSUR domain. The CSUR hasn't been updated in some time, but the [UCSUR](https://www.kreativekorp.com/ucsur/) is acting as a holding area until they can be added to the CSUR - this could be considered being sent there if a new range is selected.


```
Code Point C Glyph Name          Unicode Name
--------------------------------------------------------
U+E2300    󢌀 denpa_bu            ZBALERMORNA SYMBOL FOR DENPA BU
U+E2310    󢌐 yhy                 ZBALERMORNA SYMBOL FOR YHY
U+E2320    󢌠 py                  ZBALERMORNA LETTER PY
U+E2330    󢌰 ty                  ZBALERMORNA LETTER TY
U+E2340    󢍀 ky                  ZBALERMORNA LETTER KY
U+E2350    󢍐 fy                  ZBALERMORNA LETTER FY
U+E2360    󢍠 ly                  ZBALERMORNA LETTER LY
U+E2370    󢍰 sy                  ZBALERMORNA LETTER SY
U+E2380    󢎀 cy                  ZBALERMORNA LETTER CY
U+E2390    󢎐 my                  ZBALERMORNA LETTER MY
U+E23A0    󢎠 xy                  ZBALERMORNA LETTER XY
U+E23B0    󢎰 by                  ZBALERMORNA LETTER BY
U+E23C0    󢏀 dy                  ZBALERMORNA LETTER DY
U+E23D0    󢏐 gy                  ZBALERMORNA LETTER GY
U+E23E0    󢏠 vy                  ZBALERMORNA LETTER VY
U+E23F0    󢏰 ry                  ZBALERMORNA LETTER RY
U+E2400    󢐀 zy                  ZBALERMORNA LETTER ZY
U+E2410    󢐐 jy                  ZBALERMORNA LETTER JY
U+E2420    󢐠 ny                  ZBALERMORNA LETTER NY
U+E2430    󢐰 iy                  ZBALERMORNA LETTER SEMIVOWEL IY
U+E2440    󢑀 uy                  ZBALERMORNA LETTER SEMIVOWEL UY

U+E2450    󢑐 abu                 ZBALERMORNA VOWEL SIGN ABU
U+E2460    󢑠 ebu                 ZBALERMORNA VOWEL SIGN EBU
U+E2470    󢑰 ibu                 ZBALERMORNA VOWEL SIGN IBU
U+E2480    󢒀 obu                 ZBALERMORNA VOWEL SIGN OBU
U+E2490    󢒐 ubu                 ZBALERMORNA VOWEL SIGN UBU
U+E24A0    󢒠 ybu                 ZBALERMORNA VOWEL SIGN YBU
U+E24B0    󢒰 aibu                ZBALERMORNA VOWEL SIGN AIBU
U+E24C0    󢓀 eibu                ZBALERMORNA VOWEL SIGN EIBU
U+E24D0    󢓐 oibu                ZBALERMORNA VOWEL SIGN OIBU
U+E24E0    󢓠 aubu                ZBALERMORNA VOWEL SIGN AUBU

U+E24F1    󢓱 sepli_me_abu        ZBALERMORNA LETTER FULL ABU
U+E24F2    󢓲 sepli_me_ebu        ZBALERMORNA LETTER FULL EBU
U+E24F3    󢓳 sepli_me_ibu        ZBALERMORNA LETTER FULL IBU
U+E24F4    󢓴 sepli_me_obu        ZBALERMORNA LETTER FULL OBU
U+E24F5    󢓵 sepli_me_ubu        ZBALERMORNA LETTER FULL UBU
U+E24F6    󢓶 sepli_me_ybu        ZBALERMORNA LETTER FULL YBU
U+E24F7    󢓷 sepli_me_aibu       ZBALERMORNA LETTER FULL AIBU
U+E24F8    󢓸 sepli_me_eibu       ZBALERMORNA LETTER FULL EIBU
U+E24F9    󢓹 sepli_me_oibu       ZBALERMORNA LETTER FULL OIBU
U+E24FA    󢓺 sepli_me_aubu       ZBALERMORNA LETTER FULL AUBU

U+E230F    󢌏 slaka_bu            ZBALERMORNA SYMBOL FOR SLAKA BU
U+E231F    󢌟 bahotongabu         ZBALERMORNA COMBINING BAHOTONGABU
U+E232F    󢌯 subytongabu         ZBALERMORNA COMBINING SUBYTONGABU
U+E233F    󢌿 bahorsubytongabu    ZBALERMORNA COMBINING BAHORSUBYTONGABU
U+E234F    󢍏 suhurbahutongabu    ZBALERMORNA COMBINING SUHURBAHUTONGABU
U+E235F    󢍟 bahebu              ZBALERMORNA COMBINING BAHEBU
U+E238F    󢎏 tcena_bu            ZBALERMORNA COMBINING TCENA BU
U+E23CF    󢏏 samji_bu            ZBALERMORNA SYMBOL FOR SMAJI BU
```

Ligatures would then take the format `ty_abu`, `bahebu_bahebu`, `denpa_bu_yhy`, etc and would not be a part of the unicode spec, just as the other ligatures have been removed.

Native Lojban names should/could be used for all of the glyphs - some options for these are below. `bu` is added at the end to indicate a symbol is being talked about:

```
stretch:    tcena   -ten-

brato'a  t1 is a tone high in pitch/frequency from source t3.
cmato'a  t1 is a tone low in pitch/frequency from source t3.
cmabrato'a low-high pitch
bracmato'a high-low pitch

togystika x1 is a musical accidental (e.g. sharp, flat, or natural) modifying note x2 by a change of x3 to a pitch of x4.

tone:       tonga   -tog-   -to'a-  
rising:     banro   -ba'o-  
diving:     sfubu   -sub-   -su'u-  

ba'orto'a
subyto'a
ba'orsubyto'a

zengau in sense "make greater"
cmaze'a in sense "become diminished"
zgito'a in sense "of note" on place 2

galcparetonga
ba'otonga
fa'urtonga
ba'orsu'utonga
su'urba'otonga
```

These codes could be arranged in a 4x16 table with 14 slots to spare, similar to this:

|    | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F |
|----|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0x | 󢌠 | 󢌰 | 󢍀 | 󢍐 | 󢍠 | 󢍰 | 󢎀 | 󢎐 | 󢎠 | 󢌀 | 󢌐 | 󢓰 |   |   |   |   |
| 1x | 󢎰 | 󢏀 | 󢏐 | 󢏠 | 󢏰 | 󢐀 | 󢐐 | 󢐠 |   |   |   |   |   | 󢍟 | 󢏏 |   |
| 2x | 󢑐 | 󢑠 | 󢑰 | 󢒀 | 󢒐 | 󢒠 | 󢒰 | 󢓀 | 󢓐 | 󢓠 | 󢐰 | 󢑀 |   |   |   |   |
| 3x | 󢓱 | 󢓲 | 󢓳 | 󢓴 | 󢓵 | 󢓶 | 󢓷 | 󢓸 | 󢓹 | 󢓺 | 󢌏 | 󢌟 | 󢌯 | 󢌿 | 󢍏 | 󢎏 |

## Full glyph list for Zbalermorna fonts:

|   |`abu`|`ebu`|`ibu`|`obu`|`ubu`|`ybu`|`aibu`|`eibu`|`oibu`|`aubu`|
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `denpa_bu`|`denpa_bu_abu`|`denpa_bu_ebu`|`denpa_bu_ibu`|`denpa_bu_obu`|`denpa_bu_ubu`|`denpa_bu_ybu`|`denpa_bu_aibu`|`denpa_bu_eibu`|`denpa_bu_oibu`|`denpa_bu_aubu`|
| `yhy`|`yhy_abu`|`yhy_ebu`|`yhy_ibu`|`yhy_obu`|`yhy_ubu`|`yhy_ybu`|`yhy_aibu`|`yhy_eibu`|`yhy_oibu`|`yhy_aubu`|
| `py`|`py_abu`|`py_ebu`|`py_ibu`|`py_obu`|`py_ubu`|`py_ybu`|`py_aibu`|`py_eibu`|`py_oibu`|`py_aubu`|
| `ty`|`ty_abu`|`ty_ebu`|`ty_ibu`|`ty_obu`|`ty_ubu`|`ty_ybu`|`ty_aibu`|`ty_eibu`|`ty_oibu`|`ty_aubu`|
| `ky`|`ky_abu`|`ky_ebu`|`ky_ibu`|`ky_obu`|`ky_ubu`|`ky_ybu`|`ky_aibu`|`ky_eibu`|`ky_oibu`|`ky_aubu`|
| `fy`|`fy_abu`|`fy_ebu`|`fy_ibu`|`fy_obu`|`fy_ubu`|`fy_ybu`|`fy_aibu`|`fy_eibu`|`fy_oibu`|`fy_aubu`|
| `ly`|`ly_abu`|`ly_ebu`|`ly_ibu`|`ly_obu`|`ly_ubu`|`ly_ybu`|`ly_aibu`|`ly_eibu`|`ly_oibu`|`ly_aubu`|
| `sy`|`sy_abu`|`sy_ebu`|`sy_ibu`|`sy_obu`|`sy_ubu`|`sy_ybu`|`sy_aibu`|`sy_eibu`|`sy_oibu`|`sy_aubu`|
| `cy`|`cy_abu`|`cy_ebu`|`cy_ibu`|`cy_obu`|`cy_ubu`|`cy_ybu`|`cy_aibu`|`cy_eibu`|`cy_oibu`|`cy_aubu`|
| `my`|`my_abu`|`my_ebu`|`my_ibu`|`my_obu`|`my_ubu`|`my_ybu`|`my_aibu`|`my_eibu`|`my_oibu`|`my_aubu`|
| `xy`|`xy_abu`|`xy_ebu`|`xy_ibu`|`xy_obu`|`xy_ubu`|`xy_ybu`|`xy_aibu`|`xy_eibu`|`xy_oibu`|`xy_aubu`|
| `by`|`by_abu`|`by_ebu`|`by_ibu`|`by_obu`|`by_ubu`|`by_ybu`|`by_aibu`|`by_eibu`|`by_oibu`|`by_aubu`|
| `dy`|`dy_abu`|`dy_ebu`|`dy_ibu`|`dy_obu`|`dy_ubu`|`dy_ybu`|`dy_aibu`|`dy_eibu`|`dy_oibu`|`dy_aubu`|
| `gy`|`gy_abu`|`gy_ebu`|`gy_ibu`|`gy_obu`|`gy_ubu`|`gy_ybu`|`gy_aibu`|`gy_eibu`|`gy_oibu`|`gy_aubu`|
| `vy`|`vy_abu`|`vy_ebu`|`vy_ibu`|`vy_obu`|`vy_ubu`|`vy_ybu`|`vy_aibu`|`vy_eibu`|`vy_oibu`|`vy_aubu`|
| `ry`|`ry_abu`|`ry_ebu`|`ry_ibu`|`ry_obu`|`ry_ubu`|`ry_ybu`|`ry_aibu`|`ry_eibu`|`ry_oibu`|`ry_aubu`|
| `zy`|`zy_abu`|`zy_ebu`|`zy_ibu`|`zy_obu`|`zy_ubu`|`zy_ybu`|`zy_aibu`|`zy_eibu`|`zy_oibu`|`zy_aubu`|
| `jy`|`jy_abu`|`jy_ebu`|`jy_ibu`|`jy_obu`|`jy_ubu`|`jy_ybu`|`jy_aibu`|`jy_eibu`|`jy_oibu`|`jy_aubu`|
| `ny`|`ny_abu`|`ny_ebu`|`ny_ibu`|`ny_obu`|`ny_ubu`|`ny_ybu`|`ny_aibu`|`ny_eibu`|`ny_oibu`|`ny_aubu`|
| `leribu`|`leribu_abu`|`leribu_ebu`|`leribu_ibu`|`leribu_obu`|`leribu_ubu`|`leribu_ybu`|`leribu_aibu`|`leribu_eibu`|`leribu_oibu`|`leribu_aubu`|
| `lerubu`|`lerubu_abu`|`lerubu_ebu`|`lerubu_ibu`|`lerubu_obu`|`lerubu_ubu`|`lerubu_ybu`|`lerubu_aibu`|`lerubu_eibu`|`lerubu_oibu`|`lerubu_aubu`|
|   |  |  |  |  |  |  |  |  |  |  |
|   |  |  |  |  |  |  |  |  |  |  |
| `abu`|`denpa_bu_abu_yhy_abu`|`denpa_bu_abu_yhy_ebu`|`denpa_bu_abu_yhy_ibu`|`denpa_bu_abu_yhy_obu`|`denpa_bu_abu_yhy_ubu`|`denpa_bu_abu_yhy_ybu`|`denpa_bu_abu_yhy_aibu`|`denpa_bu_abu_yhy_eibu`|`denpa_bu_abu_yhy_oibu`|`denpa_bu_abu_yhy_aubu`|
| `ebu`|`denpa_bu_ebu_yhy_abu`|`denpa_bu_ebu_yhy_ebu`|`denpa_bu_ebu_yhy_ibu`|`denpa_bu_ebu_yhy_obu`|`denpa_bu_ebu_yhy_ubu`|`denpa_bu_ebu_yhy_ybu`|`denpa_bu_ebu_yhy_aibu`|`denpa_bu_ebu_yhy_eibu`|`denpa_bu_ebu_yhy_oibu`|`denpa_bu_ebu_yhy_aubu`|
| `ibu`|`denpa_bu_ibu_yhy_abu`|`denpa_bu_ibu_yhy_ebu`|`denpa_bu_ibu_yhy_ibu`|`denpa_bu_ibu_yhy_obu`|`denpa_bu_ibu_yhy_ubu`|`denpa_bu_ibu_yhy_ybu`|`denpa_bu_ibu_yhy_aibu`|`denpa_bu_ibu_yhy_eibu`|`denpa_bu_ibu_yhy_oibu`|`denpa_bu_ibu_yhy_aubu`|
| `obu`|`denpa_bu_obu_yhy_abu`|`denpa_bu_obu_yhy_ebu`|`denpa_bu_obu_yhy_ibu`|`denpa_bu_obu_yhy_obu`|`denpa_bu_obu_yhy_ubu`|`denpa_bu_obu_yhy_ybu`|`denpa_bu_obu_yhy_aibu`|`denpa_bu_obu_yhy_eibu`|`denpa_bu_obu_yhy_oibu`|`denpa_bu_obu_yhy_aubu`|
| `ubu`|`denpa_bu_ubu_yhy_abu`|`denpa_bu_ubu_yhy_ebu`|`denpa_bu_ubu_yhy_ibu`|`denpa_bu_ubu_yhy_obu`|`denpa_bu_ubu_yhy_ubu`|`denpa_bu_ubu_yhy_ybu`|`denpa_bu_ubu_yhy_aibu`|`denpa_bu_ubu_yhy_eibu`|`denpa_bu_ubu_yhy_oibu`|`denpa_bu_ubu_yhy_aubu`|
| `ybu`|`denpa_bu_ybu_yhy_abu`|`denpa_bu_ybu_yhy_ebu`|`denpa_bu_ybu_yhy_ibu`|`denpa_bu_ybu_yhy_obu`|`denpa_bu_ybu_yhy_ubu`|`denpa_bu_ybu_yhy_ybu`|`denpa_bu_ybu_yhy_aibu`|`denpa_bu_ybu_yhy_eibu`|`denpa_bu_ybu_yhy_oibu`|`denpa_bu_ybu_yhy_aubu`|
| `aibu`|`denpa_bu_aibu_yhy_abu`|`denpa_bu_aibu_yhy_ebu`|`denpa_bu_aibu_yhy_ibu`|`denpa_bu_aibu_yhy_obu`|`denpa_bu_aibu_yhy_ubu`|`denpa_bu_aibu_yhy_ybu`|`denpa_bu_aibu_yhy_aibu`|`denpa_bu_aibu_yhy_eibu`|`denpa_bu_aibu_yhy_oibu`|`denpa_bu_aibu_yhy_aubu`|
| `eibu`|`denpa_bu_eibu_yhy_abu`|`denpa_bu_eibu_yhy_ebu`|`denpa_bu_eibu_yhy_ibu`|`denpa_bu_eibu_yhy_obu`|`denpa_bu_eibu_yhy_ubu`|`denpa_bu_eibu_yhy_ybu`|`denpa_bu_eibu_yhy_aibu`|`denpa_bu_eibu_yhy_eibu`|`denpa_bu_eibu_yhy_oibu`|`denpa_bu_eibu_yhy_aubu`|
| `oibu`|`denpa_bu_oibu_yhy_abu`|`denpa_bu_oibu_yhy_ebu`|`denpa_bu_oibu_yhy_ibu`|`denpa_bu_oibu_yhy_obu`|`denpa_bu_oibu_yhy_ubu`|`denpa_bu_oibu_yhy_ybu`|`denpa_bu_oibu_yhy_aibu`|`denpa_bu_oibu_yhy_eibu`|`denpa_bu_oibu_yhy_oibu`|`denpa_bu_oibu_yhy_aubu`|
| `aubu`|`denpa_bu_aubu_yhy_abu`|`denpa_bu_aubu_yhy_ebu`|`denpa_bu_aubu_yhy_ibu`|`denpa_bu_aubu_yhy_obu`|`denpa_bu_aubu_yhy_ubu`|`denpa_bu_aubu_yhy_ybu`|`denpa_bu_aubu_yhy_aibu`|`denpa_bu_aubu_yhy_eibu`|`denpa_bu_aubu_yhy_oibu`|`denpa_bu_aubu_yhy_aubu`|

```
denpa_bu_yhy

sepli_me_abu
sepli_me_ebu
sepli_me_ibu
sepli_me_obu
sepli_me_ubu
sepli_me_ybu
sepli_me_aibu
sepli_me_eibu
sepli_me_oibu
sepli_me_aubu

slaka_bu
bahotongabu
subytongabu
bahorsubytongabu
suhurbahutongabu
bahebu
bahebu_bahebu
bahebu_bahebu_bahebu
tcena_bu
tcena_bu.init
tcena_bu.medi
tcena_bu.fina

```