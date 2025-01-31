use array::ArrayTrait;
use result::ResultTrait;

#[test]
fn test_declare() {
    let class_hash = declare('minimal').unwrap();
    assert(class_hash != 0, 'class_hash != 0');
}

#[test]
fn test_declare_nonexistent() {
    declare('abcdef').unwrap();
}

#[test]
fn test_declare_broken() {
    declare('broken').unwrap();
}

#[test]
fn test_declare_cairo0() {
    declare('cairo0').unwrap();
}
