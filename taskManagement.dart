import 'dart:io';

void main() {
  List<String> taks = [];

  bool isRunning = true;

  while (isRunning) {
    print('Gerenciamento de tarefas:');
    print('1. Adicionar Tarefa');
    print('2. Listar Tarefas');
    print('3. Remover Tarefa');
    print('4. Sair');

    stdout.write('Escolha uma tarefa: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Digite a tarefa: ');

        String? digitTask = stdin.readLineSync();

        if (digitTask != null && !digitTask.isEmpty) {
          taks.add(digitTask);

          print('Task adicionada: $digitTask');

          break;
        }

        print('Tarefa inválida.');

        break;

      case '2':
        if (haveTasks(taks)) return print('Não á tarefas para ser listadas.');

        print('Lista de tarefas:\n');

        taks.forEach((tasks) {
          print(tasks);
        });

        break;

      case '3':
        if (taks.isEmpty) {
          print('Não há tarefas para serem deletadas.');
          break;
        }

        int index = 0;
        taks.forEach((task) {
          print('$index - $task');
          index++;
        });

        stdout.write('Qual tarefa você deseja deletar: ');

        String? value = stdin.readLineSync();

        if (value != null && value.isNotEmpty) {
          try {
            int valueDigit = int.parse(value);

            if (valueDigit < 0 || valueDigit >= taks.length) {
              print('Valor digitado não disponível.');
            } else {
              taks.removeAt(valueDigit);
              print('Tarefa deletada!');
            }
          } catch (e) {
            print('Entrada inválida: $e');
          }
        } else {
          print('Nenhum valor inserido.');
        }

      case '4':
        isRunning = false;

        break;
    }
  }
}

bool haveTasks(List<String> array) {
  return array.isEmpty;
}
