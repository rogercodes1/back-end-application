
categories = [
  "Miscellaneous",
  "Electricity",
  "Rent",
  "Groceries",
  "Loan",
  "Phone Service",
  "Trip",
  "Clothing",
  "Car Service",
  "Home Service",
  "Medical Service",
  "Deposit",
  "Beer",
  "Movies",
  "Birthday Money",
  "Subway Ticket",
  "Bus Ticket",
  "Music Festival",
  "Vegas",
  "Fast Food",
  "Enertainment",
  "Sports Event",
  "Bar",
  "Gambling"

].sort

  index = 0
  while(index < categories.length) do
    Category.find_or_create_by(name: categories[index])
    index = index + 1
  end

roger = User.find_or_create_by(first_name: "Roger", last_name: "Perez", email: "roger@gmail.com", password_digest: "123123", phone: "6615555555")
whitney = User.find_or_create_by(first_name: "Whitney", last_name: "Bui", email: "whitbui@gmail.com", password_digest: "rawr1234", phone: "6615555555")
trans1 = Transaction.find_or_create_by(
  amount: "50",
  date: "2018/10/10",
  description: "toast",
  transaction_type: "income",
  user_id: 1,
  category_id: 1
)
