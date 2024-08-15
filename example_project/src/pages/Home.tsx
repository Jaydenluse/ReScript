import React from 'react';

const Home = () => {
  return (
    <div className="max-w-4xl mx-auto">
      <h1 className="text-5xl font-bold mb-4 text-gradient">Welcome...</h1>
      <p className="text-xl text-gray-400 mb-8">
          Quickly set up a modern React application with Tailwind CSS and Vite, so you can focus on building great features.
      </p>
      <div className="flex space-x-4 mb-12">
        <button className="bg-light-blue text-dark-blue px-6 py-2 rounded-md hover:bg-blue-400 transition duration-300">
          Get Started
        </button>
        <a href="https://github.com/Jaydenluse/re_script" target="_blank" rel="noopener noreferrer">
          <button className="border border-light-blue text-light-blue px-6 py-2 rounded-md hover:bg-gray-blue transition duration-300">
            View on GitHub
          </button>
        </a>
      </div>
      <div className="bg-gray-blue rounded-lg p-6 shadow-lg">
        <h2 className="text-2xl font-semibold mb-4 text-light-blue">Features</h2>
        <ul className="list-disc list-inside space-y-2 text-gray-300">
          <li>React for building user interfaces</li>
          <li>Tailwind CSS for rapid styling</li>
          <li>Vite for fast development and building</li>
          <li>TypeScript for type safety</li>
          <li>React Router for seamless navigation</li>
          <li>Automatic project structure setup</li>
        </ul>
      </div>
    </div>
  );
};

export default Home;
