{ stdenv, fontforge, xclip }:

let mkDrv = font: stdenv.mkDerivation {
      inherit (font) name;
      src = ./.;
      buildInputs = [ fontforge ];
      installPhase = ''
        mkdir -p $out/share/fonts/zbalermorna
        ./build.sh ${font.name}
        cp fonts/${font.name}.otf $out/share/fonts/zbalermorna
      '';

      meta = with stdenv.lib; {
        inherit (font) version license;
        description = "A font for the Zbalermorna writing system of the language Lojban";
        homepage = https://github.com/jackhumbert/zbalermorna;
        platforms = platforms.all;
      };
    };

    fonts = with stdenv.lib.licenses;
      __mapAttrs (name: attrs: mkDrv ({ name = name; } // attrs)) {
        # I extracted versions with: grep -oE '^Version: .*$' src/*.sfd
        balvi-regular        = {
          version = "1.001";
          license = ofl;
        };
        crisa-light          = {
          version = "2.015";
          license = ofl;
        };
        crisa-regular        = {
          version = "0.1";
          license = ofl;
        };
        dunda-regular        = {
          version = "1.10";
          license = unfree;
        };
        fira-code-zlm        = {
          version = "1.208";
          license = ofl;
        };
        lavi-zlm             = {
          version = "2.0";
          license = gpl3;
        };
        lobster-zlm          = {
          version = "001.001";
          license = unfree;
        };
        nerfopi-regular      = {
          version = "001.001";
          license = unfree;
        };
        piper-karot          = {
          version = "1.1";
          license = ofl;
        };
        primihi-regular      = {
          version = "2008.02.06";
          license = publicDomain;
        };
        ritli-regular        = {
          version = "0.1";
          license = gpl3;
        };
        tanbo-regular        = {
          version = "2.000";
          license = asl20;
        };
        tisna-bold           = {
          version = "0.1";
          license = asl20;
        };
        tnr-zlm              = {
          version = "001.000";
          license = unfree;
        };
        unicode-drakono      = {
          version = "001.000";
          license = unfree;
        };
        unicode-manri        = {
          version = "001.000";
          license = unfree;
        };
        unifont              = {
          version = "12.1.02";
          license = gpl2;
        };
        vrude-italic-regular = {
          version = "1.200";
          license = ofl;
        };
        vrude-regular        = {
          version = "1.200";
          license = ofl;
        };
        zlm-manri            = {
          version = "001.000";
          license = unfree;
        };
        zlm-template         = {
          version = "0.1";
          license = ofl;
        };
        zlm-tnr              = {
          version = "001.000";
          license = unfree;
        };
      };

    zlm = stdenv.mkDerivation {
      name = "zlm";
      src = ./.;
      buildInputs = [ xclip ];
      installPhase = ''
        mkdir -p $out/bin/ime
        sed -i 's;xclip;${xclip}/bin/xclip;' ./zlm.sh
        cp ./zlm.sh $out/bin/zlm
        cp ime/ime.sh $out/bin/ime/ime.sh
      '';

      meta = with stdenv.lib; {
        version = "0.1.0";
        description = "Translate latin text into Zbalermorna";
        homepage = https://github.com/lboklin/zbalermorna;
        platforms = platforms.all;
        license = licenses.agpl3;
      };
    };
 in { zlm = zlm; } // fonts
