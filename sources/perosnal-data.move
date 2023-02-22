module personal_data::data{
    use std::signer;    
    use aptos_framework::account;
    use std::vector;
    use aptos_std::type_info;
    use aptos_std::simple_map::{Self, SimpleMap};

    // All the information required for iformation
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
    struct DataCap  has key {
        DataMap: SimpleMap< vector<u8>,address>,
    }


}