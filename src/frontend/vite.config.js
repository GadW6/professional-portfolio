/// <reference types="vitest" />
import { defineConfig } from 'vite';
import tailwindcss from '@tailwindcss/vite';
import { sveltekit } from '@sveltejs/kit/vite';

export default defineConfig({
	plugins: [tailwindcss(), sveltekit()],

	resolve: {
		conditions: ['browser']
	},

	test: {
		expect: { requireAssertions: true },
		setupFiles: ['./vitest.setup.js'],

		projects: [
			{
				extends: './vite.config.js',

				test: {
					name: 'client',
					environment: 'happy-dom',

					include: ['src/**/*.svelte.{test,spec}.{js,ts}'],
					exclude: ['src/lib/server/**']
				}
			},

			{
				extends: './vite.config.js',

				test: {
					name: 'server',
					environment: 'node',
					include: ['src/**/*.{test,spec}.{js,ts}'],
					exclude: ['src/**/*.svelte.{test,spec}.{js,ts}']
				}
			}
		]
	},

	server: {
		port: 5000, // Set your desired port here
		host: '0.0.0.0'
	},
	preview: {
		port: 8080, // You can also set a different port for the preview server
		host: '0.0.0.0'
	}
});
