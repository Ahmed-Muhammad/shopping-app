import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:untitled2/core/Shared/constant.dart';

import 'package:untitled2/layouts/home/Widgets/cubit/shop_cubit.dart';
import 'package:untitled2/layouts/home/Widgets/cubit/shop_state.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                width: 310,
                child: ListView.builder(
                  itemBuilder: (context, index) => UserAccountsDrawerHeader(
                    currentAccountPicture: const CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://www.kindpng.com/picc/m/136-1369892_avatar-people-person-business-user-man-character-avatar.png',
                          ),
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/abstract-grunge-decorative-relief-navy-blue-stucco-wall-texture-wide-angle-rough-colored-background_1258-28311.jpg?size=626&ext=jpg')),
                    ),
                    accountName: Text(
                      '${cubit.profileModel!.data!.name!} ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text(
                      '${cubit.profileModel!.data!.email!} ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    arrowColor: Colors.red,
                    currentAccountPictureSize: const Size(70, 70),
                  ),
                  itemCount: 1,
                ),
              ),
              const SizedBox(height: 500,),
              ListTile(
                leading: const Icon(MdiIcons.logout),
                title: const Text('Logout'),
                onTap: ()
                {
                  signOut(context);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
