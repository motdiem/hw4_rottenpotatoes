Feature: add and delete movies
 
  As a site administrator
  So that I can maintain the movies shown on the site
  I want to be able to add or delete any movie

Background: movies have been added to database
        
  Given the following movies exist:
    | title                   | rating | release_date |
    | Aladdin                 | G      | 25-Nov-1992  |
    | The Terminator          | R      | 26-Oct-1984  |
    | When Harry Met Sally    | R      | 21-Jul-1989  |
    | The Help                | PG-13  | 10-Aug-2011  |
    | Chocolat                | PG-13  | 5-Jan-2001   |
    | Amelie                  | R      | 25-Apr-2001  |
    | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
    | The Incredibles         | PG     | 5-Nov-2004   |
    | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
    | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page
  And I check the following ratings: G, PG, PG-13, R, NC-17
  And I press "Refresh"

Scenario: add a new movie
  When I follow "Add new movie"
  And I fill in "Title" with "Snatch"
  And I select "R" from "Rating"
  And I select "2011" from "movie_release_date_1i"
  And I select "October" from "movie_release_date_2i"
  And I select "10" from "movie_release_date_3i"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  And I should see "Snatch"

Scenario: delete a new movie
  When I follow "More about Chocolat"
  And I press "Delete"
  Then I should be on the RottenPotatoes home page
  And I should not see "Chocolat"

