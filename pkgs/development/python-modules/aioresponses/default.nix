{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, pbr
, aiohttp
, ddt
, asynctest
, pytest
}:

buildPythonPackage rec {
  pname = "aioresponses";
  version = "0.7.2";
  disabled = pythonOlder "3.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-guSV0Ri3SJaqW01H4X7/teLMeD5RCuOVzq3l6Hyr6Jo=";
  };

  nativeBuildInputs = [
    pbr
  ];

  propagatedBuildInputs = [
    aiohttp
  ];

  checkInputs = [
    asynctest
    ddt
    pytest
  ];

  # Skip a test which makes requests to httpbin.org
  checkPhase = ''
    pytest -k "not (test_address_as_instance_of_url_combined_with_pass_through or test_pass_through_with_origin_params)"
  '';

  meta = {
    description = "A helper to mock/fake web requests in python aiohttp package";
    homepage = "https://github.com/pnuckowski/aioresponses";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ rvl ];
  };
}
