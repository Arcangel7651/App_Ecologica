# App Ecológica (EcoX)

Aplicación móvil desarrollada en Flutter que reúne, en un solo lugar, la
organización de actividades de conservación ambiental, un mercado de segunda
mano y un foro de preguntas y respuestas para una comunidad ecológica.

## Stack / Tecnologías

- **Lenguaje:** Dart (SDK `>=3.3.3 <4.0.0`)
- **Framework:** Flutter (Material Design)
- **Backend (BaaS):** Supabase — Autenticación, base de datos PostgreSQL y
  Storage, mediante `supabase_flutter`
- **Almacenamiento local:** `shared_preferences` (persistencia del ID de sesión)
- **Utilidades:**
  - `flutter_dotenv` — carga de variables de entorno
  - `image_picker` — selección de imágenes desde el dispositivo
  - `intl` — formato de fechas
  - `app_links` — manejo de deep links
  - `flutter_launcher_icons` — generación del icono de la app
- **Calidad de código:** `flutter_lints`

> Nota: `shared_preferences` se utiliza en el código pero no está declarado en
> `pubspec.yaml`. Debe añadirse a las dependencias para poder compilar (ver
> sección *Cómo ejecutarlo*).

## Características principales

- **Autenticación de usuarios:** registro e inicio de sesión con Supabase Auth,
  y perfil extendido en la tabla `usuario`.
- **Actividades de conservación:** creación, edición, listado y eliminación de
  actividades (limpieza, reciclaje, educación, plantación), con inscripción de
  participantes y control de cupos disponibles.
- **Mercado (marketplace):** publicación, edición y eliminación de artículos de
  segunda mano con categorías, precio, ubicación e imágenes almacenadas en
  Supabase Storage.
- **Foro de preguntas y respuestas:** los usuarios pueden publicar preguntas y
  responder a las de otros miembros de la comunidad.
- **Mis publicaciones:** vista para gestionar las actividades y artículos
  creados por el usuario autenticado.
- **Navegación por pestañas:** eventos, mercado, preguntas, perfil y
  publicaciones desde una barra de navegación inferior.

## Cómo ejecutarlo

Requisitos previos: tener instalado el [SDK de Flutter](https://docs.flutter.dev/get-started/install)
(Dart `>=3.3.3`) y un proyecto de Supabase con las tablas correspondientes
`[POR CONFIRMAR: esquema de base de datos]`.

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/Arcangel7651/App_Ecologica.git
   cd App_Ecologica
   ```

2. Instalar las dependencias:

   ```bash
   flutter pub get
   ```

3. Añadir `shared_preferences` a las dependencias (necesario para compilar):

   ```bash
   flutter pub add shared_preferences
   ```

4. Crear el archivo `.env` a partir de la plantilla y completar los valores
   reales desde el panel de Supabase (*Project Settings → API*):

   ```bash
   cp .env.example .env
   ```

   Variables requeridas:

   | Variable | Descripción |
   |----------|-------------|
   | `SUPABASE_URL` | URL del proyecto de Supabase |
   | `SUPABASE_ANON_KEY` | Llave pública `anon` |
   | `SUPABASE_STORAGE_BUCKET` | Nombre del bucket de imágenes (por defecto `markedplace`) |

5. Ejecutar la aplicación en un emulador o dispositivo conectado:

   ```bash
   flutter run
   ```

## Estructura del proyecto

```
lib/
├── main.dart            Punto de entrada; inicializa dotenv y Supabase
├── config/              Definición de rutas de navegación
├── models/              Modelos de datos (usuario, artículo, actividad, preguntas...)
├── services/            Lógica de acceso a Supabase (auth, artículos, actividades, preguntas)
├── screens/             Pantallas de la aplicación (login, mercado, eventos, foro, perfil...)
├── widgets/             Componentes reutilizables de UI (tarjetas, diálogos...)
├── constants/           Categorías y constantes
└── atributos/           Datos de usuario en memoria
```

## Capturas / Demo

[CAPTURAS / DEMO — pendiente de añadir imágenes o enlace a demo en vivo]

---

### Topics sugeridos para GitHub

`flutter` · `dart` · `supabase` · `mobile-app` · `postgresql` · `android` ·
`ios` · `material-design` · `flutter-dotenv` · `crud`
</content>
</invoke>
