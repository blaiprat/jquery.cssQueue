(($)->

    $.fn.cssQueue = (queue) ->
        @each ->
            $el = $(@)
            copiedQueue = _.clone(queue)
            processQueue = ->
                actualStep = copiedQueue.shift();
                # is an step to do something?
                if actualStep?

                    tryToCallBack = ->
                        actualStep.callBack() if actualStep.callBack?

                    updateElement = ->
                        if actualStep.addClassName?
                            $el.addClass(actualStep.addClassName)
                            #console.log "nothing ot see here"
                        if actualStep.removeClassName?
                            $el.removeClass(actualStep.removeClassName)

                        if copiedQueue.length != 0
                            if actualStep.transition is true    
                                $el.one "webkitTransitionEnd transitionend oTransitionEnd", ->
                                    processQueue() if copiedQueue.length != 0
                            else
                                # wait for the browser to catch up
                                setTimeout(processQueue, 0) if copiedQueue.length != 0
                        
                        actualStep.callBack() if actualStep.callBack?

                    if actualStep.delay > 4
                        setTimeout(updateElement, actualStep.delay)
                    else 
                        updateElement()

            processQueue()
    
) jQuery