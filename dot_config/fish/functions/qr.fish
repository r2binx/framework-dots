function _genqr -a text
  printf "QR: '$text'\n"
  qrencode -m 2 -t utf8 "$text"
end

function qr --description 'Generate qrcode for each argument or paste from clipboard without'
  if test (count $argv) -eq 1
    _genqr "$argv[1]"
  else if test (count $argv) -gt 1
    for s in $argv
      _genqr "$s"
      printf "\n"
    end
  else
    _genqr "$(wl-paste)"
  end
end
