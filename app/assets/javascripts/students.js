$(document).ready(function(){
  alert("test");
  bindClickHandlers();
})


//
//
 const bindClickHandlers = () => {
   alert("Inside Click Handlers");
//
  $('#view_students').on('click', (e) => {
    alert("You Clicked View students");

    // $('#clicker').click(function(){
    //    alert('hey');
    //    $('.hide_div').hide();
   // });
      e.preventDefault()
//      alert("Test Success")
      (fetch(`/students.json`));
        // .then(res => res.json())
        // .then(data => x)

       .then(res => res.json())
       .then(data => console.log(data))
  })
 }


// $(function(){
//   $("a.load_students").on("click", function(e){
//     $.ajax({
//       method: "GET",
//       url: 'http://localhost:3000/students'
//     }).done(function(data){
//
//     });
//       e.preventDefault();
//   })
// })
