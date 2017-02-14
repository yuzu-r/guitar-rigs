class Axe extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div className='axe'>
        <img className='axe' src={this.props.axe.url} alt='guitar pic' />
        <p>Likes: {this.props.axe.like_count}</p>
      </div>
    )
  }
}