// address: a1e3aa355555eb0b94cb3de6c98c1a5dd33c45a3647b3b5697c21d4719339b2e
module personal_data::data{
    use std::signer;    
    use aptos_framework::account;
    use std::vector;
    use aptos_std::type_info;
    use aptos_std::simple_map::{Self, SimpleMap};

    // All the information required for Vesting
    struct DataStore has key,store
    {
        User: address,  
        name: vector<u8>,
        age: u8,
        email: vector<u8>,
        phone_number: vector<u8>,  
        resource_cap: account::SignerCapability, // Signer
    }

    //Map to store seed and corresponding resource account address
    struct VestingCap  has key {
        vestingMap: SimpleMap< vector<u8>,address>,
    }


}