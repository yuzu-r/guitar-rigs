$(function() {
  return $('#masonry-container').imagesLoaded(function() {
    return $('#masonry-container').masonry({
      itemSelector: '.box',
      isFitWidth: true
    });
  });
});
