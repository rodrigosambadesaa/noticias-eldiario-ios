# elDiario.es para iOS

Port nativo **SwiftUI + Swift Package Manager** de la app Android [noticias-eldiario](https://github.com/rodrigosambadesaa/noticias-eldiario).

## Funciones
- Noticias RSS, imágenes asíncronas, búsqueda, carga de páginas antiguas cuando el feed la permite.
- Caché JSON offline mediante escritura atómica, deduplicación por URL y lectura asíncrona.
- Vista de artículos con WKWebView, apertura en navegador y compartir.
- Observación pasiva con NWPathMonitor (Wi-Fi, datos móviles, red costosa o restringida).
- Diagnóstico manual multicapa DNS, TCP, TLS, NTP y HTTPS; comprobación HTTPS **solo tras errores ambiguos de descarga**.
- Normalización HTML/Unicode de títulos RSS y separación entre errores HTTP, XML y conectividad.

## Compilar
- Requisitos: macOS, Xcode y XcodeGen (`brew install xcodegen`).
- Ejecutar `xcodegen generate` y abrir `NewsReaderIOS.xcodeproj`.
- Las pruebas unitarias se ejecutan con `swift test`.
- GitHub Actions utiliza macOS y genera un archivo **.app para simulador**, no un IPA distribuible.

## Límites y seguridad
La observación pasiva no prueba que un servidor responda. Los diagnósticos activos no se realizan por noticia, imagen ni WebView. En iOS una app de terceros no puede alternar libremente el Wi-Fi, observar todas las capas radio ni demostrar que una red está libre de Evil Twin/MitM. NWPathMonitor tampoco identifica todas las VPN. Las peticiones usan HTTPS cuando la fuente lo proporciona; la WebView utiliza el almacén de confianza del sistema.

La firma y distribución de IPA/App Store requieren aprovisionamiento de Apple y pruebas en dispositivos reales. Los feeds de terceros pueden cambiar sus rutas y formato. El motor de diagnóstico es una **reimplementación nativa** de sus capacidades relevantes, no una traducción literal de las 2.628 líneas Java.
