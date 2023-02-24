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

    //  //Functions    
    // public entry fun add_info(
    //     account: &signer,
    //     person_address: address,
    //     name: vector<u8>,
    //     age: u8,
    //     email: vector<u8>,
    //     phone_number: vector<u8>,
    //     seeds: vector<u8>
    // )acquires DataCap {
        // let account_addr = signer::address_of(account);
        // let (data, data_cap) = account::create_resource_account(account, seeds); //resource account
        // let data_address = signer::address_of(&data);
        // if (!exists<DataCap>(account_addr)) {
        //     move_to(account, DataCap { dataMap: simple_map::create() })
        // };
        // let maps = borrow_global_mut<DataCap>(account_addr);
        // simple_map::add(&mut maps.dataMap, seeds,data_address);
        // let data_signer_from_cap = account::create_signer_with_capability(&data_cap);
    
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
    // public fun validate_personal_data(
    //     address: address
    // ): DataStore {
    //     assert!(exists<DataStore>(address), 1);

    // }

    //provides a public key that can be used for sharing information
    // public fun get_Share_Key(

    // )

    // Get a Person object from the PersonalDataStore
    // public fun get_person(store: &PersonalDataStore, person_address: address): Option<Person> {
        //     for (i, (addr, person)) in store.data.iter().enumerate() {
        //         if addr == &person_address {
        //             return Some(person);
        //         }
        //     }
        // }

    // }


}