import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Order {
  const Order({
    @required this.assetName,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.target,
    @required this.status})
      : assert(assetName != null),
        assert(title != null),
        assert(description != null),
        assert(price != null),
        assert(target != null),
        assert(status != null);

  final String assetName;
  final String title;
  final String description;
  final String price;
  final String target;
  final String status;
}

List<Order> orders(BuildContext context) => [
  Order(
    assetName: 'assets/kfc-ads.png',
    title: 'Đơn hàng 1',
    description: 'abcdef',
    price: '10',
    target: '144 Xuân Thủy',
    status: 'chưa giao',
  ),
  Order(
    assetName: 'assets/kfc-ads.png',
    title: 'Đơn hàng 1',
    description: 'abcdef',
    price: '10',
    target: '144 Xuân Thủy',
    status: 'chưa giao',
  ),
  Order(
    assetName: 'assets/kfc-ads.png',
    title: 'Đơn hàng 1',
    description: 'abcdef',
    price: '10',
    target: '144 Xuân Thủy',
    status: 'chưa giao',
  ),
];

class OrderItem extends StatelessWidget {
  const OrderItem({Key key, @required this.order, this.shape})
      : assert(order != null),
        super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const height = 280.0;
  final Order order;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: OrderContent(order: order),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
      child:
        Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}

class OrderContent extends StatelessWidget {
  const OrderContent({Key key, @required this.order})
      : assert(order != null),
        super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5.copyWith(color: Colors.white);
    final descriptionStyle = theme.textTheme.subtitle1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: Stack(
            children: [
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as
                // part of the Material and display ink effects above it. Using
                // a standard Image will obscure the ink splash.
                child: Ink.image(
                  image: AssetImage(
                    order.assetName,
                  ),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              // Positioned(
              //   bottom: 16,
              //   left: 16,
              //   right: 16,
              //   child: FittedBox(
              //     fit: BoxFit.scaleDown,
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       order.title,
              //       style: titleStyle,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        // Description and share/explore buttons.
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // This array contains the three line description on each card
                // demo.
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),

                ),
                Text(
                  order.title
                  + '\nChi tiết: ' +order.description
                  + '\nPrice: ' + order.price
                  + '\nĐiểm đến: ' + order.target
                  // style: descriptionStyle.copyWith(color: Colors.black54),
                ),
                // Text(
                //   'Chi tiết: ' +order.description,
                //   // style: descriptionStyle.copyWith(color: Colors.black54),
                // ),
                // Text(
                //     'Price: ' + order.price
                // ),
                // Text(
                //     'Điểm đến: ' + order.target
                // ),
              ],
            ),
          ),
        ),
        // share, explore buttons
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Tính năng không hỗ trợ'),
                      content: Text('Hệ thống đang bảo trì, vui lòng thử lại sau'),
                    ),
                    barrierDismissible: true,
                  );
                },
                child:
                  Text(
                    "Nhận đơn",
                    style: TextStyle(fontSize: 12),
                  )
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Tính năng không hỗ trợ'),
                      content: Text('Hệ thống đang bảo trì, vui lòng thử lại sau'),
                    ),
                    barrierDismissible: true,
                  );
                },
                  child:
                  Text(
                    "Lưu kho",
                    style: TextStyle(fontSize: 12),
                  )
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Tính năng không hỗ trợ'),
                        content: Text('Hệ thống đang bảo trì, vui lòng thử lại sau'),
                      ),
                      barrierDismissible: true,
                    );
                  },
                  child:
                  Text(
                    "Bản đồ",
                    style: TextStyle(fontSize: 12),
                  )
              ),
            ],
          ),
      ],
    );
  }
}

class Schedule extends StatefulWidget {
  const Schedule();

  @override
  _CardsDemoState createState() => _CardsDemoState();
}

class _CardsDemoState extends State<Schedule> with RestorationMixin {
  final RestorableBool _isSelected = RestorableBool(false);

  @override
  String get restorationId => 'cards_demo';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_isSelected, 'is_selected');
  }

  @override
  void dispose() {
    _isSelected.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          restorationId: 'cards_demo_list_view',
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            for (final order in orders(context))
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: OrderItem(order: order)
              ),
          ],
        ),
      ),
    );
  }
}

