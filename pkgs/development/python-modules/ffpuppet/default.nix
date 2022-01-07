{ lib
, buildPythonPackage
, fetchPypi
# build inputs
, psutil
, setuptools
, xvfbwrapper
# check inputs
, pytest-mock
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "ffpuppet";
  version = "0.8.7";

  src = fetchPypi {
    pname = "ffpuppet";
    inherit version;
    sha256 = "sha256-Zgj9ix4TlIvc4C2IpuCPOaAwhdYsdYFToBdGqICtFZw=";
  };

  postPatch = ''
    substituteInPlace setup.py --replace "setup()" "setup(version='${version}')"
  '';

  propagatedBuildInputs = [
    psutil
    setuptools
    xvfbwrapper
  ];
  checkInputs = [
    pytest-mock
    pytestCheckHook
  ];

  pythonImportsCheck = [ "ffpuppet" ];

  meta = with lib; {
    description = "Firefox automated testing tool";
    longDescription = ''
      FFPuppet is a Python module that automates browser process
      related tasks to aid in fuzzing. Happy bug hunting!
    '';
    homepage = "https://github.com/MozillaSecurity/ffpuppet";
    license = licenses.mpl20;
    maintainers = [ maintainers.kvark ];
    platforms = platforms.unix;
  };
}
