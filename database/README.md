# Database

This document contains database schema related content.

## Incident

Following is the incident schema

```mermaid
erDiagram

    incident_types {
        %% Descibe the type of incident (eg: threat, injury, death...)
        bigint id PK
        varchar(255) label "UNIQUE NOT NULL"
        text description 
        boolean is_active "NOT NULL" DEFAULT true
    }

    incident_targets {
        %% Describe the target of the incident (eg: human, pet, livestock, vehicule, property...)
        bigint id PK
        varchar(255) label "UNIQUE NOT NULL"
        text description
        boolean is_active "NOT NULL" DEFAULT true
    }

    incident_causes {
        %% Describe the cause of the incident (eg: unknown, alcool, drug, age, safety measure non respect, accident, other...)
        bigint id PK
        varchar(255) label "UNIQUE NOT NULL"
        text description
        boolean is_active "NOT NULL" DEFAULT true
    }

    incident_status {
        int Pending_verification "Pending_verification"
        int Verified "Verified"
        int Unverifiable "Unverifiable"
        int Rejected "Rejected"
    }

    incidents {
        bigint id PK
        bigint incident_type_id FK "REFERENCES incident_types(id) ON DELETE RESTRICT NOT NULL"
        bigint incident_target_id FK "REFERENCES incident_targets(id) ON DELETE RESTRICT NOT NULL"
        bigint incident_cause_id FK "REFERENCES incident_causes(id) ON DELETE RESTRICT NOT NULL"
        timestamp_with_time_zone date "NOT NULL"
        bigint town_id FK "REFERENCES towns(id) ON DELETE RESTRICT NOT NULL"
        text title "NOT NULL"
        text description "NOT NULL"
        timestamp_with_time_zone created_at 
        timestamp_with_time_zone updated_at 
        timestamp_with_time_zone deleted_at 
        incident_status incident_status "NOT NULL DEFAULT 'Pending_verification'"
    }

    incidents }|--|| incident_types : ""
    incidents }|--|| incident_targets : ""
    incidents }|--|| incident_causes : ""
    incidents }|--|| incident_status : ""

    incident_sources {
        bigint id PK
        bigint incident_id FK "REFERENCES incidents(id) ON DELETE CASCADE NOT NULL"
        text description
        text source
    }

    incidents ||--o{ incident_sources : ""

    incident_history {
        %% history of the incident report (changes, who created it, when, who validated it, when, who closed it, when, why, how...)
        bigint id PK
        bigint incident_id FK "REFERENCES incidents(id) ON DELETE CASCADE NOT NULL"
        bigint user_id FK "REFERENCES users(id) ON DELETE CASCADE NOT NULL"
        text description
        timestamp_with_time_zone created_at 
    }
    
    incidents ||--o{ incident_history: ""
    incident_history }|--|| users: ""

    %% incident -> municipality -> zip_code with its location. That way we get a nice precise location

    towns {
      bigint id PK
      varchar[5] insee_code
      text town_name
      varchar[5] zip_code
      text routing_label
      text line_5
      geography(POINT_4326) geopoint
    }

    incidents }o--|| towns: ""

```

## Authentication

Here are user and role related schemas

```mermaid
erDiagram
  roles {
    bigint id PK
    varchar(255) name "UNIQUE NOT NULL"
  }

  users {
    bigint id PK
    varchar(255) username "UNIQUE NOT NULL"
    varchar(255) email "UNIQUE NOT NULL"
    timestamp_with_time_zone created_at 
    timestamp_with_time_zone updated_at 
    timestamp_with_time_zone deleted_at 
  }

  user_history {
    %% history of the user. Mainly used for audit purpose
    bigint id PK
    bigint user_id FK "REFERENCES users(id) ON DELETE CASCADE NOT NULL"
    text description
    timestamp_with_time_zone created_at 
  }

  users_roles {
    bigint user_id FK "REFERENCES users(id) ON DELETE CASCADE NOT NULL"
    bigint role_id FK "REFERENCES roles(id) ON DELETE CASCADE NOT NULL"
  }

  users ||--|{ users_roles : ""
  users_roles }|--|| roles  : ""

  users ||--o{ user_history  : ""
```

## Migration

Database migration is managed by golang-migrate. Following is the used schema

```mermaid
erDiagram

schema_migrations {
    %% Used by golang-migrate/migrate

    bigint version "NOT NULL"
    boolean dirty "NOT NULL"
}

```

## Geo data

Geographical comes from [La Poste DataNova](https://datanova.laposte.fr/datasets/laposte-hexasmal). [The file](./base-officielle-codes-postaux.csv) in this repository is a CSV export of all cites with center coordinates.