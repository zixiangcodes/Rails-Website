document.addEventListener('DOMContentLoaded', function () {
    const fetchUsersButton = document.getElementById('fetchUsers');
    const createUserButton = document.getElementById('createUser');
    const userListContainer = document.getElementById('userList');

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

    createUserButton.addEventListener('click', function () {
        console.log("Hello!")


    });


});


// 'DOMContentLoaded',
