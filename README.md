
# Mechanic_App

This app is developed for all Mechanics in Egypt to join us to provide Mechanic services in the customer app in the right way. The registration process is made to be as less exhaustive and lengthy as possible.

## Table of Contents
<img src="https://user-images.githubusercontent.com/43541909/126873433-57a03a3f-a2d6-4346-8b13-e8e1e4555310.jpg" width="150" height="300" align = "right" />

1. [Installation.](#Installation)
2. [Techanologies Used.](#Techanologies_Used)
3. [Learning OutComes.](#Learning_OutComes)
4. [Documentaion For Project.](#Documentaion_For_Project)

   4.1 [Registration[LogIn / SignUp]](#Registration)  
   
   4.2 [Requesting Winch Service](#Requesting_Winch_Service) 
   
   	* [Getting Ready For Receiving Requests](#Getting_Ready_For_Receiving_Requests)
	* [Receiving Customer Request](#Receiving_Customer_Request)
	* [Acceptance Of the Request](#Acceptance_Of_the_Request)
	* [Starting Winch service](#Starting_Winch_service)
	* [Arrival To dropOff location](#Arrival_To_dropOff_location)
	
   	
5. [Projet Status.](#Project_Status)


.
<a name="Installation"/>
## Installation

1. Install Android Studio / Visual Studio.

2. Add Dart & Flutter Exstensions.

3. Download Flutter SDK.

4. Clone The Project.

5. Open Emulator,Run The Project & Enjoy..

#### Note : You may can't proceed in using app normally, this is due to server in off state.
.
<a name="Techanologies_Used"/>
## Techanologies Used :

* Dart / Flutter.
* Firbase Phone Authuntication [Baas].
* Working with Networking [HTTP Requests] 
* Working with Google cloud services [GMaps - GeoCoding API - Directions API - Places API -Distance Matrix API]
* Hive [No Sql] Local DB. 

.
<a name="Learning_OutComes"/>
## Learning Out-Comes :

* Designing somehow beautiful UI screens.
* Using provider as state a mangmnet solution.
* Working with google maps services.
* Impleminting local BB to save user info & app data.
* Supporting Localization [AR - EN]


.
<a name="Documentaion_For_Project"/>
## Documentaion For Project.

.
<a name="Registration"/>
### Registration[LogIn / SignUp]
* Part I:

	[Just like customer registration process, winch drivers register by their mobile number, to do a verification step on this mobile number and to check whether there is an account associated with this mobile number, to let him login to this account or if there is no account associated with this number, to let this winch driver complete his registration process by entering his first and last name or continue with his social accounts.](https://github.com/sherif17/customer_app#Registration)
  
* Part II :

  If it is the first time mechanic register in the app, mechanic is required to select working city and upload important files, to be reviewed by admin to decide whether to accept this winch driver or not.

 <img src="https://user-images.githubusercontent.com/43541909/126874660-9c4e01c3-77ad-49e4-a19f-a57c4184cf08.jpg" width="150" height="300" align = "center"  />  <img src="https://user-images.githubusercontent.com/43541909/126873865-5cca7a31-d5b1-423b-94db-9a6b511e989c.jpg" width="150" height="300" align = "center" />
<img src="https://user-images.githubusercontent.com/43541909/126873864-c7dce529-959f-4208-b3aa-7dac1ae7298c.jpg" width="150" height="300" align = "center"  />  

#### Note: Currently for testing,we skip the part of reviewing of the admins for uploaded information, Winch driver will be approved directly if he uploaded all the required information. 
    
* Home & Profile page.

  After registration, Winch driver will be able to use our app normally,recieving incoming requests and viewing associated information to this account.
 
  <img src="https://user-images.githubusercontent.com/43541909/126875098-d7a9af4c-ebdb-459e-b325-a7eb50bc21bd.jpg" width="150" height="300" align = "center"  />  <img src="https://user-images.githubusercontent.com/43541909/126875116-cecbbcc3-2fae-4f63-a525-8187e57bdccb.jpg" width="150" height="300" align = "center" />
    

### Records





https://user-images.githubusercontent.com/43541909/127242698-663e0960-a7ca-43a8-ad9f-8a087a70c05b.mp4





https://user-images.githubusercontent.com/43541909/127242922-bce8f8e8-4c27-4a2d-b8d6-dce913af10ca.mp4






.
<a name="Requesting_Winch_Service"/>
### Requesting Winch Service 

.
<a name="Getting_Ready_For_Receiving_Requests"/>
* Getting Ready For Receiving Requests

	* By being online  

	* Winch driver location sent periodically  to backend for matching process. 

	* Waiting for nearest client.
	
	  <img src="https://user-images.githubusercontent.com/43541909/126863560-568a0f50-20e5-45fc-a151-d0cea00fcf71.png" width="150" height="300" align = "center" />  
  	  <img src="https://user-images.githubusercontent.com/43541909/126863592-83519254-077c-4781-981e-c99383b88cff.png" width="150" height="300" align = "center" /> 
 
 
.
<a name="Receiving_Customer_Request"/>  
* Receiving Customer Request

   Request information:
    * PolyLine Between Customer PickUp Location & Winch Driver Current Location. 
    * Estimated Distance Between 2 Points 
    * Estimated Duration Between 2 Points.
    * Customer Rating.  
  
  
  	<img src="https://user-images.githubusercontent.com/43541909/126865384-8f09cbe3-b4c6-4a29-949e-17e57f1e4fc3.png" width="150" height="300" align = "center" />  
  	<img src="https://user-images.githubusercontent.com/43541909/126865385-1e704ce8-bc2d-4a17-90f5-e91a707a6445.png" width="150" height="300" align = "center" />  
  
  
.
<a name="Acceptance_Of_the_Request"/>  
* Acceptance Of the Request 

   Acceptted Request Information:
    * PolyLine Between Customer PickUp Location & Winch Driver Current Location. 
    * Place Name Of The customer Pick-Up Location. 
    * Customer FName, LName, Owned Car Info and Phone Number.
    
      <img src="https://user-images.githubusercontent.com/43541909/126865678-4aa63ae5-7f19-438a-b089-cea5efa6e5be.png" width="150" height="300" align = "center" />
      <img src="https://user-images.githubusercontent.com/43541909/126865605-f7ccfca6-d17c-4e12-bf3a-b901db7fc339.png" width="150" height="300" align = "center" />
      <img src="https://user-images.githubusercontent.com/43541909/126865608-aa074b7c-5a86-417d-8393-29046f64a807.png" width="150" height="300" align = "center" />

.
<a name="Starting_Winch_service"/>
* Starting Winch service.
    
* Customer Start Tracking For arrival of Winch Driver

	* Now,winch driver picked up customer car,heading to drop off location.  

	* When winch driver arrive to drop off location, That Trip will be ended. 
   <img src="https://user-images.githubusercontent.com/43541909/126866045-282a1a69-8fac-49aa-9f98-38cc853e79db.png" width="150" height="300" align = "center" />
   <img src="https://user-images.githubusercontent.com/43541909/126866047-c280cf39-96a5-48fe-a65f-e1d355bc0bb0.png" width="150" height="300" align = "center" />


.
<a name="Arrival_To_dropOff_location"/>
* Arrival To dropOff location.

	When, winch driver ends that trip ,final fare will be shown with an option for rating customer
  
 	 <img src="https://user-images.githubusercontent.com/43541909/126866146-3feafd16-6eae-4f37-8da7-3e68b4850768.png" width="150" height="300" align = "center" />
  
  
### Records  



https://user-images.githubusercontent.com/43541909/127242958-9b62edf3-37fb-4e82-8814-7f9d53b79528.mp4




https://user-images.githubusercontent.com/43541909/127243067-5a218f62-6dbd-49a1-844f-3163587bb848.mp4




.
<a name="Project_Status"/>
## Project Status.

#### Project Has Been closed For Now, Wait For Further notice 
