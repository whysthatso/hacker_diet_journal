// Entry point for the build script in your package.json
import bulmaCalendar from 'bulma-calendar/dist/js/bulma-calendar.min.js';


// Initialize all input of date type.
const calendars = bulmaCalendar.attach('[type="datetime-local"]', {dateFormat: "yyyy-MM-dd", timeFormat: "HH:mm:ss", editTimeManually: true });


document.addEventListener('DOMContentLoaded', () => {
    (document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
      const $notification = $delete.parentNode;

      $delete.addEventListener('click', () => {
        $notification.parentNode.removeChild($notification);
      });
    });
  });
