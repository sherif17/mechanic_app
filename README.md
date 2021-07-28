
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
### Requesting Mechanic Service 

.
<a name="Getting_Ready_For_Receiving_Requests"/>
* Getting Ready For Receiving Requests

	* By being online  

	* Mechanic location sent periodically  to backend for matching process. 

	* Waiting for nearest client.
	
	  <img src="https://user-images.githubusercontent.com/43541909/127243529-01442295-5802-48c5-b885-a87ca9b1be04.png" width="150" height="300" align = "center" />   
 
 
.
<a name="Receiving_Customer_Request"/>  
* Receiving Customer Request

   Request information:
    * PolyLine Between Customer Location & Mechanic Current Location. 
    * Estimated Distance Between 2 Points 
    * Estimated Duration Between 2 Points.
    * Customer Rating.
    * Car info.
    * Customer Problems & services Needed.   
  
  
  	<img src="https://user-images.githubusercontent.com/43541909/127243723-344f3abd-c6a3-45be-a29c-86e69b6793c2.png" width="150" height="300" align = "center" />  
  	<img src="https://user-images.githubusercontent.com/43541909/127243736-528ac6c4-40e0-46b1-a4d6-8492a1db4f57.png" width="150" height="300" align = "center" />  
  
  
.
<a name="Acceptance_Of_the_Request"/>  
* Acceptance Of the Request 

   Acceptted Request Information:
    * PolyLine Between Customer Location & Mechanic Current Location. 
    * Place Name Of The customer Pick-Up Location. 
    * Customer FName, LName, Owned Car Info and Phone Number.
    
      <img src="https://user-images.githubusercontent.com/43541909/127243859-19af21e6-28e1-4d67-8627-3632fe9acd06.png" width="150" height="300" align = "center" />
      <img src="https://user-images.githubusercontent.com/43541909/127243864-134bb0e2-5670-48b0-84ae-abec83bdeadf.png" width="150" height="300" align = "center" />
   
.
<a name="Arrival_To_Customer_Location"/>
* Arrival To Customer Location.

	* Mechanic is checking customer car Now
	* Mechanic also can check what is the requriments of the customers & asociated information about his car.
	* Customer waiting for mechanic finish his diagnosis for the car.

  
 	 <img src="https://user-images.githubusercontent.com/43541909/127244200-5f3802e5-8ae2-430b-8016-d551cbb35281.png" width="150" height="300" align = "center" />
	 <img src="https://user-images.githubusercontent.com/43541909/127244210-fe905b28-60e7-4f12-a6df-86c8327b5fef.png" width="150" height="300" align = "center" />
      	 <img src="https://user-images.githubusercontent.com/43541909/127244219-4625eeb4-a188-435f-8f99-7f11c0890342.png" width="150" height="300" align = "center" />
	 <img src="https://user-images.githubusercontent.com/43541909/127244224-ba904477-7b2e-43ea-91e8-15c54efa611e.png" width="150" height="300" align = "center" />
  


.
<a name="Arrival_To_Customer_Location"/>
* Selecting Repaires To be Made.

	* After , mechanic finishs checking cutomer car.
	* Mechanaic will select repaires to be made.
	* To send it to the customer, to take it's confirmation.

  
 	 <img src="https://user-images.githubusercontent.com/43541909/127244495-a1ae6bd4-9c83-4876-a1c8-81170699ab0a.png" width="150" height="300" align = "center" />
	 <img src="https://user-images.githubusercontent.com/43541909/127244501-a4b8bc21-e6ca-4914-a7b3-f676fbd6de7b.png" width="150" height="300" align = "center" />
      	 <img src="https://user-images.githubusercontent.com/43541909/127244507-a3771379-84f5-4e32-b382-4559bc962dcb.png" width="150" height="300" align = "center" />
	 <img src="https://user-images.githubusercontent.com/43541909/127244512-753d45b0-ad18-4b16-a90a-dc3b409e1698.png" width="150" height="300" align = "center" />
  

.
<a name="Arrival_To_Customer_Location"/>
* Waiting For cusotmer approval.

	* After , mechanic slecting diagnosis & sending it to the customer .
	* He is waiting for Customer reponse about this repaires if it will be acceptted or not.

  
 	 <img src="https://user-images.githubusercontent.com/43541909/127244738-928b736c-bab2-4c7a-930e-27109ba4eafa.png" width="150" height="300" align = "center" />
  
  
  
.
<a name="Arrival_To_Customer_Location"/>
* Repaires Acceptted & Service Started  .

	* If , the customer accept those repaires , mechanic would be notifed by that , he will be able to start working in the customer car.

 	 <img src="https://user-images.githubusercontent.com/43541909/127244899-a95051b3-1b81-46f8-ac7e-8d4537837e34.png" width="150" height="300" align = "center" />
	 <img src="https://user-images.githubusercontent.com/43541909/127244902-fb40e17d-1c85-4ab0-a253-916af1485a84.png" width="150" height="300" align = "center" />

.
<a name="Starting_service"/>
* Starting Mechanic service.
    
* Mechanic now staart workin in the customer car
* And customer is wating him till he finishes those repaires. 
* When the mechanic finishs those repaires ,he will slide the buttons to end the services & the fare will be shown.
   <img src="https://user-images.githubusercontent.com/43541909/127245123-810fb3bd-57e3-4261-b611-6a0d3ba8bdab.png" width="150" height="300" align = "center" />
   <img src="https://user-images.githubusercontent.com/43541909/127245132-e858c825-483b-4672-82d0-5a709d1e7be3.png" width="150" height="300" align = "center" />


  
  
### Records  



https://user-images.githubusercontent.com/43541909/127242958-9b62edf3-37fb-4e82-8814-7f9d53b79528.mp4




https://user-images.githubusercontent.com/43541909/127243067-5a218f62-6dbd-49a1-844f-3163587bb848.mp4




.
<a name="Project_Status"/>
## Project Status.

#### Project Has Been closed For Now, Wait For Further notice 
