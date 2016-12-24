(function () {

    window.pageLoad = function () {
        var $ = $telerik.$;
        var cssSelectors = ["accountInfo", "personalInfo", "contactDetails", "confirmation"];
        var breadCrumbButtons = $(".rwzBreadCrumb .rwzLI");

        for (var i = 0; i < cssSelectors.length; i++) {
            $(breadCrumbButtons[i]).addClass(cssSelectors[i]);
        }
    }

    window.OnClientLoad = function (sender, args) {
        for (var i = 1; i < sender.get_wizardSteps().get_count(); i++) {
            sender.get_wizardSteps().getWizardStep(i).set_enabled(false);
        }
    }

    window.OnClientButtonClicking = function (sender, args) {
        if (!args.get_nextActiveStep().get_enabled()) {
            args.get_nextActiveStep().set_enabled(true);
        }
    }

    window.AcceptTermsCheckBoxValidation = function (source, args) {
        var termsChecked = $telerik.$("input[id*='AcceptTermsCheckBox']")[0].checked;
        args.IsValid = termsChecked;
    }

    window.UserNameLenghthValidation = function (source, args) {
        var userNameConditions = $telerik.$(".conditions")[0];
        var isValid = (args.Value.length >= 4 && args.Value.length <= 15);
        args.IsValid = isValid;
        $telerik.$(userNameConditions).toggleClass("redColor", !isValid);

    }

    window.PasswordLenghthValidation = function (source, args) {
        var passwordConditions = $telerik.$(".conditions")[1];
        var isValid = args.Value.length >= 6;
        args.IsValid = isValid;
        $telerik.$(passwordConditions).toggleClass("redColor", !isValid);
    }
})();