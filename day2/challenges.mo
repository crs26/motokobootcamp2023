import Text "mo:base/Text";
import Char "mo:base/Char";
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";

actor {
  public query func average_array(array : [Int]) : async Int {
    var sum : Int = 0;
    for (item in array.vals()) {
      sum += item;
    };
    return sum / array.size();
  };

  public query func count_character(t : Text, c : Char) : async Nat {
    var charCount : Nat = 0;
    for (s in t.chars()) {
      if (s == c) { charCount += 1 };
    };
    return charCount;
  };

  public query func factorial(n : Nat) : async Nat {
    var sum : Nat = 0;
    var input : Nat = n;
    while (input > 0) {
      sum += input;
      input -= 1;
    };
    return sum;
  };

  public query func number_of_words(t : Text) : async Nat {
    type Pattern = Text.Pattern;
    let pattern : Pattern = #char(' ');
    var i = Text.split(t, pattern);
    var wordCount : Nat = 0;
    for (word in i) {
      wordCount += 1;
    };
    return wordCount;
  };

  public query func find_duplicates(a : [Nat]) : async [Nat] {
    var buff = Buffer.Buffer<Nat>(1);
    for (i in Iter.range(0, a.size() -1)) {
      for (j in Iter.range(i + 1, a.size() - 1)) {
        if (a[i] == a[j] and not Buffer.contains(buff, a[i], Nat.equal)) {
          buff.add(a[j]);
        };
      };
    };
    return Buffer.toArray(buff);
  };

  public query func convert_to_binary(n : Nat) : async Text {
    if (n == 0) return "0";
    var binText : Text = "";
    var decimal = n;
    while (decimal > 0) {
      var bit = decimal % 2;
      binText := Nat.toText(bit) # binText;
      decimal /= 2;
    };
    return binText;
  };
};
