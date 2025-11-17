<%@ Page Title="Bulk Message" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BulkMessage.aspx.cs" Inherits="Tours_Travels.BulkMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

    <style>
        .hero-section {
            position: relative;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(11, 110, 79, 0.5);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            text-shadow: 0 2px 8px rgba(0,0,0,0.5);
        }

        .message-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .btn-primary {
            background-color: var(--dartmouth-green);
            color: white;
            padding: 0.75rem 2rem;
            border-radius: 9999px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-primary:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(11, 110, 79, 0.3);
        }

        .btn-secondary {
            background-color: white;
            color: var(--dartmouth-green);
            padding: 0.75rem 2rem;
            border-radius: 9999px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: 2px solid var(--dartmouth-green);
            cursor: pointer;
        }

        .btn-secondary:hover {
            background-color: var(--dartmouth-green);
            color: white;
        }

        .template-btn {
            padding: 0.5rem 1rem;
            margin: 0.25rem;
            border-radius: 8px;
            border: 1px solid #d1d5db;
            background: white;
            cursor: pointer;
            transition: all 0.2s ease;
            font-size: 0.875rem;
        }

        .template-btn:hover {
            border-color: var(--dartmouth-green);
            background-color: #f0fdf4;
            transform: translateY(-2px);
        }

        .label {
            display: block;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--midnight-green);
        }

        .input-field, .textarea-field, .select-field {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.2s ease;
        }

        .input-field:focus, .textarea-field:focus, .select-field:focus {
            outline: none;
            border-color: var(--dartmouth-green);
        }

        .textarea-field {
            resize: vertical;
            min-height: 150px;
            font-family: inherit;
        }

        .stats-card {
            background: linear-gradient(135deg, var(--dartmouth-green), var(--midnight-green));
            color: white;
            padding: 1.5rem;
            border-radius: 12px;
            text-align: center;
        }

        .recipient-row {
            display: flex;
            align-items: center;
            padding: 1rem;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            margin-bottom: 0.75rem;
            transition: all 0.2s ease;
        }

        .recipient-row:hover {
            background-color: #f9fafb;
            border-color: var(--dartmouth-green);
        }

        .recipient-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--dartmouth-green), var(--midnight-green));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.25rem;
            margin-right: 1rem;
        }

        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .status-active {
            background-color: #d1fae5;
            color: #065f46;
        }

        .status-premium {
            background-color: #fef3c7;
            color: #92400e;
        }

        .status-inactive {
            background-color: #fee2e2;
            color: #991b1b;
        }

        .checkbox-custom {
            width: 20px;
            height: 20px;
            cursor: pointer;
            accent-color: var(--dartmouth-green);
        }

        .filter-tag {
            display: inline-block;
            padding: 0.5rem 1rem;
            margin: 0.25rem;
            border-radius: 20px;
            border: 1px solid #d1d5db;
            background: white;
            cursor: pointer;
            transition: all 0.2s ease;
            font-size: 0.875rem;
        }

        .filter-tag:hover, .filter-tag.active {
            background-color: var(--dartmouth-green);
            color: white;
            border-color: var(--dartmouth-green);
        }

        .message-preview {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            padding: 1.5rem;
            margin-top: 1rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <!-- Hero Section -->
        <section class="hero-section h-64 md:h-80 w-full bg-cover bg-center" data-aos="fade-in"
                 style="background-image: url('https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
            <div class="hero-content container mx-auto px-4" data-aos="fade-up">
                <h1 class="text-4xl md:text-5xl font-bold heading-font mb-4">Bulk Message Center</h1>
                <p class="text-lg md:text-xl max-w-3xl mx-auto">Send promotional offers and discounts to your customers</p>
            </div>
        </section>

        <section class="py-12 md:py-16 bg-gray-50">
            <div class="container mx-auto px-4">

                <!-- Statistics Dashboard -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8" data-aos="fade-up">
                    <div class="stats-card">
                        <h3 class="text-3xl font-bold">245</h3>
                        <p class="text-sm opacity-90 mt-2">Total Customers</p>
                    </div>
                    <div class="stats-card">
                        <h3 class="text-3xl font-bold" id="selectedCount">0</h3>
                        <p class="text-sm opacity-90 mt-2">Selected Recipients</p>
                    </div>
                    <div class="stats-card">
                        <h3 class="text-3xl font-bold">127</h3>
                        <p class="text-sm opacity-90 mt-2">Messages Sent Today</p>
                    </div>
                </div>

                <!-- Message Composition Section -->
                <div class="message-card" data-aos="fade-up" data-aos-delay="100">
                    <h2 class="text-2xl font-bold heading-font mb-6" style="color: var(--midnight-green);">📝 Compose Message</h2>
                    
                    <!-- Message Templates -->
                    <div class="mb-6">
                        <label class="label">Quick Templates</label>
                        <div class="flex flex-wrap gap-2">
                            <button class="template-btn" onclick="loadTemplate('seasonal')">🎉 Seasonal Offer</button>
                            <button class="template-btn" onclick="loadTemplate('earlybird')">✈️ Early Bird Discount</button>
                            <button class="template-btn" onclick="loadTemplate('flash')">🌟 Flash Sale</button>
                            <button class="template-btn" onclick="loadTemplate('loyalty')">🎁 Loyalty Reward</button>
                            <button class="template-btn" onclick="loadTemplate('newdest')">📢 New Destination</button>
                        </div>
                    </div>

                    <!-- Subject -->
                    <div class="mb-6">
                        <label class="label">Subject</label>
                        <input type="text" id="txtSubject" class="input-field" 
                            placeholder="e.g., Exclusive 30% Off on Your Dream Vacation!" />
                    </div>

                    <!-- Message Body -->
                    <div class="mb-6">
                        <label class="label">Message</label>
                        <textarea id="txtMessage" class="textarea-field"
                            placeholder="Dear Customer,&#10;&#10;We are excited to announce an exclusive offer just for you! &#10;&#10;Book your dream vacation now and save big..."></textarea>
                        <small class="text-gray-600">💡 Use {Name} to personalize with customer name</small>
                    </div>

                    <!-- Discount/Offer Details -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                        <div>
                            <label class="label">Discount Code (Optional)</label>
                            <input type="text" id="txtDiscountCode" class="input-field" 
                                placeholder="e.g., SAVE30" />
                        </div>
                        <div>
                            <label class="label">Valid Until (Optional)</label>
                            <input type="date" id="txtValidUntil" class="input-field" />
                        </div>
                    </div>

                    <!-- Message Type -->
                    <div class="mb-6">
                        <label class="label">Message Type</label>
                        <div class="flex gap-6">
                            <label class="flex items-center gap-2 cursor-pointer">
                                <input type="radio" name="messageType" value="email" checked class="checkbox-custom" />
                                <span>📧 Email</span>
                            </label>
                            <label class="flex items-center gap-2 cursor-pointer">
                                <input type="radio" name="messageType" value="sms" class="checkbox-custom" />
                                <span>📱 SMS</span>
                            </label>
                            <label class="flex items-center gap-2 cursor-pointer">
                                <input type="radio" name="messageType" value="both" class="checkbox-custom" />
                                <span>📧📱 Both</span>
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Recipient Selection Section -->
                <div class="message-card" data-aos="fade-up" data-aos-delay="200">
                    <div class="flex justify-between items-center mb-6">
                        <h2 class="text-2xl font-bold heading-font" style="color: var(--midnight-green);">👥 Select Recipients</h2>
                        <div class="flex gap-3">
                            <button class="btn-secondary" onclick="selectAll()">Select All</button>
                            <button class="btn-secondary" onclick="deselectAll()">Deselect All</button>
                        </div>
                    </div>

                    <!-- Filter Options -->
                    <div class="mb-6 p-4 bg-gray-50 rounded-lg">
                        <label class="label">Filter Recipients</label>
                        <div class="flex flex-wrap gap-2">
                            <button class="filter-tag active" onclick="filterRecipients('all')">All Customers</button>
                            <button class="filter-tag" onclick="filterRecipients('active')">Active Customers</button>
                            <button class="filter-tag" onclick="filterRecipients('premium')">Premium Members</button>
                            <button class="filter-tag" onclick="filterRecipients('inactive')">Inactive (30+ days)</button>
                        </div>
                    </div>

                    <!-- Recipients List (Static) -->
                    <div id="recipientsList">
                        <!-- Recipient 1 -->
                        <div class="recipient-row" data-status="active">
                            <input type="checkbox" class="checkbox-custom recipient-checkbox" onchange="updateCount()" />
                            <div class="recipient-avatar">A</div>
                            <div class="flex-grow">
                                <h4 class="font-semibold text-lg">Amit Sharma</h4>
                                <p class="text-sm text-gray-600">amit.sharma@email.com | +91 98765 43210</p>
                                <p class="text-xs text-gray-500 mt-1">Last Booking: Nov 10, 2025</p>
                            </div>
                            <span class="status-badge status-active">Active</span>
                        </div>

                        <!-- Recipient 2 -->
                        <div class="recipient-row" data-status="premium">
                            <input type="checkbox" class="checkbox-custom recipient-checkbox" onchange="updateCount()" />
                            <div class="recipient-avatar">P</div>
                            <div class="flex-grow">
                                <h4 class="font-semibold text-lg">Priya Patel</h4>
                                <p class="text-sm text-gray-600">priya.patel@email.com | +91 98765 43211</p>
                                <p class="text-xs text-gray-500 mt-1">Last Booking: Nov 12, 2025</p>
                            </div>
                            <span class="status-badge status-premium">Premium</span>
                        </div>

                        <!-- Recipient 3 -->
                        <div class="recipient-row" data-status="active">
                            <input type="checkbox" class="checkbox-custom recipient-checkbox" onchange="updateCount()" />
                            <div class="recipient-avatar">R</div>
                            <div class="flex-grow">
                                <h4 class="font-semibold text-lg">Rahul Kumar</h4>
                                <p class="text-sm text-gray-600">rahul.kumar@email.com | +91 98765 43212</p>
                                <p class="text-xs text-gray-500 mt-1">Last Booking: Nov 08, 2025</p>
                            </div>
                            <span class="status-badge status-active">Active</span>
                        </div>

                        <!-- Recipient 4 -->
                        <div class="recipient-row" data-status="inactive">
                            <input type="checkbox" class="checkbox-custom recipient-checkbox" onchange="updateCount()" />
                            <div class="recipient-avatar">S</div>
                            <div class="flex-grow">
                                <h4 class="font-semibold text-lg">Sneha Desai</h4>
                                <p class="text-sm text-gray-600">sneha.desai@email.com | +91 98765 43213</p>
                                <p class="text-xs text-gray-500 mt-1">Last Booking: Sep 15, 2025</p>
                            </div>
                            <span class="status-badge status-inactive">Inactive</span>
                        </div>

                        <!-- Recipient 5 -->
                        <div class="recipient-row" data-status="premium">
                            <input type="checkbox" class="checkbox-custom recipient-checkbox" onchange="updateCount()" />
                            <div class="recipient-avatar">V</div>
                            <div class="flex-grow">
                                <h4 class="font-semibold text-lg">Vikram Singh</h4>
                                <p class="text-sm text-gray-600">vikram.singh@email.com | +91 98765 43214</p>
                                <p class="text-xs text-gray-500 mt-1">Last Booking: Nov 14, 2025</p>
                            </div>
                            <span class="status-badge status-premium">Premium</span>
                        </div>

                        <!-- Recipient 6 -->
                        <div class="recipient-row" data-status="active">
                            <input type="checkbox" class="checkbox-custom recipient-checkbox" onchange="updateCount()" />
                            <div class="recipient-avatar">M</div>
                            <div class="flex-grow">
                                <h4 class="font-semibold text-lg">Meera Joshi</h4>
                                <p class="text-sm text-gray-600">meera.joshi@email.com | +91 98765 43215</p>
                                <p class="text-xs text-gray-500 mt-1">Last Booking: Nov 11, 2025</p>
                            </div>
                            <span class="status-badge status-active">Active</span>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="text-center mt-8" data-aos="fade-up" data-aos-delay="300">
                    <button class="btn-primary text-lg" onclick="sendMessages()">
                        📤 Send Messages
                    </button>
                    <button class="btn-secondary text-lg ml-4" onclick="previewMessage()">
                        👁️ Preview Message
                    </button>
                </div>

                <!-- Message Preview Modal (Hidden by default) -->
                <div id="previewModal" class="message-preview hidden mt-8" data-aos="fade-up">
                    <h3 class="text-xl font-bold mb-4">Message Preview</h3>
                    <div class="bg-white p-6 rounded-lg border-2 border-gray-200">
                        <p class="font-semibold mb-2">Subject: <span id="previewSubject"></span></p>
                        <hr class="my-4" />
                        <p id="previewBody" class="whitespace-pre-line"></p>
                        <hr class="my-4" />
                        <p class="text-sm text-gray-600">Discount Code: <span id="previewCode"></span></p>
                        <p class="text-sm text-gray-600">Valid Until: <span id="previewDate"></span></p>
                    </div>
                </div>

            </div>
        </section>
    </main>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            AOS.init({ duration: 800, once: true, offset: 50 });
        });

        // Update selected count
        function updateCount() {
            const checkboxes = document.querySelectorAll('.recipient-checkbox:checked');
            document.getElementById('selectedCount').textContent = checkboxes.length;
        }

        // Select all recipients
        function selectAll() {
            document.querySelectorAll('.recipient-checkbox').forEach(cb => {
                if (cb.closest('.recipient-row').style.display !== 'none') {
                    cb.checked = true;
                }
            });
            updateCount();
        }

        // Deselect all recipients
        function deselectAll() {
            document.querySelectorAll('.recipient-checkbox').forEach(cb => cb.checked = false);
            updateCount();
        }

        // Filter recipients
        function filterRecipients(filter) {
            // Update active filter tag
            document.querySelectorAll('.filter-tag').forEach(tag => tag.classList.remove('active'));
            event.target.classList.add('active');

            const rows = document.querySelectorAll('.recipient-row');
            rows.forEach(row => {
                if (filter === 'all') {
                    row.style.display = 'flex';
                } else {
                    row.style.display = row.getAttribute('data-status') === filter ? 'flex' : 'none';
                }
            });
            updateCount();
        }

        // Load message templates
        function loadTemplate(type) {
            const templates = {
                seasonal: {
                    subject: '🎉 Exclusive Seasonal Offer - Save Up to 40%!',
                    message: 'Dear {Name},\n\nThis season, we have something special for you! Enjoy up to 40% off on all our premium tour packages.\n\nBook your dream destination now and create memories that last a lifetime.\n\nHurry! Offer valid for limited time only.\n\nBest Regards,\nTours & Travels Team'
                },
                earlybird: {
                    subject: '✈️ Early Bird Special - Book Now & Save Big!',
                    message: 'Dear {Name},\n\nBe an early bird and grab amazing discounts on your next adventure!\n\nBook 60 days in advance and get up to 30% off on all destinations.\n\nDon\'t miss this opportunity to save while you explore the world.\n\nBest Regards,\nTours & Travels Team'
                },
                flash: {
                    subject: '🌟 24-Hour Flash Sale - Up to 50% Off!',
                    message: 'Dear {Name},\n\n⚡ FLASH SALE ALERT! ⚡\n\nFor the next 24 hours only, enjoy up to 50% off on selected destinations!\n\nThis is your chance to book that dream vacation you\'ve been planning.\n\nOffer ends soon - Book NOW!\n\nBest Regards,\nTours & Travels Team'
                },
                loyalty: {
                    subject: '🎁 Thank You! Here\'s Your Exclusive Loyalty Reward',
                    message: 'Dear {Name},\n\nThank you for being a valued customer!\n\nAs a token of appreciation, we\'re offering you an exclusive 25% discount on your next booking.\n\nYour loyalty means the world to us, and we look forward to serving you again.\n\nBest Regards,\nTours & Travels Team'
                },
                newdest: {
                    subject: '📢 New Exotic Destinations Now Available!',
                    message: 'Dear {Name},\n\nExciting news! We\'ve just added stunning new destinations to our collection.\n\nFrom tropical beaches to mountain retreats, discover places you\'ve never explored before.\n\nBook early and get 20% off on all new destinations!\n\nBest Regards,\nTours & Travels Team'
                }
            };

            if (templates[type]) {
                document.getElementById('txtSubject').value = templates[type].subject;
                document.getElementById('txtMessage').value = templates[type].message;
            }
        }

        // Preview message
        function previewMessage() {
            const subject = document.getElementById('txtSubject').value || 'No Subject';
            const message = document.getElementById('txtMessage').value || 'No Message';
            const code = document.getElementById('txtDiscountCode').value || 'N/A';
            const date = document.getElementById('txtValidUntil').value || 'N/A';

            document.getElementById('previewSubject').textContent = subject;
            document.getElementById('previewBody').textContent = message.replace('{Name}', 'John Doe');
            document.getElementById('previewCode').textContent = code;
            document.getElementById('previewDate').textContent = date;

            document.getElementById('previewModal').classList.remove('hidden');
        }

        // Send messages (Static alert - replace with backend logic later)
        function sendMessages() {
            const selected = document.querySelectorAll('.recipient-checkbox:checked').length;
            
            if (selected === 0) {
                alert('⚠️ Please select at least one recipient!');
                return;
            }

            const subject = document.getElementById('txtSubject').value;
            const message = document.getElementById('txtMessage').value;

            if (!subject || !message) {
                alert('⚠️ Please fill in both subject and message!');
                return;
            }

            // Simulate sending
            alert(`✅ Success! Message sent to ${selected} recipient(s).\n\nSubject: ${subject}\n\n(Backend logic will be added later)`);
        }
    </script>
</asp:Content>

