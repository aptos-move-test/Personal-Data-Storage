module personal_data::DataStore{
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
        // resource_cap: account::SignerCapability, // Signer
    }

    //Map to store seed and corresponding resource account address
    struct DataCap  has key {
        DataMap: SimpleMap< vector<u8>,address>,
    }

    //Functions    

    //Asks to enter the information and stores the data
    public fun add_personal_data(
        signer: &signer,
        name: vector<u8>,
        age: u8,
        email: vector<u8>,
        phone_number: vector<u8>
    ): bool {
        let sender_address = Signer::address_of(signer);
        let personal_data = DataStore {
            name: name,
            age: age,
            email: email,
            phone_number: phone_number
        };
        move_to(sender_address, personal_data);
        true
    }

    //returnes user data when address is provided
    public fun get_personal_data(
        address: address
    ): DataStore {
        assert!(exists<DataStore>(address), 1);
        let personal_data: DataStore = move_from(address);
        personal_data
    }

    //Checks user data whether its accurate or not
    public fun validate_personal_data(
        address: address
    ): DataStore {
        assert!(exists<DataStore>(address), 1);

    }

    //provides a public key that can be used for sharing information
    public fun get_Share_Key(

    )


}