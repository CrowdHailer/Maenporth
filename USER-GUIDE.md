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

### The Property Creation Form

#### This form is used both when editing a property and when creating a new one.

When you first open the creation form, the default view is the 'For Sale Property Profile Form'.

There are two buttons at the top of the form that say 'For Sale' and 'For Rent'.  They are light blue.  Clicking on the 'For Rent' form will take you to the 'Rental Property Profile Form'.  Clicking on the 'For Sale' button will take you back to the 'For Sale Property Profile Form'.

#### Images

The first thing we ask you to do is upload images.  Uploading images is the most likely part of this process to fail - this is why we ask you to do this first.

Before you upload your images it is useful to know the size to which the website automatically re-sizes the image.  If you prepare your images to be the right size before you upload this will help ensure the images are displayed as you expect them to be when you view the completed profile.

Here are the dimensions:

```
644 pixels wide
344 pixels high
```

You need to upload eight images.  Use the eight 'Choose File' buttons to locate the images on your local machine.  Once you have done this click on the large 'Upload' button.

The website will now upload the images.  Once this has completed it is helpful if you save the form.  It is advisable to save the form regularly to avoid losing your changes as you  progress through the form. The save button is at the bottom of the form.

#### Written Content

It is advised to write your profile content before you put it into the form.  The form does not have any spell-check functionality and if you lose your work half way through it can be frustrating.  Write the content first in a word processor and once it is ready you should copy and paste the relevant sections into the form saving the form regularly.

The save button is at the bottom of the form.

Some of the content boxes in this form use 'Markdown' which is a simple way of adding style to your content without the need for rich-text editing tools. Use this handy guide to Markdown - please note, not all of the advanced features of Markdown style are utilised. 

[Markdown Cheat Sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet)

### For Rent Profiles

#### Property Name

This is a simple text box - enter the name of the property e.g. '11 The Ridges'.

#### Maenporth Estate managed?

Tick this box if the property is managed or marketed by Maenporth Estate.  If the property is managed and marketed by a third party do not tick the box.

#### Description

Enter a 130 word description of the property.  You can use markdown.

#### Reviews

Enter reviews separated by a line.  This is generated by using several equals symbols together. Refer to the [Markdown Cheat Sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Here-Cheatsheet) for more information.

You can enter as many reviews as you like because the container scrolls to accommodate any length.

#### Enquiry Route

Some owners prefer to receieve enquiries about their property directly, others prefer to send enquiries to their booking agent.  Simply select which one they would like.  You have to select one or the other.

By selecting 'Send enquiries to my booking agent' a new box appears into which you must enter the URL for the booking agents website.  This is typically a specific page on the agent's website about the property and is less often the generic home page for the agent.

URLS must by the full URL including either http:// or https://

If you copy and paste the URL of the agent's website from the address bar in your browser, it usually copies the full URL including the http.

If you are going to send enquiries about this property directly to the owner, select 'Send enquiries directly to me'. If you select this option you need to provide an email address to which the enquiry will be sent.  Please ensure the email address is accurate as we cannot validate if the email sent reaches its destination.

#### Property Checklist

This is a checklist of pre-defined values in order to provide consistency for the end-user when comparing properties they may wish to rent.

Please select a value for each option.  Where the option presents a checkbox, as for Wifi for example, a checked box indicates that the item exists.  An unchecked box indicates that the item does not exist.

For example, a property with the Washing Machine item ticked but the Tumble Dryer item unticked is a property that has a washing machine but does not have a tumble dryer.

#### Ratings Images

You can upload up to three ratings images.  These images are displayed on the property profile in the list and on the individual profile page. The image must be:

```
66 pixels wide
100 pixels high
```

#### Local Recommendations

Local recommendations are entered as list items on the profile with a bullet point. You can enter up to eight local recommendations.  There is no markdown style available for these text boxes.

#### Map

Finally, we would like to know where the property is on the Maenporth map.  You have a number of map images saved locally that all have the map marker placed over different sections of the estate.  Choose the map image that suits the location of this property best and upload that image.

To upload the image, click the 'Choose File' button and find the image on your local machine.

Click 'Upload' to complete the upload.  Always save the form regularly.

### For Sale Profiles

The 'For Sale' profile is a little easier than the 'For Rent' profile.  

Some of the fields are shared between the 'For Rent' and the 'For Sale' profiles such as 'Property Name'.

#### Uploading Images

Select and upload eight images the same as you did for the 'For Rent' profile.  The images are different but you can use the same images if you like.  We felt the average holiday maker may want to see different pictures to the average property purchaser.

#### Description

Enter a 130 word description of the property.  You can use markdown.

#### Sale Price

Enter the sale price unformatted and do not include any currency symbols.

#### Estate Agent Website Link

Enter the URL for the estate agent selling the property.  This is usually a specific page about the property rather than the generic home page for the agent. 

Remember to include the http:// or https:// at the beginning of the URL.

#### Checklist

This is a simple checklist about the property's features.  Please select a value for each option from the dropdown menus.  Where there is a checkbox you can either check the box or leave it unchecked.  A checked box indicates that the item exists.  An unchecked box indicates that the item does not exist.

For example, a property with a balcony should have the balcony box checked.  However, if the property does not have a balcony the check box should not be checked.

#### Map

Finally, we would like to know where the property is on the Maenporth map.  You have a number of map images saved locally that all have the map marker placed over different sections of the estate.  Choose the map image that suits the location of this property best and upload that image.

To upload the image, click the 'Choose File' button and find the image on your local machine.

Click 'Upload' to complete the upload.  Always save the form regularly.

