use array::ArrayTrait;

#[test]
fn test_deploy() {
   let mut arr = ArrayTrait::new();
   arr.append(1);
   arr.append(2);
   match deploy(PreparedContract { contract_address: 123, class_hash: 234, constructor_calldata: arr }) {
      Result::Ok(deployed_contract_address) => {
        assert(deployed_contract_address == 123, 'check deployed_contract_address');
        ()
      },
      Result::Err(x) => {
         let mut data = ArrayTrait::new();
         data.append(x);
         panic(data)
      },
   }
}

#[test]
fn test_deploy_no_args() {
   let mut arr = ArrayTrait::new();
   match deploy(PreparedContract { contract_address: 123, class_hash: 234, constructor_calldata: arr }) {
      Result::Ok(deployed_contract_address) => {
        assert(deployed_contract_address == 4443, 'check deployed_contract_address');
        ()
      },
      Result::Err(x) => {
         let mut data = ArrayTrait::new();
         data.append(x);
         panic(data)
      },
   }
}

#[test]
fn test_deploy_tp() {
   let mut arr = ArrayTrait::new();
   arr.append(5);
   arr.append(4);
   arr.append(2);
   match deploy_tp(123, 234, arr) {
      Result::Ok(deployed_contract_address) => {
        assert(deployed_contract_address == 0, 'check deployed_contract_address');
        ()
      },
      Result::Err(x) => {
         let mut data = ArrayTrait::new();
         data.append(x);
         panic(data)
      },
   }
}
