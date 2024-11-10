pragma solidity ^0.6.0;

contract StudentManagement {
    struct Student {
        int256 stud_id;
        string name;
        string department;
    }

    Student[] private students;

    event StudentAdded(int256 stud_id, string name, string department);
    event EtherReceived(address sender, uint256 value, string message);

    function addStudent(int256 stud_id, string memory name, string memory department) public {
        Student memory stud = Student(stud_id, name, department);
        students.push(stud);
        emit StudentAdded(stud_id, name, department);
    }

    function getStudent(int256 stud_id) public view returns (string memory, string memory) {
        for (uint256 i = 0; i < students.length; i++) {
            Student memory stud = students[i];
            if (stud.stud_id == stud_id) {
                return (stud.name, stud.department);
            }
        }
        return ("Not Found", "Not Found");
    }

    receive() external payable {
        emit EtherReceived(msg.sender, msg.value, "Ether received via receive function");
    }

    fallback() external payable {
        emit EtherReceived(msg.sender, msg.value, "Fallback function triggered");
    }
}
