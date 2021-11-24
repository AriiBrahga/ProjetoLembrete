import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter/widgets.dart';
import 'dart:core';


class CustomDrawer extends StatelessWidget {  
  
  @override
  Widget build(BuildContext context) {
    
    
    
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                height: 200,
                width: double.infinity, 
                image: AssetImage('images/fundo.jpg'),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3, 
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('images/user.jpg'),
                            fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 6,),
                    /*Text(
                      obj.usuario,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Murais'),
                onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  'telaPrincipal',
                  
                );
              },
            ),

          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  'telaconfig',
                  
                );
              },
            ),
          ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Ajuda'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  'telaAjuda',
                
                );
              },
            ),
          ListTile(
              leading: Icon(Icons.info_sharp),
              title: Text('Sobre'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  'sobre',
                
                );
              },
            ),
                       
            
          Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(                        
                  leading: Icon(Icons.exit_to_app),
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                ),                          
              ), 
            ),
        ],
      ),
    );
  }
}