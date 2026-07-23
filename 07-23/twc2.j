require 'strings'

websafe =: 0 51 102 153 204 255

round =: {{ '0123456789ABCDEF' {~ 16 16 #: websafe {~ (i. <./) | websafe - ". '16b' , tolower y}}

color =: '#F4B2D1'
hex =: }. color

; (<"1) {{
  '0123456789ABCDEF' {~ 16 16 #: websafe {~ (i. <./) | websafe - ".  '16b' , tolower y
}}&> (<"1) 3 2 $ hex

{{
  ; (<"1) {{
    '0123456789ABCDEF' {~ 16 16 #: websafe {~ (i. <./) | websafe - ".  '16b' , tolower y
  }}&> (<"1) 3 2 $ }. y
}} color

hex
