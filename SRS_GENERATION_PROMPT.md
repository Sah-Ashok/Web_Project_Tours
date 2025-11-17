# 📋 Software Requirements Specification (SRS) Generation Prompt
## For Exploria - Tours & Travels Booking System

---

## 🎯 Project Context

**Generate a comprehensive Software Requirements Specification (SRS) document for the following web application:**

### **Project Overview**
- **Project Name:** Exploria - Tours & Travels Booking System
- **Project Type:** Web-based Travel Booking Platform
- **Technology Stack:** ASP.NET Web Forms with C# (.NET Framework 4.7.2)
- **Database:** SQL Server LocalDB
- **Purpose:** Educational project demonstrating full-stack web development with modern UI/UX

---

## 🏗️ System Architecture Analysis

### **1. Technology Stack**

**Backend Technologies:**
- ASP.NET Web Forms (Framework: .NET 4.7.2)
- Programming Language: C#
- Data Access: ADO.NET (SqlConnection, SqlCommand, SqlDataReader, SqlDataAdapter)
- Server: IIS Express
- Email Service: Gmail SMTP (smtp.gmail.com:587)

**Frontend Technologies:**
- HTML5, CSS3, JavaScript (ES6+)
- CSS Framework: Tailwind CSS
- JavaScript Libraries:
  - AOS (Animate On Scroll) for animations
  - Swiper.js for image carousels
  - jQuery for DOM manipulation
  - Font Awesome for icons

**Database:**
- SQL Server LocalDB
- Database Name: Exploria_db.mdf
- Connection String: LocalDB with AttachDbFilename
- Max File Upload: 50MB (configured in Web.config)

---

## 📊 Database Schema

### **Tables (4 Main Entities):**

#### **1. Users Table**
```sql
- Id (INT, PK, IDENTITY)
- FirstName (NVARCHAR(MAX), NOT NULL)
- LastName (NVARCHAR(MAX), NOT NULL)
- Email (NVARCHAR(MAX), NOT NULL) - Login credential
- Phone (NVARCHAR(MAX), NOT NULL)
- Country (NVARCHAR(MAX), NOT NULL)
- State (NVARCHAR(MAX), NOT NULL)
- City (NVARCHAR(MAX), NOT NULL)
- Password (NVARCHAR(MAX), NOT NULL) - ⚠️ Stored as plain text
- Image (NVARCHAR(MAX), NULL) - Profile picture path
- Role (NVARCHAR(MAX), DEFAULT 'users') - Values: 'users' or 'admin'
```

#### **2. Destinations Table**
```sql
- Id (INT, PK, IDENTITY)
- Name (NVARCHAR(MAX), NOT NULL)
- Tagline (NVARCHAR(MAX), NULL)
- Duration (NVARCHAR(MAX), NULL)
- GroupSize (NVARCHAR(MAX), NULL)
- Region (NVARCHAR(MAX), NULL)
- Description (NVARCHAR(MAX), NOT NULL)
- Included (NVARCHAR(MAX), NULL) - Amenities/services included
- Price (DECIMAL(10,2), NOT NULL) - Per person price
- Category (NVARCHAR(MAX), NOT NULL) - Beach, Mountain, City, etc.
- MainImage (NVARCHAR(MAX), NOT NULL) - Primary display image
- Image (NVARCHAR(MAX), NULL) - Gallery images (comma-separated)
- DateAdded (DATETIME, DEFAULT GETDATE())
```

#### **3. Bookings Table**
```sql
- BookingId (INT, PK, IDENTITY)
- UserId (INT, FK → Users.Id)
- DestinationId (INT, FK → Destinations.Id)
- TravelerFirstName (NVARCHAR(MAX), NOT NULL)
- TravelerLastName (NVARCHAR(MAX), NOT NULL)
- TravelerEmail (NVARCHAR(MAX), NOT NULL)
- TravelerPhone (NVARCHAR(MAX), NULL)
- TravelDate (DATE, NOT NULL)
- NumberOfAdults (INT, NOT NULL)
- NumberOfChildren (INT, DEFAULT 0)
- TotalAmount (DECIMAL(10,2), NOT NULL)
- BookingStatus (NVARCHAR(50), DEFAULT 'Pending')
  - Constraint: CHECK (BookingStatus IN ('Pending', 'Confirmed', 'Cancelled', 'Completed'))
- DateOfBooking (DATETIME, DEFAULT GETDATE())
```

#### **4. Contacts Table**
```sql
- Id (INT, PK, IDENTITY)
- Name (NVARCHAR(MAX), NOT NULL)
- Email (NVARCHAR(MAX), NOT NULL)
- Subject (NVARCHAR(MAX), NOT NULL)
- Message (NVARCHAR(MAX), NOT NULL)
```

**Relationships:**
- One User → Many Bookings (1:N)
- One Destination → Many Bookings (1:N)
- Bookings acts as a junction table linking Users and Destinations

---

## 📂 Application Structure

### **Web Pages (ASPX Files):**

#### **Public Pages (Accessible to all visitors):**
1. **Home.aspx** - Landing page with hero section, featured destinations
2. **Destination.aspx** - Browse all destinations with category filters
3. **ViewDetails.aspx** - Single destination details with image gallery
4. **Contact.aspx** - Contact form for inquiries
5. **About.aspx** - About us/company information
6. **ThankYou.aspx** - Confirmation/thank you page

#### **Authentication Pages:**
7. **Login.aspx** - User login with email and password
8. **Register.aspx** - New user registration with profile photo upload
9. **ForgetPassword.aspx** - Password recovery request via email
10. **ResetPassword.aspx** - Reset password with email verification

#### **User Pages (Require Login):**
11. **Profile.aspx** - User profile management and settings
12. **MyBookings.aspx** - View booking history and status
13. **bookingConfirmation.aspx** - Booking form and confirmation

#### **Admin Pages (Require Admin Role):**
14. **AddDestinations.aspx** - Add new destinations with images
15. **AdminDestinations.aspx** - Manage existing destinations (Edit/Delete)
16. **AdminUserManagement.aspx** - View and manage users

#### **Shared Components:**
17. **Site1.Master** - Master page with navigation bar and footer
18. **EmailService.cs** - Service class for email functionality

### **Assets:**
- **CSS Folder:** home.css, destinations.css, modern-hero.css, footer.css, testimonials.css
- **JS Folder:** Custom JavaScript files
- **Images Folder:** User uploads, destination images, static assets
- **App_Data Folder:** Database files (Exploria_db.mdf, Exploria_db_log.ldf)

---

## 👥 User Roles & Permissions

### **1. Guest/Visitor (Unauthenticated)**
**Permissions:**
- View home page and browse destinations
- View destination details
- Access contact and about pages
- Register for new account
- Login to existing account

**Restrictions:**
- Cannot make bookings
- Cannot access user dashboard
- Cannot view profile or booking history

### **2. Registered User (Role: 'users')**
**Permissions:**
- All guest permissions PLUS:
- Make destination bookings
- View and manage personal profile
- View booking history
- Update profile information
- Upload/change profile picture
- Receive email notifications

**Restrictions:**
- Cannot access admin panel
- Cannot add/edit/delete destinations
- Cannot manage other users

### **3. Administrator (Role: 'admin')**
**Permissions:**
- All user permissions PLUS:
- Access admin dashboard
- Add new destinations with images
- Edit existing destinations
- Delete destinations
- View all users in system
- View all bookings system-wide
- Manage user accounts
- View contact form submissions

---

## ⚙️ Core Functional Requirements

### **FR1: User Authentication & Authorization**

#### **FR1.1: User Registration**
- Users can register with: FirstName, LastName, Email, Phone, Country, State, City, Password
- Optional profile picture upload
- Email must be unique in system
- Password requirements: [Specify complexity rules]
- Default role assigned: 'users'
- Email validation required
- Form validation on client and server side

#### **FR1.2: User Login**
- Login using Email and Password
- "Remember Me" checkbox for persistent sessions
- Create session variables upon successful login:
  - Session["UserID"]
  - Session["FullName"]
  - Session["UserEmail"]
  - Session["isLogin"]
- Redirect to home page after login
- Display error message for invalid credentials

#### **FR1.3: Password Recovery**
- User can request password reset via email
- System sends reset link to registered email
- Reset link expires after [X hours]
- User can set new password via ResetPassword page
- Email service integration required

#### **FR1.4: Session Management**
- Sessions maintained throughout user visit
- Master page checks session status
- Display username in navigation if logged in
- Show/hide navigation elements based on login status
- Logout functionality clears all session data

#### **FR1.5: Role-Based Access Control**
- Check user role for admin page access
- Redirect unauthorized users to login page
- Protect admin pages from direct URL access
- Admin-only features hidden from regular users

---

### **FR2: Destination Management**

#### **FR2.1: Browse Destinations (Public)**
- Display all destinations in grid/card layout
- Filter destinations by category (Beach, Mountain, City, Cultural, Adventure)
- Each destination card shows:
  - Main image
  - Destination name and tagline
  - Price per person
  - Duration
  - "View Details" button
- Responsive grid layout (3 cols desktop, 2 tablet, 1 mobile)
- Image lazy loading for performance
- AOS animations on scroll

#### **FR2.2: View Destination Details (Public)**
- Display comprehensive destination information:
  - Image gallery with Swiper.js carousel
  - Destination name, tagline, description
  - Duration, group size, region
  - Price breakdown
  - Included amenities/services
  - Category
- "Book This Trip" button (requires login)
- Related destinations suggestions
- Social share buttons

#### **FR2.3: Add Destination (Admin Only)**
- Admin form to add new destinations
- Required fields: Name, Description, Price, Category, MainImage
- Optional fields: Tagline, Duration, GroupSize, Region, Included
- Main image upload (single file)
- Gallery images upload (multiple files)
- Image format validation (JPG, PNG, max 50MB)
- Store image paths in database
- Auto-set DateAdded to current timestamp
- Success/error message display

#### **FR2.4: Edit Destination (Admin Only)**
- Admin can modify existing destination details
- Pre-populate form with current data
- Allow image replacement
- Update database records
- Confirmation message after update

#### **FR2.5: Delete Destination (Admin Only)**
- Admin can delete destinations
- Confirmation dialog before deletion
- Cascade delete or handle foreign key constraints
- Remove associated images from server
- Success message after deletion

---

### **FR3: Booking Management**

#### **FR3.1: Create Booking (Logged-in Users)**
- Display booking form with destination details
- Required fields:
  - TravelerFirstName, TravelerLastName
  - TravelerEmail, TravelerPhone
  - TravelDate (date picker, future dates only)
  - NumberOfAdults (dropdown: 1-10)
  - NumberOfChildren (dropdown: 0-10)
- Auto-populate traveler info from user profile if available
- Real-time price calculation:
  - Base price × (NumberOfAdults + NumberOfChildren)
  - Display total amount before confirmation
- Additional options (optional):
  - Travel insurance
  - Airport transfer
  - Extra hotel nights
- Booking summary section showing:
  - Destination name and image
  - Selected date
  - Traveler count
  - Price breakdown
  - Total amount
- "Confirm Booking" button
- Validation:
  - Travel date must be in future
  - At least 1 adult required
  - Email format validation

#### **FR3.2: Booking Confirmation**
- Insert booking record into database
- Generate unique BookingId
- Set BookingStatus to 'Pending'
- Record DateOfBooking
- Send confirmation email to traveler
- Email should include:
  - Booking ID
  - Destination details
  - Travel date and traveler count
  - Total amount
  - Booking status
- Redirect to ThankYou page
- Display booking confirmation details

#### **FR3.3: View Bookings (User Dashboard)**
- Display user's booking history
- Show booking cards with:
  - Destination name and thumbnail
  - Travel date
  - Number of travelers
  - Total amount
  - Booking status (with color coding):
    - Pending (Yellow/Orange)
    - Confirmed (Green)
    - Cancelled (Red)
    - Completed (Blue)
  - Date of booking
- Filter bookings by status
- Sort by date (newest first)
- "View Details" link for each booking

#### **FR3.4: View All Bookings (Admin)**
- Admin dashboard shows all system bookings
- Display in tabular format
- Columns:
  - Booking ID
  - User name
  - Destination name
  - Travel date
  - Travelers count
  - Total amount
  - Status
  - Booking date
- Filter by status
- Search by user name or destination
- Export functionality (CSV/Excel) [Optional]
- Update booking status capability

---

### **FR4: User Profile Management**

#### **FR4.1: View Profile**
- Display user information:
  - Profile picture
  - Full name (FirstName + LastName)
  - Email
  - Phone
  - Location (Country, State, City)
  - Member since (registration date)
- Display user statistics:
  - Total bookings
  - Active trips
  - Completed trips

#### **FR4.2: Edit Profile**
- Editable fields:
  - FirstName, LastName
  - Phone
  - Country, State, City
  - Profile picture
- Email not editable (used as login)
- Password change option (with old password verification)
- Image upload with preview
- Form validation
- Update database on save
- Display success message

#### **FR4.3: Profile Picture Management**
- Upload new profile picture
- Image format validation (JPG, PNG, GIF)
- Image size limit (5MB)
- Image preview before upload
- Store image in Images folder
- Update Image field in Users table with file path
- Default avatar if no image uploaded

---

### **FR5: Contact & Communication**

#### **FR5.1: Contact Form (Public)**
- Public contact form with fields:
  - Name (required)
  - Email (required)
  - Subject (required)
  - Message (required, textarea)
- Form validation (client & server side)
- Insert submission into Contacts table
- Send notification email to admin
- Display success message
- Form reset after submission

#### **FR5.2: View Contact Submissions (Admin)**
- Admin can view all contact form submissions
- Display in list/table format
- Show: Name, Email, Subject, Message, Date
- Mark as read/unread
- Delete option
- Reply functionality (email)

---

### **FR6: Email Notification System**

#### **FR6.1: Email Service Configuration**
- Gmail SMTP integration
- Configuration in EmailService.cs:
  - SMTP Server: smtp.gmail.com
  - Port: 587
  - EnableSSL: True
  - Credentials: Gmail app password

#### **FR6.2: Booking Confirmation Email**
- Triggered on successful booking
- Recipient: Traveler email
- Content:
  - Booking ID
  - Destination name and details
  - Travel date
  - Traveler information
  - Total amount
  - Booking status
  - Contact information

#### **FR6.3: Password Reset Email**
- Triggered on password reset request
- Recipient: User email
- Content:
  - Reset link with token
  - Expiration time
  - Instructions
  - Security notice

#### **FR6.4: Contact Form Notification**
- Triggered on contact form submission
- Recipient: Admin email
- Content:
  - Sender name and email
  - Subject
  - Message
  - Timestamp

---

### **FR7: Admin Dashboard**

#### **FR7.1: Dashboard Overview**
- Display key statistics:
  - Total users
  - Total destinations
  - Total bookings
  - Pending bookings count
  - Revenue (sum of TotalAmount)
- Quick links to:
  - Add Destination
  - Manage Destinations
  - User Management
  - View Bookings

#### **FR7.2: User Management**
- View all registered users
- Display in table format:
  - User ID
  - Name
  - Email
  - Phone
  - Role
  - Registration date
  - Total bookings
- Search users by name/email
- View user details
- Change user role (optional)
- Deactivate users (optional)

---

## 🎨 Non-Functional Requirements

### **NFR1: Performance**
- Page load time: < 3 seconds
- Database query optimization
- Image compression and lazy loading
- CDN usage for external libraries
- Connection pooling for database
- Caching for static content

### **NFR2: Usability**
- Responsive design (mobile, tablet, desktop)
- Intuitive navigation
- Consistent UI/UX across pages
- Clear error messages
- Form validation with helpful feedback
- Accessibility standards (WCAG 2.1)

### **NFR3: Security**
⚠️ **Current Implementation (For Educational Purpose):**
- Plain text password storage
- SQL injection vulnerability (string concatenation)
- No input sanitization
- Basic session management

**Recommended for Production:**
- Password hashing (BCrypt, Argon2)
- Parameterized SQL queries
- Input validation and sanitization
- HTTPS enforcement
- CSRF protection
- XSS prevention
- Rate limiting on login
- Secure session management

### **NFR4: Compatibility**
- Browser support:
  - Chrome (latest 2 versions)
  - Firefox (latest 2 versions)
  - Safari (latest 2 versions)
  - Edge (latest 2 versions)
- Device support:
  - Desktop (1920x1080, 1366x768)
  - Tablet (768x1024, 1024x768)
  - Mobile (375x667, 414x896)

### **NFR5: Scalability**
- Support 100+ concurrent users
- Database can handle 10,000+ records
- Image storage optimization
- Efficient query execution

### **NFR6: Maintainability**
- Modular code structure
- Code comments and documentation
- Consistent naming conventions
- Separation of concerns (layers)
- Version control (Git)

### **NFR7: Availability**
- System uptime: 99% (educational environment)
- Error handling and logging
- Graceful degradation
- Backup and recovery procedures

---

## 🔄 System Workflows

### **Workflow 1: User Registration to First Booking**
```
1. Visitor lands on Home page
2. Clicks "Sign Up" → Navigate to Register.aspx
3. Fills registration form:
   - Personal details (name, email, phone)
   - Location (country, state, city)
   - Password
   - Optional: Upload profile picture
4. Submit form → Server validation
5. Check email uniqueness in database
6. Insert user record into Users table
7. Display success message
8. Redirect to Login page
9. User logs in with credentials
10. Session created with user info
11. Redirect to Home page (logged in state)
12. Browse destinations → Click destination card
13. View destination details
14. Click "Book This Trip"
15. Navigate to bookingConfirmation.aspx
16. Fill booking form:
    - Traveler details (auto-populated)
    - Select travel date
    - Select number of travelers
17. View price calculation
18. Confirm booking
19. Insert booking into Bookings table
20. Send confirmation email
21. Redirect to ThankYou page
22. Display booking confirmation
```

### **Workflow 2: Admin Adding New Destination**
```
1. Admin logs in with admin credentials
2. Session["Role"] = 'admin'
3. Navigate to AddDestinations.aspx
4. Fill destination form:
   - Name, Tagline, Description
   - Duration, GroupSize, Region
   - Price, Category
   - Upload main image
   - Upload gallery images (optional)
5. Submit form → Server validation
6. Validate image formats and sizes
7. Save images to server (Images/DestinationImages/)
8. Generate image paths
9. Insert destination record into Destinations table
10. Display success message
11. Option to: Add another / View destinations
12. Navigate to AdminDestinations.aspx
13. View all destinations in table
14. Options: Edit / Delete each destination
```

### **Workflow 3: Password Reset**
```
1. User clicks "Forgot Password" on Login page
2. Navigate to ForgetPassword.aspx
3. Enter registered email address
4. Submit → Verify email exists in database
5. Generate password reset token
6. Send email with reset link
7. User clicks link in email
8. Navigate to ResetPassword.aspx?token=[TOKEN]
9. Verify token validity and expiration
10. Display password reset form
11. Enter new password (twice for confirmation)
12. Submit → Validate passwords match
13. Update password in Users table
14. Display success message
15. Redirect to Login page
16. User logs in with new password
```

---

## 📋 System Constraints

### **Technical Constraints:**
- .NET Framework 4.7.2 required
- Windows Server or IIS hosting
- SQL Server LocalDB or SQL Server instance
- Gmail account for SMTP service
- Visual Studio for development

### **Operational Constraints:**
- Max file upload: 50MB
- Max concurrent sessions: [Based on server capacity]
- Database max size: 10GB (LocalDB limit)
- Email send limit: Gmail SMTP limits (500/day for free accounts)

### **Business Constraints:**
- Educational project scope
- Single-language support (English)
- Single currency support
- No payment gateway integration
- No real-time inventory management

---

## 🎯 Success Criteria

### **For Users:**
- Successfully register and create account
- Browse destinations with smooth UX
- Complete booking within 3 steps
- Receive email confirmations
- View booking history easily
- Update profile information

### **For Administrators:**
- Add/edit/delete destinations efficiently
- View all bookings in dashboard
- Manage user accounts
- Receive contact form notifications

### **For System:**
- No server crashes under normal load
- All database transactions complete successfully
- Email delivery rate > 95%
- Page load times < 3 seconds
- Mobile responsiveness on all pages

---

## 📝 SRS Document Structure Request

**Please generate a comprehensive SRS document with the following sections:**

### **1. Introduction**
- 1.1 Purpose
- 1.2 Document Conventions
- 1.3 Intended Audience
- 1.4 Project Scope
- 1.5 References

### **2. Overall Description**
- 2.1 Product Perspective
- 2.2 Product Features
- 2.3 User Classes and Characteristics
- 2.4 Operating Environment
- 2.5 Design and Implementation Constraints
- 2.6 Assumptions and Dependencies

### **3. System Features**
- 3.1 User Authentication Module
- 3.2 Destination Management Module
- 3.3 Booking Management Module
- 3.4 User Profile Module
- 3.5 Admin Dashboard Module
- 3.6 Email Notification Module
- 3.7 Contact Management Module

### **4. External Interface Requirements**
- 4.1 User Interfaces
- 4.2 Hardware Interfaces
- 4.3 Software Interfaces
- 4.4 Communication Interfaces

### **5. Non-Functional Requirements**
- 5.1 Performance Requirements
- 5.2 Safety Requirements
- 5.3 Security Requirements
- 5.4 Software Quality Attributes
- 5.5 Business Rules

### **6. Other Requirements**
- 6.1 Database Requirements
- 6.2 Internationalization Requirements
- 6.3 Legal Requirements

### **Appendices**
- Appendix A: Glossary
- Appendix B: Analysis Models (Use Cases, Sequence Diagrams)
- Appendix C: Database Schema Details
- Appendix D: Screen Mockups

---

## 🔍 Additional Information

### **Known Issues/Limitations (For Educational Purpose):**
1. Passwords stored in plain text (security vulnerability)
2. SQL injection risks (string concatenation in queries)
3. No input sanitization
4. Basic session management without timeout
5. No CSRF protection
6. No payment processing integration
7. No real-time availability checking
8. Single language support only

### **Future Enhancements (Out of Scope for Current SRS):**
- Payment gateway integration
- Multi-language support
- Real-time chat support
- Advanced search and filters
- User reviews and ratings
- Social media integration
- Mobile application (iOS/Android)
- Advanced analytics and reporting
- Integration with third-party travel APIs
- Recommendation engine

---

## ✅ Validation Checklist

**Ensure the SRS document includes:**
- [ ] Clear functional requirements for each module
- [ ] User stories/use cases for key workflows
- [ ] Database schema with all tables and relationships
- [ ] UI/UX mockups or descriptions
- [ ] Security considerations and recommendations
- [ ] Performance benchmarks
- [ ] Testing requirements
- [ ] Deployment requirements
- [ ] User role matrix
- [ ] API specifications (if any)
- [ ] Error handling procedures
- [ ] Data backup and recovery procedures

---

## 📄 Output Format

**Please generate the SRS document in the following format:**
- Professional IEEE 830 standard structure
- Clear and concise language
- Technical specifications for developers
- User-friendly descriptions for stakeholders
- Include diagrams: Use Case, Sequence, ER, Flowcharts
- Page numbering and table of contents
- Version control information

**Target Audience:**
- Project stakeholders
- Development team
- QA/Testing team
- Future maintainers
- Academic evaluators

---

**🎓 Note:** This is an educational project demonstrating ASP.NET Web Forms development. The SRS should reflect best practices while acknowledging the intentional security limitations for learning purposes. Include recommendations for production-ready implementations where applicable.

---

**End of SRS Generation Prompt**
