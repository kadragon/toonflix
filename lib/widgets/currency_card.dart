import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final int order;

  final _blackColor = const Color(0xFF1F2123);

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -20 * order.toDouble()),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: order.isOdd ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: order.isOdd ? _blackColor : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: order.isOdd ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        code,
                        style: TextStyle(
                          color:
                              order.isOdd
                                  ? _blackColor
                                  : Colors.white.withValues(alpha: 0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    icon,
                    color: order.isOdd ? _blackColor : Colors.white,
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyCardList extends StatelessWidget {
  const CurrencyCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> currencies = [
      {
        "name": "Euro",
        "code": "EUR",
        "amount": "6,428",
        "icon": Icons.euro_rounded,
      },
      {
        "name": "Bitcoin",
        "code": "BTC",
        "amount": "9,785",
        "icon": Icons.currency_bitcoin_rounded,
      },
      {
        "name": "Dollar",
        "code": "USD",
        "amount": "428",
        "icon": Icons.attach_money_rounded,
      },
    ];

    return Column(
      children:
          currencies.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> currency = entry.value;
            return CurrencyCard(
              name: currency["name"],
              code: currency["code"],
              amount: currency["amount"],
              icon: currency["icon"],
              order: index,
            );
          }).toList(),
    );
  }
}
