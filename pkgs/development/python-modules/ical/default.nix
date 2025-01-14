{ lib
, python-dateutil
, buildPythonPackage
, emoji
, fetchFromGitHub
, freezegun
, tzdata
, py
, pyparsing
, pydantic
, pytest-asyncio
, pytest-benchmark
, pytest-golden
, pytestCheckHook
, pythonOlder
, pyyaml
}:

buildPythonPackage rec {
  pname = "ical";
  version = "4.5.3";
  format = "setuptools";

  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "allenporter";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-CHo6khJ8Bqej/OdQBtcfa/luO1Gj8cu7h//MwPhWrMU=";
  };

  propagatedBuildInputs = [
    emoji
    python-dateutil
    tzdata
    pydantic
    pyparsing
  ];

  nativeCheckInputs = [
    freezegun
    py
    pytest-asyncio
    pytest-benchmark
    pytest-golden
    pytestCheckHook
    pyyaml
  ];

  pythonImportsCheck = [
    "ical"
  ];

  meta = with lib; {
    description = "Library for handling iCalendar";
    homepage = "https://github.com/allenporter/ical";
    changelog = "https://github.com/allenporter/ical/releases/tag/${version}";
    license = licenses.asl20;
    maintainers = with maintainers; [ dotlambda ];
  };
}
