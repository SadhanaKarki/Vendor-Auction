
import 'package:flutter/material.dart';
import 'package:fyp/Pages/user_registration/user_registration.dart';
import 'package:fyp/Pages/home/ui/homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
         icon: Icon(Icons.arrow_back), // Your leading icon
         onPressed: () {
           Navigator.pop(context);
         },
        ),
        title:  Center(child: Text('Sign In ',style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 83, 82, 82)),)), 
      ),
      body: Center(
        child: Container(
          height: 530,
          width: 390,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Login(),

        )),

    );
  }
   //Custom Widget
 
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey =GlobalKey<FormState>();
    TextEditingController username= TextEditingController();
   TextEditingController password= TextEditingController();

   bool _isPasswordVisible = false; 
   
   //Regular expn for email validation
     String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  @override

  void dispose(){
      username.dispose();
      password.dispose();
      super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formkey,
      child:
           ListView(
              padding:const  EdgeInsets.only(top: 15,bottom: 20,left: 40,right: 40),
              children: [
                Center(child: Text('Welcome', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 0, 0, 0)),)),
                const SizedBox(height: 10,),
                Center(child: Text("Sign in with your username and password",style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 83, 82, 82)),),),
                const SizedBox(height: 20,),
                Expanded(
                  child: TextFormField(
                    controller: username,
                    decoration:  InputDecoration(
                      labelText: 'Username',
                      hintText: 'enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )  
                    ),
                    keyboardType: TextInputType.text,
                    validator:(value) {
                      if(value!.isEmpty){
                        return"Please enter your username";
                      }
                      return null;
                    }
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: TextFormField(
                    controller: password,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      labelText: 'Password',
                      hintText: 'enter your password',
                      suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility 
                        : Icons.visibility_off, 
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible; 
                    });
                  },
                ),
              ),
                    validator:(value) {
                      if(value!.isEmpty){
                        return"Please enter your password";
                      }
                      else if(value.length<8){
                        return"Your password must be 8 characters or more";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16,),
                TextButton(
                  onPressed: (){}, 
                  child: Text("Forgot Password?",style: TextStyle(),)
                  ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Homepage()),
                     );
                    }
                     
                  }, 
                 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                   child: Container(
                    height: 40,
                    width: 80,
                    child: const Center(child: Text('Log in' , style: TextStyle(color: Colors.white),))),
                  ),
                const SizedBox(height: 25,), 
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: TextStyle(
                      fontSize: 15,color: Colors.black
                    ),),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserRegistration()),);
                      }, 
                      child: Text("Sign Up",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue),)
                     )
                  ],
                ),
                
            
              ],
            )
    );
  }
}