{ lib
, stdenv
, fetchFromGitHub
, cmake
}:

stdenv.mkDerivation rec {
  pname = "vtm";
  version = "0.9.9k";

  src = fetchFromGitHub {
    owner = "netxs-group";
    repo = "vtm";
    rev = "v${version}";
    sha256 = "sha256-vmgjonMjhVEfsujWUuX+50NPAzgIfJADp8qjnDmfV1E=";
  };

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [ "../src" ];

  meta = with lib; {
    description = "Terminal multiplexer with window manager and session sharing";
    homepage = "https://vtm.netxs.online/";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ ahuzik ];
  };
}
