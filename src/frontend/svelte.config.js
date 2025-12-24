import adapter from '@sveltejs/adapter-node';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		// Using adapter-node for Docker deployment.
		// See https://svelte.dev/docs/kit/adapter-node for configuration options.
		adapter: adapter()
	}
};

export default config;
