let students = [];

function addStudent() {
    const name = document.getElementById('name').value;
    const age = document.getElementById('age').value;
    const grade = document.getElementById('grade').value;

    if (name === '' || age === '' || grade === '') {
        alert('Please fill out all fields.');
        return;
    }

    const student = { name, age, grade };
    students.push(student);

    document.getElementById('name').value = '';
    document.getElementById('age').value = '';
    document.getElementById('grade').value = '';

    alert('Student added successfully!');
}



function sortStudents() {
    students.sort((a, b) => b.age - a.age);
    viewStudents();
}

function viewStudents() {
    const studentList = document.getElementById('studentList');
    studentList.innerHTML = '';

    for (let i = 0; i < students.length; i++) {
        const row = `<tr>
                        <td>${students[i].name}</td>
                        <td>${students[i].age}</td>
                        <td>${students[i].grade}</td>
                    </tr>`;
        studentList.innerHTML += row;
    }


}

document.getElementById('viewButton').addEventListener('mouseover', function() {
    viewStudents();  
});

document.getElementById('viewButton').addEventListener('mouseout', function() {
    const studentList = document.getElementById('studentList');
    studentList.innerHTML = '';  
});

function deleteStudent() {
    const name_Delete = prompt('Enter the name of the student you want to delete:');

    const studentIndex = students.findIndex(student => student.name === name_Delete);

    if (studentIndex !== -1) {
        const confirmation = confirm(`Are you sure you want to delete ${name_Delete}?`);
        if (confirmation) {
            students.splice(studentIndex, 1);
            alert('Student deleted successfully.');
            viewStudents();
        }
    } else {
        alert('Student not found.');
    }
}

function bgChange(){
    document.body.style.backgroundColor = '#f0f8ff'
}