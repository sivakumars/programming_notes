209 Study Guide
=================

Notes created while preparing for Assessment 209. This assessment is designed to test knowledge of course 201 and will focus on HTML and CSS.

Introduction
------------

**HTML** (HyperText Markup Language) is a markup language that describes the content of a web page. **CSS** (Cascading Style Sheets) is a stylesheet language that describes the presentation and appearance of an HTML web page. HTML and CSS documents are simply plain-text documents saved with the corresponding `.html` or `.css` extension.

HTML and CSS are designed to enable the separation of content and its structure from its presentation. This separation improves accessibility, performance, maintainability, and can reduce redundancy by allowing the same CSS stylesheets to be applied to many web pages.

HTML
-----

To inform a web browser that you are using the latest version of HTML, `<!DOCTYPE html>` is placed at the very beginning of an HTML document. Inside an `<html>` element, the `<head>` element contains information about the document (e.g. page title, links to external stylesheets/files). The content inside the `<head>` is not displayed on the web page itself. Any visible content is included in the `<body>` element.

### Elements

HTML **elements** are designators that define the structure and content of objects within a web page. Elements are marked by a pair of opening and closing **tags**, and the content of the element falls between the opening and closing tags. **Attributes** are properties defined within the opening tag and can provide additional information about an element. Each attribute contains a *name* and a *value*.

![HTML syntax outline for an element, attribute, and tag](http://learn.shayhowe.com/assets/images/courses/html-css/building-your-first-web-page/html-syntax-outline.png)

Not all elements consist of both opening and closing tags; there are a number of *self-closing* elements (`<br>`, `<img>`, `<meta>`, `<embed>`, `<input>`, `<link>`).

There are generally text, list, or structural elements. Text elements include heading elements (e.g. `<h1>` - `<h6>`), paragraph elements (`<p>`), and presentation elements (e.g. `<strong>`, `<em>`). List elements include `<dl>`, `<ol>`, and `<ul>`. Structural elements include `<html>`, `<head>`, `<body>`, `<table>`, and `<form>`. HTML5 introduced many new structural elements, including `<main>`, `<header`, `<nav>`, `<article>`, `<section>`, `<aside>`, and `<footer>`. There are numerous other HTML elements with their own specific uses.

### Semantic HTML

Semantic HTML is the practice of giving the appropriate meaning to your HTML content.

People often confuse *semantics* with *syntax*. **Syntax** is simply the grammar, or the rules for what parts of a language you can use and in what order. Every language — foreign or programming — has its own unique syntax. **Semantics** refers to the meaning of a particular sentence or line of code. A sentence can follow proper syntax but contain no real meaning (e.g. "The water tastes triangular.").

When it comes to programming languages, *pseudo code* emphasizes semantics over syntax, *error-free code* requires only correct syntax, but *good code* requires both correct syntax and appropriate semantics.

Semantic HTML is the practice of giving content meaning and structure by  using the appropriate elements. Semantic HTML strictly describes the content of a page rather than how the content should look on the page. Although writing semantically takes extra effort, there are many benefits, including improving *accessibility* by enabling screen readers and search engines to easily read and understand the content of a web page and *maintainability* by making it easier for future developers to comprehend and update the website.

Except for the `<div>` block and `<span>` inline element, all other HTML elements convey some semantic meaning.

CSS
----

CSS **selectors** designate which specific HTML elements to style, or apply CSS rules to. Selectors can target an element's attribute value (e.g. class or id) or simply an element's type such as `<h1>` or `<p>`. Once an element is selected, CSS **properties** determine the styles that will be applied to that element based on a corresponding property **value**.

![CSS syntax outline for a selector, properties, and values](http://learn.shayhowe.com/assets/images/courses/html-css/building-your-first-web-page/css-syntax-outline.png)


### CSS Resets

Each web browser applies its own set of default styles to a web page to make unstyled websites appear more legible. These default styles are contained in what's called the `user agent` stylesheet and loaded along with each web page. While generally helpful, this default stylesheet can make it difficult for web developers to write CSS that makes a website look consistent across different browsers.

To alleviate this issue, developers often include a set of CSS rules to *reset* the the rules applied by the most comment `user agent` stylesheets. This set of rules is called a **CSS Reset**.

### The Cascade

CSS properties are applied in the order in which they appear in a stylesheet (i.e. top-down). In other words, all rules **cascade** from the top of the stylesheet to the bottom, allowing new styles to override the behavior of styles written earlier. This behavior occurs whether the styles are applied using separate CSS rules or duplicated within the same CSS rule. There are, however, times where the cascade doesn't play so nicely. Those times occur when different types of selectors are used and the specificity of those selectors breaks the cascade.

### CSS Specificity

Every selector in CSS has a specificity weight. A selector’s weight, along with its location in the cascade, determines how and which of its properties will be applied.

The type selector has the lowest weight with a point value of `0-0-1`. The class selector has a point value of `0-1-1`. And the ID selector has a point value of `1-0-0`. In other words, the specificity weight of a particular selector is calculated using three columns of values.

The higher the weight of a selector, the more superiority it is given when a rule conflict occurs.  

### Complex Selectors

The **descendant** selector matches every element that resides within the identified ancestor element. The element may fall anywhere within the ancestor element.

```css
article p { ... }
```

The **direct child** selector matches only elements that are direct children of the identified ancestor element.

```css
article > p { ... }
```

The **general sibling** selector matches elements that share the same parent as and follow the first element.

```css
h2 ~ p { ... }
```

The **adjacent sibling** selector matches elements that share the same parent as and **immediately follow** the first element.

```css
h2 + p { ... }
```

The **attribute present** selector identifies an element based on whether it includes a particular attribute or not, regardless of the actual attribute value.

```css
a[target] { ... }
```

The **attribute equals** selector identifies an element with a specific attribute value.

```css
input[type="email"] { ... }
```

The **attribute contains** selector identifies an element based on part of an attribute value. An asterisk should fall between the attribute name and the equals sign.

```css
a[href*="login"] { ... }
```

The **attribute begins with selector** identifies an element based on the beginning of an attribute's value. A circumflex accent should fall between the attribute name and the equals sign.

```css
a[href^="https://"] { ... }
```

The **attribute ends with** selector identifies an element based on the end of an attribute's value. A dollar sign should fall between the attribute name and the equals sign.

```css
a[href$=".pdf"] { ... }
```

Pseudo-elements and pseudo-classes
----------------------------------

**Pseudo elements** and **Pseudo classes** allow styling based on information that lies outside the document tree. Pseudo-classes may reside anywhere in a group of selectors but pseudo-elements may only be appended to the last selector in a selector group.

![CSS rule example](https://mdn.mozillademos.org/files/3668/css%20syntax%20-%20ruleset.png)

### Pseudo-elements

**Pseudo-elements** are elements that are dynamically created and don't exist in the actual document tree. *Only one pseudo-element may be used within a selector group at a given time.*

The `:first-letter` and `:first-line` pseudo-elements allow you to select the first letter or first letter of text within an element. The `:before` and `:after` pseudo-elements create new inline pseudo-elements just inside the selected element. The `::selection` pseudo-element selects the part of the document that has been highlighted by a user.

### Pseudo-classes

**Pseudo-classes** are classes that are dynamically created as a result of a user action or the document's structure.

The `:link` and `:visited` pseudo-classes allow you to apply specific rules depending on if a user has visited a link or not.

The `:hover` pseudo-class is applied when a user moves their cursor over the selected element. The `:active` pseudo-class is applied when a user engages (or clicks) the selected element. Lastly, the `:focus` pseudo-class is applied when a user has made a selected element the focus of the page, often by using the keyboard to tab to it.

The `:enabled`, `:disabled`, `:checked`, and `:indeterminate` pseudo-classes are applied based on the current state of specific `<input>` elements.

#### Structural & Position Pseudo-classes

A handful of pseudo-classes are determined based off where elements reside in the document tree.

- `:first-child`: selects element if it's the first child within its parent
- `:last-child`: selects element if it's the last child within its parent
- `:only-child`: selects element if it's the only child within its parent
- `:first-of-type`: selects first element of its type within a common parent
- `:last-of-type`: selects last element of its type within a common parent
- `:only-of-type`: selects element if it's the only of its type within a common parent

#### `nth` (or algebraic) Pseudo-classes

The `:nth-child(n)` and `:nth-of-type(n)` psuedo-classes accept a number or expression (`n`) that determines which element(s) to select based on their order among a group of elements. Assigning `n` to a number will count individual elements from the beginning or end of the document tree and then select one element. Expressions are defined in the format `an±b`. The variable `a` indicates the multiplier in which elements will be counted and the variable `b` indicates where to begin the counting.

For example, `li:nth-child(3n)` will select every third list item within a list, beginning at the start of the list while `li:nth-child(4n+7)` will select every fourth list item starting with the seventh list item. To determine which elements will be selected, a trick is to substitute values for `n` starting at `0`. The 2nd example would yield `7, 11, 15` and so on.

To only select elements up to a specific number, a negative `b` value is used. For example, `li:nth-child(-n+9)` will select the first nine elements in a list.

The `:nth-last-child(n)` and `:nth-last-of-type(n)` selectors behave similarly but begin counting starting from the end of the document tree.

#### Other Pseudo-classes

The `:target` pseudo-class selects an element whose ID attribute value matches that of the URL fragment identifier, in other words, what directly follows the `#` character in a URI. The `:empty` pseudo-class selects elements that do not contain any content or child elements.

Box Model
----------

The **box model** refers to the system in which *each element on a page is represented as a rectangular box*. Further, each box contains a **content area** along with optional **padding**, **border**, and **margin** areas that surround the content.

![The box model](https://www.w3.org/TR/CSS22/images/boxdim.png)

### Padding, Border, & Margin

The `padding` extends the content by creating space between the element's content and its border. The area created by padding is completely transparent and the element's background (e.g. color or image) will extend and appear in the padding area. The `border` creates a border around the padding and content of an element. The `margin` creates an empty area that separates the element from neighboring elements. The area created by margin is also transparent but since it resides outside the element, it displays the background of the parent container.

### The `display` property

The primary factor in how elements are displayed and laid out is determined by the element's `display` property. Every element has a default value but it can usually be overwritten. The most common values are `block`, `inline`, and `inline-block`.

A `block` element always begins on a new line, stacking one on top of another, and occupies the entire width of its parent element. Given enough space, `inline` and `inline-block` elements begin on the same line as the previous element and line up one after another occupying only the width necessary to contain their content. Block elements can contain inline elements but inline elements cannot contain block elements.

As noted above, an element's width depends on its `display` value. An element's default height, on the other hand, is determined by its content. An element will vertically expand and contract to accommodate its content.

### Box Sizing

The content area of *block* and *inline-block* elements can be changed by changing the values of the `width` and `height` properties. But when you adjust these dimensions, you are modifying the `width` and `height` of the element's content area, not the total width or height of the element. In order to determine the *total width* or *total height* of an element, you must take into account the element's `margin`, `padding`, and `border` values.

`total width = margin-right + border-right + padding-right + width + padding-left + border-left + margin-left`

`total height = margin-top + border-top + padding-top + height + padding-bottom + border-bottom + margin-bottom`

For example, if you set the `width` of an element to be `500px` and add `padding` of `50px`, then the actual full width of the element becomes `600px`.

This default behavior, however, can be changed to support a more intuitive calculation. In CSS3, the `box-sizing` property was introduced and its default value (`content-box`) is often changed to `border-box` resulting in the calculation shown below.

`element width = margin-right + width + margin-left`

`element height = margin-top + height + margin-bottom`

Using the same example as above, when you now add `50px` padding to a `500px` element, the actual width of the element remains at `500px`. Instead of increasing the size of the element, the padding now reduces the content area of the element from `500px` to `400px`.

### The `display` property continued...

The calculations described above do not apply to all elements. Specifically, `inline` elements behave quite differently.

#### `display: block`

Block elements will always use the box model properties (`width`, `height`, `margin`, `padding`, `border`) to determine how much space the content will take up and how much space the element will have between it and surrounding elements.

#### `display: inline`

The `margin-top` and `margin-bottom` properties are completely ignored.

Also, any `width` and `height` properties applied to an inline element are ignored. The HTML content (along with any horizontal  padding) determines *width* of the element. If there isn't enough space on the current line to accommodate the content, the element wraps to the next line. This is known as the *inline formatting context*.

Lastly, the `padding-top` and `padding-bottom` properties behave a bit differently.  With inline elements, these properties do not actually push away another element's content, they simply push away the border. Therefore, you run the risk of an inline element's border overlapping the inline content of an element above or below it. In order to push away content, `line-height` should be used instead.

The `margin-left`, `margin-right`, `padding-left`, and `padding-right` properties all work the same as for block elements.

#### `display: inline-block`

Similar to inline elements, inline-block elements line up on the same line and their content dictates their dimensions. The difference is that these dimensions can be overridden with the `width` and `height` properties.

The `inline-block` property value is usually applied when you either want to apply `width` or `height` to an inline element or you want to place block elements on the same line.

When using `inline-block` or `inline`, a thing to remember is that a single space is included between elements. In order to simplify your box model calculations, the white space should be removed using comments.

```html
    <section>
    </section><!--
 --><section>
    </section><!--
 --><section>
    </section>
```

CSS Positioning
---------------

Up to this point, our descriptions of how elements (block and inline) are positioned is based on what's called the **normal flow**. There are however two additional positioning schemes, the **float model** and the **absolute positioning model** that can dramatically change the way elements are laid out.

### Normal Flow

Let's review what is meant by **normal flow**.

Block boxes participate in what's known as a **block formatting context**. In other words, block boxes are positioned starting in the upper left of their container block and stack from top to bottom.

Inline boxes participate in what's known as an **inline formatting context**. In other words, inline boxes are laid out horizontally, one after the other beginning at the top of the container element. When there isn't enough space to fit an inline box on the current line, it is wrapped to the next line.

### Floats

In the **float** model, a box is first laid out according to the normal flow, then taken out of the flow and shifted left or right until its edge touches either the edge of its containing block or the edge of another floated element. Whether the floated element shifts left or right is determined by the value of the `float` property.

A floated block box no longer occupies all available width and instead behaves similar to an inline-block element in that its content dictates its dimensions but these dimensions can be changed with the `width` and `height` properties.

If there isn't enough horizontal space for the floated element, it's shifted downward until there is. Since a floated element is not in the *normal flow*, surrounding boxes flow vertically as if the floated element did not exist.

#### Wrapping Elements

The most interesting characteristic of a float is that surrounding content may flow alongside it. This allows naturally-flowing content like text to *wrap* around a floated element.

![Text flowing around floated elements](https://css-tricks.com/wp-content/csstricks-uploads/web-text-wrap.png)

Since a floated element is removed from the normal flow, any surrounding non-floated elements will position themselves as if the floated element isn't there. However, any line boxes (e.g. text) in these surrounding elements do notice the floated element will shorten the width of their line box to make room for the floated element. If the containing block of the line box has room for both the floated element and the line box, the line box's text will appear alongside the floated element. Once the line box runs out of room, it will continue to the next line and may eventually continue beneath the floated element, resulting in the wrapping behavior.

#### Layout using Floats

When multiple elements are floated, they will horizontally stack, providing the ability to create a layout. For example, when `float: left;` is applied to multiple elements, each floated element will shift to the left until its left edge touches either the edge of its containing block or the edge of another floated element.

#### Containing Floats

A major issue with using floats is that a containing block does not take its floated elements into account when calculating its height. This behavior is known as the "collapsing parent". A containing block is supposed to vertically expand and contract to accommodate its content, however, this does not occur with its floated elements.

There are several solutions to this problem but a widely accepted best practice is to use the `:after` pseudo-element to *contain* the floats within the containing block.

```css
.clearfix:after {
  clear: both;
  content: "";
  display: block;
}
```

Another common solution is to use the `overflow` property to *contain* the floats.

```css
.clearfix {
  overflow: auto;
}
```

### The `position` property

When you need to fine-tune the placement of elements within their containers or overlap elements on top of one another, the CSS `position` property can be useful.

The `position` property identifies how an element is positioned on a page and also whether or not it appears within the *normal flow*. It's used in conjunction with the box offset properties — `top`, `right`, `bottom`, and `left` — which determine how much and from which directions an element will be shifted relative to its containing block.

#### Static Positioning

By default every element has a `position` value of `static`, which means the element exists in the normal flow and does not accept the box offset properties. In order to accept box offset properties, the `position` property must be given a value of `relative`, `absolute`, or `fixed`.

#### Relative Positioning

When `position: relative` is applied, the box is shifted relative to its original position. The box's original position remains in the normal flow and any surrounding elements will behave as if it is still there, regardless of where it's actually shifted by the box offset properties.

#### Absolute Positioning

When `position: absolute` is applied, the box is shifted relative to its closest ancestor element that has a `position` value of `relative`. If none of its ancestors do, then it's positioned relative to the `<body>` element. An absolutely positioned element is removed from the *normal flow* and any surrounding elements will occupy the space left at the box's original position.

#### Fixed Positioning

When `position: fixed` is applied, the box is shifted relative to the browser viewport and not the web page content. The box is *fixed* with respect to the viewport and does not move when the page is scrolled.

### Z-Index Property

When elements are positioned with the `position` property, it's possible they'll overlap with nearby elements.

Generally, elements are positioned upon the z-axis as they appear within the DOM. Elements written earlier in the HTML are positioned behind elements written after them. To change this order, the `z-index` property is available.

To apply the `z-index` property, you must first apply a `position` value of `relative`, `absolute`, or `fixed`. The element with the highest `z-index` value will appear on top regardless of its placement in the DOM.

Lengths
-------

There are a few different ways to indicate lengths in CSS. The first distinction is between *absolute* and *relative* lengths. The most common absolute unit of measurement is the **pixel**, which is usually equal to 1/96th of an inch.

### Relative Units

**Percentages (%)** are one of the most popular relative units of measurement and are calculated relative to an element's parent. For example, if an element is assigned `width: 50%`, the actual width applied is half that of its parent element's width.

The **em** is a relative unit of measurement equal to the currently specified font-size. For example, if an element has `font-size: 14px;` and `width: 5em`, the actual width applied would be 70 pixels (14 * 5). If `font-size` is not explicitly stated within the same element, the em unit will be relative to the `font-size` of the closest parent with a stated `font-size`.

The **rem** is a relative unit of measurement closely related to em. The difference is that the rem unit is relative to the root `font-size`. And since most browsers set their default font-size to 16px, 1rem is usually equal to 16px.

### Line Height

Since vertical margins are not accepted by inline elements and vertical padding does not push away surrounding content, the `line-height` property can be very useful to set what's known as the *leading* of a line of text. More precisely, the `line-height` property defines the amount of space above and below inline elements.

Line height may also be used to vertically center a single line of text within an element. Using the same value for the `line-height` and `height` properties will vertically center a line of text.

CSS Backgrounds
------------

Within CSS, element backgrounds can be a solid color, an image, a gradient, or a combination of these.

### Single Color Background

The `background-color` property is used to add a single color background. While hexadecimal values are most commonly used, RGBa or HSLa values can be used to add transparency to a background color.

When using an RGBa or HSLa value as a transparent background color, it's a good idea to provide a fallback color.

```css
div {
  background-color: #b2b2b2;
  background-color: rgba(0, 0, 0, .3);
}
```

### Background Images

The `background-image` property, along with a `url()` function for the image path, is used to apply an image as a background.

By default, the background image will repeat horizontally and vertically to fill up the element's background and the image will be positioned at the top-left corner of the element. These defaults can be easily changed using the `background-repeat` and `background-position` properties.

```css
div {
  background-color: #b2b2b2;
  background-image: url("alert.png");
  background-position: 20px 10px;
  background-repeat: no-repeat;
}
```

The `background-position` property requires two values: a horizontal offset (the first value) and a vertical offset (the second value).

![Background image positioning](http://learn.shayhowe.com/assets/images/courses/html-css/setting-backgrounds-and-gradients/background-position.png)

The `background-color`, `background-image`, `background-position`, and `background-repeat` properties may be rolled into a shorthand `background` property value.

```css
div {
  background: #b2b2b2 url("alert.png") no-repeat 20px 10px;
}
```

Images
------

The three image types used most often are jpg, png, and gif. **JPG** is the most common format for image content, offering a good balance of quality and file size (i.e. compression). **PNG** is the most common format for background images, offering a lossless (i.e. no compression) image. PNG files are generally used for images requiring a high level of detail, alpha transparency, or more than 256 colors. Finally, **GIF** is a popular image format for animated images and small icons.

You can add an image to a web page using the `<img>` HTML element or by using the `background-image` CSS property to apply a background image to an element. The `<img>` element is preferred when the image holds semantic value and its content is relevant to the content of the page. The `background-image` property is preferred when the image is part of the design or user interface of the page and not directly relevant to the content of the page.

When using`<img>`, the `src` attribute *must* be included to specify the image path and the `alt` attribute *should* be included to provide alternate text when the browser cannot display the image, one example being with screen readers. Images may be resized using the `width` and `height` CSS properties and specifying one dimension causes the other dimension to adjust automatically to maintain the image's aspect ratio. Specifying both will likely result in a new aspect ratio, potentially distorting the image.

The `<figure>` block-level element is used to identify and wrap self-contained content like an image and a caption. Specifically for a caption, the `<figcaption>` element can be used.

#### Image Sprites

As the number of images on your web page increases, the number of individual HTTP requests required to display your web page also increases. This will start slowing down the page load time and can have a significant effect on mobile devices in particular. This is where **sprite** sheets can help. A sprite is created by taking a handful of background images and stacking them on top or alongside of each other to create one single image.

After creating a fixed width and height for each element, `background-position` is used to specify which portion of the sprite sheet will uncover each element's appropriate background image. Since the images are arranged vertically or horizontally, you'll likely only have to shift the image's position in one direction.

Forms
-----

In HTML, **forms** are used to capture user input through a variety of interactive *controls* including text fields, multiple-choice options, and buttons. Forms are placed on a web page using the `<form>` element. Like a `<div>` element, `<form>` wraps all of the elements included within it.

The `action` and `method` attributes are required by the `<form>` element to determine how and where to send the user input once submitted. The `action` attribute value contains the URL of the server which will receive and process the form data, and the `method` attribute value determines the HTTP method that the browser will use to send the form data – POST or GET.

The most common element used within `<form>` is the `<input>` element. The functionality of the `<input>` element varies considerable depending on the value of its `type` attribute. Aptly name, the `type` attribute indicates what type of input is to be captured. Listed below are the most common values for the `type` attribute and a description of their functionality. All `<input>` elements should have a `name` attribute, allowing the user-submitted data to be sent to the server.

### `<input>` types

- `text`: single line of text input
- `password`: single line of obscured text input
- `email`: single line of email address; validates on submission
- `checkbox`: on/off element whose state can be switched by user
- `radio`: commonly listed as a group of on/off elements with only able to be selected at a time
- `hidden`: control isn't displayed but value is submitted to server
- `reset`: button that resets all inputs to default values
- `submit`: button that submits the form

#### Radio Buttons

A **radio** element can be turned on and off, are almost always listed in groups, and allow just one option to be selected at a time. To group multiple radios, each element must specify the same value for the `name` attribute. When submitted, only the selected radio's `value` attribute value is sent to the server.

```html
<input type="radio" name="day" value="friday" checked />Friday
<input type="radio" name="day" value="saturday" />Saturday
<input type="radio" name="day" value="sunday"/>Sunday
```

#### Check Boxes

A **checkbox** can also be turned on and off but they allow multiple options to be selected at a time. Unless the `value` attribute is specified, a value of **on** is sent to the server for each selected checkbox.

```html
<input type="checkbox" name="day" value="friday" checked />Friday
<input type="checkbox" name="day" value="saturday" />Saturday
<input type="checkbox" name="day" value="sunday"/>Sunday
```

#### Drop-Down Lists

When providing a user with a long list of options, drop-down lists become more practical than radio buttons or check boxes. A drop-down is configured by nesting a list of `<option>` elements in a `<select>` element. The `name` attribute resides on the `<select>` element, and the `value` attribute resides on the nested `<option>` elements. The `value` attribute on each `<option>` element then corresponds to the `name` attribute on the `<select>` element.

```html
<select name="day">
  <option value="friday">Friday</option>
  <option value="saturday">Saturday</option>
  <option value="sunday">Sunday</option>
</select>
```

This example provides the same functionality with a different design as our radio button example. By adding the boolean attribute `multiple` to the `<select>` element, we can provide the same functionality as our check box example.

#### `<textarea>` element

This element provides a multiline version of a text input. The `rows` and `cols` attributes control the vertical and horizontal size of the element, measured in the number of characters. These dimensions will likely be overridden with CSS but it's good to set them in case the CSS fails to load.

### Organizing Forms

The `<label>` element allows you to assign headings or captions to form controls. A `<label>` should include a `for` attribute whose value matches the value of the `id` attribute of the form element that it's labeling. This binds the two elements together, allowing users to click on the `<label>` element to bring focus to the corresponding form element. If desired, the `<label>` element may wrap form controls, such as radio buttons or checkboxes, rendering the `for` and `id` attributes unnecessary.

The `<fieldset>` element is a block element that is often used to group form elements and their labels into organized sections.

### Other `<form>` attributes

- `id`: Useful when there are form controls that exist outside the `<form>` element but whose data should still be submitted with the form
- `novalidate`: Boolean attribute that will disable any field validations in the form
- `autocomplete`: Accepts values on/off to enable/disable browser's autocomplete feature
- `autocorrect`: Accepts values on/off to enable/disable autocorrect feature on iOS devices

### Other `<input>` attributes
- `disabled`: Boolean attribute that renders input as gray box and prevents user interaction
- `inputmode`: Accepts values to change the default keyboard layout on mobile browsers
- `readonly`: Boolean attribute that's similar to `disabled`
- `required`: Boolean attribute which prevents form from being submitted without a value
- `autofocus`: Boolean attribute that places initial focus of page on the element

Tables
------

The `<table>` element allows you to arrange information and display it in rows and columns. At a minimum, a table must consist of `<table>`, `<tr>` (table row), and `<td>` (table data) elements.

#### Table Header

To designate a particular cell as the heading for a column or row of cells, the table header element, `<th>`, should be used. The `<th>` element works just like the `<td>` element except that it provides semantic value.

Table headers may be used within both columns and rows. The `scope` attribute indicates whether a table header applies to a row or a column. Placing a value of `col` in the `<th>` element indicates that every cell within that cell's column relates to it, and placing a value of `row` indicates that every cell within that cell's row relates to it.

#### Table Structure

Tables can be divided into up to 3 sections with the `<thead>` (table head), `<tbody>` (table body), and `<tfoot>` (table foot) elements.

The `<thead>` element wraps the heading rows of a table and should be placed at the top of a table. The `<tbody>` element wraps the primary data within a table, while the `<tfoot>` element contains data that outlines the contents of a table.  

#### Cell Merging

The merging of rows or columns is possible using the `rowspan` and `colspan` attributes which can be applied to either the `<td>` or `<th>` elements. The `rowspan` and `colspan` attributes accepts an integer value that indicates the number of cells to merge (or span across).  

#### Table Borders

When borders are applied to `<table>`, `<td>`, or `<th>` elements, the individual borders for each cell will begin to stack on top of each other. The `border-collapse` property is available to modify a table's border model. By default, its value is `separate`, meaning that all of the different borders will stack. But setting the value to `collapse` will condense stacked borders into one by choosing the table cell as the primary border. If, on the other hand, you prefer the stacked borders but wish to add space between the individual cell borders, the `border-spacing` will accept a length value.

Note that within a table, borders **cannot** be applied to `<tr>`, `<thead>`, `<tbody>`, or `<tfoot>` elements.


Responsive Web Design
---------------------

**Responsive design** is the practice of building a website suitable to work on every device or screen size, no matter how large or small. The first component of responsive design is the use of *flexible layouts*. These layouts are made up of elements defined using relative lengths (e.g. percentages) for the `width`, `margin`, and `padding` properties. Using relative lengths allows the elements to scale according to the browser's viewport.

### Media Queries

At times the width of a browser viewport may be so small that a flexible layout will create columns too small. In this event, **media queries** are used to specify different styles at different viewport sizes.

Each media query may include a media type followed by one or more expressions. Common media types include `all`, `screen`, `print`, `tv`, and `braille.` Should a media type not be specified the media query will default to `all`.

The expression that follows the media type may include different media features and values, which then evaluate to be true (rules are applied) or false (rules are ignored).

The most common media features revolve around determining the width for a browser viewport. The width may be found by using the `width` or `device-width` media features. The `width` is based of the width of the viewport rendering area, the browser window for example. The `device-width` is based off the width of the output device, which may be larger than the actual rendering area.

Within responsive design the most commonly used features include `min-width` and `max-width.` The `min` (greater than or equal to) and `max` (less than or equal to) prefixes can be used on quite a few media features.

```css
@media (max-width: 480px) {
  aside {
    background: transparent;
  }
}
```

### Viewport

As the number of mobile devices began growing, the vast majority of websites were obviously still designed for large, desktop screen sizes. To allow mobile users to still use these websites, Apple designed their mobile browser to assume a viewport much wider than the width of the mobile device. This allowed users to scroll, pan, and zoom in to different areas of the page. Without this mobile browser design, web pages scrunch to fit the width of a mobile device and be practically unreadable.

As mobile devices became more popular, web developers began using media queries to alter the design of their web pages at narrower widths. With web pages now tailored for a narrower screen width, there was no need for a wider viewport. Apple introduced the `viewport` meta tag to allow a web site to override the default wider viewport.

Using the `viewport` meta tag with a `width` value will define the initial width of the viewport and an `initial-scale` value will define the ratio between the device size and the viewport size.

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

CSS Positioning Tricks
----------------------

### Horizontal Centering

There are two common ways of centering elements within a containing block.

1) Set `text-align: center` on an element's container to center all inline content, inline elements, and inline-block elements within the container.

2) Set `margin: 0 auto` to center a specific block-level element. The element must satisfy these requirements:
  - Must be block-level
  - Must not be floated
  - Must have fixed width (i.e. width that is not `auto`)
  - Must not be fixed or absolutely positioned

### Centering Background Image

By default, background images are positioned at the top left corner of an element. To vertically and horizontally center a background image, use the following CSS:

```css
.center {
  background: url("image.png") no-repeat 50% 50%;
}
```

### Using an Image as a List Item Marker

This is accomplished by placing a background image on each `<li>` element within a list and adding padding to create space for the image.

```css
li {
  background: url("arrow.png") 0 50% no-repeat;
  list-style-type: none;
  padding-left: 12px;
}
```

### Horizontally Displaying List

The quickest way to display a list on a single line is to give the `<li>` elements a `display` property of `inline` or `inline-block`. Doing so places all the `<li>` elements within a single line, with a single space between each list item, and also removes the list item marker.

If the list item marker is needed, floating each `<li>` element is a better option. When `<li>` elements are floated, the list item marker is displayed but actually sits on top of the `<li>` element next to it. To prevent this, a horizontal `margin` or `padding` should be added.

### Vertically Center Text

To vertically center text in an inline, inline-block, or table element, you can use the `vertical-align` property.

### Vertically Center Single Line of Text in a Block

To vertically center a single line of text in a block with a fixed `height`, set the `line-height` equal to the block's `height` value.

To vertically center multiple lines of text in a block element, it's easiest to use Flexbox.

```css
  .vertical-center {
    display: flex;
    align-items: center;
  }
```

### Element Fills Entire Viewport

```css
.viewport {
  position: fixed;
  height: 100vh;
  width: 100vw;
}
```

Photoshop Tips
---------------

### Exporting Images from Photoshop

- Select the `move tool`
- Select desired layer or group
- Right-click in the layer panel and choose `Duplicate...`
- Click the `Document` dropdown and select `New`
- Select all (`Cmd-a`)
- Copy merged (`Shift-Cmd-c`)
- New file (`Cmd-n`) and `Enter`
- Paste (`Cmd-v`)
- Save for web (`Cmd-opt-shift-s`)
- Click `Save` and name file

### Leading vs. Line-Height

In typography, **leading** refers to the distance between baselines of text.

In Photoshop, the leading is often set to `auto` — *120%* of the font-size — which is standard in digital typesetting. Note that the additional 20% is added beneath each line of text.

In CSS, the **`line-height`** property specifies height of inline content (e.g. text). When `line-height: 120%` is applied to an element with text content, the result is 10% of space added above and beneath each line of text.

In summary, while *leading* and *line-height* generally exhibit the same behavior, they are applied a little differently.

To demonstrate, let's create a web page with a paragraph of text that has a *font-size* and a *leading* of 16px each. Later, your designer updates the design and increases the *leading* to 24px, expecting 8px of space to be added beneath each line of text.

In CSS, however, when you assign a `line-height: 24px` to a paragraph with `font-size: 16px`, `4px` of space is added above and below each line of text.

Therefore, while the line spacing will appear the same, your entire paragraph will likely be 4px lower on the page than your designer intended.
