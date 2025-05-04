puts "Nettoyage des données..."
MealItem.destroy_all
Meal.destroy_all
Food.destroy_all
Category.destroy_all
User.destroy_all

puts "Création des catégories et aliments..."

categories = {
  "Viandes et poissons" => [
    { name: "Poulet (filet)", calories: 165, proteins: 31 },
    { name: "Bœuf (rumsteck)", calories: 191, proteins: 27 },
    { name: "Saumon", calories: 208, proteins: 20 },
    { name: "Thon (en boîte)", calories: 116, proteins: 25 }
  ],
  "Produits animaux et œufs" => [
    { name: "Œuf (entier)", calories: 143, proteins: 13 },
    { name: "Fromage (emmental)", calories: 380, proteins: 28 },
    { name: "Lait écrémé", calories: 35, proteins: 3.4 },
    { name: "Yaourt nature", calories: 60, proteins: 4.5 }
  ],
  "Féculents" => [
    { name: "Riz blanc cuit", calories: 130, proteins: 2.4 },
    { name: "Pâtes cuites", calories: 131, proteins: 5 },
    { name: "Quinoa cuit", calories: 120, proteins: 4.1 },
    { name: "Pommes de terre", calories: 77, proteins: 2 }
  ],
  "Légumes" => [
    { name: "Brocolis", calories: 34, proteins: 2.8 },
    { name: "Carottes", calories: 41, proteins: 0.9 },
    { name: "Courgette", calories: 17, proteins: 1.2 },
    { name: "Épinards crus", calories: 23, proteins: 2.9 }
  ],
  "Fruits" => [
    { name: "Pomme", calories: 52, proteins: 0.3 },
    { name: "Banane", calories: 89, proteins: 1.1 },
    { name: "Orange", calories: 47, proteins: 0.9 },
    { name: "Fraise", calories: 32, proteins: 0.7 }
  ],
  "Oléagineux" => [
    { name: "Amandes", calories: 579, proteins: 21 },
    { name: "Noix", calories: 654, proteins: 15 },
    { name: "Cacahuètes", calories: 567, proteins: 25 },
    { name: "Graines de chia", calories: 486, proteins: 16 }
  ]
}

categories.each do |category_name, foods|
  category = Category.create!(name: category_name)
  foods.each do |food_data|
    category.foods.create!(food_data)
  end
end

puts "Création d'un utilisateur de test..."

User.create!(
  username: "TestUser",
  email: "test@example.com",
  password: "password",
  password_confirmation: "password"
)

puts "Seed terminé ! ✅"
