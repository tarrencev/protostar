# `deploy`

```cairo
fn deploy(prepared_contract: PreparedContract) -> Result::<felt252, felt252> nopanic;
```

Deploys a [preapred](./prepare.md) contract.

- `prepared_contract` - an object of the struct `PreparedContract` that consists of the following fields:
    - `contract_address` - the address of the contract calculated during contract [preparation](./prepare.md)
    - `class_hash` - class hash calculated during contract [declaration](./declare.md)
    - `constructor_calldata` - calldata for the constructor. If the constructor exists, it is called by `deploy`.

```cairo title="Example"
use array::ArrayTrait;
use result::ResultTrait;

#[test]
fn test_deploy() {
    let class_hash = declare('minimal').unwrap();
    assert(class_hash != 0, 'class_hash != 0');

    let prepare_result = prepare(class_hash, ArrayTrait::new()).unwrap();

    assert(prepare_result.contract_address != 0, 'prepared contract_address != 0');
    assert(prepare_result.class_hash != 0, 'prepared class_hash != 0');

    let prepared_contract = PreparedContract {
        contract_address: prepare_result.contract_address,
        class_hash: prepare_result.class_hash,
        constructor_calldata: prepare_result.constructor_calldata
    };
    let deployed_contract_address = deploy(prepared_contract).unwrap();
    assert(deployed_contract_address != 0, 'deployed_contract_address != 0');
}
```

You can find more examples [here](https://github.com/software-mansion/protostar/blob/18959214d46409be8bedd92cc6427c1945b1bcc8/tests/integration/cairo1_hint_locals/deploy/deploy_test.cairo).
