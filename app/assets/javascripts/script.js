// $(document).ready(function() {
//   var randomFood =
//   ['Pizza', 'Pad thai', 'Tacos', 'Pasta', 'Burger', 'Steak', 'Pho', 'Salad',
//   'Chicken Tikka Masala', 'Scone', 'Lobster', 'Sandwich', 'Grilled Cheese'];
//   var counter = 0
//   $('#yellperID').append('<p id="randomFoodTag" class="col-md-2"></p>');
//
//   function showRandomFood() {
//     $('.navbar-header').on('click', '#yelperLink', function(e) {
//       e.preventDefault();
//       counter++
//       var randomNum = Math.floor(Math.random() * randomFood.length);
//       $('#randomFoodTag').text('What about ' + randomFood[randomNum] + '?');
//       if (counter === 5) {
//         $('#randomFoodTag').hide();
//       };
//     })
//     counter = 0;
//   }
//   showRandomFood();
//
// })
