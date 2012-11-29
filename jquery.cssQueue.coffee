(($)->
    $.fn.cssQueue = (queue) ->
        @each ->
            $el = $(@)
            copiedQueue = queue.slice()
            processQueue = ->
                actualStep = copiedQueue.shift();
                # if actualStep is defined do something
                if actualStep?

                    updateElement = ->
                        # adding Classes
                        if actualStep.addClassName?
                            $el.addClass(actualStep.addClassName)

                        # removing Classes
                        if actualStep.removeClassName?
                            $el.removeClass(actualStep.removeClassName)

                        # calling the method again
                        # TODO: try to automate checking if element has transition-duration
                        if copiedQueue.length != 0
                            if actualStep.transition is true    
                                $el.one "webkitTransitionEnd transitionend oTransitionEnd", ->
                                    # we continue after a browser refresh
                                    # to prevent transitions firing when we don't want
                                    setTimeout(processQueue, 0)
                            else
                                # we continue after a browser refresh
                                # to prevent transitions firing when we don't want
                                setTimeout(processQueue, 0) 
                        
                        actualStep.callBack() if actualStep.callBack?

                    # delay call if needed
                    if actualStep.delay > 4
                        setTimeout(updateElement, actualStep.delay)
                    else 
                        updateElement()

            # firing local function that 
            # iterates throught array
            processQueue()

            this

        this
    
) jQuery