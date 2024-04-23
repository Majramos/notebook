# Open links in new tab

```html
<a href="#" target="_blank" rel="noopener noreferrer">
    Open Wikipedia in a new tab
</a>
```

The _blank attribute value will open the given link in a new tab.

This will help your users to better navigate back to your website after they click an external link that they find interesting.

## What Is The Rel Attribute on the a Element?<sup>[1](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel)</sup>

The rel attribute stands for relationship and it defines the relationship between the current website and the website that is being linked to.

Relationships values to be used:
- noopener
The noopener attribute value disables the default behavior for the original website to potentially gain control of the new tab's context after the user clicks the link.

The noopener attribute value should always be used on external links for security reasons in order to separate the web contexts between the linking website and the linked website.

- noreferrer
The noreferrer attribute value will not send a referrer header to the website that is being linked to. This means the owner of the destination website will not be able to see where the link was originally sourced from.

Using the noreferrer attribute will not leak referrer information to the destination website's analytics software (such as Google Analytics).
