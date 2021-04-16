import ic_kanban from 'ic:canisters/ic_kanban';

ic_kanban.greet(window.prompt("Enter your name:")).then(greeting => {
  window.alert(greeting);
});
