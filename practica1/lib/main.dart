import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Elements Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainActivity(),
    );
  }
}

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int _currentIndex = 0;
  
  final List<Widget> _fragments = [
    TextFieldFragment(),
    ButtonFragment(),
    SelectionFragment(),
    ListFragment(),
    InfoFragment(),
  ];
  
  final List<String> _titles = [
    'TextFields',
    'Botones',
    'Selección',
    'Listas',
    'Información',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: Colors.blue,
      ),
      body: _fragments[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Text'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_button), label: 'Botón'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Select'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lista'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
        ],
      ),
    );
  }
}

// Fragment 1: TextFields
class TextFieldFragment extends StatefulWidget {
  @override
  _TextFieldFragmentState createState() => _TextFieldFragmentState();
}

class _TextFieldFragmentState extends State<TextFieldFragment> {
  final _controller = TextEditingController();
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📝 TextFields (EditText)',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            '💡 Los TextFields permiten al usuario introducir texto. Son útiles para formularios, búsquedas y entrada de datos.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Escribe algo aquí',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.edit),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _displayText = _controller.text;
              });
            },
            child: Text('Mostrar Texto'),
          ),
          SizedBox(height: 16),
          if (_displayText.isNotEmpty)
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('Escribiste: $_displayText'),
            ),
        ],
      ),
    );
  }
}

// Fragment 2: Botones
class ButtonFragment extends StatefulWidget {
  @override
  _ButtonFragmentState createState() => _ButtonFragmentState();
}

class _ButtonFragmentState extends State<ButtonFragment> {
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎨 Botones',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            '💡 Los botones permiten al usuario realizar acciones. Son elementos interactivos fundamentales en cualquier interfaz.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _message = 'Botón Elevado presionado!';
              });
            },
            child: Text('Botón Elevado'),
          ),
          SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {
              setState(() {
                _message = 'Botón Outline presionado!';
              });
            },
            child: Text('Botón Outline'),
          ),
          SizedBox(height: 12),
          TextButton(
            onPressed: () {
              setState(() {
                _message = 'Botón de Texto presionado!';
              });
            },
            child: Text('Botón de Texto'),
          ),
          SizedBox(height: 12),
          IconButton(
            onPressed: () {
              setState(() {
                _message = 'Botón de Icono presionado!';
              });
            },
            icon: Icon(Icons.favorite, color: Colors.red),
            iconSize: 40,
          ),
          SizedBox(height: 16),
          if (_message.isNotEmpty)
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(_message),
            ),
        ],
      ),
    );
  }
}

// Fragment 3: Elementos de Selección
class SelectionFragment extends StatefulWidget {
  @override
  _SelectionFragmentState createState() => _SelectionFragmentState();
}

class _SelectionFragmentState extends State<SelectionFragment> {
  bool _checkboxValue = false;
  bool _switchValue = false;
  String _radioValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '⚡ Elementos de Selección',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            '💡 Permiten al usuario elegir opciones. CheckBox para múltiples opciones, RadioButton para una sola opción.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          CheckboxListTile(
            title: Text('Acepto términos y condiciones'),
            value: _checkboxValue,
            onChanged: (value) {
              setState(() {
                _checkboxValue = value ?? false;
              });
            },
          ),
          SwitchListTile(
            title: Text('Recibir notificaciones'),
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
          SizedBox(height: 16),
          Text('Selecciona tu color favorito:'),
          RadioListTile<String>(
            title: Text('Rojo'),
            value: 'rojo',
            groupValue: _radioValue,
            onChanged: (value) {
              setState(() {
                _radioValue = value ?? '';
              });
            },
          ),
          RadioListTile<String>(
            title: Text('Azul'),
            value: 'azul',
            groupValue: _radioValue,
            onChanged: (value) {
              setState(() {
                _radioValue = value ?? '';
              });
            },
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Estado actual:'),
                Text('Checkbox: ${_checkboxValue ? "Marcado" : "No marcado"}'),
                Text('Switch: ${_switchValue ? "Activado" : "Desactivado"}'),
                Text('Radio: ${_radioValue.isEmpty ? "Ninguno" : _radioValue}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Fragment 4: Lista
class ListFragment extends StatelessWidget {
  final List<String> _items = [
    'Elemento 1', 'Elemento 2', 'Elemento 3', 'Elemento 4', 'Elemento 5',
    'Elemento 6', 'Elemento 7', 'Elemento 8', 'Elemento 9', 'Elemento 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📋 Listas',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            '💡 Las listas muestran múltiples elementos de forma organizada. Permiten scroll cuando hay muchos elementos.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(_items[index]),
                    subtitle: Text('Descripción del elemento ${index + 1}'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tocaste ${_items[index]}')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Fragment 5: Elementos de Información
class InfoFragment extends StatefulWidget {
  @override
  _InfoFragmentState createState() => _InfoFragmentState();
}

class _InfoFragmentState extends State<InfoFragment>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  double _progress = 0.3;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📊 Elementos de Información',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            '💡 Muestran información al usuario. TextView para texto, ImageView para imágenes, ProgressBar para progreso.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.info, size: 40, color: Colors.blue),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Este es un TextView que muestra información importante al usuario.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Barra de Progreso:'),
          SizedBox(height: 8),
          LinearProgressIndicator(value: _progress),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _progress = (_progress + 0.1).clamp(0.0, 1.0);
                  });
                },
                child: Text('+'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _progress = (_progress - 0.1).clamp(0.0, 1.0);
                  });
                },
                child: Text('-'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Progreso circular:'),
          SizedBox(height: 8),
          Center(
            child: AnimatedBuilder(
              animation: _progressController,
              builder: (context, child) {
                return CircularProgressIndicator(
                  value: _progressController.value,
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Text('Progreso: ${(_progress * 100).toInt()}%'),
        ],
      ),
    );
  }
}