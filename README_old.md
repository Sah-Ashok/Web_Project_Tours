# ?? Exploria - Tours & Travels Booking Website

A comprehensive **ASP.NET Web Forms** travel booking platform that allows users to explore destinations, make bookings, and manage their travel plans. Built with modern UI/UX principles using Tailwind CSS and integrated with SQL Server database.

---

## ?? Table of Contents
- [Complete System Overview](#-complete-system-overview)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Database Schema](#-database-schema)
- [Project Structure](#-project-structure)
- [Setup Instructions](#-setup-instructions)
- [Security Notice](#-security-notice)

---

## ?? Complete System Overview

```
+-----------------------------------------------------------------------------+
�                          EXPLORIA TRAVEL BOOKING SYSTEM                      �
+-----------------------------------------------------------------------------+

+-----------------------------------------------------------------------------+
�                              PRESENTATION LAYER                              �
+-----------------------------------------------------------------------------�
�                                                                              �
�  PUBLIC PAGES                    �   USER PAGES      �   ADMIN PAGES        �
�  -------------                   �   -----------     �   ------------        �
�  � Home.aspx                     �   � Profile.aspx  �   � AddDestinations  �
�  � Destination.aspx              �   � MyBookings    �   � AdminDestinations�
�  � ViewDetails.aspx              �   � bookingConf   �   � AdminUserMgmt    �
�  � About.aspx                    �                   �                      �
�  � Contact.aspx                  �                   �                      �
�  � Login/Register/ForgetPassword �                   �                      �
�                                                                              �
�  MASTER PAGE: Site1.Master (Navbar, Footer, Common Layout)                  �
�                                                                              �
�  STYLING: Tailwind CSS + Custom CSS (home.css, destinations.css, etc)       �
�  INTERACTIVITY: JavaScript + AOS + Swiper.js                                �
+------------------------------------------------------------------------------+
                                       �
                                       ?
+-----------------------------------------------------------------------------+
�                            BUSINESS LOGIC LAYER                              �
+-----------------------------------------------------------------------------�
�                                                                              �
�  CODE-BEHIND FILES (*.aspx.cs)                                              �
�  ----------------------------                                               �
�  � Authentication & Authorization Logic                                     �
�  � Booking Calculation & Validation                                         �
�  � File Upload Handling (Images)                                            �
�  � Session Management (UserID, Role)                                        �
�                                                                              �
�  SERVICES                                                                    �
�  --------                                                                    �
�  � EmailService.cs ? Send booking confirmations & password reset emails     �
�    +- SMTP: Gmail (smtp.gmail.com:587)                                      �
�                                                                              �
+------------------------------------------------------------------------------+
                                       �
                                       ?
+-----------------------------------------------------------------------------+
�                              DATA ACCESS LAYER                               �
+-----------------------------------------------------------------------------�
�                                                                              �
�  ADO.NET Components:                                                         �
�  � SqlConnection    ? Database connectivity                                  �
�  � SqlCommand       ? Execute queries & stored procedures                    �
�  � SqlDataReader    ? Read data streams                                      �
�  � SqlDataAdapter   ? Fill DataSets                                          �
�                                                                              �
�  Connection String: Web.config ? (localdb)\MSSQLLocalDB                      �
�                                                                              �
+------------------------------------------------------------------------------+
                                       �
                                       ?
+-----------------------------------------------------------------------------+
�                            DATABASE LAYER                                    �
+-----------------------------------------------------------------------------�
�  SQL Server LocalDB (Exploria_db.mdf)                                       �
�                                                                              �
�  +-------------+    +--------------+    +--------------+    +----------+  �
�  �   Users     �    � Destinations �    �   Bookings   �    � Contacts �  �
�  +-------------�    +--------------�    +--------------�    +----------�  �
�  � Id (PK)     �    � Id (PK)      �    � BookingId PK �    � Id (PK)  �  �
�  � FirstName   �---+� Name         �---+� UserId FK ---+----� Name     �  �
�  � LastName    �   �� Description  �   �� DestinationFK�    � Email    �  �
�  � Email       �   �� Price        �   �� TravelDate   �    � Subject  �  �
�  � Password    �   �� Duration     �   �� TotalAmount  �    � Message  �  �
�  � Role        �   �� Category     �   �� Status       �    +----------+  �
�  � Image       �   �� MainImage    �   �+--------------+                   �
�  +-------------+   �+--------------+   �                                   �
�                    �                    �                                   �
�                    +--------------------+                                   �
�                     (Foreign Key Relationships)                             �
+-----------------------------------------------------------------------------+

+-----------------------------------------------------------------------------+
�                         EXTERNAL SERVICES                                    �
+-----------------------------------------------------------------------------�
�  � Gmail SMTP Server (Email Notifications)                                  �
�  � CDN: Tailwind CSS, Font Awesome, AOS, Swiper.js                          �
+-----------------------------------------------------------------------------+

-------------------------------------------------------------------------------
                              USER FLOW DIAGRAM
-------------------------------------------------------------------------------

START ? Home Page
         �
         +-? Browse Destinations ? View Details ? [Login Required] ? Book Trip
         �                                              �
         �                                              ?
         +-? Register/Login -----------------? User Dashboard
         �                                       �
         �                                       +-? My Profile
         �                                       +-? My Bookings
         �                                       +-? Browse & Book
         �
         +-? Forgot Password ? Email Link ? Reset Password ? Login
         �
         +-? Contact Us / About Us

ADMIN FLOW:
Admin Login ? Admin Dashboard
              �
              +-? Add Destinations (Upload Images, Set Prices)
              +-? Manage Destinations (Edit/Delete)
              +-? User Management
              +-? View All Bookings
```

---

## ? Features

### For Users
- ?? **Authentication**: Register, Login, Password Recovery
- ??? **Browse Destinations**: Explore travel packages with images, pricing, and details
- ?? **Book Trips**: Select dates, travelers count, automatic price calculation
- ?? **Profile Management**: Update personal info and view booking history
- ?? **Email Notifications**: Booking confirmations and password reset

### For Admins
- ? **Add Destinations**: Upload images, set pricing, duration, and categories
- ?? **Manage Content**: Edit/Delete destinations and manage users
- ?? **View Bookings**: Track all user bookings and their status

### UI/UX
- ?? Fully responsive design with Tailwind CSS
- ?? Modern animations (AOS, Swiper.js)
- ??? Hero section with parallax effects
- ?? Sticky navigation and smooth scrolling

---

## ??? Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | ASP.NET Web Forms, Tailwind CSS, JavaScript, AOS, Swiper.js |
| **Backend** | C# (.NET Framework 4.7.2), ADO.NET |
| **Database** | SQL Server LocalDB |
| **Email** | Gmail SMTP |
| **Server** | IIS Express |

---

## ?? Project Structure

```
Tours&Travels/
�
+-- ?? Pages (ASPX Files)
�   +-- Home.aspx                    # Landing page with hero section
�   +-- Login.aspx                   # User login
�   +-- Register.aspx                # New user registration
�   +-- ForgetPassword.aspx          # Password recovery
�   +-- ResetPassword.aspx           # Password reset
�   +-- Destination.aspx             # Browse destinations
�   +-- ViewDetails.aspx             # Single destination details
�   +-- bookingConfirmation.aspx     # Booking process
�   +-- MyBookings.aspx              # User booking history
�   +-- Profile.aspx                 # User profile management
�   +-- Contact.aspx                 # Contact form
�   +-- About.aspx                   # About us page
�   +-- ThankYou.aspx                # Thank you page
�   �
�   +-- ?? Admin Pages
�   +-- AddDestinations.aspx         # Add new destinations
�   +-- AdminDestinations.aspx       # Manage destinations
�   +-- AdminUserManagement.aspx     # Manage users
�
+-- ?? Code Behind (CS Files)
�   +-- *.aspx.cs                    # Page logic files
�   +-- EmailService.cs              # Email sending service
�   +-- Site1.Master.cs              # Master page logic
�
+-- ?? Assets
�   +-- CSS/
�   �   +-- home.css                 # Custom styles
�   +-- Images/                      # User & static images
�   +-- Site-Photo/                  # Site photos
�   +-- DestinationImages/           # Destination photos
�
+-- ?? Database
�   +-- App_Data/
�   �   +-- Exploria_db.mdf          # Database file
�   �   +-- Exploria_db_log.ldf      # Database log
�   +-- SQLQuery1.sql                # Database schema
�
+-- ?? Configuration
�   +-- Web.config                   # App configuration
�   +-- Site1.Master                 # Master page layout
�   +-- packages.config              # NuGet packages
�
+-- ?? Build Output
    +-- bin/                         # Compiled assemblies
    +-- obj/                         # Build artifacts
```

---

## ??? Database Schema

### Tables Overview

**Users** (Authentication & Profile)
| Column | Type | Description |
|--------|------|-------------|
| Id (PK) | INT | Primary Key |
| FirstName, LastName | NVARCHAR | User name |
| Email | NVARCHAR | Login credential |
| Phone | NVARCHAR | Contact number |
| Country, State, City | NVARCHAR | Location details |
| Password | NVARCHAR | Plain text (?? security risk) |
| Image | NVARCHAR | Profile picture path |
| Role | NVARCHAR | 'users' or 'admin' |

**Destinations** (Travel Packages)
| Column | Type | Description |
|--------|------|-------------|
| Id (PK) | INT | Primary Key |
| Name | NVARCHAR | Destination name |
| Tagline, Description | NVARCHAR | Marketing content |
| Duration, GroupSize, Region | NVARCHAR | Trip details |
| Price | DECIMAL(10,2) | Per person cost |
| Category | NVARCHAR | Trip type |
| MainImage, Image | NVARCHAR | Image paths |
| DateAdded | DATETIME | Creation timestamp |

**Bookings** (User Reservations)
| Column | Type | Description |
|--------|------|-------------|
| BookingId (PK) | INT | Primary Key |
| UserId (FK) | INT | References Users(Id) |
| DestinationId (FK) | INT | References Destinations(Id) |
| TravelerFirstName, TravelerLastName | NVARCHAR | Traveler info |
| TravelerEmail, TravelerPhone | NVARCHAR | Contact details |
| TravelDate | DATE | Trip date |
| NumberOfAdults, NumberOfChildren | INT | Party size |
| TotalAmount | DECIMAL(10,2) | Calculated total |
| BookingStatus | NVARCHAR(50) | Pending/Confirmed/Cancelled/Completed |
| DateOfBooking | DATETIME | Booking timestamp |

**Contacts** (Contact Form Submissions)
| Column | Type | Description |
|--------|------|-------------|
| Id (PK) | INT | Primary Key |
| Name, Email | NVARCHAR | Contact details |
| Subject, Message | NVARCHAR | Inquiry content |

### Relationships
- **Users** `1 --? N` **Bookings**
- **Destinations** `1 --? N` **Bookings**

---

## ?? Setup Instructions

### Prerequisites
- Visual Studio 2019 or later
- .NET Framework 4.7.2
- SQL Server LocalDB
- IIS Express (included with Visual Studio)

### Installation Steps

1. **Clone Repository**
   ```bash
   git clone https://github.com/Sah-Ashok/Web_Project_Tours.git
   cd Tours&Travels
   ```

2. **Open Solution**
   - Double-click `Tours&Travels.sln` to open in Visual Studio

3. **Database Setup** (Auto-configured)
   - Database file: `App_Data/Exploria_db.mdf`
   - Connection string is pre-configured in `Web.config`
   - SQL Server LocalDB will auto-attach the database on first run
   - (Optional) Run `SQLQuery1.sql` to recreate schema

4. **Configure Email Service** (Optional)
   - Open `Tours&Travels/EmailService.cs`
   - Update SMTP credentials:
     ```csharp
     smtp.Credentials = new NetworkCredential("your-email@gmail.com", "your-app-password");
     ```
   - Generate Gmail App Password: [Google Account Settings](https://myaccount.google.com/apppasswords)

5. **Build & Run**
   - Press `Ctrl + Shift + B` to build
   - Press `F5` to run with debugging
   - Application opens at `http://localhost:[port]/Home.aspx`

6. **Create Admin Account**
   - Register as a regular user
   - Open SQL Server Object Explorer in Visual Studio
   - Navigate to: `Exploria_db` ? `Tables` ? `Users` ? View Data
   - Change `Role` column from `'users'` to `'admin'` for your account
   - Log out and log back in to access admin features

---

## ?? Features Configuration

| Feature | Status | Configuration Required |
|---------|--------|----------------------|
| Browse Destinations | ? Ready | None |
| User Registration/Login | ? Ready | None |
| Make Bookings | ? Ready | None |
| View Booking History | ? Ready | None |
| Email Notifications | ?? Optional | Gmail SMTP credentials |
| Password Reset | ?? Optional | Gmail SMTP credentials |

---

## ?? Security Notice

**?? WARNING - Educational Project Only**

This project contains critical security vulnerabilities:

| Issue | Description | Impact |
|-------|-------------|--------|
| **Plain Text Passwords** | Passwords stored without hashing | Full account compromise |
| **SQL Injection** | String concatenation in queries | Database breach |
| **No Input Validation** | Missing server-side validation | XSS, data corruption |
| **Session Fixation** | Basic session management | Session hijacking |

**For Production Use, Implement:**
- ? Password hashing (bcrypt, Argon2, or ASP.NET Identity)
- ? Parameterized SQL queries or ORM (Entity Framework)
- ? Input validation & sanitization
- ? HTTPS enforcement
- ? CSRF protection
- ? Rate limiting on login attempts

---

## ?? License

Educational Project - Free to use for learning purposes

---

## ?? Author

**Ashok Sah**  
GitHub: [@Sah-Ashok](https://github.com/Sah-Ashok)

---

**Happy Traveling! ????**
