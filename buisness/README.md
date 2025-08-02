# Business Requirements

This document contains business logic and user story documentation for the hunting incident management system.

## 📋 Feature Overview

The system supports three main user types with different capabilities:

### 🌐 Public Users (Anonymous)
- **[Home Page](./home.feature)** - Interactive map interface with incident display, filtering, and search capabilities
- **[Event Details](./event_details.feature)** - Detailed incident information display with source attribution

### 👥 Event Managers (Authenticated)
- **[Event Management](./event_manager.feature)** - Create, edit, and validate hunting incidents with full audit trail
- **[Account Management](./account.feature)** - Basic profile and authentication features

### 🛡️ Administrators (Elevated Access)
- **[Admin Features](./admin.feature)** - User management, role assignment, and system administration
- All event manager capabilities included

### 🤖 Automated Systems
- **[Automatic Import Job](./auto_import_job.feature)** - Daily news processing and incident detection from configured sources

## 🎯 User Journey Flow

```
Anonymous User → View Map → Filter/Search → View Details
                    ↓
              Login → Event Manager → Create/Edit Incidents → Admin (optional)
```

## 📊 Key Features by Role

| Feature               | Anonymous | Event Manager | Admin |
| --------------------- | --------- | ------------- | ----- |
| View incidents on map | ✅         | ✅             | ✅     |
| Filter and search     | ✅         | ✅             | ✅     |
| View incident details | ✅         | ✅             | ✅     |
| Create incidents      | ❌         | ✅             | ✅     |
| Edit incidents        | ❌         | ✅             | ✅     |
| View incident history | ❌         | ✅             | ✅     |
| Manage user accounts  | ❌         | ❌             | ✅     |
| System administration | ❌         | ❌             | ✅     |

## 🔍 Data Validation & Quality

All features include comprehensive validation and audit trails:
- **Input Validation**: Required fields, data format checks, business rule enforcement
- **History Tracking**: Complete audit log of all changes with user attribution and timestamps
- **Source Attribution**: Link incidents to news sources for verification and credibility
- **Status Management**: Incident validation workflow (Pending → Verified/Rejected/Not Verifiable)

## 📝 Gherkin Format

All feature files follow standard Gherkin syntax with:
- **Given**: Preconditions and context setup
- **When**: User actions or system triggers
- **Then**: Expected outcomes and system responses
- **Background**: Common setup steps
- **Scenario Outline**: Data-driven test scenarios with examples