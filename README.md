# LaunchDarkly Demo with basic Create React App

#### Dependencies

_Note: This project assumes **node**, **terraform**, and **awscli** are installed locally._

## Terraform

The terraform scripts have 2 providers LaunchDarkly and AWS.
By default the scrips will deploy:

1. LaunchDarkly project
2. Two LD project environments
3. Feature flags already integrated with the react app

4. Two AWS S3 buckets (for each station) and public website policies
5. AWS Route53 CNAME records pointing to the S3 buckets

## Automation

With the use of the Makefile you can build and deploy your application to multiple stations for your event or demo. These values are currently hard coded and can be modified to match the s3 bucket and station name of your choice.

```shell
# Build and deploy a single station
make station-1 

# Build and deploy both stations
make stations
```

For more information run `make help`

## REACT APP

This application has 3 environment variables:

```
REACT_APP_EVENT_STATION
REACT_APP_QRURL
REACT_APP_LD_CLIENT_ID
```

Please configure them using a .env file. If you wish to create multiple stations you can have separate .env.STATION files and use the Makefile to automate the build and deployment steps once the infrastructure is setup.

_Some minor development will be required._

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

### Available Scripts

In the project directory, you can run:

#### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

#### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

#### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

#### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

### Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).
