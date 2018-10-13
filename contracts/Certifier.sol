pragma solidity ^0.4.23;

contract Certifier {
    address public owner;
    mapping(bytes32 => Course) public courses;


    struct Course {
        string name;
        uint  cost;
        uint duration;
        uint threshold;
        bytes32[] codes;
        mapping(address => Student) students;
        mapping(bytes32 => Session) sessions;
    }

    struct Student {
        string fname;
        string lname;
        uint age;
        string email;
        bytes32[] codes;
    }

    struct Session {
        string name;
        uint date;
        bytes32[] subjects;
        bytes32[] assistance;
    }

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted() {
        require (msg.sender == owner) ;
        _;
    }

    function isOwner() public view returns(bool) {
        return msg.sender == owner;
    }

    function addCourse(
        bytes32 _code,
        string _name,
        uint  _cost,
        uint _duration,
        uint _threshold,
        bytes32[] _codes) public restricted {
            courses[_code] = Course({
                name: _name,
                cost: _cost,
                duration: _duration,
                threshold: _threshold,
                codes: _codes
        });
    }

    function getCourse(bytes32 _code) public restricted view returns(string, uint, uint, uint, bytes32[]){
        Course storage course = courses[_code];
        return(course.name, course.cost, course.duration, course.threshold, course.codes);
    }

    function subscribe(
        bytes32 _code,
        string _fname,
        string _lname,
        uint _age,
        string _email
    ) public payable{
        require(msg.value == 3 ether, "You haven't sent exactly 3 ether" );
        Course storage course = courses[_code];
        course.students[msg.sender] = Student({
            fname: _fname,
            lname: _lname,
            age: _age,
            email: _email,
            codes: new bytes32[](0)
        });
    }

    function addSession(
        bytes32 _course_code,
        bytes32 _session_code,
        string _name,
        uint _date,
        bytes32[] _subjects,
        bytes32[] _assitance) public restricted{
        Course storage course = courses[_course_code];
        course.sessions[_session_code] = Session({name: _name, date: _date, subjects: _subjects, assistance: _assitance});
    }
}
