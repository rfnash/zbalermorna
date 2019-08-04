#
# For help with the feature file format/syntax, check out this page:
# https://adobe-type-tools.github.io/afdko/OpenTypeFeatureFileSpecification.html
#

#
# Setup
#

# Generic helpers

log      = console.log.bind console
join     = (.join '')
spaces   = (.join ' ')
debug    = -> &0 = "---- " + &0; log ...
map      = (λ, xs) --> [ λ x for x in xs ]
filter   = (λ, xs) --> [ x for x in xs when λ x ]
contains = (xs, needle) -> (xs.index-of needle) > -1


# ZLM DSL

glyph = (g) ->
  if SEMIV `contains` g
    \ZLM_SEMIVOWEL_ + g
  else if CONSN `contains` g
    \ZLM_ + g
  else if ALL_VOWELS `contains` g
    \ZLM_DIACRITIC_ + g
  else
    \ZLM_ + g

dot  = (g) -> \ZLM_DOT_ + g
cas  = (before, after) -> \ZLM_CAS_ + join before ++ \H ++ after
list = spaces << map glyph
to-v = (q) -> if q is \Q then \I else if q is \W then \U else \UNKNOWN


# Features DSL

def-class = (name, members) ->
  if typeof members is \string
    log "@#name = [ #members ];"
  else
    log "@#name = [ #{ list members } ];"

comment     = (text) -> log "\n# #text\n"
big-comment = (text) -> log "\n\n#\n# #text\n#\n"
description = (title, λ) -> big-comment title; λ!
section     = (name, λ) -> big-comment name; λ!
feature     = (name, λ) -> comment name; log "feature rlig {"; λ!; log "} rlig;"
feature-custom     = (name, f, λ) -> comment name; log "feature #f {"; λ!; log "} #f;"
sub         = (...parts, lig) -> log "  sub #{ map glyph, parts |> spaces } by #lig;"
sub-tick    = (...parts, lig) -> log "  sub #{ map glyph, parts |> map (+ \') |> spaces } by #lig;"
ignore      = (ctx, ...gs) -> log "  ignore sub #ctx #{ map (+ \'), gs |> spaces  };"
name        = (name) -> log "  featureNames {\n    name \"#name\";\n  };"


# Data

SEMIV  = <[ Q W ]>
CONSN  = <[ P T K F L S C M X B D G V R Z J N H ]>
VOWELS = <[ A E I O U Y ]>
DIPHTH = <[ AI EI OI AU ]>

ALL_CONSN  = CONSN ++ SEMIV
ALL_VOWELS = VOWELS ++ DIPHTH

log "# This file is generated automatically by tools/zlm.feature.ls"
log "# Run 'lsc tools/zlm.feature.ls > src/zlm.fea' to update it"

description "ZLM OpenType Feature Table Definitions", ->

  def-class \consonant, ALL_CONSN
  def-class \vowel,     ALL_VOWELS
  def-class \anything, "@consonant @vowel"

  log "languagesystem DFLT dflt;
languagesystem latn dflt;
languagesystem latn DEU;
languagesystem cyrl dflt;
languagesystem cyrl SRB;
languagesystem grek dflt;"

  section "Latin Mapping", ->
    feature-custom "C", "ss10", ->
      for c in CONSN
        log "  sub #c by ZLM_#c;"
        log "  sub #{ c.toLowerCase() } by ZLM_#c;"
      log "  sub period by ZLM_NULL;"
      log "  sub quotesingle by ZLM_H;"
      for v in VOWELS
        log "  sub #v by ZLM_FULL_#v;"
        log "  sub #{ v.toLowerCase() } by ZLM_DIACRITIC_#v;"
      log "  sub w by ZLM_SEMIVOWEL_W;"
      log "  sub W by ZLM_SEMIVOWEL_W;"
      log "  sub q by ZLM_SEMIVOWEL_Q;"
      log "  sub Q by ZLM_SEMIVOWEL_Q;"
    feature-custom "Numbers", "ss11", ->
      log "  sub zero by ZLM_NO;"
      log "  sub one by ZLM_PA;"
      log "  sub two by ZLM_RE;"
      log "  sub three by ZLM_CI;"
      log "  sub four by ZLM_VO;"
      log "  sub five by ZLM_MU;"
      log "  sub six by ZLM_XA;"
      log "  sub seven by ZLM_ZE;"
      log "  sub eight by ZLM_BI;"
      log "  sub nine by ZLM_SO;"
    feature-custom "Split diphthongs", "ss10" ->

  section "Full Vowel Support", ->
    feature "VV" ->
      log "  sub ZLM_FULL_A ZLM_FULL_I by ZLM_FULL_AI;"
      log "  sub ZLM_FULL_O ZLM_FULL_I by ZLM_FULL_OI;"
      log "  sub ZLM_FULL_E ZLM_FULL_I by ZLM_FULL_EI;"
      log "  sub ZLM_FULL_A ZLM_FULL_U by ZLM_FULL_AU;"
    feature ",VV" ->
      log "  sub ZLM_SLAKABU ZLM_FULL_AI by ZLM_FULL_AI;"
      log "  sub ZLM_SLAKABU ZLM_FULL_OI by ZLM_FULL_OI;"
      log "  sub ZLM_SLAKABU ZLM_FULL_EI by ZLM_FULL_EI;"
      log "  sub ZLM_SLAKABU ZLM_FULL_AU by ZLM_FULL_AU;"
    feature ",V" ->
      for v in VOWELS
        log "  sub ZLM_SLAKABU ZLM_FULL_#v by ZLM_FULL_#v;"

  section "6-part ligatures", ->
    feature \NVV'VV, ->
      for [ a, b ] in DIPHTH
        for [ c, d ] in DIPHTH
          sub \NULL, a, b, \H, c, d, cas [ a, b ], [ c, d ]
  section "5-part ligatures", ->
    feature \VV'VV, ->
      ignore \@consonant \@vowel \@vowel \ZLM_H \@vowel \@vowel
      for [ a, b ] in DIPHTH
        for [ c, d ] in DIPHTH
          sub-tick a, b, \H, c, d, cas [ a, b ], [ c, d ]
    feature \NVV'V, ->
      for [ a, b ] in DIPHTH
        for c in VOWELS
          sub \NULL, a, b, \H, c, cas [ a, b ], [ c ]
    feature \NV'VV, ->
      for a in VOWELS
        for [ c, d ] in DIPHTH
          sub \NULL, a, \H, c, d, cas [ a ], [ c, d ]

  section "4-part ligatures", ->
    feature \VV'V, ->
      ignore \@consonant \@vowel \@vowel \ZLM_H \@vowel
      for [ a, b ] in DIPHTH
        for v in VOWELS
          sub-tick a, b, \H, v, cas [ a, b ], [ v ]
    feature \NV'V, ->
      for a in VOWELS
        for b in VOWELS
          sub-tick \NULL, a, \H, b, cas [ a ], [ b ]
    feature \V'VV, ->
      ignore \@consonant \@vowel \ZLM_H \@vowel \@vowel
      for v in VOWELS
        for [ a, b ] in DIPHTH
          sub-tick v, \H, a, b, cas [ v ], [ a, b ]

  section "3-part ligatures", ->
    feature \V'V, ->
      ignore \@consonant \@vowel \ZLM_H \@vowel
      for a in VOWELS
        for b in VOWELS
          sub-tick a, \H, b, cas [ a ], [ b ]
    feature \QVV, ->
      ignore \@consonant \@vowel \@vowel \@vowel
      for q in SEMIV
        for [ a, b ] in DIPHTH
          sub-tick q, a, b, glyph q + a + b
    feature \WVV, ->
      ignore \@consonant \@vowel \@vowel \@vowel
      for q in SEMIV
        for [ a, b ] in DIPHTH
          sub-tick (to-v q), a, b, glyph q + a + b
    feature \CVV, ->
      log "  ignore sub @consonant' @vowel' @vowel' @vowel;"
      for c in CONSN
        for [ a, b ] in DIPHTH
          sub-tick c, a, b, glyph c + a + b

  section "2-part ligatures", ->
    feature \QV, ->
      for q in SEMIV
        for v in VOWELS
          sub q, v, glyph q + v
    feature \WV, ->
      for q in SEMIV
        for v in VOWELS
          sub (to-v q), v, glyph q + v
    feature \CV, ->
      for c in CONSN
        for v in VOWELS
          sub c, v, glyph c + v
    feature \VV, ->
      for [ a, b ] in DIPHTH
        sub a, b, glyph a + b
    feature "\NV", ->
      ignore \@anything \@vowel
      for v in ALL_VOWELS
        sub-tick \NULL, v, dot v

  section "symbols", ->
    feature "bahebu", ->
      sub \BAHEBU_1, \BAHEBU_1, \BAHEBU_1, \ZLM_BAHEBU_3
      sub \BAHEBU_1, \BAHEBU_1, \ZLM_BAHEBU_2
    feature "smajibu initial", ->
      log "  ignore sub ZLM_DASH_MEDI ZLM_DASH_MEDI';"
      log "  ignore sub ZLM_DASH_INIT ZLM_DASH_MEDI';"
      log "  sub ZLM_DASH_MEDI' ZLM_DASH_MEDI by ZLM_DASH_INIT;"
      log "  sub ZLM_DASH_MEDI' ZLM_DASH_FINAL by ZLM_DASH_INIT;"
    feature "smajibu final", ->
      log "  ignore sub ZLM_DASH_MEDI' ZLM_DASH_MEDI;"
      log "  ignore sub ZLM_DASH_MEDI' ZLM_DASH_FINAL;"
      log "  sub ZLM_DASH_MEDI ZLM_DASH_MEDI' by ZLM_DASH_FINAL;"
      log "  sub ZLM_DASH_INIT ZLM_DASH_MEDI' by ZLM_DASH_FINAL;"
    feature "smajibu iso", ->
      log "  ignore sub ZLM_DASH_MEDI ZLM_DASH_MEDI' ZLM_DASH_MEDI;"
      log "  ignore sub ZLM_DASH_INIT ZLM_DASH_MEDI' ZLM_DASH_MEDI;"
      log "  ignore sub ZLM_DASH_MEDI ZLM_DASH_MEDI' ZLM_DASH_FINAL;"
      log "  ignore sub ZLM_DASH_INIT ZLM_DASH_MEDI' ZLM_DASH_FINAL;"
      log "  ignore sub ZLM_DASH_MEDI' ZLM_DASH_MEDI;"
      log "  ignore sub ZLM_DASH_MEDI ZLM_DASH_MEDI';"
      log "  ignore sub ZLM_DASH_MEDI' ZLM_DASH_FINAL;"
      log "  ignore sub ZLM_DASH_INIT ZLM_DASH_MEDI';"
      log "  sub ZLM_DASH_MEDI' by ZLM_DASH_ISO;"

# I'm not sure this is needed in any jbo text
#
#  section "Single Substitutions", ->
#    feature ".V", ->
#      ignore \@anything \@vowel
#      for v in ALL_VOWELS
#        sub-tick v, dot v
