$(function() {
  return $('#masonry-container').imagesLoaded(function() {
    console.log('rendering');
//    $('img').each(function(){
//      $(this).attr('onerror', 'this.src="http://www.placehold.it/200x200"');
//    })
    return $('#masonry-container').masonry({
      itemSelector: '.box',
      isFitWidth: true
    });
  });
});

