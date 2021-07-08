// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts-ethereum-package/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DeveloperFactory is OwnableUpgradeSafe {
    event NewDeveloper(uint devId, string name, string position, uint age);
    event SetAdminStatus(address account, bool adminStatus);

    uint public maxAge = 100;
    uint public minAge = 5;
    address public fund;

    struct Developer {
        uint devId;
        string name;
        string position;
        uint age;
    }

    Developer[] public developers;

    mapping(address => bool) public admin;

    function initialize(address _fund) public initializer {
        OwnableUpgradeSafe.__Ownable_init();
        fund = _fund;
        admin[msg.sender] = true;
    }

    modifier onlyAdmin() {
        require(admin[msg.sender], "!admin");
        _;
    }

    function setAdminStatus(address _account, bool _isAdmin) external onlyOwner {
        admin[_account] = _isAdmin;
        emit SetAdminStatus(_account, _isAdmin);
    }

    function _createDeveloper (uint _devId, string memory _name, string memory _position, uint _age) private {
        developers.push(Developer(_devId, _name, _position, _age));
        emit NewDeveloper(_devId, _name, _position, _age);
    }

    function  _generateRandomId (string memory _str) private pure returns (uint) {
        uint _rand = uint(keccak256(abi.encodePacked(_str)));
        return _rand;
    }

    function _createRandomDeveloper (string calldata _name, string calldata _position, uint _age) external onlyAdmin {
        require(_age > minAge, 'too low');
        require(_age < maxAge, 'too high');
        uint _id = _generateRandomId(_name);
        _createDeveloper(_id, _name, _position, _age);
    }
}
