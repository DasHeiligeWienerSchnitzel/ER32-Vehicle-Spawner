# Vehicle Spawner with Custom GUI for Arma 3

Ein modularer **Vehicle Spawner** für **Arma 3** mit eigener GUI, Fahrzeugvorschau und Garagenfunktion.  
Das System ermöglicht es Spielern, Fahrzeuge komfortabel über ein grafisches Interface auszuwählen, zu betrachten, anzupassen und anschließend zu spawnen.

## Features

- **Custom GUI**
  - Eigenes übersichtliches Interface für Fahrzeugauswahl und Verwaltung
  - Intuitive Bedienung direkt im Spiel

- **Konfigurierbare Fahrzeuglisten**
  - Fahrzeuge können frei per **Config** definiert werden
  - Unterstützung für **eigene Kategorien**
  - Classnames lassen sich einfach ergänzen, entfernen oder sortieren

- **Vehicle Preview / Viewscreen**
  - Integrierter Vorschaubereich für das ausgewählte Fahrzeug
  - Fahrzeuge können vor dem Spawn visuell betrachtet werden

- **Rotations-Slider**
  - Fahrzeugrotation per **Schiebebalken**
  - Ermöglicht eine bessere Ansicht aus verschiedenen Winkeln vor dem Spawnen

- **Vordefinierte Inventar-Optionen**
  - Vorausgewählte Loadouts / Inventar-Setups für Fahrzeuge
  - Schnelle Auswahl von standardisierten Ausrüstungen

- **Garage-Funktion**
  - Anpassung von:
    - **Skins / Texturen**
    - **Attachments / Anbauteilen**
    - **Ausrüstung / Inventar**
  - Direkte Individualisierung vor dem Spawn

- **Modularer Aufbau**
  - Leicht erweiterbar
  - Geeignet für Missionsprojekte, Server-Systeme

## Ziel des Projekts

Dieses Projekt wurde entwickelt, um das Spawnen und Anpassen von Fahrzeugen in Arma 3 deutlich komfortabler und flexibler zu machen.  
Anstatt Fahrzeuge nur über einfache Listen oder Skriptbefehle zu erzeugen, bietet dieses System eine visuelle und benutzerfreundliche Lösung mit Fokus auf Anpassbarkeit.

## Funktionsweise

Der Spieler öffnet den Vehicle Spawner über die bereitgestellte Aktion.  
Innerhalb der GUI kann er:

1. Eine **Fahrzeugkategorie** auswählen
2. Ein Fahrzeug aus der konfigurierten Liste wählen
3. Das Fahrzeug im **Viewscreen** ansehen
4. Die Rotation über einen **Slider** anpassen
5. Ein **vordefiniertes Inventar-Setup** auswählen
6. Optional in der **Garage**:
   - Skin ändern
   - Attachments konfigurieren
   - Ausrüstung anpassen
7. Das Fahrzeug schließlich spawnen

## Konfiguration

Die Fahrzeugauswahl erfolgt vollständig über eine **Config-Struktur**.  
Dadurch können Server- oder Missionsentwickler selbst festlegen:

- Welche Fahrzeuge verfügbar sind
- In welcher Kategorie diese erscheinen
- Welche Presets für Inventar angeboten werden
- Welche Garage-Optionen verfügbar sind
