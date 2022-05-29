import 'package:ecommerce/widget/custom_appbar.dart';
import 'package:ecommerce/widget/order_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const String routeName = '/checkout';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailContoller = TextEditingController();
    final TextEditingController nameContoller = TextEditingController();
    final TextEditingController addressContoller = TextEditingController();
    final TextEditingController cityContoller = TextEditingController();
    final TextEditingController countryContoller = TextEditingController();
    final TextEditingController zipCodeContoller = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: "Checkout"),
     
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "CUSTOMER INFORMATION",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildTextFormField(emailContoller, context, "email"),
            _buildTextFormField(nameContoller, context, "full name"),
            Text(
              "DELEVERY INFORMATION",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _buildTextFormField(addressContoller, context, "address"),
            _buildTextFormField(cityContoller, context, "city"),
            _buildTextFormField(countryContoller, context, "country"),
            _buildTextFormField(zipCodeContoller, context, "zipCode"),
            Text(
              "ORDER SUMMARY",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            OrderSummary()
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(TextEditingController controller,
      BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(labelText),
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 18),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ))
        ],
      ),
    );
  }
}
