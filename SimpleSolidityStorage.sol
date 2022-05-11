pragma solidity >=0.6.0 <0.9.0;
// 一个合约由一组代码（合约的函数）和数据（合约的状态）组成。合约位于以太坊区块链上的一个特殊地址。
// Solidity的运行原理
// 首先，Solidity源码会被编译为字节码，部署时，字节码会以交易为载体在网络间确认，并在节点上形成合约；
//合约函数调用，如果是交易类型，会经过网络确认，最终由EVM执行。
// EVM是栈式虚拟机，它会读取合约的字节码并执行。
// 在执行过程中，会与栈、内存、合约存储进行交互。
// 其中，栈用于存储普通的局部变量，这些局部变量就是字节码的操作数；
// 内存用于存储对象，采用length+body进行存储，顺序分配方式进行内存分配；状态存储用于存储状态变量。
contract SimpleSolidityStorage {

    uint256 favoriteNumber;

    // struct 结构体名称{
    //     类型 字段名;
    // }
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // 结构体不定长数组
    People[] public people;
    // mapping：映射，
    // 无法判断是否存在某个key 不支持length
    mapping(string => uint256) public nameToFavoriteNumber; 
    // function 函数名称(可选参数) 修饰符 返回值{ 函数体 }
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    // 使用returns指定返回的类型
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
