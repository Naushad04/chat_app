import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/controller/image_picker_controller.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/view/screen/login_screen/login_screen.dart';
import 'package:chat_app/view/screen/registration_screen/registration_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final ImagePickerController imagePickerController =
  Get.put(ImagePickerController());

  bool obscureText = true;
  final List<String> maritalStatusOptions = [
    'Single',
    'Married',
    'Divorced',
    'Widowed',
    'Separated'
  ];

  // Currently selected marital status
  String selectedStatus = "";
  @override
  Widget build(BuildContext context) {
    var view = RegistrationScreenWidget();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.055),
                // Text(
                //   'Registration an Account',
                //   style: TextStyle(color:Colors.blue, fontSize: 25, fontWeight: FontWeight.w700),
                // ),
                SizedBox(height: height * 0.012),
                Center(
                  child: Stack(alignment: Alignment.bottomRight, children: [
                    Container(
                      width: width * 0.25,
                      height: height * 0.12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: GetBuilder<ImagePickerController>(
                        builder: (controller) {
                          // Check if userImagePath is null or empty before displaying the image
                          return (controller.userImagePath != null)
                              ? ClipOval(
                                  child: Image.file(
                                    controller.userImagePath!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Icon(Icons.person, size: 60, color: Colors.white,); // Show camera icon when image is not available
                        },
                      ),
                    ),
                    Positioned(
                      top: height * 0.055,
                      child: Container(
                        width: width * 0.090,
                        height: height * 0.090,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey.shade300),
                        child: GestureDetector(
                            onTap: () {
                              imagePickerController.vehicleImageImagePicker();
                            },
                            child: Icon(
                              Icons.camera_alt,
                              size: 15,
                            )),
                      ),
                    )
                  ]),
                ),
                SizedBox(height: height * 0.020),
                view.textFiled(hint: 'Name', controller: nameController),
                SizedBox(height: 16),
                view.textFiled(hint: 'Email', controller: emailController),
                SizedBox(height: 16),
                view.textFiled(hint: 'Age', controller: ageController),
                SizedBox(height: 16),
                view.textFiled(hint: 'Bio', controller: bioController),
                SizedBox(height: 16),
                view.textFiled(hint: 'Address', controller: addressController),
                SizedBox(height: 16),
                view.dropDownTextField(
                    selectedStatus: selectedStatus,
                    maritalStatusOptions: maritalStatusOptions,
                    setState: setState
                ),
                SizedBox(height: 16),
                view.passwordTextField(hint: 'Password', obscureText: obscureText, controller: passwordController),
                SizedBox(height: 25),
                view.loginButton(
                    onPressed: () {
                      textFieldValidation();
                    },
                    text: 'Registration'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Get.to(
                            LoginScreen(),
                            transition: Transition.fade,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.bounceOut
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  textFieldValidation(){
    final imagePickerController = Get.find<ImagePickerController>();
    if(imagePickerController.userImagePath == null){
      Get.snackbar(
        'Please select an profile picture',
        '',
        barBlur: 1.0,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        shouldIconPulse: true,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
        overlayBlur: 1.0,
        animationDuration: Duration(seconds: 1),
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.easeInOutBack,
        duration: Duration(seconds: 2),
      );
    }
    else if(nameController.text.isEmpty){
      Get.snackbar(
        'Please enter name',
        '',
        barBlur: 1.0,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        shouldIconPulse: true,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
        overlayBlur: 1.0,
        animationDuration: Duration(seconds: 1),
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.easeInOutBack,
      );
    }
    else if(emailController.text.isEmpty){
      Get.snackbar(
        'Please enter email',
        '',
        barBlur: 1.0,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        shouldIconPulse: true,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
        overlayBlur: 1.0,
        animationDuration: Duration(seconds: 1),
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.easeInOutBack,
      );
    }
    else if(ageController.text.isEmpty){
      Get.snackbar(
        'Please enter age',
        '',
        barBlur: 1.0,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        shouldIconPulse: true,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
        overlayBlur: 1.0,
        animationDuration: Duration(seconds: 1),
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.easeInOutBack,
      );
    }
    else if(bioController.text.isEmpty){
      Get.snackbar(
        'Please enter bio',
        '',
        barBlur: 1.0,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        shouldIconPulse: true,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
        overlayBlur: 1.0,
        animationDuration: Duration(seconds: 1),
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.easeInOutBack,
      );
    }
    else if(addressController.text.isEmpty){
      Get.snackbar(
        'Please enter address',
        '',
        barBlur: 1.0,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        shouldIconPulse: true,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
        overlayBlur: 1.0,
        animationDuration: Duration(seconds: 1),
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.easeInOutBack,
      );
    }
    else if(selectedStatus == " "){
      Get.snackbar(
        'Please select a merital status',
        '',
        barBlur: 1.0,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        shouldIconPulse: true,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
        overlayBlur: 1.0,
        animationDuration: Duration(seconds: 1),
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.easeInOutBack,
      );
    }
    else if(passwordController.text.isEmpty){
      Get.snackbar(
        'Please new password',
        '',
        barBlur: 1.0,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        shouldIconPulse: true,
        icon: Icon(Icons.error_outline_outlined, color: Colors.red,),
        overlayBlur: 1.0,
        animationDuration: Duration(seconds: 1),
        forwardAnimationCurve: Curves.bounceInOut,
        reverseAnimationCurve: Curves.easeInOutBack,
      );
    }
    else{
      UserModel user = UserModel(
          name: nameController.text.toString(),
          email: emailController.text.toString(),
          age: ageController.text.toString(),
          address: addressController.text.toString(),
          bio: bioController.text.toString(),
          maritalStatus: selectedStatus.toString(),
          password: passwordController.text.toString()
      );
      AuthController().registration(user);
    }
  }

}
