jquery.cssQueue
===============

A plugin to handle adding, removing css classes with transitions attached to them. 

This plugin will get receive an object 

## dependencies

Modernizr csstransition


Usage
-----
Call the plugin after selecting the source object that need to add or remove classes

``` javascript
$(item).cssQueue(cssQueueArr)
```

## Array
The parameter needs to be an Array with one or more objects using the following properties
	addClassName		name of the class or classes that will be added 
	removeClassName		name of the class or classes that will be removed
	transition  		if set to true, the plugin will wait to the transition to finish before continuing
	callBack			function to be called after the actual step is applied


### 
``` javascript
	cssQueueObj = [
	    {
	        addClassName: "transition"
	    },
	    {
	        removeClassName: "open"
	        transition: true
	        callBack: function(){
	        	console.log("launching animation")
	    	}
	    },
	    {
	        removeClassName: "transition"
	    }
	]

```