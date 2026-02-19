import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';

/// Clase NeuBox
///
/// `NeuBox` es un widget que crea un contenedor con efecto neumórfico.
/// Este efecto se logra mediante sombras claras y oscuras, que hacen que
/// el contenedor parezca elevado o incrustado en la pantalla.
///
/// - Crea un fondo con sombras para dar un efecto tridimensional.
/// - Permite incluir un widget dentro (por ejemplo, un icono o un botón).
/// - Usa el color de fondo del tema actual para mayor flexibilidad.
class NeuBox extends StatelessWidget {
  /// Widget hijo dentro del NeuBox
  /// - Es el contenido que estará dentro del `NeuBox` (puede ser un `Icon`, `Text`, etc.).
  /// - Se pasa como parámetro en el constructor.
  final Widget? child;

  /// Constructor de NeuBox
  /// - Se usa `required` para obligar a que `child` sea proporcionado.
  /// - `super.key` se pasa al constructor de `StatelessWidget` para gestionar la clave del

  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Modo oscuro
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // Darker shadow on bottom right
          BoxShadow(
            color: isDarkMode ? Colors.black : Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4),
          ),
          // Lighter shadow on top left
          BoxShadow(
            color: isDarkMode ? Colors.grey.shade800 : Colors.white,
            blurRadius: 15,
            offset: const Offset(-4, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: child, // El child será el icono, que es obligatorio (required)
    );
  }
}
