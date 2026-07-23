require 'strings'

{{
  websafe=:0 51 102 153 204 255
  values=:'00';'33';'66';'99';'CC';'FF'
  ;values{~websafe i.{{
    websafe{~(i.<./)|websafe-".'16b',tolower y
  }}&>(<"1)3 2$}.y
}}'#F4B2D1'
