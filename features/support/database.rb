# coding: utf-8

DATABASE = {
        name: {
            name1: 'Tony',
            name2: 'Alberto',
            name3: 'Diana',
            name4: 'Elaine',
            name5: 'Nicholas',
            name6: Faker::Name.name
        },

        salary: {
            salary1: 420800,
            salary2: 100,
            salary3: 5000,
            salary4: 90000,
            salary5: 30000,
            salary6: Faker::Number.number
        },

        age: {
            age1: 30,
            age2: 40,
            age3: 27,
            age4: 90,
            age5: 45,
            age6: Faker::Number.number(digits: 2)
        }
}