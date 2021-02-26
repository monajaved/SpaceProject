

* Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.
                    
* You must include at least one class level ActiveRecord scope method (Links to an external site.). a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods (Links to an external site.) within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

(x) * Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

* Your forms should correctly display validation errors.
a. Your fields should be enclosed within a fieldswitherrors class
b. Error messages describing the validation failures must be present within the view.

* Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.
• Logic present in your controllers should be encapsulated as methods in your models.
• Your views should use helper methods and partials when appropriate.
• Follow patterns in the Rails Style Guide (Links to an external site.) and the Ruby Style Guide (Links to an external site.).

<div style="font-family: Courier New; font-size: 22px"><%= link_to "Requirement Satisfaction", new_post_comment_path(@post, @comment) %></div> <br><br><br>

