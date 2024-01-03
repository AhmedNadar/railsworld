// app/javascript/controllers/tabs_controller.js
import { Controller } from "@hotwired/stimulus"

// This class extends the functionality of Stimulus Controller.
// It is used to control the behavior of tabs in your application.
export default class extends Controller {
    // static properties are used to declare metadata for the controller.

    // static targets are used by Stimulus to automatically find and keep references to elements in your HTML.
    // Here, it looks for elements with `data-tabs-target="btn"` and `data-tabs-target="tab"`.
    static targets = ["btn", "tab"]

    // static classes define a list of classes that can be easily referenced in the controller.
    // Here, it allows us to use `this.activeClasses[0]` to refer to the "active" class.
    static classes = ["active"]

    // static values are used to manage state within the controller.
    // Here, it allows the component to keep track of which tab should be shown by default.
    static values = { defaultTab: String }

    // The connect method is called automatically when the controller is connected to the DOM.
    connect() {
        // Initially, hide all tab contents.
        // this.tabTargets.forEach(tab => tab.hidden = true)

        // Then, show the default tab (either the one specified or the first tab).
        this.showTab(this.defaultTabValue || this.tabTargets[0].id);
    }

    // This method is called when a tab button is clicked.
    select(event) {
        event.preventDefault(); // Prevents the default action of the event (e.g., navigating to a link).
        const selectedTabId = event.currentTarget.id; // Gets the ID of the clicked tab button.
        this.showTab(selectedTabId); // Calls showTab with the ID of the selected tab.
    }

    // This method is used to show a specific tab and hide all others.
    showTab(selectedTabId) {
        this.tabTargets.forEach((tab, index) => {
            const isSelected = tab.id === selectedTabId; // Check if this tab is the selected one.
            tab.hidden = !isSelected; // Hide or show the tab content based on whether it's selected.
            this.btnTargets[index].classList.toggle(this.activeClasses[0], isSelected); // Add or remove the "active" class from the tab button.
        });
    }
}
