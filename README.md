# Hunting Incident Project Documentation

This repository provides comprehensive documentation for the hunting incident management system, including business requirements, database schema, and data specifications.

## 📋 Overview

The hunting incident management system is designed to collect, track, and analyze hunting-related incidents across France. The system provides:

- **Public Interface**: Interactive map displaying incidents with filtering and search capabilities
- **Content Management**: Event manager and admin interfaces for incident validation and management
- **Automated Import**: Daily processing of news sources to identify new incidents
- **Audit Trail**: Complete history tracking for all incidents and user actions

## 📁 Repository Structure

### [Business Requirements](./buisness/)
Contains all business logic and user stories written in Gherkin format:
- **Home Page**: Public map interface and filtering capabilities
- **Event Management**: Incident creation, editing, and validation workflows
- **User Roles**: Authentication and authorization for different user types
- **Automated Import**: News processing and incident detection logic

### [Database Documentation](./database/)
Contains database schema specifications and reference data:
- **Schema Diagrams**: Mermaid ERD diagrams for all database entities
- **Geographic Data**: French postal codes and town coordinates
- **Migration Reference**: Links to actual migration files in the API repository

## 🎯 User Roles & Permissions

| Role              | Description           | Capabilities                                                  |
| ----------------- | --------------------- | ------------------------------------------------------------- |
| **Anonymous**     | Public users          | View incidents on map, use filters and search                 |
| **Event Manager** | Content moderators    | Create/edit incidents, view history, validate imported events |
| **Admin**         | System administrators | All event manager rights + user management                    |

## 🗺️ Geographic Coverage

The system covers all French territories using official postal code data from La Poste DataNova, providing:
- **5-digit INSEE codes** for administrative identification
- **Precise coordinates** for accurate mapping
- **Full-text search** capabilities across town names and postal codes

## 📊 Incident Classification

Incidents are classified using three main dimensions:

### Types
- Threat (Menace)
- Injury (Blessure) 
- Death (Mort)
- Property damage (Destruction)
- Other (Autre)

### Targets
- Hunter (Chasseur)
- Human (Humain)
- Pet (Animal de compagnie)
- Livestock (Animal d'élevage)
- Protected wildlife (Faune sauvage protégée)
- Building (Bâtiment)
- Vehicle (Véhicule)

### Causes
- Unknown (Inconnue)
- Alcohol (Alcool)
- Drugs (Drogue)
- Age-related (Vieillesse)
- Inexperience (Inexpérience)
- Safety rule violation (Non-respect des règles de sécurité)
- Mishandling (Mauvaise manipulation)
- Other (Autre)

## 🔄 Data Import Process

The system includes automated daily import from configured news sources:
1. **Source Monitoring**: Scan configured news websites for new articles
2. **Content Analysis**: Identify hunting-related incidents using NLP techniques
3. **Deduplication**: Check against existing incidents to avoid duplicates
4. **Source Attribution**: Link articles as sources to relevant incidents
5. **Audit Logging**: Track all automated actions for transparency

## 🛠️ Documentation Tools

- **Mermaid**: Schema diagrams and flowcharts are created using [Mermaid](https://mermaid.js.org/)
- **Gherkin**: Business requirements use Gherkin syntax for clear specification
- **Markdown**: All documentation follows standard Markdown formatting

## 🔗 Related Repositories

- **API**: Backend service and database migrations
- **UI**: Frontend React application