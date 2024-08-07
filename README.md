 fruit_shop

# 🍏 Fruit Shop - Flutter Shopping App 🍏
Welcome to the Fruit Shop Flutter application! This app is designed to offer a delightful shopping experience for fruit lovers. Built with a modern approach using Flutter, the app showcases a clean architecture, state management with Provider, and robust navigation with AutoRoute.

## Features
**Product Listing**: Browse through a variety of fruits displayed in a grid layout.

**Product Details**: View detailed information about each fruit, including images, price, and category.

**Add to Cart**: Easily add fruits to your shopping cart with a single tap.

**Cart Management**: View, update, and remove items from your cart.

**Checkout**: Seamlessly complete your purchase with a checkout process.

**Persistent Storage**: Store cart data locally using SQFlite.

## Getting Started

**Installation**
Clone the Repository

    git clone https://github.com/yourusername/fruit_shop.git
    cd fruit_shop

Install Dependencies

    flutter pub get

Run the App

    flutter run


## Project Structure
The project follows the CLEAN architecture and SOLID principles, ensuring a scalable and maintainable codebase.


    lib/
    ├── core/
    │   └── utils/
    │       └── service_locator.dart
    ├── data/
    │   ├── datasources/
    │   │   └── product_local_data_source.dart
    │   ├── models/
    │   │   └── product_model.dart
    │   └── repositories/
    │       └── product_repository_impl.dart
    ├── domain/
    │   ├── entities/
    │   │   └── product.dart
    │   ├── repositories/
    │   │   └── product_repository.dart
    │   └── usecases/
    │       └── get_products.dart
    ├── presentation/
    │   ├── pages/
    │   │   ├── cart_page.dart
    │   │   ├── product_detail_page.dart
    │   │   └── product_list_page.dart
    │   ├── providers/
    │   │   ├── cart_provider.dart
    │   │   └── product_provider.dart
    │   ├── routes/
    │   │   ├── router.dart
    │   │   └── router.gr.dart
    └── main.dart
    assets/
    └── initial_data.json

## Detailed Explanation
**Main Components**
- Product Listing Page (product_list_page.dart)

**Displays products in a grid view.**
- Uses GridView.builder to create a responsive grid layout.
- Each product is displayed as a ProductGridTile.
- Product Details Page (product_detail_page.dart)

**Shows detailed information about the selected product.**
- Includes an "Add to Cart" button.
- Cart Page (cart_page.dart)

**Lists all items in the cart.**
- Allows updating the quantity and removing items.
- Displays the total price and includes a "Checkout" button.
S- hows a thank-you dialog upon checkout and clears the cart.

**State Management**
**Provider: Used for state management.**
  - CartProvider: Manages the cart items and total price.
  - ProductProvider: Manages the list of products.
**Navigation**
  - AutoRoute: Simplifies navigation and routing within the app.
  - Routes are defined in router.dart.
  - Navigation is handled via the generated router.gr.dart.
**Data Handling**
  - SQFlite: Used for local storage.
  - product_local_data_source.dart: Manages local data operations.
  - Data is initialized from initial_data.json.
**Dependency Injection**
  - GetIt: Used for service location and dependency injection.
  - Services are registered in service_locator.dart.
**UI Components**
  - GridView: Displays products in a grid layout.
  - ListView: Displays cart items in a list.
  - Cards: Used for product and cart item presentation.
  - Dialogs: Used for displaying the checkout confirmation.
**Assets**
  - Images: Product images are stored in the assets directory.
  - JSON: Initial product data is stored in initial_data.json.
