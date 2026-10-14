}
  "template": "bolt-vite-react-ts"
}
For all designs I ask you to make, have them be beautiful, not cookie cutter. Make webpages that are fully featured and worthy for production.

By default, this template supports JSX syntax with Tailwind CSS classes, React hooks, and Lucide React for icons. Do not install other packages for UI themes, icons, etc unless absolutely necessary or I request them.

Use icons from lucide-react for logos.

Import project modules with the `@/` path alias, which maps to `src/` (e.g. `@/components/Foo` == `src/components/Foo`), instead of deep relative paths like `../../components/Foo`.
import { useState } from 'react';
import { Menu } from 'lucide-react';
import Sidebar from '@/components/Sidebar';
import Dashboard from '@/pages/Dashboard';
import Patients from '@/pages/Patients';
import CareOverview from '@/pages/CareOverview';
import Settings from '@/pages/Settings';

const pageMeta = {
  dashboard: { title: 'Dashboard', subtitle: 'Overview of patient data and care activity' },
  patients: { title: 'Patient Records', subtitle: 'Manage, search, and view patient information' },
  care: { title: 'Care Overview', subtitle: 'CapaciCare innovation module hub' },
  settings: { title: 'Settings', subtitle: 'Manage your application preferences' },
};

export default function App() {
  const [currentPage, setCurrentPage] = useState('dashboard');
  const [sidebarOpen, setSidebarOpen] = useState(false);

  const handleNavigate = (page) => {
    setCurrentPage(page);
    setSidebarOpen(false);
  };

  const meta = pageMeta[currentPage];

  return (
    <div className="app-shell">
      <Sidebar
        currentPage={currentPage}
        onNavigate={handleNavigate}
        isOpen={sidebarOpen}
        onClose={() => setSidebarOpen(false)}
      />

      <div className="main-content">
        <header className="topbar">
          <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
            <button
              className="mobile-menu-btn"
              onClick={() => setSidebarOpen(true)}
            >
              <Menu size={22} />
            </button>
            <div className="topbar-title">
              <h2>{meta.title}</h2>
              <p>{meta.subtitle}</p>
            </div>
          </div>
          <div className="topbar-actions">
            <div className="avatar">CC</div>
          </div>
        </header>

        <main className="content-area">
          {currentPage === 'dashboard' && <Dashboard onNavigate={handleNavigate} />}
          {currentPage === 'patients' && <Patients />}
          {currentPage === 'care' && <CareOverview />}
          {currentPage === 'settings' && <Settings />}
        </main>
      </div>
    </div>
  );
}
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  /* Color system — deep teal, mint accents, neutrals */
  --teal-900: #0d3b3a;
  --teal-800: #134e4a;
  --teal-700: #0f5450;
  --teal-600: #15706b;
  --teal-500: #1d8a82;
  --teal-400: #2ba89e;
  --mint-500: #34d4c4;
  --mint-400: #5fe5d8;
  --mint-300: #8af0e8;
  --mint-100: #d6fbf6;
  --mint-50: #edfdfa;

  --bg: #f4f7f8;
  --card: #ffffff;
  --border: #e2e8ec;
  --text: #1a2e2c;
  --text-muted: #6b8584;
  --text-light: #94a8a6;

  --success: #16a34a;
  --success-bg: #dcfce7;
  --warning: #d97706;
  --warning-bg: #fef3c7;
  --error: #dc2626;
  --error-bg: #fee2e2;
  --info: #2563eb;
  --info-bg: #dbeafe;

  --radius-sm: 8px;
  --radius: 12px;
  --radius-lg: 16px;
  --shadow-sm: 0 1px 2px rgba(13, 59, 58, 0.06);
  --shadow: 0 2px 8px rgba(13, 59, 58, 0.08);
  --shadow-lg: 0 8px 30px rgba(13, 59, 58, 0.12);
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
  background: var(--bg);
  color: var(--text);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#root {
  min-height: 100vh;
}

/* App layout */
.app-shell {
  display: flex;
  min-height: 100vh;
}

.sidebar {
  width: 250px;
  background: linear-gradient(180deg, var(--teal-900) 0%, var(--teal-800) 100%);
  color: #c9e8e4;
  display: flex;
  flex-direction: column;
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  z-index: 100;
  transition: transform 0.3s ease;
}

.sidebar-brand {
  padding: 24px 20px;
  display: flex;
  align-items: center;
  gap: 12px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}

.sidebar-brand-icon {
  width: 40px;
  height: 40px;
  background: linear-gradient(135deg, var(--mint-500), var(--teal-500));
  border-radius: var(--radius-sm);
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  flex-shrink: 0;
}

.sidebar-brand-text h1 {
  font-size: 18px;
  font-weight: 700;
  color: #fff;
  letter-spacing: -0.02em;
}

.sidebar-brand-text span {
  font-size: 11px;
  color: var(--mint-300);
  font-weight: 500;
  letter-spacing: 0.04em;
  text-transform: uppercase;
}

.sidebar-nav {
  flex: 1;
  padding: 16px 12px;
  overflow-y: auto;
}

.sidebar-nav-section {
  font-size: 11px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.06em;
  color: rgba(201, 232, 228, 0.5);
  padding: 12px 12px 8px;
}

.sidebar-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 11px 12px;
  border-radius: var(--radius-sm);
  cursor: pointer;
  font-size: 14px;
  font-weight: 500;
  color: #b0d4cf;
  transition: all 0.2s ease;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
}

.sidebar-item:hover {
  background: rgba(255, 255, 255, 0.06);
  color: #fff;
}

.sidebar-item.active {
  background: rgba(52, 212, 196, 0.15);
  color: var(--mint-400);
  box-shadow: inset 3px 0 0 var(--mint-500);
}

.sidebar-item .sidebar-item-icon {
  flex-shrink: 0;
}

.sidebar-footer {
  padding: 16px 20px;
  border-top: 1px solid rgba(255, 255, 255, 0.08);
  font-size: 12px;
  color: rgba(201, 232, 228, 0.5);
}

/* Main content */
.main-content {
  flex: 1;
  margin-left: 250px;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.topbar {
  background: var(--card);
  border-bottom: 1px solid var(--border);
  padding: 16px 32px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: sticky;
  top: 0;
  z-index: 50;
}

.topbar-title h2 {
  font-size: 20px;
  font-weight: 700;
  color: var(--text);
}

.topbar-title p {
  font-size: 13px;
  color: var(--text-muted);
  margin-top: 2px;
}

.topbar-actions {
  display: flex;
  align-items: center;
  gap: 12px;
}

.mobile-menu-btn {
  display: none;
  background: none;
  border: none;
  color: var(--text);
  cursor: pointer;
  padding: 6px;
}

.content-area {
  padding: 32px;
  flex: 1;
}

/* Cards */
.card {
  background: var(--card);
  border-radius: var(--radius);
  border: 1px solid var(--border);
  box-shadow: var(--shadow-sm);
}

.card-header {
  padding: 20px 24px;
  border-bottom: 1px solid var(--border);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.card-header h3 {
  font-size: 16px;
  font-weight: 600;
  color: var(--text);
}

.card-body {
  padding: 24px;
}

/* Stat cards */
.stat-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
  gap: 20px;
}

.stat-card {
  background: var(--card);
  border-radius: var(--radius);
  border: 1px solid var(--border);
  box-shadow: var(--shadow-sm);
  padding: 22px;
  display: flex;
  flex-direction: column;
  gap: 14px;
  transition: box-shadow 0.2s ease, transform 0.2s ease;
}

.stat-card:hover {
  box-shadow: var(--shadow);
  transform: translateY(-2px);
}

.stat-card-top {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.stat-card-icon {
  width: 44px;
  height: 44px;
  border-radius: var(--radius-sm);
  display: flex;
  align-items: center;
  justify-content: center;
}

.stat-card-icon.teal {
  background: var(--mint-100);
  color: var(--teal-600);
}
.stat-card-icon.blue {
  background: var(--info-bg);
  color: var(--info);
}
.stat-card-icon.amber {
  background: var(--warning-bg);
  color: var(--warning);
}
.stat-card-icon.green {
  background: var(--success-bg);
  color: var(--success);
}
.stat-card-icon.red {
  background: var(--error-bg);
  color: var(--error);
}

.stat-card-value {
  font-size: 32px;
  font-weight: 700;
  color: var(--text);
  letter-spacing: -0.02em;
  line-height: 1;
}

.stat-card-label {
  font-size: 13px;
  color: var(--text-muted);
  font-weight: 500;
}

/* Tables */
.table-wrap {
  overflow-x: auto;
}

table.data-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 14px;
}

table.data-table thead th {
  text-align: left;
  padding: 12px 16px;
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.04em;
  color: var(--text-muted);
  border-bottom: 1px solid var(--border);
  white-space: nowrap;
}

table.data-table tbody td {
  padding: 14px 16px;
  border-bottom: 1px solid var(--border);
  color: var(--text);
}

table.data-table tbody tr {
  transition: background 0.15s ease;
}

table.data-table tbody tr:hover {
  background: var(--mint-50);
}

table.data-table tbody tr:last-child td {
  border-bottom: none;
}

/* Badges */
.badge {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 4px 10px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 600;
  white-space: nowrap;
}

.badge-active {
  background: var(--success-bg);
  color: var(--success);
}
.badge-monitoring {
  background: var(--warning-bg);
  color: var(--warning);
}
.badge-discharged {
  background: #e5e7eb;
  color: #6b7280;
}

/* Forms */
.form-group {
  margin-bottom: 18px;
}

.form-group label {
  display: block;
  font-size: 13px;
  font-weight: 600;
  color: var(--text);
  margin-bottom: 6px;
}

.form-group .form-hint {
  font-size: 12px;
  color: var(--text-light);
  margin-top: 4px;
}

.form-input,
.form-select,
.form-textarea {
  width: 100%;
  padding: 10px 14px;
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  font-size: 14px;
  font-family: inherit;
  color: var(--text);
  background: var(--card);
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
  outline: none;
}

.form-input:focus,
.form-select:focus,
.form-textarea:focus {
  border-color: var(--teal-400);
  box-shadow: 0 0 0 3px rgba(52, 212, 196, 0.15);
}

.form-input.error,
.form-select.error,
.form-textarea.error {
  border-color: var(--error);
}

.form-error {
  font-size: 12px;
  color: var(--error);
  margin-top: 4px;
  font-weight: 500;
}

.form-textarea {
  resize: vertical;
  min-height: 80px;
}

.form-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

/* Buttons */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 10px 20px;
  border-radius: var(--radius-sm);
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  border: none;
  transition: all 0.2s ease;
  white-space: nowrap;
  font-family: inherit;
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn-primary {
  background: var(--teal-600);
  color: #fff;
}

.btn-primary:hover:not(:disabled) {
  background: var(--teal-500);
  box-shadow: var(--shadow);
}

.btn-secondary {
  background: var(--card);
  color: var(--text);
  border: 1px solid var(--border);
}

.btn-secondary:hover:not(:disabled) {
  background: var(--bg);
  border-color: var(--text-light);
}

.btn-danger {
  background: var(--error-bg);
  color: var(--error);
}

.btn-danger:hover:not(:disabled) {
  background: #fecaca;
}

.btn-ghost {
  background: none;
  color: var(--text-muted);
  padding: 6px;
}

.btn-ghost:hover {
  color: var(--text);
  background: var(--bg);
}

.btn-icon {
  width: 32px;
  height: 32px;
  padding: 0;
  border-radius: var(--radius-sm);
}

/* Search */
.search-box {
  position: relative;
  flex: 1;
  max-width: 360px;
}

.search-box .search-icon {
  position: absolute;
  left: 12px;
  top: 50%;
  transform: translateY(-50%);
  color: var(--text-light);
}

.search-box .form-input {
  padding-left: 38px;
}

/* Modal */
.modal-overlay {
  position: fixed;
  inset: 0;
  background: rgba(13, 59, 58, 0.4);
  backdrop-filter: blur(4px);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 200;
  padding: 20px;
  animation: fadeIn 0.2s ease;
}

.modal {
  background: var(--card);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-lg);
  width: 100%;
  max-width: 600px;
  max-height: 90vh;
  overflow-y: auto;
  animation: slideUp 0.25s ease;
}

.modal.modal-lg {
  max-width: 720px;
}

.modal-header {
  padding: 20px 24px;
  border-bottom: 1px solid var(--border);
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.modal-header h3 {
  font-size: 18px;
  font-weight: 700;
  color: var(--text);
}

.modal-body {
  padding: 24px;
}

.modal-footer {
  padding: 16px 24px;
  border-top: 1px solid var(--border);
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 12px;
}

/* States */
.state-box {
  text-align: center;
  padding: 48px 24px;
}

.state-box .state-icon {
  width: 64px;
  height: 64px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 16px;
}

.state-box .state-icon.loading {
  background: var(--mint-100);
  color: var(--teal-600);
}

.state-box .state-icon.empty {
  background: var(--bg);
  color: var(--text-light);
}

.state-box .state-icon.error {
  background: var(--error-bg);
  color: var(--error);
}

.state-box h4 {
  font-size: 16px;
  font-weight: 600;
  color: var(--text);
  margin-bottom: 6px;
}

.state-box p {
  font-size: 14px;
  color: var(--text-muted);
  max-width: 360px;
  margin: 0 auto;
}

/* Alert */
.alert {
  padding: 12px 16px;
  border-radius: var(--radius-sm);
  font-size: 14px;
  font-weight: 500;
  display: flex;
  align-items: center;
  gap: 10px;
  margin-bottom: 16px;
}

.alert-error {
  background: var(--error-bg);
  color: var(--error);
  border: 1px solid #fca5a5;
}

.alert-success {
  background: var(--success-bg);
  color: var(--success);
  border: 1px solid #86efac;
}

.alert-info {
  background: var(--info-bg);
  color: var(--info);
  border: 1px solid #93c5fd;
}

/* Loading spinner */
.spinner {
  animation: spin 0.8s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

/* Detail view */
.detail-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

.detail-item {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.detail-item .detail-label {
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.04em;
  color: var(--text-light);
}

.detail-item .detail-value {
  font-size: 15px;
  color: var(--text);
  font-weight: 500;
}

.detail-full {
  grid-column: 1 / -1;
}

/* Care overview */
.care-placeholder {
  text-align: center;
  padding: 60px 24px;
}

.care-placeholder .care-icon-wrap {
  width: 80px;
  height: 80px;
  border-radius: 20px;
  background: linear-gradient(135deg, var(--mint-100), var(--mint-50));
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 24px;
  color: var(--teal-600);
}

.care-modules {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 20px;
  margin-top: 32px;
}

.care-module-card {
  background: var(--card);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 24px;
  text-align: left;
  transition: box-shadow 0.2s ease;
}

.care-module-card:hover {
  box-shadow: var(--shadow);
}

.care-module-card .module-icon {
  width: 40px;
  height: 40px;
  border-radius: var(--radius-sm);
  background: var(--mint-100);
  color: var(--teal-600);
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 16px;
}

.care-module-card h4 {
  font-size: 15px;
  font-weight: 600;
  color: var(--text);
  margin-bottom: 8px;
}

.care-module-card p {
  font-size: 13px;
  color: var(--text-muted);
  line-height: 1.5;
}

.care-module-card .module-status {
  margin-top: 16px;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  font-size: 12px;
  font-weight: 600;
  color: var(--text-light);
}

/* Settings */
.settings-section {
  margin-bottom: 32px;
}

.settings-section h3 {
  font-size: 16px;
  font-weight: 600;
  color: var(--text);
  margin-bottom: 16px;
}

.setting-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 16px 0;
  border-bottom: 1px solid var(--border);
}

.setting-row:last-child {
  border-bottom: none;
}

.setting-row .setting-label {
  font-size: 14px;
  font-weight: 500;
  color: var(--text);
}

.setting-row .setting-desc {
  font-size: 13px;
  color: var(--text-muted);
  margin-top: 2px;
}

/* Toggle switch */
.toggle {
  position: relative;
  width: 44px;
  height: 24px;
  background: #d1d5db;
  border-radius: 12px;
  cursor: pointer;
  transition: background 0.2s ease;
  flex-shrink: 0;
}

.toggle.on {
  background: var(--teal-500);
}

.toggle::after {
  content: '';
  position: absolute;
  top: 2px;
  left: 2px;
  width: 20px;
  height: 20px;
  background: white;
  border-radius: 50%;
  transition: transform 0.2s ease;
  box-shadow: 0 1px 3px rgba(0,0,0,0.2);
}

.toggle.on::after {
  transform: translateX(20px);
}

/* Avatar */
.avatar {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--teal-500), var(--mint-500));
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-size: 14px;
  font-weight: 600;
  flex-shrink: 0;
}

/* Responsive */
@media (max-width: 900px) {
  .sidebar {
    transform: translateX(-100%);
  }

  .sidebar.open {
    transform: translateX(0);
  }

  .main-content {
    margin-left: 0;
  }

  .mobile-menu-btn {
    display: flex;
  }

  .content-area {
    padding: 20px;
  }

  .form-row {
    grid-template-columns: 1fr;
  }

  .detail-grid {
    grid-template-columns: 1fr;
  }

  .topbar {
    padding: 14px 20px;
  }
}

.sidebar-backdrop {
  display: none;
}

@media (max-width: 900px) {
  .sidebar-backdrop.show {
    display: block;
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, 0.4);
    z-index: 99;
  }
}

@media (max-width: 600px) {
  .stat-grid {
    grid-template-columns: 1fr;
  }

  .modal {
    max-width: 100%;
  }
}
import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import App from './App.jsx';
import './index.css';

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>
);
/// <reference types="vite/client" />


