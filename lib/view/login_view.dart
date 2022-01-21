
import 'dart:ffi';
import 'package:flutter/material.dart';
class  _MyHomePage extends State<StatefulWidget> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

//  密码显示按钮
  @override
   initState() {
    usernameController  = TextEditingController();
    passwordController  = TextEditingController();
  }
//  密码查看
  late  bool _showPassword = true;
  void _togglePasswordVisibility(){
    setState((){
      _showPassword = !_showPassword;
    });
  }


//  发送账号密码
  var username; //账号
  var password; //密码
  var UsernameTips ='   请输入账号';
  var PasswordTips ='   请输入密码';
  var num;  //账号得长度
  var nums;  //密码得长度
  late bool numlenth =true; //账号得判断
  late bool numslenth =true;  //密码得判断
  void loginbtton() {
    setState(() {
      username =usernameController.text;
      password =passwordController.text;
    });
    if(username==123456.toString() && password=='admin' ){
      print('登录成功'+username);
    }else{
      print('登录失败'+password);
    }
  }
//  监听账号框
  void InputUser (){
    setState(() {
      num =usernameController.text.length;
      if(num != 0 ){
        numlenth =false;
      }
    });
    if(num ==0 ){
      numlenth =true;
    }
    // print(num.toString());
  }
//  监听密码框
  void Inputpass (){
    setState(() {
      nums =passwordController.text.length;
      if(nums != 0 ){
        numslenth =false;
      }
    });
    if(nums ==0 ){
      numslenth =true;
    }
    // print(num.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 26, top: 20, right: 26, bottom: 0,),
        child: Column(
          children: [
            Container(
              height: 210,
              child: Image.asset('images/home-image.png', fit: BoxFit.cover,),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                  left: 20, top: 0, right: 20, bottom: 0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    // height:60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(242, 242, 242, 1),
                              offset: Offset(0.0, 0.0),
                              blurRadius: 15.0,
                              spreadRadius: 1
                          )
                        ]
                    ),
                    child: TextField(
                      controller: usernameController,
                      onChanged: (text) {
                        InputUser();
                      },
                      maxLength: 12,
                      decoration: InputDecoration(
                        errorText: numlenth ? UsernameTips  :"" ,
                        // 右测按钮4
                          suffixIcon: IconButton(
                              onPressed: () {
                                usernameController.clear();
                                InputUser();
                              },
                              icon: const Icon(Icons.close)
                          ),
                          fillColor: const Color.fromRGBO(255, 255, 255, 1),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(
                                  30))
                          ),
                          prefixIcon: const Icon(Icons.perm_identity),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 1
                          ),
                          filled: true,
                          hintText: 'Username',
                          hintStyle: const TextStyle(color: Color.fromRGBO(172,
                              172,
                              172, 1))
                      ),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    // height:60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(242, 242, 242, 1),
                              offset: Offset(0.0, 0.0),
                              blurRadius: 15.0,
                              spreadRadius: 1
                          )
                        ]
                    ),
                    child:  TextField(
                      controller: passwordController,
                        maxLength: 8,
                        obscureText: _showPassword,
                        onChanged: (text){
                          Inputpass();
                        },
                        decoration: InputDecoration(
                            errorText: numslenth ? PasswordTips : "",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _togglePasswordVisibility();
                                },
                              icon: _showPassword
                                ? const Icon(Icons.explore_off)
                                : const Icon(Icons.explore),
                    ),
                                // icon: const Icon(Icons.explore_off)

                            fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    30))
                            ),
                            prefixIcon: const Icon(Icons.lock),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 1
                            ),
                            filled: true,
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Color.fromRGBO(172, 172,
                                172, 1))
                        ),
                        style: const TextStyle(fontSize: 18,)
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: const BoxDecoration(
                      // color: Colors.pink
                    ),
                    width: 316,
                    height: 55,
                    child: TextButton(
                      onPressed: () {
                        loginbtton();
                      },
                      child: const Text('SIGN IN'),
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          // 按钮字体
                          foregroundColor: MaterialStateProperty.all(
                              Colors.white),
                          // 按钮背景
                          backgroundColor: MaterialStateProperty.all(
                              Colors.lightBlueAccent),
                          // 按钮边框
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30
                                  )
                              )
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: const Text('Don have an account?', style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(180, 182, 186, 1))),

                    decoration: const BoxDecoration(

                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    child: const Text('SIGN UP NOW',
                        style: TextStyle(fontSize: 16, color: Colors.blue)),

                    decoration: const BoxDecoration(

                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    child: const Text('Terms and Conditions', style: TextStyle(
                        color: Color.fromRGBO(180, 182, 186, 1))),

                    decoration: const BoxDecoration(

                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePage createState() {

    return _MyHomePage();
  }
}



