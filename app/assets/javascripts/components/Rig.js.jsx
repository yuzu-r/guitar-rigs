class Rig extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoading: true,
      loadingMsg: 'fetching your rig'
    }
  }
  componentDidMount() {
    // put masonry stuff??
    this.setState({isLoading: false, loadingMsg: ''})
  }
  render(){
    //var axes = this.props.axes;
    //console.table(axes);
    var elAxes = this.props.axes.map((a, index) => {
      return (<Axe axe={a} />)
    });
    if (this.state.isLoading) {
      return <p>{this.state.loadingMsg}</p>
    }
    else {
      return <div>{elAxes}</div>
    }
  }
} 