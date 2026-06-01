HTMLWidgets.widget({
  name: "facets",
  type: "output",
  factory: function(el, width, height) {
    var model;
    return {
      renderValue: function(x) {
        paper.setup(el);
        model = draw_facets(x);
        model.position = paper.view.center;
      },
      model: model
    }
  }
});
