{ lib
, buildPythonPackage
, fetchPypi
# build inputs
, setuptools
# check inputs
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "lithium-reducer";
  version = "0.6.1";

  src = fetchPypi {
    pname = "lithium-reducer";
    inherit version;
    sha256 = "sha256-Zy1qqRmENdbpcatyqSaL69dE/eLhCf4iYHc9hToVYe4=";
  };

  postPatch = ''
    substituteInPlace setup.py --replace "setup()" "setup(version='${version}')"
  '';

  propagatedBuildInputs = [
    setuptools
  ];
  checkInputs = [
    pytestCheckHook
  ];

  disabledTestPaths = [
    #TODO: import file mismatch
    "src/lithium/interestingness/diff_test.py"
  ];

  meta = with lib; {
    description = "Lithium is an automated testcase reduction tool";
    longDescription = ''
      Lithium is an automated testcase reduction tool developed by Jesse Ruderman.
    '';
    homepage = "https://github.com/MozillaSecurity/lithium";
    license = licenses.mpl20;
    maintainers = [ maintainers.kvark ];
    platforms = platforms.unix;
  };
}
