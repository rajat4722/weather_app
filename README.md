
# Weather App

The Flutter Weather Application is a mobile app designed to provide users with real-time weather information for any city around the world. It fetches weather data from the OpenWeatherMap API and displays essential details such as temperature, humidity, wind speed, and more. The app dynamically adjusts its background image and UI colors based on the current weather conditions of the selected city, enhancing the user experience with visual cues.


## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+![Screenshot_20240626-131004](https://github.com/rajat4722/weather_app/assets/33422414/44b42113-92f6-4652-aaf7-659c4c1510b5)
![Screenshot_20240626-130948](https://github.com/rajat4722/weather_app/assets/33422414/ed3e7f03-191b-4116-bc71-41186e53ec58)
![Screenshot_20240626-131032](https://github.com/rajat4722/weather_app/assets/33422414/9d2ce1cd-d870-4389-b37d-49cc5870146a)
![Screenshot_20240626-131020](https://github.com/rajat4722/weather_app/assets/33422414/61274531-1599-4abf-9785-45baea4d2b83))





## Key Features


Real-Time Weather Data:- Fetches current weather data from OpenWeatherMap API.
Dynamic UI:- Adapts background image and card colors based on weather conditions (Clear, Cloudy, Rain, Snow, Thunderstorm).

City Search:- Allows users to search for weather information by entering the city name.

Error Handling:- Implements robust error handling for network issues and invalid city entries.

Clean and Intuitive Design:- Provides a user-friendly interface for seamless navigation and information retrieval.
## Installation

Clone the repository:

```bash
 git clone https://github.com/rajat4722/weather_app.git
 cd weather_app
```
    
## API Reference

#### Get all items

```http
  https://api.openweathermap.org/
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

## Install Dependencies

```bash
flutter pub get
```

http: For making HTTP requests to fetch weather data.
Other dependencies used in your project.
## Network Permissions (Android)


If your app makes network requests (e.g., to fetch weather data from an API), you'll need to ensure your Android app has the necessary permissions. Open your AndroidManifest.xml file located in android/app/src/main and add the following permissions if they are not already present:

```bash
 <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```
## Run the app

```bash
flutter run
```
## License

[MIT](https://choosealicense.com/licenses/mit/)

