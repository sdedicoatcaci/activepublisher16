<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Visualization.aspx.cs" Inherits="Salamander.Web.MAEPublisher.Visualization" AspCompat="true" %>
<%@ Register TagPrefix="cc1" Namespace="Salamander.Web.Util.Controls" Assembly="Salamander.Web.Util" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type='text/css'>
        body {
            margin: 0;
            padding: 0;
            border: 0;
            height: 100%;
            width: 100%;
            overflow: hidden;
            background: none transparent;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" />
    <cc1:CssManager ID="CssManager1" runat="server" />
    <div id='mood-visualization' class='mood-visualization'></div>
    <script>
        (function initialise() {
            var ChildPostMessageHandler = function ChildPostMessageHandler(actionCallback) {
                var receivePostMessage = function receivePostMessage(event) {
                    if (event == null || typeof event !== 'object') {
                        console.warn("Post message received with no event.");
                        return;
                    }

                    if (event.source != window.parent) {
                        // message is not intended for us
                        console.warn("Visualization received postMessage from window which was not the parent.");
                        return;
                    }

                    var message = JSON.parse(event.data);

                    // validate
                    if (message === null || typeof message !== 'object' || typeof message.action !== 'string' || Array.isArray(message.data) === false) {
                        // the message is not in the expected format
                        console.log("postMessage received in unexpected format.");
                        return;
                    }

                    // give message to callback
                    actionCallback(message.action, message.data);
                };

                // Setup post messaging
                this.sendMessageToParent = function sendMessageToParent(action, messageObject) {
                    var serializedMessage = JSON.stringify({ action: action, data: messageObject });

                    window.parent.postMessage(serializedMessage, "*");
                };

                // register the listener
                window.addEventListener("message", receivePostMessage, false);
            };

            var mooDNoVisualization = function mooDNoVisualization(config) {
                // Do nothing this function is used if we can't find the entry function to the visualization
            };

            var functions = {};

            // The main creation method for the visualization
            // Note that this function will be detroyed by its own execution when functions is
            // assigned to a ref to config.functions
            functions.create = function create(config, css) {
                // Register CSS in document if we have some
                if (typeof css === "string") {
                    Salamander.Css.registerCssBlock(css, true, "CssManager-block", true);
                }

                // Make sure we have a config object, with some sensible defaults
                config = config || {};
                config.width = config.width || '399px';
                config.height = config.height || '199px';
                config.element = config.element || 'mood-visualization';
                config.data = config.data || [{ id: 0, name: 'Visualization' }];
                config.style = config.style || <%=GetPackageStyle()%>;

                // Set the width and height from the parameters so we can cache this page?
                var style = document.getElementById(config.element).style;
                style.width = config.width;
                style.minWidth = config.width;
                style.height = config.height;
                style.minHeight = config.height;

                // Try to get the entry function as specfied by the package
                var entryFunction;
                try {
                    entryFunction = <%=GetEntryFunctionName()%>;
                } catch (e) {
                    // This can happen if the entry function name is not defined or there is a problem with the javascript so the function hasn't been set
                }

                // register the functions which are supported by the parent
                if (Array.isArray(config.functionNames)) {
                    config.functionNames.forEach(function registerEachFunction(functionName) {
                        if (typeof functionName === "string" && functionName.trim().length > 0) {
                            // Simply passthrough to the parent
                            functions[functionName] = function actionPostMessage() {
                                // we have to ensure that arguments is passed as a real array
                                postMessageHandler.sendMessageToParent(functionName, Array.prototype.slice.call(arguments));
                            };
                        }
                    });

                    // We need special handling for performAction as the 'event' is not serializable
                    functions.performAction = function performAction(name, elementId, event) {
                        var location = event;

                        if (location && typeof location.pageX === "number" && typeof location.pageY === "number") {
                            // event cannot be serialized due to the circular references in DOM objects
                            // BUT we can grab the bits we need i.e. the location
                            location = { pageX: location.pageX, pageY: location.pageY };
                        }

                        postMessageHandler.sendMessageToParent("performAction", [name, elementId, location]);
                    };

                    // We need special handling for the updateSize action as we may need to do work on this side as well to resize the visualization container
                    functions.updateSize = function updateSize(width, height) {
                        try {
                            if (config.overflowX || config.overflowY) {
                                var container = document.getElementById(config.element)

                                if (container) {
                                    if (config.overflowX) {
                                        if (typeof width === 'number') {
                                            container.style.width = width + "px";
                                        } else if (typeof width === 'string') {
                                            container.style.width = width;
                                        }
                                    }

                                    if (config.overflowY) {
                                        if (typeof height === 'number') {
                                            container.style.height = height + "px";
                                        } else if (typeof height === 'string') {
                                            container.style.height = height;
                                        }
                                    }
                                }
                            }
                        } catch (e) {
                             console.warn("Visualization error in updateSize. " + e);
                        }

                        postMessageHandler.sendMessageToParent("updateSize", [width, height]);
                    };

                    // Keep a bag of the callbacks for each action and element
                    var hasActionCallbackBag = {};

                    function registerHasActionCallback(key, callback) {
                        // We use a list as the visualization may call us more than once and it expects an answer for each
                        hasActionCallbackBag[key] = hasActionCallbackBag[key] || [];

                        // Store the callback in the bag keyed on the name of the action and the element id so we can easily get it out again when we get called back with the name and element id again
                        hasActionCallbackBag[key].push(callback);
                    };

                    // We need special handling for hasAction as it has a callback and functions can't be passed accross the boundary
                    functions.hasAction = function hasAction(name, elementId, callback) {
                        if (typeof elementId === "string") {
                            registerHasActionCallback(name + elementId, callback);
                        } else if (Array.isArray(elementId)) {
                            for (var i = 0; i < elementId.length; i++) {
                                registerHasActionCallback(name + elementId[i], callback);
                            }
                        }
                        
                        // And call the parent has action function passing the name of the function that will handle the callback that is defined below,
                        // the parent code has handling for when the callback is a string to post a message to us with it so our function with this name gets called
                        postMessageHandler.sendMessageToParent("hasAction", [name, elementId, "hasActionCallback"]);
                    };

                    // Handle the callback to us with the result of the hasAction by grabbing the callback function we stored and calling that
                    functions.hasActionCallback = function hasActionCallback(name, elementId, hasAction) {
                        // The answer should be the same for all callbacks in the list so answer them all now
                        var list = hasActionCallbackBag[name + elementId] || [];
                        var callback;
                        while ((callback = list.shift())) {
                            callback(hasAction, elementId);
                        }
                    };
                } else {
                    console.warn("Expected config.functionNames to be an array. Frame will not make calls to parent.");
                }

                // remove the 'create' action handler so it cannot be called in a post message loop
                functions.create = function deadCreate() {
                    console.warn("Create function is being called after it has run to completion.");
                };

                // ensure the visualization has access to the communication functions
                config.functions = functions;

                // And if we got one then call the entry function
                if (typeof entryFunction === 'function') {
                    return entryFunction(config);
                } else {
                    return entryFunction;
                }
            };

            // If we are not in an iFrame then try to create the visualization so we have something to show
            // We might not be in an iFrame if the Visualizations.aspx page has been loaded directly into the browser.
            // In this instance a default config will be used.
            if (window.parent === window) {
                functions.create()
            } else {
                window.onload = function onload() {
                    var frameActionCallback = function frameActionCallback(action, data) {
                        // ensure that we only call existing functions
                        if (functions.hasOwnProperty(action) && typeof functions[action] === "function") {
                            functions[action].apply(this, data);
                        } else {
                            console.log("No function exists to handle action in call from parent: " + action);
                        }
                    }

                    window.postMessageHandler = new ChildPostMessageHandler(frameActionCallback);
                    window.postMessageHandler.sendMessageToParent("ready", []);
                }
            }
        })();
    </script>       
    </div>
</asp:Content>