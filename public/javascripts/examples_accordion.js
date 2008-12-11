window.addEvent('domready', function() {
  //create our Accordion instance
  var examplesAccordion = new Accordion($('left_menu'), 'div.header', 'div.elements', {
    opacity: false,
    onActive: function(toggler, element){
    //      toggler.setStyle('color', '#41464D');
    },
    onBackground: function(toggler, element){
    //      toggler.setStyle('color', '#528CE0');
    }
  });
});