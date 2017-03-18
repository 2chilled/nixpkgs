{ stdenv, lib, fetchzip }:

stdenv.mkDerivation (rec {
  name = "glassfish-${version}";
  version = "4.1.1";

  src = fetchzip {
    url = "http://download.java.net/glassfish/4.1.1/release/${name}.zip";
    sha256 = "0iqs7ji1dwm492dfl7v5mcwk5a72fax6s49m6vfmysbs0wma5r6v";
  };

  #outputs = [ "out" "webapps" ];
  installPhase = ''
    mkdir $out
    mv * $out
  '';

  meta = {
    homepage = https://glassfish.java.net/;
    description = "TODO";
    platforms = with lib.platforms; all;
    maintainers = with lib.maintainers; [ mahe ];
    license = [ lib.licenses.cddl ];
  };
})

