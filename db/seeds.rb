# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'




def generate_dogs
    Dog.destroy_all
    10.times do 
        Dog.create!(dog_name:Faker::Name.dog_name,dog_id:Faker::Number.dog_id)
    end
end

def generate_dog_sitters
    DogSitter.destroy_all
    10.times do
        Dogsitter.create!(first_name: Faker::Name.first_name, dog_sitter_id: Faker::Number.between(DogSitter.first.id, DogSitter.last.id))
       
    end
end




def generate_strolls
    Stroll.destroy_all
    15.times do
        Stroll.create!(promenade: Faker::Name.promenade, 
        dog_sitter_id: Faker::Number.between(DogSitter.first.id, DogSitter.last.id), 
        dog_id: Faker::Number.between(Dog.first.id, Dog.last.id))
    end
end

def generate_cities
    City.destroy_all
    15.times do 
        City.create!(city_place: Faker::Artist.city_place,dog_sitter_id: Faker::Number.between(DogSitter.first.id, DogSitter.last.id), 
        dog_id: Faker::Number.between(Dog.first.id, Dog.last.id))
    end
end

    # Méthode perform qui appelle les méthodes generate
    # L'ordre est important car il ne faut pas appeler une table qui dépend d'une autre avant qu'elle-même ne soit créée

def perform
  	
    
    generate_strolls
    generate_cities
end

perform