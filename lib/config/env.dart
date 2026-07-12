// lib/config/env.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Acceso centralizado a las variables de entorno definidas en `.env`.
/// Cargar `dotenv` en `main()` antes de usar estas propiedades.
class Env {
  Env._();

  /// URL del proyecto de Supabase.
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';

  /// Llave pública `anon` de Supabase.
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  /// Bucket de Supabase Storage para imágenes de artículos y actividades.
  static String get storageBucket =>
      dotenv.env['SUPABASE_STORAGE_BUCKET'] ?? 'markedplace';
}
