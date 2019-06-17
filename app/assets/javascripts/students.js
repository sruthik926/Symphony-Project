$(document).ready(function(){
  // alert("test");
  bindClickHandlers();
})


//
//
 const bindClickHandlers = () => {
   // alert("Inside Click Handlers");

//
 $('#view_students').on('click', (e) => {
    // alert("You Clicked View students");
        e.preventDefault()
        fetch(`/students.json`)
          .then(res => res.json())
            .then(students => {
              // $('#app-container').html('')
               students.forEach(student => {
                 let newStudent = new Student(student)
                 let studentHtml = newStudent.formatIndex()
                 $('#app-container').append(studentHtml)
                 // console.log(studentHtml)
            })
          })
     })
     $("#new_student").on("submit", function(e) {
        e.preventDefault()
        // alert("Inside Submit");
        const values = $(this).serialize()

        $.post("/students", values).done(function(data){
          const newStudent = new Student(data)
          const htmlToAdd = newStudent.formatShowStudent()
          $('#app-container').html(htmlToAdd)
        })
      })

    $(document).on('click', ".show_link", function(e) {
        e.preventDefault()
        // console.log(this)
        // $('#app-container').html('')
        let id = $(this).attr('data-id')
        // console.log(id)
        fetch(`/students/${id}.json`)
        .then(res => res.json())
          .then(student => {
              let newStudent = new Student(student)

              let studentHtml = newStudent.formatShowStudent()
              // $('#app-container').append(studentHtml)
              $(".s-detail").remove();
              $(this).append(studentHtml);

       })
    })
//
// }



      function Student(student_json){
        this.id = student_json.id
        this.first_name = student_json.first_name
        this.last_name = student_json.last_name
        this.phone_number = student_json.phone_number
        this.email = student_json.email
        this.appointments = student_json.appointments

      }


   Student.prototype.formatIndex = function() {
      let studentHtml = `
        <a href="/students/${this.id}" data-id="${this.id}" class="show_link" <br> <table>
        <h1 style="text-align:left;"> <th> ${this.first_name} ${this.last_name} </th></h1> </table> </a>

      `
        // console.log(studentHtml)
        return studentHtml;
   }

  Student.prototype.formatShowStudent = function(){
    let newArr = []
    let appointArr = this.appointments
    $.each(appointArr, function( k, v ) {
      newArr.push('<li>' + "Appointment Id" + " " + v.id + " " + "Subject Taught" + " " + v.subject_taught + " " + "Lesson Date " + v.lesson_date +  " " + '</a></li>')
      console.log(newArr)
   });


  //   const newArr = this.appointments.map((a, index) => {
  //     return "subject taught" +  a.subject_taught;
  // })
      let studentHtml = ` <a class="s-detail" <h1> ${this.first_name} ${this.last_name}<h1>
       <h1> ${this.phone_number} </h1>
       <h1> ${this.email} <h1>
       <h2> ${newArr} </h2></a>
      `
      return studentHtml

  }

}
//
//     // $('#clicker').click(function(){
//     //    alert('hey');
//     //    $('.hide_div').hide();
//    // });
//       e.preventDefault()
// //      alert("Test Success")
//       (fetch(`/students.json`));
//         // .then(res => res.json())
//         // .then(data => x)
//
//        .then(res => res.json())
//        .then(students => console.log(students))
//   })



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
