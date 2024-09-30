import 'package:flutter/material.dart';
// If you choose to use cached_network_image, uncomment the next line
// import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const PharmaMateApp());
}

class PharmaMateApp extends StatelessWidget {
  const PharmaMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of products
    List<Map<String, dynamic>> products = [
      {
        'imagePath':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOagOkvngNfF0Wp7wSs1E5qp6r7GxA-23waw&s', // Replace with actual URLs
        'productName': 'Baby Diapers',
        'price': 20.00
      },
      {
        'imagePath': 'https://noblehealthco.com/wp-content/uploads/%E5%8D%93%E7%87%9F%E6%96%B9%E8%A4%87%E5%90%88%E7%B6%AD%E4%BB%96%E5%91%BDB-C-%E7%9B%92-2.jpg',
        'productName': 'Vitamin B',
        'price': 5.00
      },
      {
        'imagePath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLP2JkOv_aRx9sP5LovAbll8vKJ3APl0HW-w&s',
        'productName': 'Omega 3',
        'price': 15.00
      },
      {
        'imagePath': 'https://tovpet.com/cdn/shop/files/100086898_142298510746327_2827989282969354240_n-removebg-preview.png?v=1687508862',
        'productName': 'Paracetamol',
        'price': 1.25
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        // Uncomment and adjust if you have a local asset
        /*
        leading: IconButton(
          icon: Image.asset(
            'images/hospital-logo.png',
            width: 50,
            height: 50,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard2()),
            );
          },
        ),
        */
        title: const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Pharma',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextSpan(
                text: 'Mate',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined,
                color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner
              Container(
                padding: const EdgeInsets.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(1),
                          prefixIcon:
                          const Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://img.freepik.com/free-vector/mega-sale-offers-banner-template_1017-31299.jpg', // Replace with actual URL
                        width: double.infinity,
                        height: 190,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return const Center(
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),

              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Show All"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Categories Scroll
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Example categories with unique images
                    const CategoryWidget(
                        imagePath:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSBVB3wiO1H19MsATtnX9shg3ajr0sTP3pKQ&s', // Replace with actual URL
                        label: "Care"),
                    const CategoryWidget(
                        imagePath:
                        'https://cdn-icons-png.flaticon.com/512/710/710144.png', // Replace with actual URL
                        label: "Heart"),
                    const CategoryWidget(
                        imagePath:
                        'https://t3.ftcdn.net/jpg/02/14/39/38/360_F_214393844_8TuJzbiHWQT8tRqamM2WZYg2M1XM2fh0.jpg', // Replace with actual URL
                        label: "Brain"),
                    const CategoryWidget(
                        imagePath:
                        'https://cdn-icons-png.flaticon.com/512/9056/9056024.png', // Replace with actual URL
                        label: "Stomach"),
                    const CategoryWidget(
                        imagePath:
                        'https://cdn-icons-png.flaticon.com/512/3843/3843297.png', // Replace with actual URL
                        label: "Lung"),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Popular Items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Show All"),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Grid of Products
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length, // Use dynamic product count
                itemBuilder: (context, index) {
                  return ProductCard(
                    imagePath: products[index]['imagePath'],
                    productName: products[index]['productName'],
                    price: products[index]['price'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryWidget(
      {super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
                  // If using cached_network_image:
                  /*
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: Colors.red),
                  ),
                  */
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double price;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120, // Adjust as needed
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  height: 120,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object error,
                  StackTrace? stackTrace) {
                return const SizedBox(
                  height: 120,
                  child: Center(
                    child: Icon(Icons.error, color: Colors.red),
                  ),
                );
              },
            ),
            // If using cached_network_image:
            /*
            child: CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 120,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error, color: Colors.red)),
            ),
            */
          ),
          // Product Details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Price and Favorite Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.green),
                ),
                const Icon(Icons.favorite_border),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
