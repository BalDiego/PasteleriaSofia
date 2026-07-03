# 🎂 Pastelería Sofía

> Aplicación móvil desarrollada en **SwiftUI** para la gestión y administración de encargos de una pastelería, permitiendo registrar, consultar, organizar y dar seguimiento a los pedidos de los clientes desde una interfaz moderna e intuitiva.

---

# 📖 Descripción

Pastelería Sofía es un prototipo funcional desarrollado como parte de un proyecto académico de Ingeniería en Sistemas. Su objetivo es digitalizar el proceso de gestión de encargos realizado por una pastelería, reemplazando el registro manual en papel o mediante aplicaciones de mensajería por un sistema móvil organizado y fácil de utilizar.

La aplicación centraliza toda la información relacionada con los clientes y sus pedidos, permitiendo visualizar los encargos pendientes, consultar el calendario de entregas y administrar el estado de cada pedido.

---

# 🚩 Problemática que Soluciona

Muchas pequeñas pastelerías administran sus pedidos de manera manual, utilizando agendas físicas, hojas de cálculo o conversaciones de WhatsApp, lo que provoca problemas como:

- Pérdida de información de clientes.
- Dificultad para organizar las entregas.
- Omisión de detalles importantes del pedido.
- Errores en los montos pendientes de pago.
- Falta de control sobre los pedidos entregados y cancelados.
- Dificultad para consultar pedidos anteriores.

Pastelería Sofía propone una solución digital que permite registrar cada encargo de forma estructurada, reduciendo errores y mejorando la organización del negocio.

---

# 🎯 Objetivo General

Desarrollar una aplicación móvil que facilite el registro, organización y administración de los encargos realizados por los clientes de una pastelería.

---

# ✅ Alcances del Sistema

Actualmente el prototipo permite:

- Inicio de sesión de usuarios.
- Registro de nuevos encargos.
- Registro de información completa del cliente.
- Registro de especificaciones detalladas del pastel.
- Cálculo automático del adelanto (50%) y saldo restante.
- Registro de pedidos con entrega a domicilio.
- Visualización de todos los encargos registrados.
- Filtrado de pedidos por estado.
- Consulta del calendario de entregas.
- Visualización detallada de cada pedido.
- Cambio del estado de un pedido de **Pendiente** a **Entregado**.
- Eliminación de pedidos (simulación de cancelación).
- Persistencia temporal de datos durante la ejecución del prototipo mediante memoria RAM (OrderStore).

---

# 🚧 Funcionalidades Futuras

El proyecto fue diseñado para facilitar su integración con un backend en la nube.

Entre las mejoras planificadas se encuentran:

- Integración con Firebase.
- Integración con Turso Database.
- Sincronización entre múltiples dispositivos.
- Notificaciones de pedidos próximos.
- Historial de clientes.
- Gestión de inventario.
- Registro de productos.
- Estadísticas de ventas.
- Reportes financieros.
- Panel administrativo.

---

# 📱 Manual de Uso

## 1. Inicio de Sesión

Al iniciar la aplicación se presenta la pantalla de autenticación.

El usuario debe ingresar:

- Correo electrónico
- Contraseña

Una vez autenticado accederá al menú principal.

---

## 2. Menú Principal

Desde la pantalla principal es posible acceder a:

- Nuevo Encargo
- Calendario
- Encargos Registrados

También es posible navegar mediante la barra inferior de navegación.

---

## 3. Registrar un Encargo

Seleccionar **Nuevo Encargo**.

Completar la información solicitada:

### Información General

- Nombre del cliente
- Número telefónico
- Cédula
- Nombre del encargo
- Fecha y hora de entrega
- Tipo de pedido

### Especificaciones

- Cantidad
- Sabor del bizcocho
- Relleno
- Empaquetado
- Decoración
- Topper
- Velas
- Confitura
- Tipo de baño
- Dedicatoria
- Notas adicionales

### Entrega

- Requiere entrega
- Dirección de entrega (si aplica)

### Facturación

- Monto total

La aplicación calcula automáticamente:

- Adelanto (50%)
- Saldo pendiente (50%)

Finalmente presionar:

**Registrar Encargo**

---

## 4. Consultar Encargos

Desde la sección **Encargos** es posible:

- Visualizar todos los pedidos.
- Filtrar entre:
  - Pendientes
  - Entregados

Cada tarjeta muestra:

- Cliente
- Nombre del pedido
- Fecha
- Total
- Estado

---

## 5. Consultar el Calendario

Desde la pestaña **Calendario** el usuario puede:

- Seleccionar una fecha.
- Consultar los pedidos programados para ese día.

---

## 6. Ver el Detalle de un Pedido

Seleccionando cualquier pedido se visualiza:

### Información del Cliente

- Nombre
- Teléfono
- Cédula

### Información del Pedido

- Nombre
- Tipo
- Cantidad
- Fecha de registro
- Fecha de entrega

### Especificaciones

- Sabor
- Relleno
- Empaquetado
- Decoración
- Topper
- Velas
- Confitura
- Tipo de baño
- Dedicatoria
- Notas

### Entrega

- Requiere entrega
- Dirección

### Facturación

- Total
- Adelanto
- Saldo pendiente

---

## 7. Cambiar Estado

Los pedidos pendientes pueden marcarse como:

**Entregado**

Automáticamente desaparecen del listado de pendientes y aparecen en la sección de entregados.

---

## 8. Cancelar un Pedido

Desde la vista de detalle es posible eliminar un pedido.

En el prototipo esta acción representa la cancelación del encargo por parte del cliente.

---

# 🏗 Arquitectura

El proyecto sigue una arquitectura inspirada en **MVVM (Model - View - ViewModel)**.

```
Views
│
├── Login
├── Register
├── Home
├── Orders
├── Order Detail
├── Calendar
└── New Order

Models
│
├── Order
├── SampleData
└── OrderStore
```

---

# 🗂 Organización del Proyecto

```
PasteleriaSofia
│
├── Assets
│
├── Models
│   ├── Order.swift
│   ├── SampleData.swift
│   └── OrderStore.swift
│
├── Views
│   ├── LoginView.swift
│   ├── RegisterView.swift
│   ├── HomeView.swift
│   ├── NewOrderView.swift
│   ├── OrdersView.swift
│   ├── OrderDetailView.swift
│   └── CalendarView.swift
│
└── PasteleriaSofiaApp.swift
```

---

# 🛠 Tecnologías Utilizadas

- Swift 6
- SwiftUI
- Xcode 16
- Combine
- Git
- GitHub

---

# 💾 Persistencia de Datos

Actualmente el prototipo utiliza una persistencia temporal mediante:

```
OrderStore.swift
```

Los datos permanecen almacenados únicamente mientras la aplicación permanece abierta.

En futuras versiones se implementará persistencia permanente mediante Firebase o Turso Database.

---

# 🎨 Diseño de la Interfaz

La aplicación fue diseñada siguiendo las recomendaciones de Human Interface Guidelines (HIG) de Apple.

## Colores

Color principal:

- Rosa pastel

Color secundario:

- Blanco

Estados:

- 🟠 Pendiente
- 🟢 Entregado

## Iconografía

Se utilizan **SF Symbols** de Apple para mantener consistencia con el ecosistema iOS.

## Navegación

- NavigationStack
- TabView
- Formularios (Form)
- Listas (List)
- NavigationLink

---

# 📋 Requisitos

- macOS Sonoma o superior
- Xcode 16 o superior
- Swift 6
- iOS 17 o superior

---

# ▶️ Cómo Compilar el Proyecto

## 1.

Clonar el repositorio.

```bash
git clone https://github.com/BalDiego/PasteleriaSofia.git
```

## 2.

Abrir el proyecto.

```
PasteleriaSofia.xcodeproj
```

## 3.

Esperar que Xcode indexe el proyecto.

---

## 4.

Seleccionar un simulador de iPhone.

Ejemplo:

```
iPhone 17
```

---

## 5.

Ejecutar la aplicación.

```
⌘ + R
```

o

```
Product
Run
```

---

# 📌 Estado del Proyecto

**Versión actual**

```
v1.0 (Prototipo Funcional)
```

Estado:

- ✅ Desarrollo del frontend finalizado.
- ✅ Navegación implementada.
- ✅ Gestión temporal de pedidos implementada.
- ✅ CRUD básico en memoria.
- ⏳ Integración con base de datos pendiente.
- ⏳ Autenticación real pendiente.

---

# 👨‍💻 Autor

**Diego Baltodano**

Estudiante de Ingeniería en Sistemas de Información

Universidad Nacional Autónoma de Nicaragua (UNAN-Carazo)

---

# 📄 Licencia

Este proyecto fue desarrollado con fines académicos como parte del proceso de formación en Ingeniería en Sistemas de Información.

Su código puede utilizarse únicamente con fines educativos y de aprendizaje.
