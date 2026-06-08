HTMLWidgets.widget({
  name: "net",
  type: "output",
  factory: function(el, width, height) {
    var el;
    var project;
    var model;
    return {
      renderValue: function(x) {
        if (project) project.clear();
        project = paper.setup(el);
        model = draw_net(x);
        model.position = paper.view.center;
      },
      resize: function(width, height) {
        if (project) {
          paper.view = new paper.Size(width, height);
          project.getItems()[0].position = paper.view.center;
        }
      },
      el: el,
      project: project,
      model: model
    }
  }
});
