pragma solidity ^0.4.11;

contract CrowdFunding {
  struct Investor {
    address addr;
    uint amount;
  }

  address public owner;
  uint public numInvestors;
  uint public deadline;
  bool public goalReached;
  uint public goalAmount;
  uint public amountRaised;
  mapping (uint => Investor) public investors;

  // オーナーのみ実行可能にしたい処理が一部あるのでmodifierを設定
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
  * コンストラクタ
  * @param _duration プロジェクトの期間を設定
  * @param _goalAmount 目標金額を設定
  */
  function CrowdFunding(uint _duration, uint _goalAmount) {
    owner = msg.sender;
    deadline = now + _duration;
    goalAmount = _goalAmount;
    goalReached = false;
    numInvestors = 0;
    amountRaised = 0;
  }

  /**
  * 出資を行う
  */
  function fund() payable {
    require(!goalReached);

    Investor investor = investors[numInvestors++];
    investor.addr = msg.sender;
    investor.amount = msg.value;
    amountRaised += investor.amount;
  }

  /**
  * 目標に達しているか確認し、達成した場合オーナーに出資金を送金
  * 達成していない場合は各出資者に出資金を返金
  */
  function checkGoalReached() public onlyOwner {
    require(!goalReached);
    require(now >= deadline);

    goalReached = true;
    if(amountRaised >= goalAmount) {
      owner.send(this.balance);
    } else {
      for(uint i = 0; i < numInvestors; i++) {
        investors[i].addr.send(investors[i].amount);
      }
    }
  }
}