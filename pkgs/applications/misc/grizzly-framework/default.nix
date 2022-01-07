{ lib
, buildPythonApplication
, fetchPypi
# build inputs
, ffpuppet
, lithium-reducer
, setuptools
# check inputs
, pytestCheckHook
}:

buildPythonApplication rec {
  pname = "grizzly-framework";
  version = "0.14.0";

  src = fetchPypi {
    pname = "grizzly-framework";
    inherit version;
    sha256 = "sha256-0cfBQlEQNE8Jy+fp2SgAvZkHgRoLUY47CzhbECRledA=";
  };

  propagatedBuildInputs = [
    ffpuppet
    lithium-reducer
    setuptools
  ];
  checkInputs = [
    pytestCheckHook
  ];

  meta = with lib; {
    description = "Modular general purpose browser fuzzing framework";
    longDescription = ''
      Grizzly is a modular general purpose browser fuzzing framework.
      The goal is to create a platform that can be extended via the creation of plug-ins
      to support multiple combinations of browsers and fuzzers. An Adapter is used to
      add support for a fuzzer and a Target to add support for a browser.
    '';
    homepage = "https://github.com/MozillaSecurity/grizzly";
    license = licenses.mpl20;
    maintainers = [ maintainers.kvark ];
    platforms = platforms.unix;
  };
}
