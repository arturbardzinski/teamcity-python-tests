import pytest
import allure

@allure.feature("Math")
def test_addition():
    assert 1 + 1 == 2

@allure.feature("String")
def test_uppercase():
    assert "abc".upper() == "ABC"