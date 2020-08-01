{ stdenv, fontforge }:

let mkDrv = name: version: stdenv.mkDerivation {
      name = name;
      src = ./.;
      buildInputs = [ fontforge ];
      installPhase = ''
        mkdir -p $out/share/fonts/zbalermorna
        ./build.sh ${name}
        cp fonts/${name}.otf $out/share/fonts/zbalermorna
      '';

      meta = with stdenv.lib; {
        inherit version;
        description = "A font for the Zbalermorna writing system of the language Lojban";
        homepage = https://github.com/jackhumbert/zbalermorna;
        license = with licenses; [ ofl ];
        platforms = platforms.all;
      };
    };
 in __mapAttrs (name: attrs: mkDrv name (__getAttr attrs name)) {
      # I just got these with: grep -oE '^Version: .*$' src/*.sfd
      balvi-regular        = { version = "1.001"; };
      crisa-light          = { version = "2.015"; };
      crisa-regular        = { version = "0.1"; };
      dunda-regular        = { version = "1.10"; };
      fira-code-zlm        = { version = "1.208"; };
      lavi-zlm             = { version = "2.0"; };
      lobster-zlm          = { version = "001.001"; };
      nerfopi-regular      = { version = "001.001"; };
      piper-karot          = { version = "1.1"; };
      primihi-regular      = { version = "2008.02.06"; };
      ritli-regular        = { version = "0.1"; };
      tanbo-regular        = { version = "2.000"; };
      tisna-bold           = { version = "0.1"; };
      tnr-zlm              = { version = "001.000"; };
      unicode-drakono      = { version = "001.000"; };
      unicode-manri        = { version = "001.000"; };
      unifont              = { version = "12.1.02"; };
      vrude-italic-regular = { version = "1.200"; };
      vrude-regular        = { version = "1.200"; };
      zlm-manri            = { version = "001.000"; };
      zlm-template         = { version = "0.1"; };
      zlm-tnr              = { version = "001.000"; };
    }
