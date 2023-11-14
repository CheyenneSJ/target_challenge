import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textEC = TextEditingController();
  final editTextEC = TextEditingController();
  final controller = sl<HomeController>();

  @override
  void initState() {
    controller.loadTextList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Observer(builder: (_) {
                      return Container(
                        width: double.infinity,
                        height: 300,
                        margin: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.separated(
                          itemCount: controller.textList.length,
                          itemBuilder: (context, index) {
                            final item = controller.textList[index];
                            return TextListItem(
                              item: item,
                              controller: controller,
                              editTextEC: editTextEC,
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              endIndent: 8,
                              indent: 8,
                              color: AppColors.black,
                            );
                          },
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ),
                      child: TextFormField(
                        maxLines: 3,
                        minLines: 1,
                        controller: textEC,
                        onFieldSubmitted: (value) {
                          controller.addText(value);
                          textEC.clear();
                        },
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Digite seu texto',
                          hintStyle: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: size.width / 2 - 100,
                top: size.height * 0.89,
                child: SizedBox(
                  width: 200,
                  child: TextButton(
                    onPressed: () => launchUrlString('https://google.com.br'),
                    child: const Text('Política de Privacidade'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
