from pathlib import Path

from tools.scripts.validate_workspace import validate


def test_workspace_structure_is_valid():
    assert validate(Path(".")) == []
