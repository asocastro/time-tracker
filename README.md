# TimeTracker

A modern time tracking application built with React, Vite, and Supabase.

## Prerequisites

- Node.js 18+ 
- Docker and Docker Compose (for containerized deployment)
- Git

## Quick Start

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/asocastro/time-tracker.git
cd timetracker
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
```bash
cp .env.example .env
```
Edit `.env` with your Supabase credentials.

4. Start the development server:
```bash
npm run dev
```

### Docker Deployment

Simply run:
```bash
docker-compose up
```

The application will be available at `http://localhost:5173`.

## Testing

### Unit Tests

Run unit tests with:
```bash
npm test
```

### E2E Tests

Run end-to-end API tests with:
```bash
npm run test:e2e
```

## Project Structure

```
├── src/
│   ├── components/     # Reusable React components
│   ├── contexts/       # React context providers
│   ├── lib/           # Utility functions and configurations
│   ├── pages/         # Page components
│   └── tests/         # Test files
├── docker/            # Docker configuration files
└── supabase/          # Supabase migrations and configurations
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request
