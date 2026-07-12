# App Ecológica (EcoX)

Aplicación móvil desarrollada en Flutter que reúne, en un solo lugar, la
organización de actividades de conservación ambiental, un mercado de segunda
mano y un foro de preguntas y respuestas para una comunidad ecológica.

## Contexto

Proyecto académico desarrollado para la asignatura de **TSP (Team Software
Process)** en la **Universidad Autónoma de Zacatecas**. Se trabajó en equipo
(IguanoSquad, 4 integrantes) siguiendo un proceso formal de ingeniería de
software: levantamiento de requisitos, diseño, implementación, pruebas y
validación por iteraciones.

El equipo se organizó con roles definidos según TSP: líder de equipo, líder de
calidad, líder de colaboración y líder técnico. Mi rol fue el de **líder
técnico**, responsable de las decisiones de arquitectura y diseño de la
solución, la coordinación técnica del desarrollo y la revisión del trabajo del
equipo. La documentación de ingeniería está en la carpeta [`docs/`](docs/).

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

## Arquitectura

El proyecto sigue una **arquitectura por capas** que separa datos, acceso a
datos e interfaz:

- **Modelos** (`models/`): clases de datos con serialización `fromJson`/`toJson`.
- **Servicios** (`services/`): acceso a datos y lógica contra Supabase (capa de
  datos).
- **Vistas** (`screens/`, `widgets/`): interfaz en Flutter con gestión de estado
  local mediante `setState`.

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
(Dart `>=3.3.3`) y un proyecto de Supabase con las tablas correspondientes. El
esquema de la base de datos está documentado en el
[SDD](docs/IguanoSquad_Iteracion_3/IguanoSquad_SDD_V3.0.pdf).

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/Arcangel7651/App_Ecologica.git
   cd App_Ecologica
   ```

2. Instalar las dependencias:

   ```bash
   flutter pub get
   ```

3. Crear el archivo `.env` a partir de la plantilla y completar los valores
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

4. Ejecutar la aplicación en un emulador o dispositivo conectado:

   ```bash
   flutter run
   ```

## Documentación

Documentación de ingeniería del proyecto, disponible en la carpeta
[`docs/`](docs/):

- [Problemática (Design Thinking)](docs/IguanoSquad_Design_Thinking/IguanoSquad_Problem%C3%A1tica_v1.0.pdf) — planteamiento del problema
- [Planeación del proyecto](docs/IguanoSquad_Planeaci%C3%B3n_Proyecto/IguanoSquad_Planeaci%C3%B3n_Proyecto_v1.1.pdf) — alcance y planificación
- [SRS](docs/IguanoSquad_Iteracion_3/IguanoSquad_System_Requirements_Specification_v3.0.pdf) — especificación de requisitos del sistema
- [SDD](docs/IguanoSquad_Iteracion_3/IguanoSquad_SDD_V3.0.pdf) — documento de diseño de software
- [Matriz de trazabilidad](docs/IguanoSquad_Iteracion_3/IguanoSquad_MatrizTrazabilidad_v3.0.xlsx) — requisitos vs. casos de uso
- [Plan de IVV](docs/IguanoSquad_Iteracion_3/IguanoSquad_Plan_IVV_v1.2.pdf) y [casos de prueba](docs/IguanoSquad_Iteracion_3/Pruebas/) — pruebas unitarias e integración
- [Guía de operación del sistema](docs/IguanoSquad_Iteracion_3/IguanoSquad_guia_de_operacion_del_sistema_v1.1.pdf) — manual de uso


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
