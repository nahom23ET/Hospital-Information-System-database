# Hospital Information System (HIS) — Database

A centralized relational database for hospital operations, covering clinical workflows, billing and revenue cycle, human resources, payroll, and security. Built on **MySQL 8.0** with full referential integrity, role-based access control, and an audit trail across all 66 tables.

---

## Table of Contents

- [Overview](#overview)
- [Schema Structure](#schema-structure)
- [Domain Breakdown](#domain-breakdown)
- [Getting Started](#getting-started)
- [Automation & Triggers](#automation--triggers)
- [Views & Stored Procedures](#views--stored-procedures)
- [Security Model](#security-model)
- [API Integration](#api-integration)
- [Project Files](#project-files)
- [Team](#team)

---

## Overview

The HIS database is the single source of truth for all hospital operational data. It replaces disconnected spreadsheets, paper records, and siloed departmental systems with a unified relational data platform.

**Key capabilities:**

- Full patient lifecycle — registration, appointments, check-in, encounters, discharge
- Clinical documentation — diagnoses (ICD-10), procedures (CPT), notes, labs, medications, prescriptions, vitals, allergies
- Revenue cycle — charge capture, insurance claims, coordination of benefits, payment processing
- HR & workforce — employee records, license tracking, scheduling, attendance, timesheets
- Payroll — configurable allowances and deductions, itemized pay stubs, payroll run management
- Security — granular RBAC, patient portal auth, API key management, webhook subscriptions, session management, immutable audit logging

---

## Schema Structure

| Stat | Value |
|---|---|
| Database Engine | MySQL 8.0.45 (InnoDB) |
| Total Tables | 66 |
| Functional Domains | 6 |
| Foreign Key Relationships | 107 |
| Schema Version | 4.0 |

---

## Domain Breakdown

###  Clinical (29 tables)

The largest domain. All clinical data is anchored to an `ENCOUNTERS` record, which links a patient to a provider, department, and room.

| Table | Purpose |
|---|---|
| `PATIENTS` | Core demographics and MRN |
| `PATIENT_ADDRESSES` | Mailing and home addresses |
| `PATIENT_EMERGENCY_CONTACTS` | Emergency contact info |
| `PATIENT_ACCOUNTS` | Patient portal credentials |
| `PATIENT_SESSIONS` | Patient portal sessions |
| `PATIENT_CONSENTS` | HIPAA and procedural consents |
| `PATIENT_ALLERGIES` | Patient-allergy links with reaction and severity |
| `APPOINTMENTS` | Scheduled visits with cancellation tracking |
| `CHECK_INS` | Kiosk / Mobile / Front Desk check-in with triage |
| `ENCOUNTERS` | Active clinical visits — the central anchor |
| `ENCOUNTER_EVENTS` | Timestamped lifecycle events per encounter |
| `DIAGNOSES` | ICD-10 coded diagnoses |
| `ICD10_CODES` | ICD-10 reference catalog (FK integrity) |
| `PROCEDURES` | CPT coded procedures |
| `NOTE_TYPES` | Lookup table for clinical note classification |
| `CLINICAL_NOTES` | Provider-authored clinical documentation |
| `CLINICAL_NOTE_AMENDMENTS` | Immutable amendment audit trail for signed notes |
| `DISCHARGE_NOTES` | Structured discharge instructions (1-to-1 per encounter) |
| `DISCHARGE_NOTE_MEDICATIONS` | Medications listed on a discharge note |
| `VITAL_SIGNS` | Temperature, BP, O2, weight, height, BMI |
| `ALLERGIES` | Allergen catalog |
| `ALLERGEN_CODES` | Standardised allergen reference with code systems |
| `MEDICATIONS` | Medication catalog (name, strength, form) |
| `MEDICATION_ORDERS` | Inpatient medication orders |
| `PRESCRIPTIONS` | Outpatient prescriptions with refills |
| `LAB_TESTS` | Lab test catalog with reference ranges |
| `LAB_ORDERS` | Lab orders per encounter |
| `LAB_ORDER_ITEMS` | Junction: individual tests within a lab order |
| `LAB_RESULTS` | Results with values and Normal/High/Low flags |
| `PROVIDERS` | Clinicians linked to employee records |
| `ROOMS` | Room inventory (Exam/ICU/OR/Inpatient/Support/Office/ER) |
| `BEDS` | Individual bed tracking within rooms |
| `REFERRALS` | Inbound and outbound referrals |

###  Billing (6 tables)

Tracks the full financial lifecycle from charge capture through payment.

| Table | Purpose |
|---|---|
| `INSURANCE_PLANS` | Payer and plan information |
| `PATIENT_INSURANCE` | Patient-to-plan junction with primary/secondary designation |
| `CHARGES` | Encounter-level charges (Procedure/Lab/Medication/Room) |
| `CLAIMS` | Insurance claims with status tracking |
| `CLAIM_INSURANCES` | Coordination of benefits — COB junction |
| `PAYMENTS` | Payments from patients and payers, with reversal support |

###  HR (8 tables)

Employee records, credentialing, department structure, shift management, and attendance.

| Table | Purpose |
|---|---|
| `EMPLOYEES` | Full employee records with pay configuration |
| `EMPLOYEE_ADDRESSES` | Employee mailing and home addresses |
| `EMPLOYEE_LICENSES` | Professional licenses (type, number, expiration) |
| `DEPARTMENTS` | Department directory |
| `POSITIONS` | Job position catalog |
| `SHIFTS` | Shift templates (Day/Night/Weekend) |
| `STAFF_SCHEDULE` | Employee-to-shift assignments by date |
| `ATTENDANCE` | Clock-in/out event log |

###  Payroll (8 tables)

Configurable allowances and deductions with transparent, itemized pay stubs.

| Table | Purpose |
|---|---|
| `PAYROLL` | Payroll run headers (Draft/Processed/Paid/Void/Cancelled) |
| `PAYROLL_ITEMS` | Per-employee payroll calculations |
| `PAYROLL_ITEM_ALLOWANCES` | Itemized allowances per payroll item |
| `PAYROLL_ITEM_DEDUCTIONS` | Itemized deductions per payroll item |
| `ALLOWANCES` | System-level allowance type definitions |
| `DEDUCTIONS` | System-level deduction type definitions |
| `EMPLOYEE_ALLOWANCES` | Per-employee allowance config (fixed or %) |
| `EMPLOYEE_DEDUCTIONS` | Per-employee deduction config (fixed or %) |

### ⏱ Workforce (1 table)

| Table | Purpose |
|---|---|
| `TIMESHEETS` | Processed work hours with overtime, linked to schedules and approvals |

###  Auth (10 tables)

Full security stack — staff auth, RBAC, patient portal, API keys, webhooks, sessions, and audit.

| Table | Purpose |
|---|---|
| `USERS` | Staff user accounts linked to employee records |
| `ROLES` | Role definitions (admin, clinician, billing, hr, payroll, viewer) |
| `USER_ROLES` | Junction: users to roles |
| `PERMISSIONS` | Granular permission definitions (e.g. `encounters.write`) |
| `ROLE_PERMISSIONS` | Junction: roles to permissions |
| `USER_SESSIONS` | Staff session tokens with IP, device, and expiry |
| `AUDIT_LOGS` | Immutable write-operation log across all tables |
| `API_KEYS` | External system API keys (hashed, rate-limited, expiring) |
| `API_KEY_ROLES` | Junction: multi-role assignments per API key |
| `WEBHOOK_SUBSCRIPTION` | Outbound event subscriptions for external systems |

---

## Getting Started

### Prerequisites

- MySQL 8.0.16 or higher
- MySQL Workbench (recommended) or any MySQL client
- Approximately 50 MB disk space for a full seeded database

### Installation

**1. Create the database:**

```sql
CREATE DATABASE hospital_information_system CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
```

**2. Restore from dump:**

```bash
mysql -u root -p hospital_information_system < dump.sql
```

**3. Run the correction migration** (if upgrading from v3 to v4 schema):

```bash
mysql -u root -p hospital_information_system < his_schema_corrected.sql
```

The migration is fully idempotent — it can be re-run safely. Every `ADD COLUMN` is guarded by an `information_schema` check, all `CREATE TABLE` statements use `IF NOT EXISTS`, and all `INSERT` statements use `IGNORE`.

### Verify

```sql
USE hospital_information_system;
SELECT COUNT(*) FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'hospital_information_system';
-- Expected: 66
```

---

## Automation & Triggers

The following database-level automation is implemented:

| Trigger / Process | Description |
|---|---|
| **Charge auto-generation** | Inserting a row into `PROCEDURES` automatically creates a matching `CHARGES` record with the CPT code and amount |
| **Room status management** | `ROOMS.status` updates to `Occupied` when assigned to an open encounter; reverts to `Available` on encounter close |
| **Audit logging** | Every `INSERT`, `UPDATE`, and `DELETE` across audited tables is recorded in `AUDIT_LOGS` with before/after JSON |
| **Webhook notifications** | State changes (claim status, lab result, encounter open/close) fire outbound `POST` requests to subscribed URLs |
| **Session expiration** | Sessions are invalidated automatically based on `expires_at` |
| **Referential integrity** | `CASCADE` on session cleanup and child record deletion; `RESTRICT` on clinical and financial data |

---

## Views & Stored Procedures

### Views

| View | Description |
|---|---|
| `v_encounter_summary` | Encounters joined with patient, provider, department, room; counts of diagnoses and procedures |
| `v_claim_status` | Claims joined with insurance plans; aggregated payment totals |
| `v_payroll_detail` | Payroll items joined with employees, itemized allowances and deductions |
| `v_provider_schedule` | Providers joined with staff schedules and shifts |
| `v_lab_results_with_flags` | Lab results joined with lab tests; highlights out-of-range values |

### Stored Procedures

| Procedure | Description |
|---|---|
| `sp_generate_payroll` | Creates payroll items for all active employees in a pay period |
| `sp_submit_claim` | Aggregates encounter charges and creates a claim record |
| `sp_close_encounter` | Sets encounter to Closed, records discharge datetime, frees the room |
| `sp_create_encounter_from_checkin` | Creates an encounter from a check-in record |

---

## Security Model

### Staff Authentication

Staff log in via `USERS`, linked one-to-one with `EMPLOYEES`. Credentials are stored as bcrypt hashes. Sessions are tracked in `USER_SESSIONS` with IP address, device info, and a 15-minute JWT expiry with refresh token rotation.

### RBAC Chain

```
USERS → USER_ROLES → ROLES → ROLE_PERMISSIONS → PERMISSIONS
```

Permissions are granular strings like `patients.read`, `encounters.write`, `payroll.post`. Every API request resolves the full permission set via this chain and returns `403` if insufficient.

### Patient Portal

Patients authenticate through a separate `PATIENT_ACCOUNTS` / `PATIENT_SESSIONS` system. Portal access is strictly scoped — a patient can only read their own records.

### API Keys

External systems (lab interfaces, insurance clearinghouses, pharmacy systems) authenticate via `X-API-Key` headers, resolved against the `API_KEYS` table. Keys are stored as hashes, carry role-based permissions via `API_KEY_ROLES`, have per-key rate limits, and have hard expiration dates.

### Webhook Events

External systems subscribe via `WEBHOOK_SUBSCRIPTION`. On state changes, the API layer sends signed `POST` requests with HMAC-verified payloads. Supported events include:

```
encounter.created        encounter.closed
lab_result.created
claim.submitted          claim.status_changed
payment.received
appointment.scheduled    appointment.cancelled
checkin.completed
employee.created         payroll.posted
```

---

## API Integration

The system exposes a RESTful API over HTTPS with JSON payloads.

- **Rate limits:** 1,000 req/min for staff · configurable per API key · 100 req/min for patient portal
- **Pagination:** all list endpoints support `?page`, `?per_page`, `?sort`, `?order`
- **Audit:** all write operations (`POST`, `PUT`, `PATCH`, `DELETE`) are logged automatically via middleware

API endpoint groups: Authentication, Patient Management, Patient Portal, Check-In, Appointments, Encounters, Clinical Documentation, Medication Orders, Lab Orders & Results, Billing & Claims, HR & Scheduling, Payroll.

Full endpoint specification is documented in the companion API Specification Document.

---

## Project Files

| File | Description |
|---|---|
| `dump.sql` | Full MySQL dump of the current database (v4 schema + seed data) |
| `his_schema_corrected.sql` | Idempotent migration script from v3 → v4 schema |
| `his_erd.md` | Mermaid ERD source — all 66 tables and 107 relationships |
| `business_requirements_v4.docx` | Business & Technical Requirements Document v4.0 |

---
