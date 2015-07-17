(function (enviroment, $root) {
    // Script needs to run after dom loaded.
    // Currently achieved with defered script tag
    console.log('Loading code');

    // DOM access methods for Modern browsers
    var $ = {
        queryHook: function (el, hook) {
            var selector = "[data-hook~=" + hook + "]";
            console.log(selector);
            return el.querySelector(selector);
        },
        hide: function (el) {
            el.style.display = 'none';
        },
        show: function (el) {
            el.style.display = '';
        }
    };

    // Checkbox elements
    var $enquiryRouteDirect = $.queryHook($root, 'enquiry-route-direct-checkbox');
    var $enquiryRouteAgent = $.queryHook($root, 'enquiry-route-agent-checkbox');

    // Option sections
    var $enquiryRouteDirectSection = $.queryHook($root, 'enquiry-route-direct-section');
    var $enquiryRouteAgentSection = $.queryHook($root, 'enquiry-route-agent-section');

    // Update based on current checked selection
    function UpdateDisplay(){
        if ($enquiryRouteDirect.checked) {
            $.show($enquiryRouteDirectSection);
        } else {
            $.hide($enquiryRouteDirectSection);
        }
        if ($enquiryRouteAgent.checked) {
            $.show($enquiryRouteAgentSection);
        } else {
            $.hide($enquiryRouteAgentSection);
        }
    }

    // Setup initial state
    UpdateDisplay();

    // NOTE change event only fired on selection not deselection
    // Therefore need to watch both checkboxes
    $enquiryRouteDirect.addEventListener('change', function () {
        UpdateDisplay();
    });
    $enquiryRouteAgent.addEventListener('change', function () {
        UpdateDisplay();
    });

}(window, window.document));
