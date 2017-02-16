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

$(function() {
  return $('#masonry-container-rig').imagesLoaded(function() {
    console.log('rendering rig');
    return $('#masonry-container-rig').masonry({
      itemSelector: '.box',
      isFitWidth: true
    });
  });
});
