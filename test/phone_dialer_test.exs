defmodule PhoneDialerTest do
  use ExUnit.Case
  doctest PhoneDialer

  test "returns 8 when V is given" do
    assert PhoneDialer.to_digits("V") == "8"
  end

  test "returns 4 when I is given" do
    assert PhoneDialer.to_digits("I") == "4"
  end

  test "returns 8486 when VIVO is given" do
    assert PhoneDialer.to_digits("VIVO") == "8486"
  end

  test "returns 222 when ABC is given" do
    assert PhoneDialer.to_digits("ABC") == "222"
  end

  test "returns 365668 when DOJOMT is given" do
    assert PhoneDialer.to_digits("DOJOMT") == "365668"
  end

  test "returns 1-4663-79338-4663 when 1-HOME-SWEET-HOME is given" do
    assert PhoneDialer.to_digits("1-HOME-SWEET-HOME") == "1-4663-79338-4663"
  end

  test "returns 878$&@ when 878$&@ is given" do
    assert PhoneDialer.to_digits("878$&@") == "878$&@"
  end

  test "returns 8[]78{ when 8[]78{ is given" do
    assert PhoneDialer.to_digits("8[]78{") == "8[]78{"
  end

  test "returns 46634241 when home4241 is given" do
    assert PhoneDialer.to_digits("home4241") == "46634241"
  end

  test "returns #*3565 when #*35nk is given" do
    assert PhoneDialer.to_digits("#*35nk") == "#*3565"
  end

  test "returns #*35065 when #*35 nk is given" do
    assert PhoneDialer.to_digits("#*35 nk") == "#*35065"
  end

  test "returns empty string when nil is given" do
    assert PhoneDialer.to_digits(nil) == ""
  end
end
