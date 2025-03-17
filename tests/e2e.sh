#!/bin/bash

# Wait for the server to start
echo "Waiting for server to start..."
sleep 5

# Test the server health
echo "Testing server health..."
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5173)
if [ $response -eq 200 ]; then
    echo "✅ Server is healthy (Status: $response)"
else
    echo "❌ Server is not responding properly (Status: $response)"
    exit 1
fi

# Test the login page
echo "Testing login page..."
response=$(curl -s http://localhost:5173/login)
if echo "$response" | grep -q "TimeTracker"; then
    echo "✅ Login page loads successfully"
else
    echo "❌ Login page test failed"
    exit 1
fi

echo "All tests completed successfully! 🎉"