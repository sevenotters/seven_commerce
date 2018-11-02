# Seven Commerce

E-commerce project example using Seven Otters.

## Functional requirements

### User

- [x] **registration**: as a user I have to insert username/email, password and confirm password so that I can be registered
- [] **login**: as a user I have to insert username/email and password so that I can be authenticated

### Cart

- [] **my_shopping_cart**: as a user I have always a shopping cart so that I can add books to buy
- [] **add_item_to_cart**: As a user I can add books to my shopping cart so that I can have a list of books to buy
- [] **list_cart_content**: as a user I need to list my shopping cart content in order to see the state of my shopping cart
- [] **remove_item_from_cart**: as a user I need to remove book(s) fom my shopping cart

### Books

- [] **list_available_books**: as a user I need to list available books in order to choose which one to buy
- [] **search_books**: as a user I need to filter available books by title so that I can find a particular book

### Order
  
- [] **apply_order**: as a user I want to apply order so that I can receive all books in my shopping cart
- [] **order_received**: as a user I want to confirm that the books have been received and leave a feedback so that my feedback could help other users

## Tech notes

  Order status:
    
    preparing, shipped, delivered
	
  User data:
      
    username (or) email,
    password,
    cart
	
  Cart data:
  
    [book]
	
  Book data:
  
    title
    author

