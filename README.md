# pet-adoption-api
This small API was a technical task of an interview in 2017 and I added the problem description below to explain the solution.
## General description:
	Our customer Animal Salvation Army GmbH need our help implementing a new pet adoption website to streamline animal adoption process in Berlin.
	The website will be composed of two different sections, one for shelter workers and one for adoption interested users (from now on animal lovers).

	This website should let our customer to:
		- create an animal shelter
		- remove an animal shelter
		- add a new animal shelter worker to an animal shelter
		- remove a shelter worker from the system;
	This website should let animal shelters workers to:
		- browse the list of animals present in the shelter;
		- see the animal details page with the information already present in the system for that animal;
		- see if somebody is interested in adopting an animal, with the contact information for that person;
		- add new animal providing the animal picture, medical condition, current temporary name and supposed race;
		- remove an animal from the shelter list (orray! we succeeded!!!);
		- report animal as adoptable;
		- remove the pending adoption request for an animal (doh! we need to keep looking for the right animal lover!);
	This website should let animal lovers interested in adoptions to:
		- browse the list of adoptable animals, filtering by shelter name and by already pending adoption;
		- see the animal details page with the information provided by the shelter worker;
		- if the animal is not already adoption pending insert an adoption request in the system for a specific animal specifying name, email and telephone number;

Your duty:

	As backend developer your duty would be to implement a REST api to provide the functionalities outlined in the general description.

Exercise details:

	- we expect you to create all the controllers and all the actions required to implement at least two of the user aspects outlined in the general description (customer + shelter for example, or shelter + animal lover), with all the required input and output models and the right http return codes. Those actions must be exposed with the right verbs, with meaningful routes. The purpose of this exercise is to understand how you model an api first approach: we DO NOT expect you to fully implement the actions, only their exposed surface;
	- we expect you to provide the full implementation of one read action and one write action from the API to the data model;
	- we expect you to fully tests the actions you choose to implement (mock what's missing);

