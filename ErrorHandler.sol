// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ErrorHandler {
    struct Item {
        uint id;
        uint amount;
        string name;
    }

    mapping(uint => address) userItems;
    Item [] public items;

    function addProduct(uint _amount, string memory _name) external {
         if(_amount == 0) {
            revert("Amount must be greater than zero");
        }
        uint id = items.length;
        items.push(Item(id, _amount, _name));
    }

    function buyItem(uint _id, uint _amount) external payable {
        require(_id < items.length, "Item does not exist");
        Item storage product = items[_id];
        assert(_amount >= product.amount);
        
        userItems[_id] = msg.sender;
    }

}

  