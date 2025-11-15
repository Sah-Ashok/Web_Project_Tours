<%@ Page Title="Admin - Manage Destinations" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="AdminDestinations.aspx.cs"
    Inherits="Tours_Travels.AdminDestinations" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --midnight-green: #073b3a;
            --dartmouth-green: #0b6e4f;
            --pigment-green: #08a045;
        }
        .header-section {
            background: linear-gradient(to right, var(--midnight-green), var(--dartmouth-green));
        }
        .table-container { overflow-x: auto; }
        .data-table { width: 100%; border-collapse: collapse; min-width: 800px; }
        .data-table th, .data-table td { padding: 1rem 1.5rem; text-align: left; border-bottom: 1px solid #e5e7eb; vertical-align: middle; }
        .data-table th { background-color: #f9fafb; font-weight: 600; text-transform: uppercase; color: #374151; font-size: 0.75rem; }
        .data-table tbody tr:hover { background-color: #f3f4f6; }
        .dest-image-thumb { width: 96px; height: 64px; object-fit: cover; border-radius: 0.375rem; }
        .action-btn { padding: 0.5rem 1rem; border-radius: 0.5rem; font-weight: 600; display: inline-flex; align-items: center; justify-content: center; gap: 0.5rem; cursor: pointer; border: none; text-decoration: none; transition: all 0.2s ease-in-out; }
        .edit-btn { background-color: #e0e7ff; color: #4f46e5; }
        .edit-btn:hover { background-color: #4338ca; color: white; }
        .delete-btn { background-color: #fee2e2; color: #dc2626; }
        .delete-btn:hover { background-color: #b91c1c; color: white; }
        .add-new-btn { background-image: linear-gradient(to right, var(--pigment-green), var(--dartmouth-green)); color: white; padding: 0.75rem 1.5rem; border-radius: 9999px; font-weight: 600; display: inline-flex; align-items: center; gap: 0.5rem; text-decoration: none; transition: all 0.2s ease-in-out; }
        .add-new-btn:hover { transform: translateY(-3px); box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .modal-overlay {
            position: fixed; top: 0; left: 0; right: 0; bottom: 0; background-color: rgba(17, 24, 39, 0.6);
            display: flex; align-items: center; justify-content: center; z-index: 50; opacity: 0; visibility: hidden; transition: all 0.3s ease-in-out;
        }
        .modal-overlay.active { opacity: 1; visibility: visible; }
        .modal-box { background-color: white; border-radius: 0.75rem; padding: 2rem; max-width: 450px; width: 90%; transform: scale(0.95); transition: all 0.3s ease-in-out; }
        .modal-overlay.active .modal-box { transform: scale(1); }
        .modal-icon { width: 3rem; height: 3rem; border-radius: 9999px; background-color: #fee2e2; color: #dc2626; display: flex; align-items: center; justify-content: center; margin: 0 auto 1rem auto; }
        .modal-buttons { display: flex; justify-content: flex-end; gap: 0.75rem; margin-top: 1.5rem; }
        .modal-btn { padding: 0.6rem 1.2rem; border-radius: 0.5rem; font-weight: 600; border: none; cursor: pointer; transition: all 0.2s ease; display: inline-flex; align-items: center; gap: 0.5rem;}
        .modal-btn:disabled { opacity: 0.7; cursor: not-allowed; }
        .modal-btn-cancel { background-color: #e5e7eb; color: #374151; }
        .modal-btn-cancel:hover { background-color: #d1d5db; }
        .modal-btn-confirm { background-color: #dc2626; color: white; }
        .modal-btn-confirm:hover { background-color: #b91c1c; }
        .empty-data-container { text-align: center; padding: 4rem 1rem; color: #6b7280; }
        .empty-data-icon { font-size: 4rem; margin-bottom: 0.75rem; color: #d1d5db; }
        .empty-data-title { font-weight: 700; font-size: 1.25rem; color: #374151; }
        .empty-data-text { margin-top: 0.5rem; }
        .spinner {
            width: 1rem; height: 1rem; border-radius: 50%; display: inline-block;
            border-top: 2px solid #fff; border-right: 2px solid transparent;
            animation: spin 1s linear infinite;
        }
        @keyframes spin { to { transform: rotate(360deg); } }
        
        /* New Message Banner Styles */
        .message-banner {
            display: none;
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-radius: 0.5rem;
            border: 1px solid transparent;
            font-weight: 500;
        }
        .message-banner.success {
            display: flex;
            align-items: center;
            background-color: #d1fae5;
            border-color: #6ee7b7;
            color: #065f46;
        }
        .message-banner.error {
            display: flex;
            align-items: center;
            background-color: #fee2e2;
            border-color: #fca5a5;
            color: #991b1b;
        }
        .message-icon {
             margin-right: 0.75rem;
             font-size: 1.25rem;
        }

    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" xintegrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0V4LLanw2qksYuRlEzO+tcaEPQogQ0KaoIF2QVp/wP8eR7l/J7Y1b1z+oA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <main class="bg-gray-50 min-h-screen">
            <section class="header-section text-white py-20">
                <div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
                    <h1 class="text-4xl md:text-5xl font-bold">Manage Destinations</h1>
                    <p class="text-lg mt-2">Add, edit, or remove travel packages from your website.</p>
                </div>
            </section>

            <section class="py-16 md:py-24">
                <div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    
                    <div id="messageBanner" role="alert"></div>

                    <div class="flex justify-end items-center mb-8">
                        <a href="AddDestinations.aspx" class="add-new-btn">
                            <i class="las la-plus text-xl"></i><span>Add New Destination</span>
                        </a>
                    </div>

                    <asp:Panel ID="pnlDestinations" runat="server" Visible="false">
                        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                            <div class="table-container">
                                <asp:Repeater ID="rptDestinations" runat="server" OnItemCommand="rptDestinations_ItemCommand">
                                    <HeaderTemplate>
                                        <table class="data-table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Image</th>
                                                    <th>Destination Name</th>
                                                    <th>Region</th>
                                                    <th>Category</th>
                                                    <th>Price</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="font-mono text-sm text-gray-500"><%# Eval("Id") %></td>
                                            <td><img src='http://localhost:3000/uploads/<%# Eval("mainImage") %>' alt='<%# Eval("name") %>' class="dest-image-thumb" /></td>
                                            <td class="font-semibold text-gray-800"><%# Eval("name") %></td>
                                            <td class="text-gray-600"><%# Eval("region") %></td>
                                            <td class="text-gray-600"><%# Eval("category") %></td>
                                            <td class="font-semibold text-gray-800">$<%# Eval("price", "{0:N2}") %></td>
                                            <td>
                                                <div class="flex items-center gap-2">
                                                    <a href='EditDestination.aspx?id=<%# Eval("Id") %>' class='action-btn edit-btn'>
                                                        <i class="las la-pen"></i> Edit
                                                    </a>
                                                    <asp:LinkButton ID="btnDelete" runat="server"
                                                        CssClass="action-btn delete-btn"
                                                        CommandName="DeleteDestination"
                                                        CommandArgument='<%# Eval("Id") %>'
                                                        UseSubmitBehavior="false"
                                                        OnClientClick="return openConfirmModal(this);">
                                                        <i class="las la-trash"></i> Delete
                                                    </asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                            </tbody>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlNoData" runat="server" Visible="false">
                         <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                             <div class="empty-data-container">
                                 <i class="las la-box-open empty-data-icon"></i>
                                 <p class="empty-data-title">No Destinations Found</p>
                                 <p class="empty-data-text text-gray-500">Try adding a new destination to get started.</p>
                             </div>
                         </div>
                    </asp:Panel>

                </div>
            </section>
        </main>

        <div id="deleteConfirmModal" class="modal-overlay" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
            <div class="modal-box text-center">
                <div class="modal-icon"><i class="las la-exclamation-triangle text-3xl"></i></div>
                <h3 id="modalTitle" class="text-2xl font-bold text-gray-800">Confirm Deletion</h3>
                <p class="text-gray-600 mt-2">Are you sure you want to permanently delete this destination? This action cannot be undone.</p>
                <div class="modal-buttons">
                    <button type="button" id="btnModalCancel" class="modal-btn modal-btn-cancel">Cancel</button>
                    <button type="button" id="btnModalConfirm" class="modal-btn modal-btn-confirm">
                        <span class="btn-text">Yes, Delete</span>
                        <span class="btn-loader" style="display: none;"><div class="spinner"></div></span>
                    </button>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
<script>
    let postbackScript = null;
    const modal = document.getElementById('deleteConfirmModal');
    const btnConfirm = document.getElementById('btnModalConfirm');
    const btnCancel = document.getElementById('btnModalCancel');

    function openConfirmModal(linkBtn) {
        postbackScript = linkBtn.href;
        modal.classList.add('active');
        return false;
    }

    function closeConfirmModal() {
        modal.classList.remove('active');
        postbackScript = null;
    }

    btnCancel.addEventListener('click', closeConfirmModal);
    modal.addEventListener('click', e => {
        if (e.target === modal) closeConfirmModal();
    });

    btnConfirm.addEventListener('click', function () {
        if (postbackScript) {
            btnConfirm.disabled = true;
            btnConfirm.querySelector('.btn-text').textContent = 'Deleting...';
            btnConfirm.querySelector('.btn-loader').style.display = 'inline-block';

            const scriptToExecute = postbackScript.substring('javascript:'.length);
            new Function(scriptToExecute)();
        }
    });

    function showMessage(message, type) {
        const banner = document.getElementById('messageBanner');
        if (!banner) return;

        let iconHtml = '';
        if (type === 'success') {
            iconHtml = '<i class="fa-solid fa-check-circle message-icon"></i>';
        } else if (type === 'error') {
            iconHtml = '<i class="fa-solid fa-times-circle message-icon"></i>';
        }

        banner.innerHTML = `${iconHtml}<span>${message}</span>`;
        banner.className = 'message-banner'; // Reset classes
        banner.classList.add(type); // 'success' or 'error'

        // Automatically hide the banner after 4 seconds
        setTimeout(() => {
            banner.className = 'message-banner';
        }, 4000);
    }
</script>
</asp:Content>

