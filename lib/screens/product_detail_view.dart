
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/bloc/product_bloc.dart';
import 'package:flutter_ecommerce/bloc/product_event.dart';
import 'package:flutter_ecommerce/bloc/product_state.dart';
import 'package:flutter_ecommerce/common/generic_text.dart';
import 'package:flutter_ecommerce/common/generic_text_field.dart';
import 'package:flutter_ecommerce/extension/string_extension.dart';
import 'package:flutter_ecommerce/utils/calculate_discount_rate.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

 Future<void> _initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      );

  // Create a channel for notifications
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'channelId', // id
    'com.google.firebase.messaging.default_notification_channel_id',
    description: 'send message',
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
}

  Future<void> _showProgressNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channelId',
      'com.google.firebase.messaging.default_notification_channel_id',
      channelDescription: 'send message',
      importance: Importance.high,
      priority: Priority.high,
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Message Send',
      "Thank you for Contacting Us",
      platformChannelSpecifics,
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          final product = state.product;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GenericText(
                    text: product.data!.name.toString(),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),

                  // Featured Image
                  SizedBox(
                    height: 350,
                    child: Image.network(
                      product.data!.image!.first.path.toString(),
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child; // If the image has loaded, return the image
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null, // Show progress if total bytes are known
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Center(
                            child: Icon(Icons
                                .error)); // Show an error icon if the image fails to load
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const GenericText(
                    text: "Images",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // itemCount: product.data!.image!.length,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 70,
                            width: 70,
                            child: Image.network(
                                product.data!.image!.first.path.toString()),
                          );
                        }),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        GenericText(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.orange,
                            text: '\$${product.data!.price}'),
                        const SizedBox(width: 15),

                        Text(
                          '\$${product.data!.strikePrice}',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const SizedBox(width: 10),

                        GenericText(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.red,
                            text:
                                "-${calculateDiscountRate(double.parse(product.data!.price.toString()), double.parse(product.data!.strikePrice.toString())).toString()} % OFF"),
                        // Text(
                        //   '${((product.data!.strikePrice - product.data!.price) / product.strikePrice * 100).toStringAsFixed(0)}% OFF',
                        //   style: TextStyle(fontSize: 16, color: Colors.red),
                        // ),
                      ],
                    ),
                  ),

                  // Stock Availability
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        'Stock Available: ${product.data!.variantDetails!.first.stock}'),
                  ),
                  const GenericText(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      text: 'Varients'),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.data!.variantDetails!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 70,
                                  child: Image.network(
                                    product.data!.variantDetails![index].image!
                                        .first.path
                                        .toString(),
                                  ),
                                ),
                                Row(
                                  children: [
                                    GenericText(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      text: product
                                          .data!.variantDetails![index].price
                                          .toString(),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '\$${product.data!.variantDetails![index].price.toString()}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                // Use a fixed height for the inner ListView
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    height: 50,
                                    width: 120,
                                    child: ListView.builder(
                                      scrollDirection: Axis
                                          .vertical, // Add this line if you want horizontal scrolling
                                      itemCount: product
                                          .data!
                                          .variantDetails![index]
                                          .variants!
                                          .length,
                                      itemBuilder: (context, i) {
                                        return GenericText(
                                          fontSize: 10,
                                          text:
                                              "${product.data!.variantDetails![index].variants![i].typeData!.name.toString().removeNamePrefix()}:${product.data!.variantDetails![index].variants![i].valueData!.name.toString()} ",
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                GenericText(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    text:
                                        "${product.data!.variantDetails![index].stock} stocks available"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  HtmlWidget(product.data!.description.toString()),
                  // Specifications
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Specifications',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...product.data!.specification!.map((spec) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: Text('${spec.type}: ${spec.value}'),
                      )),

                  // Reviews Section (Placeholder)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Reviews',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(
                      const Size(200.0, 50.0)), // Set width and height
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(.0), // Set border radius
                    ),
                  ),
                ),
                    onPressed: () {
                      // Toggle open/close state
                      context
                          .read<ProductBloc>()
                          .add(ToggleProductOpenEvent(!state.isOpen));
                    },
                    child: const Text('Message Seller Option'),
                  ),

                  state.isOpen
                      ? Column(
                          children: [
                            GenericTextField(
                                sufficIcon: Icons.send,
                                onCLickSufficIcon: () async {
                                  await _showProgressNotification();
                                },
                                controller: TextEditingController(),
                                labelText: 'Message',
                                hintText: 'Enter Your Message Here',
                                isSecureText: false)
                          ],
                        )
                      : const Text(""),
                ],
              ),
            ),
          );
        } else if (state is ProductError) {
          return const Center(child: Text('Failed to load product'));
        }
        return Container();
      },
    );
  }
}
