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

     //Functions    
    public entry fun add_info(
        account: &signer,
        person_address: address,
        name: vector<u8>,
        age: u8,
        email: vector<u8>,
        phone_number: vector<u8>,
        seeds: vector<u8>
    )acquires DataCap {
         let account_addr = signer::address_of(account);
        let (data, data_cap) = account::create_resource_account(account, seeds); //resource account
        let data_address = signer::address_of(&data);
        if (!exists<DataCap>(account_addr)) {
            move_to(account, DataCap { dataMap: simple_map::create() })
        };
        let maps = borrow_global_mut<DataCap>(account_addr);
        simple_map::add(&mut maps.dataMap, seeds,data_address);
        let data_signer_from_cap = account::create_signer_with_capability(&data_cap);
        let person = Person {
            name: name,
            age: age,
            email: email,
            phone_number: phone_number
        };

        // Get a Person object from the PersonalDataStore
        // public fun get_person(store: &PersonalDataStore, person_address: address): Option<Person> {
        //     for (i, (addr, person)) in store.data.iter().enumerate() {
        //         if addr == &person_address {
        //             return Some(person);
        //         }
        //     }
        // }

    }


}