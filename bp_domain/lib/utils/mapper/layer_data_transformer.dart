/**
 * A data transformer interface which is used to enable entity transformation between layers.
 * transform() function can be used to convert data type <F> to <T>
 * restore() function can be used convert <T> back to <F>
 */
mixin LayerDataTransformer<F, T> {
  T transform();

  List<T> transformList({List<F> from});

  F restore(T data);

  List<F> restoreList({List<T> from});
}
