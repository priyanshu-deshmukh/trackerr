# NutriTrack - Health Tracking Application

A comprehensive health tracking application built with React, Express, and MongoDB (optional) that allows users to monitor calories, weight, and activities with visualization features.

## Deployment Instructions

### Backend Deployment on Netlify

1. **Connect Your Repository to Netlify**:
   - Sign up/login to [Netlify](https://www.netlify.com/)
   - Click "New site from Git" and connect your GitHub repository
   - Select the repository containing this project

2. **Configure Build Settings**:
   - Build command: `npm install && npm run build`
   - Publish directory: `public`
   - Click "Advanced build settings" and add environment variables:
     - `SESSION_SECRET`: Your secure session secret key
     - `MONGODB_URI`: Your MongoDB connection string (if using MongoDB)
     - `NODE_ENV`: Set to `production`

3. **Deploy and Get Your Backend URL**:
   - After deployment completes, Netlify will provide a URL (e.g., https://your-app.netlify.app)
   - This is your backend API URL

### Frontend Deployment on Vercel

1. **Update Configuration**:
   - Edit `vercel.json` and replace `https://your-netlify-app.netlify.app` with your actual Netlify backend URL

2. **Connect Repository to Vercel**:
   - Sign up/login to [Vercel](https://vercel.com/)
   - Import your GitHub repository
   - Configure the project:
     - Framework preset: Vite
     - Root Directory: `client`
     - Build Command: `npm run build`
     - Output Directory: `dist`
     
3. **Add Environment Variables**:
   - Add `VITE_API_URL` with your Netlify backend URL as the value

4. **Deploy the Frontend**:
   - Click "Deploy" and wait for the build to complete
   - Vercel will provide a URL for your frontend application

### CORS Configuration (If Needed)

If you encounter CORS issues between your Vercel frontend and Netlify backend:

1. Add the following to your `netlify/functions/api.ts` file:

```typescript
// Add this after initializing the Express app
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', 'YOUR_VERCEL_FRONTEND_URL');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  res.header('Access-Control-Allow-Credentials', 'true');
  if (req.method === 'OPTIONS') {
    return res.sendStatus(200);
  }
  next();
});
```

## Database Options

### In-Memory Storage
The application is configured to use in-memory storage by default.

### MongoDB Integration
To use MongoDB:
1. Set up MongoDB Atlas or a local MongoDB server
2. Add the MongoDB URI to environment variables on Netlify
3. Modify the storage implementation to use MongoDB

## Features

- User authentication (registration/login)
- Dashboard with summary cards and data visualizations
- Calorie tracking for meals and food intake
- Weight tracking with graphs
- Activity logging and calorie burn calculation
- Yellow-white-black minimalist theme

## License
Here's License
MIT
