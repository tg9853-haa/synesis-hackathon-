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
