import React            from "react"
import MUI              from "material-ui"
import AbstractPage     from "./abstract-page"
import MiniChart        from "../chart/mini-chart-view"

export default class HomePage extends AbstractPage {

  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <div>
        <MiniChart
          model={this.model().miniChart}
          size={{w:600, h:500}}/>
      </div>
    );
  }

  model() {
    return this.context.application.homePageModel;
  }
}
HomePage.contextTypes = {
  application: React.PropTypes.object.isRequired,
  router: React.PropTypes.func
};
