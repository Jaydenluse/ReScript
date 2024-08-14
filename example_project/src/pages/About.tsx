import React from 'react';

const About = () => {
  return (
    <div className="max-w-4xl mx-auto">
      <h1 className="text-5xl font-bold mb-8 text-gradient text-center">About...</h1>
      <div className="bg-gray-blue rounded-lg p-6 shadow-lg">
        <p className="text-xl text-gray-300 mb-6">
          This script is designed to streamline the process of setting up a modern React application, saving developers time and ensuring best practices are followed from the start.
        </p>
        <h2 className="text-2xl font-semibold mb-4 text-light-blue">Purpose</h2>
        <p className="text-gray-300 mb-6">
            To accelerate the initial phase of React development by automating the setup of a robust, scalable project structure with cutting-edge tools and technologies.
        </p>
        <h2 className="text-2xl font-semibold mb-4 text-light-blue">Key Features</h2>
        <ul className="list-disc list-inside space-y-2 text-gray-300">
          <li>One-command setup for a complete React project</li>
          <li>Integration of Vite for lightning-fast builds and hot module replacement</li>
          <li>Preconfigured Tailwind CSS for rapid UI development</li>
          <li>TypeScript support for enhanced code quality and developer experience</li>
          <li>React Router setup for seamless navigation in single-page applications</li>
          <li>Customizable project structure that follows best practices</li>
        </ul>
        <h2 className="text-2xl font-semibold mt-6 mb-4 text-light-blue">How It Works</h2>
        <p className="text-gray-300 mb-6">
          Simply run the script with a project name, and it will:
        </p>
        <ol className="list-decimal list-inside space-y-2 text-gray-300">
          <li>Create a new directory for your project</li>
          <li>Initialize a new npm project</li>
          <li>Install all necessary dependencies</li>
          <li>Set up configuration files for Vite, TypeScript, and Tailwind CSS</li>
          <li>Create a basic project structure with sample components</li>
          <li>Configure scripts for development, building, and previewing your app</li>
        </ol>
      </div>
    </div>
  );
};

export default About;
