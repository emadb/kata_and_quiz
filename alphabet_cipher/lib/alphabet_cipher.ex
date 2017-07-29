defmodule AlphabetCipher do
  def alphabet do
    'abcdefghijklmnopqrstuvwxyz'
  end

  defp find_char c do
    AlphabetCipher.alphabet |> (Enum.find_index fn(x) -> c == [x] end)
  end

  def encode_char {k, m} do   
    k_index = find_char [k]
    m_index = find_char [m]
    Enum.at(AlphabetCipher.alphabet, rem((k_index + m_index), 26))
  end

  def decode_char {k, m} do   
    k_index = find_char [k]
    m_index = find_char [m]
    Enum.at(AlphabetCipher.alphabet, rem((m_index - k_index), 26))
  end

  def pad_right str, length do
    String.duplicate(str, length) |> (String.slice 0, length)
  end

  def encode key, msg do  
    padded_key = pad_right(key, String.length(msg))
    key_chars = to_charlist padded_key
    msg_chars = to_charlist msg
    
    Enum.zip(key_chars, msg_chars) 
      |> (Enum.map fn(t) -> encode_char(t) end)
      |> to_string
  end

  def decode key, msg do  
    padded_key = pad_right(key, String.length(msg))
    key_chars = to_charlist padded_key
    msg_chars = to_charlist msg
    
    Enum.zip(key_chars, msg_chars) 
      |> (Enum.map fn(t) -> decode_char(t) end)
      |> to_string
  end

# let encode (key:Keyword) (message:Message) : Message =
#     "encodeme"

# let decode (key:Keyword) (message:Message) : Message =
#     "decodeme"

# let decipher (cipher:Message) (message:Message) : Keyword =
#     "decypherme"

end
