Jaccard
=======

The [Jaccard Coefficient Index][1] is a measure of how similar two sets are. This library makes calculating the coefficient very easy, and provides useful helpers.

Examples
========

Calculate how similar two sets are:

```ruby
    require 'jaccard'
    
    a = ["likes:jeans", "likes:blue"]
    b = ["likes:jeans", "likes:women", "likes:red"]
    c = ["likes:women", "likes:red"]

    # Determines how similar a pair of sets are
    Jaccard.coefficient(a, b)
    #=> 0.25

    Jaccard.coefficient(a, c)
    #=> 0.0

    Jaccard.coefficient(b, c)
    #=> 0.6666666666666666

    # According to the input data, b and c have the most similar likes.
```

We can also extract the distance quite easily:

```ruby
    Jaccard.distance(a, b)
    #=> 0.75
```

The Jaccard distance is the inverse relation of the coefficient: `1 - coefficient`.

Find out which set is closest to a given set of attributes (return a value where the distance is the minimum):

```ruby
    Jaccard.closest_to(a, [b, c])
    #=> ["likes:jeans", "likes:women", "likes:red"]

    Jaccard.closest_to(b, [a, c])
    #=> ["likes:women", "likes:red"]
```

Finally, we can find the best pair in a set:

```ruby
    require "pp"
    pp Jaccard.best_match([a, b, c])
    # [["likes:jeans", "likes:women", "likes:red"],
    #  ["likes:women", "likes:red"]]
    #=> nil
```

Notes on scalability
====================

This library wasn't designed to handle millions of entries. You'll have to benchmark and see if this library meets your needs.

Note on Patches/Pull Requests
=============================

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
=========

Copyright (c) 2010 François Beausoleil. See LICENSE for details.

  [1]: http://en.wikipedia.org/wiki/Jaccard_index
