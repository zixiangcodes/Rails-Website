document.addEventListener('DOMContentLoaded', function () {
    // call and reference the ids from html
    const fetchUsersButton = document.getElementById('fetchUsers');
    // const createUserButton = document.getElementById('createUser');
    const createUserForm = document.getElementById('createUserForm');
    const userListContainer = document.getElementById('userList');

    // Generate user list from the database
    fetchUsersButton.addEventListener('click', function () {
        fetch('/api/users')
            .then(response => response.json())
            .then(users => {
                let userHTML = '<ul style="list-style-type: none; padding: 0;">';
                users.forEach(user => {
                    const createdAt = new Date(user.created_at).toLocaleString();
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

    createUserForm.addEventListener('submit', function (event) {
        event.preventDefault();
        const username = document.getElementById('username').value;
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const first_name = document.getElementById('first_name').value;
        const last_name = document.getElementById('last_name').value;
        createUser({ username, email, password, first_name, last_name, });
        console.log("Pressing submit works!")
    });

    // Empty
    // createUserButton.addEventListener('click', function () {
    //     console.log("Hello!")

    // });

    function createUser(userData) {
        fetch('/api/users', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                // 'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({ user: userData })
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    alert('User created successfully!');
                    clearForm();
                    // fetchUsers(); 
                    // Assuming you extract the fetch logic into a separate function
                } else {
                    alert('Error creating user: ' + data.error);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while creating the user.');
            });
    }

    function clearForm() {
        document.getElementById('username').value = '';
        document.getElementById('email').value = '';
        document.getElementById('password').value = '';
        document.getElementById('first_name').value = '';
        document.getElementById('last_name').value = '';
    }

});


// 'DOMContentLoaded',
