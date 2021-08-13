// let ajax = document.getElementById('ajax');

function renderCal(event) {
  console.log("달력 생성!");
  var calendarEl = document.getElementById('calendar');
  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prevYear,prev,next,nextYear today',
      center: 'title',
      right: 'dayGridMonth,dayGridWeek,dayGridDay'
    },
    initialDate: '2021-08-05',
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
    events: event // 이벤트
  });
  calendar.on('dateClick',function (info){
    console.log('clicked on'+info.dateStr);
  })
  calendar.render();
}

// ajax.addEventListener('click', function (){
//   fetch('/hi')
//       .then(res=>res.json())
//       .then(myJson => {
//         renderCal(myJson);
//       });
// });
let imsi = [
  {
    title: 'All Day Event',
    start: '2021-08-01'
  },
  {
    title: 'Long Event',
    start: '2021-08-07',
    end: '2021-08-10'
  }];
document.addEventListener('DOMContentLoaded', renderCal(imsi));
