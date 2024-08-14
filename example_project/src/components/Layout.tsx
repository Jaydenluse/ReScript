import React from 'react';
import { Outlet, Link, useLocation } from 'react-router-dom';

const Layout: React.FC = () => {
  const location = useLocation();

  const isActive = (path: string) => {
    return location.pathname === path ? 'bg-gray-blue' : '';
  };

  return (
    <div className="min-h-screen flex flex-col bg-dark-blue text-white">
      <header className="bg-gray-blue shadow-lg">
        <div className="container mx-auto px-4 py-6">
          <nav>
            <ul className="flex space-x-4">
              <li>
                <Link to="/" className={`px-4 py-2 rounded-md transition duration-300 ease-in-out ${isActive('/')} hover:bg-light-blue hover:text-dark-blue`}>
                  Home
                </Link>
              </li>
              <li>
                <Link to="/about" className={`px-4 py-2 rounded-md transition duration-300 ease-in-out ${isActive('/about')} hover:bg-light-blue hover:text-dark-blue`}>
                  About
                </Link>
              </li>
            </ul>
          </nav>
        </div>
      </header>
      <main className="flex-grow container mx-auto px-4 py-8">
        <Outlet />
      </main>
      <footer className="bg-gray-blue py-6">
        <div className="container mx-auto px-4 text-center">
          <p>&copy; {new Date().getFullYear()} Raybone. All rights reserved.</p>
        </div>
      </footer>
    </div>
  );
};

export default Layout;
