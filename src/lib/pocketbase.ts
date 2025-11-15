import PocketBase from 'pocketbase';

/**
 * Get the PocketBase URL based on the environment
 * - In production (Docker): uses internal service name 'pocketbase:8090'
 * - In development (local): uses 'localhost:8090'
 */
function getPocketBaseUrl(): string {
  // Check if we're in a Node.js server context (SSR/production)
  if (typeof process !== 'undefined' && process.env.NODE_ENV === 'production') {
    return 'http://pocketbase:8090';
  }

  // Otherwise use localhost for development
  return 'http://localhost:8090';
}

/**
 * Create and export a PocketBase instance
 */
export function createPocketBase(): PocketBase {
  return new PocketBase(getPocketBaseUrl());
}