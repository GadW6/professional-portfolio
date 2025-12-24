<script>
	let count = $state(0);
</script>

<div class="min-h-screen bg-gradient-to-br from-indigo-500 via-purple-500 to-pink-500">
	<!-- Hero Section -->
	<div class="flex min-h-screen flex-col items-center justify-center px-4">
		<div class="text-center">
			<!-- Main Title -->
			<h1 class="mb-6 text-6xl font-bold text-white drop-shadow-lg sm:text-7xl md:text-8xl">
				Hello World
			</h1>

			<!-- Subtitle -->
			<p class="mb-8 text-xl text-white/90 sm:text-2xl md:text-3xl">
				Welcome to your beautiful Svelte + Tailwind CSS landing page
			</p>

			<!-- Interactive Counter -->
			<div class="mb-12 rounded-2xl bg-white/10 p-8 backdrop-blur-lg">
				<p class="mb-4 text-lg text-white/80">Click the button below:</p>
				<button
					onclick={() => count++}
					class="rounded-full bg-white px-8 py-4 text-lg font-semibold text-purple-600 shadow-xl transition-all duration-300 hover:scale-110 hover:shadow-2xl active:scale-95"
				>
					Clicked {count}
					{count === 1 ? 'time' : 'times'}
				</button>
			</div>

			<!-- Feature Cards -->
			<div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
				<!-- Card 1 -->
				<div
					class="group rounded-2xl bg-white/10 p-6 backdrop-blur-lg transition-all duration-300 hover:scale-105 hover:bg-white/20"
				>
					<div class="mb-4 text-4xl">⚡</div>
					<h3 class="mb-2 text-xl font-semibold text-white">Lightning Fast</h3>
					<p class="text-white/70">Built with Svelte 5 for optimal performance</p>
				</div>

				<!-- Card 2 -->
				<div
					class="group rounded-2xl bg-white/10 p-6 backdrop-blur-lg transition-all duration-300 hover:scale-105 hover:bg-white/20"
				>
					<div class="mb-4 text-4xl">🎨</div>
					<h3 class="mb-2 text-xl font-semibold text-white">Beautiful Design</h3>
					<p class="text-white/70">Styled with Tailwind CSS v4</p>
				</div>

				<!-- Card 3 -->
				<div
					class="group rounded-2xl bg-white/10 p-6 backdrop-blur-lg transition-all duration-300 hover:scale-105 hover:bg-white/20"
				>
					<div class="mb-4 text-4xl">🚀</div>
					<h3 class="mb-2 text-xl font-semibold text-white">Ready to Deploy</h3>
					<p class="text-white/70">Powered by SvelteKit</p>
				</div>
			</div>

			<!-- CTA Section -->
			<div class="mt-12">
				<a
					href="https://svelte.dev/docs"
					target="_blank"
					rel="noopener noreferrer"
					class="inline-block rounded-full bg-white px-8 py-3 font-semibold text-purple-600 shadow-xl transition-all duration-300 hover:scale-105 hover:shadow-2xl"
				>
					Explore Svelte Docs →
				</a>
			</div>
		</div>
	</div>
</div>
