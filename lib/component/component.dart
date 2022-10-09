import 'package:flutter/material.dart';


Widget defaultFormField({
  required TextEditingController? controller,
   TextInputType? type,
  ValueChanged<String>? onSubmit,
  FormFieldValidator<String>? onChange,
  bool isPassword = false,
  required String? Function(String?)? validate,
  String? label,
   IconData? prefix,
  TextStyle? style,
  IconData? suffix,
  Function? suffixpress,
  Widget? suffixIcon,
  int maxLines =1,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 4,right: 4,),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        maxLines: maxLines,
  

        validator: 
          validate!,
        
        style: style,
        decoration: InputDecoration(
       

          suffixIcon: suffixIcon,

          focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color:   Colors.blueGrey.shade900,
                    width: 3.0,
                  ),
                ),
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),

            borderSide: BorderSide(
              color: Colors.blueGrey.shade900,
            ),
          ),
        ),
      ),
    );




class NametextForm extends StatelessWidget {
  String? name;
  NametextForm({
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23, top: 10),
          child: Text(
            name!,
            style: TextStyle(
                // color: Color(0xff1A2552),
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w700,
                fontFamily: 'jannah'),
          ),
        ),
      ],
    );
  }
}



class Profile_button extends StatelessWidget {
  IconData? icon;
  String ?name;
  void Function()? press;
  double? width;

  Profile_button({this.icon, this.name, this.press, this.width});

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:Colors.blueGrey,
          onPrimary: Colors.grey,
          padding: EdgeInsets.only(
            top: 15,
            bottom: 9,
          ),


          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name!,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white60,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: width,
            ),

          ],
        ),
        onPressed: press!,
      ),
    );
  }
}
