import Array "mo:base/Array";
import Int "mo:base/Int";
import Buffer "mo:base/Buffer";

actor utils {

  public query func second_maximum(array : [Int]) : async Int {
    var secondLargest : Int = Array.reverse(Array.sort(array, Int.compare))[1];
    return secondLargest;
  };

  public query func remove_event(array : [Nat]) : async [Nat] {
    var evenArr = Array.filter<Nat>(array, func x = x % 2 != 0);
    return evenArr;
  };

  var drop = func<T>(xs : [T], n : Nat) : [T] {
    if (n >= xs.size()) {
      return [];
    };

    var buffer = Buffer.fromArray<T>(xs : [T]);
    var subBuffer = Buffer.subBuffer<T>(buffer, n, buffer.size() -n);
    return Buffer.toArray(subBuffer);
  };

  public query func dropNofArr(array : [Int], num : Nat) : async [Int] {
    return drop<Int>(array, num);
  };

};
