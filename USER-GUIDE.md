# Maenporth User Guide
=========
### Introduction

This system is a bespoke application developed specifically for the Maenporth Estate's requirements.  There is no other system like it, however, we have used standard elements and practices when developing the forms you will use so they should operate in a similar way to other forms you have used online.

The Holiday Homes system was originally designed to market holiday homes for sale and for holoday rentals on the estate. Later on, the system developed to include a leisure activities marketing platform which can be used to generate business for local attractions and in return create a referral fee reference which the Estate can use to collect a referral fee from the activity provider.

### Development and Production

We have created two idential 'instances' of this system.  One is a 'development' environment in which we are able to test new features and the other is a 'production' environment which is the live system available to end users.

These two systems live on what is known as 'branches'.  The development branch can be viewed here:

[Development Branch](https://wks14-ccml-staging-maenporth.herokuapp.com/)

And the production branch can be viewed here:

[Production Branch](http://holidayhomes.maenporthestate.com/)

As a user with admin rights, you will be provided with login details to access both systems.  The login details are different for development and production.

### Property Admin and Leisure Admin

There are two admin dashboards in this system - one handles the property profiles and the other handles the leisure activity profiles.  The same login details are used for both.  

### Property Profiles

To edit an existing property profile, or to add a new one, visit the [Production Branch](http://holidayhomes.maenporthestate.com/) (where our live data is stored) and click on 'Property Admin'.

Enter the username and password provided.  If you do not have access to the username or password please contact the system administrator.

Once you have gained access, you will see a list of all of the property profiles that exist in the system.

One property profile is represented by its name, two checkboxes and three buttons: 'Update', 'Edit' and 'Delete'.

You can also create a new property by clicking on the 'Create New Property +' button in the top right hand corner.  You can also click 'Add Property' in the admin menu underneath the Maenporth Estate logo.

The 'For Sale' and 'For Rent' links in blue just take you to the public facing lists of properties that are for sale or for rent.

### Working with existing properties

The existing property profiles can be changed.  The first thing to draw attention to is the property's status.  A property is either:

```
For Sale; For Rent; Null;
```

A property can be any one of the following combination of statuses:

```
Just For Sale
For Sale and For Rent
Just For Rent
Neither for sale or for rent (null)
```

The combination of statuses is represented by a tick in the checkbox.  

If a property is 'For Sale', the property profile will show on the 'For Sale' list here: [Properties For Sale](http://holidayhomes.maenporthestate.com/properties/for-sale)

If a property is 'For Rent', it will appear on the 'For Rent' list here: [Properties For Rent](http://holidayhomes.maenporthestate.com/properties/for-rent)

If a property is both for sale and for rent, it will appear on both of the lists.

If a property is neither for sale or for rent (i.e. null) then it will not appear anywhere except in the admin panel.

### Changing the status of a propery profile

To change the status of a property profile we need to use the 'Update' button which is blue.

If the property is, for example, currently 'For Rent' but the owner wants to stop renting out all together, simply uncheck the 'For Rent' checkbox and press 'Update'.    If you do not press 'Update' nothing will change.

### Unused Property Profiles

In the previous section I used an example of a property that is neither for sale nor for rent.  You may wish to delete such a profile.  To do this, simply press the 'Delete' button next to the property you would like to delete.

The website will prompt you to confirm that you would like to delete the property profile.  Once you have confirmed that you would like to delete the property profile the action is irreversable.

### Changing a property's details

When you would simply like to change some of the content of the property's profile, this can be done by clicking 'Edit'.  The edit button takes you into the standard property creation form.  Here you can follow the instructions provided for each part of the form.

Always make sure you save the form regularly to avoid loosing your changes.
