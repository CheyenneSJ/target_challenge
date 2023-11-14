import 'package:flutter/material.dart';

import '../../../app.dart';

class TextListItem extends StatelessWidget {
  final String item;
  final HomeController controller;
  final TextEditingController editTextEC;
  final int index;

  const TextListItem({
    super.key,
    required this.item,
    required this.controller,
    required this.editTextEC,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              editTextEC.text = item;
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Editar texto'),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.error),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.editText(editTextEC.text, index);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Salvar'),
                        )
                      ],
                      content: TextFormField(
                        controller: editTextEC,
                      ),
                    );
                  });
            },
            child: const Icon(
              Icons.border_color,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Excluir texto'),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                        onPressed: Navigator.of(context).pop,
                        child: const Text('Cancelar'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.error),
                        onPressed: () {
                          controller.removeText(item);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Excluir'),
                      )
                    ],
                    content:
                        const Text('Deseja remover o texto permanentemente?'),
                  );
                },
              );
            },
            child: const Icon(
              Icons.cancel,
              color: AppColors.error,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
