import 'package:flutter/material.dart';
import '../../apis/auth_api.dart';



class PaymentOptionsRow extends StatefulWidget {
  final String? trailingText;
  final Widget? trailingWidget;

  const PaymentOptionsRow({Key? key, this.trailingText, this.trailingWidget})
      : super(key: key);

  @override
  State<PaymentOptionsRow> createState() => _PaymentOptionsRowState();
}

class _PaymentOptionsRowState extends State<PaymentOptionsRow> {
  String? _selectedPayment;
  final List<String> _paymentOptions = [
    'PayPal',
  ];
  String _paypalEmail = 'user@example.com';
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _selectedPayment = 'PayPal';
    _emailController = TextEditingController(text: _paypalEmail);
    _initializeEmail();
  }

  Future<void> _initializeEmail() async {
    final authAPI = AuthAPI();
    final currentUser = await authAPI.getCurrentUserInstance();
    if (currentUser?.email != null) {
      setState(() {
        _paypalEmail = currentUser!.email!;
        _emailController.text = _paypalEmail;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.green,
      title: Row(
        children: [
          const Text(
            'Payment',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7C7C7C),
            ),
          ),
          const Spacer(),
          widget.trailingText != null
              ? Text(
                  widget.trailingText!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )
              : (widget.trailingWidget ?? Container()),
        ],
      ),
      children: [
        ..._paymentOptions.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: _selectedPayment,
            onChanged: (value) {
              setState(() {
                _selectedPayment = value;
              });
            },
          );
        }).toList(),
        if (_selectedPayment == 'PayPal')
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              controller: _emailController,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'PayPal Email',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
      ],
    );
  }
}

