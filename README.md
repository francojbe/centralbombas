# Central Bombas SpA — Suite Prototipo Técnico & Conector Defontana ERP

Este directorio contiene todo el material técnico, prototipos funcionales interactivos, kits comerciales y scripts de ejecución desarrollados por **Efinnovation SpA** para **Central Bombas SpA** (Sepúlveda Leyton 3068, Santiago).

---

## 📁 Archivos del Proyecto

### 1. Prototipos Web e Interfaces
* **`app-tecnico-centralbombas.html`**: Aplicación móvil PWA del técnico (Cuadrilla Hidráulica #2 · Móvil #4 - Marcelo Gómez).
  - Identidad oficial con colores corporativos (#00639e, #54b2db) y logo oficial.
  - Sincronización matinal con Defontana ERP.
  - Modo 100% Subterráneo (-3 Offline) con guardado en IndexedDB local.
  - Pauta técnica de sala de bombas (KSB 5.5 HP), lecturas V/A/Presión 4.5 bar, rebaja de repuestos de Bodega Sepúlveda Leyton.
  - Firma táctil digital real del mayordomo en pantalla.
  - Sincronización automática desatendida al recuperar 4G hacia `api.defontana.com`.
  - Visor integrado de Certificado PDF timbrado y firmado en el celular, con hoja de opciones para compartir directamente (Gmail / Outlook vía mailto, WhatsApp, menú del teléfono).
* **`demo-central-bombas.html`**: Portal administrativo y de gerencia (Defontana ERP en oficina).
  - Monitor en tiempo real de recepciones de OTs de terreno.
  - Rebaja de stock en Bodega Sepúlveda Leyton.
  - Inspección del JSON inyectado en Defontana y documentación técnica de SLA / Arquitectura offline.
* **`demo-terreno-ot.html`**: Prototipo técnico inicial de arquitectura offline.
* **`logo_centralbombas.png`**: Logotipo oficial corporativo de Central Bombas SpA (253x80 PNG transparente).

### 2. Documentación Estratégica y Comercial
* **`kit_reunion_central_bombas.md`**: Dossier completo para reunión comercial y técnica con Francisco Vial y Gonzalo Quiroga.
  - Resumen ejecutivo, diagnóstico de dolores operativos.
  - Análisis de ROI y cálculo de pérdidas por horas administrativas ($14M+ anuales).
  - Propuesta comercial, hitos de implementación y esquema de garantías.
* **`reunion_central_bombas_utf8.txt`**: Transcripción y notas detalladas de contexto técnico.

### 3. Ejecución Rápida y Conectividad
* **`cloudflared.exe`**: Binario oficial de Cloudflare Tunnel para publicar la demo a internet de forma segura sin abrir puertos en el router.
* **`iniciar_telefono_centralbombas.bat`** / **`iniciar_telefono_centralbombas.ps1`**: Scripts para levantar la vista de teléfono emulada en Chrome.
* **`qr_celular_https.png`** / **`qr_demo_celular.png`**: Códigos QR para abrir la demo directamente escaneando con la cámara del celular.
* **`screenshot_*.png`**: Capturas de pantalla de respaldo en alta resolución para presentaciones o dossiers.

---

## 🚀 Cómo Iniciar la Demo Localmente

### Opción A: Desde Terminal PowerShell / CMD
```powershell
# 1. Iniciar servidor web local en el puerto 8000
python -m http.server 8000

# 2. En otra terminal, exponer por túnel HTTPS seguro a tu celular:
.\cloudflared.exe tunnel --url http://127.0.0.1:8000
```

### URLs de Acceso:
* **App Técnico Móvil (en PC):** `http://localhost:8000/app-tecnico-centralbombas.html`
* **Portal Defontana Oficina (en PC):** `http://localhost:8000/demo-central-bombas.html`
