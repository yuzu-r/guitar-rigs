class Gallery extends React.Component {
  render() {
    const elements = [{src: 'http://i.imgur.com/YdkGBmC.png'}, {src: 'http://i.imgur.com/YdkGBmC.png'}]

    const childElements = elements.map((element, index) => {
      return (
        <li key={index}>
          <img src={element.src} />
        </li>
      );
    });

    return (
      <Masonry>
        {childElements}
      </Masonry>
    );
  }
}