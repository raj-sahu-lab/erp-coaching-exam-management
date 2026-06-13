# Coaching & Exam Management — ERP System

A complete ERP system for coaching institutes to manage student enrollments, exam registrations, fee collection, scholarship tracking, and multi-center operations.

> **Note:** This is a 2014 portfolio codebase. SQL queries use string concatenation and passwords are stored without hashing — standard practice before modern OWASP awareness. These would be the first items parameterized and hashed before any production deployment today.

## Built: 2014

## Tech Stack

- **Backend:** ASP.NET (VB.NET)
- **Database:** SQL Server with stored procedures
- **Frontend:** ASP.NET WebForms, AJAX Control Toolkit
- **Authentication:** Role-based (Admin / Center Head / Student)

## Features

### Student Management
- New student inquiry and enrollment
- Follow-up tracking (multi-stage F1→F4 workflow)
- Student profile with course, degree, college details

### Fee Management (8 payment workflows)
- Token + Partial payment tracking
- Token + Lumpsum payment
- No-token payment variants
- Fee follow-up with stage tracking
- Remaining fee calculation and alerts

### Exam Management
- Create exam schemas (marks, dates, negative marking)
- Student exam registration
- Performance tracking and results
- Scholarship calculation based on percentage

### Scholarship System
- 18-field scholarship registration
- Performance-based waiver calculation
- Exam result → scholarship mapping

### Multi-Center Operations
- Admin vs Center Head access levels
- Per-center student tracking
- Cross-center reporting

### Reporting
- Fee collection reports
- Student enrollment reports
- Exam performance analytics
- Follow-up status reports

## Architecture

```
├── admin_*.aspx       — Admin dashboard pages (16)
├── chead_*.aspx       — Center Head pages (17)
├── *.aspx             — Shared/student pages
├── App_Code/          — Business classes (clsExamMaster, clsScholarshipReg, clsConn)
├── App_Data/          — Database config
├── Bin/               — AjaxControlToolkit assembly
├── css/               — Stylesheets
├── js/                — Client scripts
└── web.config         — Configuration
```

## Setup

1. Create SQL Server database with the required schema and stored procedures
2. Update `web.config` connection string (`pt_enquiry`)
3. Deploy to IIS with ASP.NET enabled
4. Login at `default.aspx`

## Business Logic Highlights

- **Follow-up Engine:** 4-stage follow-up workflow with date tracking and outcome recording
- **Fee Calculator:** Handles multiple payment modes with automatic remaining balance calculation
- **Scholarship Algorithm:** Maps exam scores to percentage-based fee waivers
- **Registration ID Generator:** Auto-generates structured IDs per center

## Note

Deployed for real coaching institutes managing hundreds of students across multiple centers. Handles the complete student lifecycle from inquiry → enrollment → exam → fee collection.
