import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';
import react from '@astrojs/react';
import node from '@astrojs/node';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
    // ..
    output: 'server',
    integrations: [tailwind(), sitemap(), react(), node({mode: 'standalone',})],
});
