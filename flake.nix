{
  description = "Various WiiQt projects";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ]
          (system: function nixpkgs.legacyPackages.${system});

      version = self.shortRev or self.dirtyShortRev or self.lastModified or "unknown";
    in
    {

      devShells = forAllSystems
        (pkgs: {
          default = pkgs.mkShell {
            packages = [
              pkgs.qt6.qtbase.dev
            ];
            shellHook = ''
            '';
          };
        });

      packages = forAllSystems
        (pkgs: {

          nandBinCheck =
            pkgs.stdenv.mkDerivation
              {
                pname = "nandBinCheck";
                inherit version;
                src = pkgs.lib.cleanSource self;

                sourceRoot = "source/nandBinCheck";

                buildInputs = [ pkgs.qt6.qmake pkgs.qt6.qtbase ];
                nativeBuildInputs = [ pkgs.qt6.wrapQtAppsHook ];

                installPhase = ''
                  mkdir -p "$out/bin"
                  mv "nandBinCheck" "$out/bin"
                '';

                meta = {
                  description = "NAND Checker for Wii";
                  homepage = "https://github.com/martravi/wiiqt6";
                  license = pkgs.lib.licenses.gpl3Only;
                  platforms = pkgs.lib.platforms.darwin ++ pkgs.lib.platforms.linux;
                };
              };


          nandExtract =
            pkgs.stdenv.mkDerivation
              {
                pname = "nandExtract";
                inherit version;
                src = pkgs.lib.cleanSource self;

                sourceRoot = "source/nandExtract";

                buildInputs = [ pkgs.qt6.qmake pkgs.qt6.qtbase ];
                nativeBuildInputs = [ pkgs.qt6.wrapQtAppsHook ];

                installPhase = pkgs.lib.optionalString pkgs.stdenv.isLinux ''
                  mkdir -p "$out/bin"
                  mv "nandExtract" "$out/bin"
                '' + pkgs.lib.optionalString pkgs.stdenv.isDarwin ''
                  mkdir -p $out/Applications
                  cp -R nandExtract.app $out/Applications/
                '';

                meta = {
                  description = "NAND Extractor for Wii";
                  homepage = "https://github.com/martravi/wiiqt6";
                  license = pkgs.lib.licenses.gpl3Only;
                  platforms = pkgs.lib.platforms.darwin ++ pkgs.lib.platforms.linux;
                };
              };

          ohneschwanzenegger =
            pkgs.stdenv.mkDerivation
              {
                pname = "ohneschwanzenegger";
                inherit version;
                src = pkgs.lib.cleanSource self;

                sourceRoot = "source/ohneschwanzenegger";

                buildInputs = [ pkgs.qt6.qmake pkgs.qt6.qtbase ];
                nativeBuildInputs = [ pkgs.qt6.wrapQtAppsHook ];

                installPhase = pkgs.lib.optionalString pkgs.stdenv.isLinux ''
                  mkdir -p "$out/bin"
                  mv "ohneschwanzenegger" "$out/bin"
                '' + pkgs.lib.optionalString pkgs.stdenv.isDarwin ''
                  mkdir -p $out/Applications
                  cp -R ohneschwanzenegger.app $out/Applications/
                '';

                meta = {
                  description = "NUS NAND Builder for Wii";
                  homepage = "https://github.com/martravi/wiiqt6";
                  license = pkgs.lib.licenses.gpl3Only;
                  platforms = pkgs.lib.platforms.darwin ++ pkgs.lib.platforms.linux;
                };
              };

          punetwiin =
            pkgs.stdenv.mkDerivation
              {
                pname = "punetwiin";
                inherit version;
                src = pkgs.lib.cleanSource self;

                sourceRoot = "source/punetwiin";

                buildInputs = [ pkgs.qt6.qmake pkgs.qt6.qtbase ];
                nativeBuildInputs = [ pkgs.qt6.wrapQtAppsHook ];

                installPhase = ''
                  mkdir -p "$out/bin"
                  mv "punetwiin" "$out/bin"
                '';

                meta = {
                  description = "Converts BootMii NAND backups for Wii";
                  homepage = "https://github.com/martravi/wiiqt6";
                  license = pkgs.lib.licenses.gpl3Only;
                  platforms = pkgs.lib.platforms.darwin ++ pkgs.lib.platforms.linux;
                };
              };


        });

    };
}
