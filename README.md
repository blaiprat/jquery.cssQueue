jquery.cssQueue
===============

A plugin to handle chain adding, removing css classes with transitions attached to them without worrying about timeouts or events!

This plugin is intended to use in conjunction of CSS transition classes, keeping all the CSS stuff in the CSS files and relaying on jQuery only to add or remove class names. 

Example
-------

The problem is when you have to chain some CSS transitions, for example, when the page loads we set a menu elements to a ```"closed"``` class that hides them, then we add a ```"transition"``` class that has ```transition: all 1s ease-in-out``` and remove "closed" and add "open". We build an array with different objects defining what is added, what is removed, if is there any transition or if we have to delay execution. Each step is executed after a setTimeout(0) or after finishing a transition. This way CSS transitions can be added without overlaping other classes that are intended to be added or removed instantly previously

We do: 
``` javascript 
	cssQueueArr = [
		{	addClassName: "closed" }, 		// this is added without any transition
		{	addClassName: "transition" }, 	// we add transition after this point 
		{
			delay: 500						// the plugin will wait 500ms before executing 
											//  this step
			removeClassName: "closed",		// removing CSS
			addClassName: "open",			// adding this CSS, using tranistion
			transition: true				// this will tell the plugin to wait to finish 
											// the transition before continuing to 
											// next Array element
		}, 
		{	removeClassName: "transition" } // removing transition
	]

	$(item).cssQueue(cssQueueArr)
```


## dependencies

Modernizr csstransition


Usage
-----
Call the plugin after selecting the source object that need to add or remove classes

``` javascript
$(item).cssQueue(cssQueueArr)
```

#### Array object properties
The parameter needs to be an Array with one or more objects using the following properties

```
	delay:				*int* the executing of this step (in ms), defalut to 0
	addClassName:		*String* name of the class or classes that will be added 
	removeClassName:	*String* name of the class or classes that will be removed
	transition: 		*bool* if set to true, the plugin will wait to the transition 
						to finish before continuing (default false)
	callBack:			*function* function to be called after the actual step is applied
```


