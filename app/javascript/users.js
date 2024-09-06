document.addEventListener('DOMContentLoaded', function () {
    // call and reference the ids from html
    const fetchUsersButton = document.getElementById('fetchUsers');
    const createUserButton = document.getElementById('createUser');
    const createUserForm = document.getElementById('createUserForm');
    const userListContainer = document.getElementById('userList');

    // Generate user list from the database
    fetchUsersButton.addEventListener('click', function () {
        fetch('/api/users')
            .then(response => response.json())
            .then(users => {
                let userHTML = '<ul style="list-style-type: none; padding: 0;">';
                users.forEach(user => {
                    userHTML += `<li style="margin-bottom: 10px;">Username: ${user.username} | Email: (${user.email}) | Created At: ${user.created_at}  </li>`;
                });
                userHTML += '</ul>';
                userListContainer.innerHTML = userHTML;
            })
            .catch(error => {
                console.error('Error:', error);
                userListContainer.innerHTML = 'Error fetching users';
            });
    });

    // Empty
    createUserButton.addEventListener('click', function () {
        console.log("Hello!")

    });

    createUserForm.addEventListener('submit', function (event) {
        event.preventDefault();
        const username = document.getElementById('username').value;
        createUser(username);
    });


});


// 'DOMContentLoaded',
