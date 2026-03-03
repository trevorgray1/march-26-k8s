const root = document.getElementById('root');

function fetchTodos() {
  return fetch('http://localhost:4000/todos').then(res => res.json());
}

function addTodo(text) {
  return fetch('http://localhost:4000/todos', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ text })
  });
}

function deleteTodo(id) {
  return fetch(`http://localhost:4000/todos/${id}`, {
    method: 'DELETE'
  });
}

function render(todos) {
  root.innerHTML = `
    <h1>To-Do List</h1>
    <form id="todo-form">
      <input id="todo-input" placeholder="Add a to-do" />
      <button>Add</button>
    </form>
    <ul>
      ${todos.map(todo => `<li>${todo.text} <button data-id="${todo.id}">Delete</button></li>`).join('')}
    </ul>
  `;

  document.getElementById('todo-form').onsubmit = async e => {
    e.preventDefault();
    const input = document.getElementById('todo-input');
    if (input.value) {
      await addTodo(input.value);
      loadTodos();
      input.value = '';
    }
  };

  document.querySelectorAll('button[data-id]').forEach(btn => {
    btn.onclick = async () => {
      await deleteTodo(btn.getAttribute('data-id'));
      loadTodos();
    };
  });
}

async function loadTodos() {
  const todos = await fetchTodos();
  render(todos);
}

loadTodos();
