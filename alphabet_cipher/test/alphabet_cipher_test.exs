

defmodule AlphabetCipherTest do
  use ExUnit.Case
  
  doctest AlphabetCipher

  test "the truth" do
    assert 1 + 1 == 2
  end

  # test "encode char" do
  #   result =  AlphabetCipher.encode_char {'v', 'm'}
  #   assert [result] == 'h'
  # end

  test "pad_right" do
    result = AlphabetCipher.pad_right "ciao", 10
    assert result == "ciaociaoci"
  end

  test "encode 1" do
    result =  AlphabetCipher.encode("vigilance", "meetmeontuesdayeveningatseven")
    assert result == "hmkbxebpxpmyllyrxiiqtoltfgzzv" 
  end

  test "encode 2" do
    result =  AlphabetCipher.encode("scones", "meetmebythetree")
    assert result == "egsgqwtahuiljgs" 
  end


  test "decode 1" do
    result =  AlphabetCipher.decode("vigilance", "hmkbxebpxpmyllyrxiiqtoltfgzzv")
    assert result == "meetmeontuesdayeveningatseven"
  end

  test "decode 2" do
    result =  AlphabetCipher.decode("scones", "egsgqwtahuiljgs")
    assert result == "meetmebythetree"
  end

  test "decipher" do
    # "opkyfipmfmwcvqoklyhxywgeecpvhelzg" "thequickbrownfoxjumpsoveralazydog" = "vigilance"
    # "hcqxqqtqljmlzhwiivgbsapaiwcenmyu" "packmyboxwithfivedozenliquorjugs" = "scones"
  end


end
