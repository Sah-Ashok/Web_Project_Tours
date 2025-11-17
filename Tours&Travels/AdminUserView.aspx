<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminUserView.aspx.cs" Inherits="Tours_Travels.AdminUserView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Custom Colors based on the inferred palette (using variables just for clarity) */
        :root {
            --midnight-green: #0a4f3b; /* A deep, rich green */
            --dartmouth-green: #0b6e4f; /* A strong, primary green */
            --pigment-green: #2a9d8f; /* Lighter accent green */
            --ecru: #f4e8c1; /* Light contrast color */
        }

        .heading-font {
            font-family: 'Inter', sans-serif;
        }

        /* Replicating the header background from your ASPX */
        .header-section {
            background: linear-gradient(to right, var(--midnight-green), var(--dartmouth-green));
        }

        /* Custom styles to handle responsive table layout on mobile */
        .booking-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1200px;
        }

        .status-Completed {
            background-color: #d1fae5; /* Green-100 */
            color: #065f46; /* Green-800 */
        }

        .status-Pending {
            background-color: #fef3c7; /* Yellow-100 */
            color: #b45309; /* Amber-800 */
        }

        .status-Cancelled {
            background-color: #fee2e2; /* Red-100 */
            color: #991b1b; /* Red-800 */
        }

        @media (max-width: 768px) {
            .booking-table {
                min-width: 100%;
            }

                .booking-table thead {
                    display: none;
                }

                .booking-table, .booking-table tbody, .booking-table tr, .booking-table td {
                    display: block;
                    width: 100%;
                }

                    .booking-table tr {
                        margin-bottom: 1rem;
                        border: 1px solid #e5e7eb;
                        border-radius: 0.5rem;
                        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05);
                    }

                    .booking-table td {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        padding: 0.75rem 1rem;
                        border-bottom: 1px solid #f3f4f6;
                        text-align: right;
                    }

                        .booking-table td:last-child {
                            border-bottom: none;
                        }

                        .booking-table td[data-label]::before {
                            content: attr(data-label);
                            font-weight: 600;
                            text-align: left;
                            margin-right: 1rem;
                            color: #4b5563;
                        }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="min-h-screen">
        <!-- Header Section -->
        <section class="header-section text-white py-16" data-aos="fade-in">
            <div class="container mx-auto px-4 max-w-7xl">
                <!-- Back Link - Static version just links back to a placeholder -->
                <a href="AdminUserManagement.html" class="flex items-center gap-2 text-sm opacity-75 hover:opacity-100 transition mb-4">
                    <i class="las la-arrow-left text-xl"></i>Back to User Management
                </a>
                <div class="flex items-center gap-4">
                    <!-- Placeholder image - Replace with actual user image in dynamic environment -->
                    <img src="https://placehold.co/80x80/2a9d8f/ffffff?text=ER" alt="Evelyn Reed" class="w-20 h-20 rounded-full object-cover border-4 border-white shadow-lg" onerror="this.onerror=null; this.src='https://placehold.co/80x80/2a9d8f/ffffff?text=ER';" />
                    <div>
                        <h1 class="text-3xl md:text-4xl font-bold heading-font">Evelyn Reed</h1>
                        <p class="text-lg opacity-90">evelyn.reed@wanderlust.com</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-12 md:py-16">
            <div class="container mx-auto px-4 max-w-7xl">
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <!-- User Information Card and Financial Summary -->
                    <div class="lg:col-span-1 h-fit" data-aos="fade-up" data-aos-delay="100">

                        <!-- Contact & Address Card -->
                        <div class="bg-white rounded-xl shadow-xl p-6 mb-8">
                            <h2 class="text-2xl font-bold text-[#0a4f3b] mb-6 border-b pb-3">Contact & Address</h2>
                            <div class="space-y-2">
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="font-medium text-gray-500">First Name:</span>
                                    <span class="font-semibold text-gray-800">Evelyn</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="font-medium text-gray-500">Last Name:</span>
                                    <span class="font-semibold text-gray-800">Reed</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="font-medium text-gray-500">Phone:</span>
                                    <span class="font-semibold text-gray-800">(555) 890-1234</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="font-medium text-gray-500">Country:</span>
                                    <span class="font-semibold text-gray-800">Canada</span>
                                </div>
                                <div class="flex justify-between items-center py-2 border-b border-gray-100">
                                    <span class="font-medium text-gray-500">State:</span>
                                    <span class="font-semibold text-gray-800">British Columbia</span>
                                </div>
                                <div class="flex justify-between items-center py-2">
                                    <span class="font-medium text-gray-500">City:</span>
                                    <span class="font-semibold text-gray-800">Vancouver</span>
                                </div>
                            </div>
                        </div>

                        <!-- Financial Summary Card (NEW) -->
                        <div class="bg-white rounded-xl shadow-xl p-6" data-aos="fade-up" data-aos-delay="200">
                            <h2 class="text-2xl font-bold text-[#0a4f3b] mb-6 border-b pb-3">Financial Summary</h2>
                            <div class="space-y-2">
                                <div class="flex justify-between items-center py-2 border-b border-gray-100 bg-green-50 rounded-md px-3">
                                    <span class="font-bold text-gray-700 flex items-center gap-2"><i class="las la-check-circle text-green-600 text-xl"></i>Completed Revenue:</span>
                                    <!-- ID for JavaScript update -->
                                    <span id="lblCompletedRevenue" class="font-extrabold text-xl text-green-700">--</span>
                                </div>
                                <div class="flex justify-between items-center py-2 bg-gray-50 rounded-md px-3">
                                    <span class="font-medium text-gray-500 flex items-center gap-2"><i class="las la-wallet text-gray-400 text-xl"></i>Total Bookings Value:</span>
                                    <!-- ID for JavaScript update -->
                                    <span id="lblTotalRevenue" class="font-semibold text-gray-700">--</span>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Booking History Card -->
                    <div class="lg:col-span-2 bg-white rounded-xl shadow-xl overflow-hidden" data-aos="fade-up" data-aos-delay="200">
                        <div class="p-6">
                            <h2 class="text-2xl font-bold text-[#0a4f3b] mb-6 border-b pb-3">Booking History (4 Total)</h2>
                        </div>

                        <div class="table-container overflow-x-auto">
                            <table class="booking-table" id="bookingTable">
                                <thead>
                                    <tr>
                                        <th class="py-3 px-6 text-xs text-gray-600 uppercase tracking-wider bg-gray-50">Booking ID</th>
                                        <th class="py-3 px-6 text-xs text-gray-600 uppercase tracking-wider bg-gray-50">Destination</th>
                                        <th class="py-3 px-6 text-xs text-gray-600 uppercase tracking-wider bg-gray-50">Date</th>
                                        <th class="py-3 px-6 text-xs text-gray-600 uppercase tracking-wider bg-gray-50">Travelers</th>
                                        <th class="py-3 px-6 text-xs text-gray-600 uppercase tracking-wider bg-gray-50">Total Amount</th>
                                        <th class="py-3 px-6 text-xs text-gray-600 uppercase tracking-wider bg-gray-50">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- MOCK Booking 1: Pending -->
                                    <tr class="hover:bg-gray-50 transition duration-150">
                                        <td data-label="Booking ID" class="py-4 px-6 font-mono text-sm text-gray-500">#B001</td>
                                        <td data-label="Destination" class="py-4 px-6 font-semibold text-[#0b6e4f]">Alaskan Glacier Cruise
                                        <div class="text-xs text-gray-500 font-normal mt-1">7 Days / 6 Nights</div>
                                        </td>
                                        <td data-label="Date" class="py-4 px-6 text-gray-600">Dec 10, 2024</td>
                                        <td data-label="Travelers" class="py-4 px-6 text-gray-600">3</td>
                                        <td data-label="Total Amount" class="py-4 px-6 font-bold text-lg text-red-600" data-amount="4500.00">$4,500.00</td>
                                        <td data-label="Status" class="py-4 px-6" data-status="Pending">
                                            <span class="status-Pending inline-block px-3 py-1 rounded-full text-xs font-semibold">Pending</span>
                                        </td>
                                    </tr>
                                    <!-- MOCK Booking 2: Completed -->
                                    <tr class="hover:bg-gray-50 transition duration-150">
                                        <td data-label="Booking ID" class="py-4 px-6 font-mono text-sm text-gray-500">#B002</td>
                                        <td data-label="Destination" class="py-4 px-6 font-semibold text-[#0b6e4f]">Kyoto Cherry Blossom Tour
                                        <div class="text-xs text-gray-500 font-normal mt-1">10 Days / 9 Nights</div>
                                        </td>
                                        <td data-label="Date" class="py-4 px-6 text-gray-600">May 05, 2024</td>
                                        <td data-label="Travelers" class="py-4 px-6 text-gray-600">2</td>
                                        <td data-label="Total Amount" class="py-4 px-6 font-bold text-lg text-red-600" data-amount="3200.00">$3,200.00</td>
                                        <td data-label="Status" class="py-4 px-6" data-status="Completed">
                                            <span class="status-Completed inline-block px-3 py-1 rounded-full text-xs font-semibold">Completed</span>
                                        </td>
                                    </tr>
                                    <!-- MOCK Booking 3: Completed -->
                                    <tr class="hover:bg-gray-50 transition duration-150">
                                        <td data-label="Booking ID" class="py-4 px-6 font-mono text-sm text-gray-500">#B003</td>
                                        <td data-label="Destination" class="py-4 px-6 font-semibold text-[#0b6e4f]">Santorini Sunset Getaway
                                        <div class="text-xs text-gray-500 font-normal mt-1">4 Days / 3 Nights</div>
                                        </td>
                                        <td data-label="Date" class="py-4 px-6 text-gray-600">Jan 20, 2024</td>
                                        <td data-label="Travelers" class="py-4 px-6 text-gray-600">1</td>
                                        <td data-label="Total Amount" class="py-4 px-6 font-bold text-lg text-red-600" data-amount="1150.00">$1,150.00</td>
                                        <td data-label="Status" class="py-4 px-6" data-status="Completed">
                                            <span class="status-Completed inline-block px-3 py-1 rounded-full text-xs font-semibold">Completed</span>
                                        </td>
                                    </tr>
                                    <!-- MOCK Booking 4: Cancelled -->
                                    <tr class="hover:bg-gray-50 transition duration-150">
                                        <td data-label="Booking ID" class="py-4 px-6 font-mono text-sm text-gray-500">#B004</td>
                                        <td data-label="Destination" class="py-4 px-6 font-semibold text-[#0b6e4f]">Patagonian Hiking Trip
                                        <div class="text-xs text-gray-500 font-normal mt-1">8 Days / 7 Nights</div>
                                        </td>
                                        <td data-label="Date" class="py-4 px-6 text-gray-600">Sep 15, 2023</td>
                                        <td data-label="Travelers" class="py-4 px-6 text-gray-600">4</td>
                                        <td data-label="Total Amount" class="py-4 px-6 font-bold text-lg text-red-600" data-amount="6780.00">$6,780.00</td>
                                        <td data-label="Status" class="py-4 px-6" data-status="Cancelled">
                                            <span class="status-Cancelled inline-block px-3 py-1 rounded-full text-xs font-semibold">Cancelled</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        // Function to format a number as US currency
        const formatCurrency = (amount) => {
            return new Intl.NumberFormat('en-US', {
                style: 'currency',
                currency: 'USD',
                minimumFractionDigits: 2,
            }).format(amount);
        };

        // Function to calculate and display revenue statistics
        function calculateRevenue() {
            const tableBody = document.querySelector('#bookingTable tbody');
            if (!tableBody) return;

            let completedRevenue = 0;
            let totalRevenue = 0;

            // Get all rows in the table body
            const rows = tableBody.querySelectorAll('tr');

            rows.forEach(row => {
                const statusCell = row.querySelector('[data-status]');
                const amountCell = row.querySelector('[data-amount]');

                if (amountCell) {
                    // Get the clean numeric value from the data-amount attribute
                    const amount = parseFloat(amountCell.getAttribute('data-amount'));

                    // Add to grand total
                    totalRevenue += amount;

                    // Check status and add to completed total
                    if (statusCell && statusCell.getAttribute('data-status') === 'Completed') {
                        completedRevenue += amount;
                    }
                }
            });

            // Update the display elements
            document.getElementById('lblCompletedRevenue').textContent = formatCurrency(completedRevenue);
            document.getElementById('lblTotalRevenue').textContent = formatCurrency(totalRevenue);
        }

        // Initialize AOS animations and calculate revenue on page load
        document.addEventListener('DOMContentLoaded', () => {
            AOS.init({
                duration: 800,
                once: true,
                offset: 50
            });
            calculateRevenue(); // Run calculation after the content is loaded
        });
    </script>
</asp:Content>



