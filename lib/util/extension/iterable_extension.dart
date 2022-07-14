extension Subscript<T> on Iterable<T> {
  T operator [](int index) => length > index
      ? elementAt(index)
      : throw RangeError.index(index, this, "index", null, index);
}
