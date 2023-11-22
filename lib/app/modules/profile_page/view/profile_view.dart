import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:tokosebelah/app/modules/login_pages/view/login_view.dart';
import 'package:tokosebelah/app/modules/product_page/product_page.dart';
import 'package:tokosebelah/app/modules/profile_page/bloc/profile_bloc.dart';
import 'package:tokosebelah/utils/constans.dart';

class ProfileView extends StatelessWidget {
  static const routeName = "/profile";
  ProfileView({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton.filled(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductPage()),
                    ModalRoute.withName('/product'));
              },
              icon: const Icon(Icons.card_giftcard_rounded)),
          actions: [
            IconButton.filled(
                onPressed: () {
                  context.read<ProfileBloc>().logOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                      ModalRoute.withName('/login'));
                },
                icon: const Icon(Icons.exit_to_app_outlined)),
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          switch (state.status) {
            case GlobalSatus.initial:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case GlobalSatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case GlobalSatus.success:
              return SafeArea(
                  child: SingleChildScrollView(
                controller: _scrollController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Markdown(
                    controller: _scrollController,
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
                    shrinkWrap: true,
                    data: """ ![](${state.profileModels?.image}) 
# Mr **${state.profileModels?.username}**
>  ${state.profileModels?.email}

# Biodata

| ${state.profileModels?.firstName} ${state.profileModels?.lastName}  | Value |
| ------------- |:-------------:|
| Age      | ${state.profileModels?.age}      |
| Birthday      | ${state.profileModels?.birthday}     |
| Gender      | ${state.profileModels?.gender}     |
| Height      | ${state.profileModels?.height}     |
| Weight      | ${state.profileModels?.weight}     |
| School      | ${state.profileModels?.university}     |
| Phone      | ${state.profileModels?.phone}     |

# Network
```
${state.profileModels?.ip}
${state.profileModels?.macAddress}
${state.profileModels?.domain}
${state.profileModels?.userAgent}
```
                  """),
              ));
            case GlobalSatus.failure:
              return const Center(
                child: Text("Error"),
              );
            default:
              return const Center(
                child: Text("Shometing wrong"),
              );
          }
        }));
  }
}
