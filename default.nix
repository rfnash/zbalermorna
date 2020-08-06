{ stdenv, fontforge, xclip, ibus-engines }:

let
    zlmi = stdenv.mkDerivation {
      name = "zlmi";
      src = ./.;
      installPhase = ''
        mkdir -p $out/bin
        cp ime/ime.sh $out/bin/zlmi
      '';

      meta = with stdenv.lib; {
        version = "0.1.0";
        description = "Interactively translate latin text into Zbalermorna";
        homepage = https://github.com/lboklin/zbalermorna;
        platforms = platforms.linux;
        license = licenses.publicDomain;
      };
    };
    zlm = stdenv.mkDerivation {
      name = "zlm";
      src = ./.;
      buildInputs = [ zlmi xclip ];
    
      installPhase = ''
        mkdir -p $out/bin

        ln -s ${zlmi}/bin/zlmi $out/bin/zlmi

        cat << EOF > $out/bin/zlm
        #!/usr/bin/env bash
        OUT=\$(${zlmi}/bin/zlmi <(echo \$@))
        echo -n \$OUT | ${xclip}/bin/xclip -selection clipboard
        echo \$OUT
        EOF

        chmod +x $out/bin/zlm
      '';

      meta = with stdenv.lib; {
        version = "0.1.0";
        description = "Translate latin text into Zbalermorna from stdin";
        homepage = https://github.com/lboklin/zbalermorna;
        platforms = platforms.linux;
        license = licenses.agpl3;
      };
    };

    fonts =
      let mkDrv = { name, version, license }: stdenv.mkDerivation {
            inherit name;
            src = ./.;
            buildInputs = [ fontforge ];
            installPhase = ''
              mkdir -p $out/share/fonts/zbalermorna
              ./build.sh ${name}
              cp fonts/${name}.otf $out/share/fonts/zbalermorna
            '';

            meta = with stdenv.lib; {
              inherit version license;
              description = "A font for the Zbalermorna writing system of the language Lojban";
              homepage = https://github.com/jackhumbert/zbalermorna;
              platforms = platforms.linux;
            };
          };

       in builtins.mapAttrs
          (name: attrs: mkDrv ({ inherit name; inherit (attrs) version license; }))
          (import ./fonts.nix { inherit (stdenv.lib) licenses fontforge; });

    ibus-table = with ibus-engines; stdenv.mkDerivation {
      name = "table-zbalermorna";
      src = ./.;
      buildInputs = [ table ];
      buildPhase = ''
        export HOME=$TMP
        ${table}/bin/ibus-table-createdb -n zlm.db -s ime/zlm.ibus
      '';
      installPhase = ''
        TABLE_LOCATION=$out/share/ibus-table/tables
        mkdir -p $TABLE_LOCATION
        cp zlm.db $TABLE_LOCATION/zlm.db
      '';

     meta = with stdenv.lib; {
       isIbusEngine = true;
       version = "0.1.0";
       description = "Basic input method for Zbalermorna text";
       homepage = https://github.com/lboklin/zbalermorna;
       platforms = platforms.linux;
       license = licenses.lgpl3;
      };
    };

    

 in {
      inherit zlm ibus-table;
    } // fonts
