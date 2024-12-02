class CytoscapeJSON {
  elements Elements
}

class Elements{
    nodes CytoscapeNode[]
    edges CytoscapeEdge[]
}

class CytoscapeNode {
  data map<string, string> @description(#" 
    Metadata for the Node. Must include 'id', 'name', and 'label'. 'id' should be a unique identifier, such as a long_name or email. 'label' should be the categorical type of Node, such as 'person' or 'company'. 'name' should be a human-readable short descriptor like 'Peter Smith'. Add any additional key-values pairs related to the Node.
  "#)
}


class CytoscapeEdge {
    data CytoscapeEdgeData
}

class CytoscapeEdgeData{
    id string @description(#"
    A unique human-readable identifier for the vertex, like 'peter'
  "#)
  source string @description(#"
    A unique human-readable identifier for the Node, using it's 'id' field."#)
target string @description(#"
    A unique human-readable identifier for the Node, using it's 'id' field."#)
    label string @description(#"
    A human-readable label for the edge, like 'KNOWS' or "WORKS_WITH", etc..
    "#)
}

// This function jumps straight into generating the graph from a text or image input (like pdf page).
function GenerateCytoscapeGraph(input: string | image) -> CytoscapeJSON {
  client "openai/gpt-4o-mini"
  prompt #"
    You're an expert at graph data analytics and visualizations.
    Create a graph visualization of all important nodes and relationships (edges) for the given input.

    {{ ctx.output_format}}

    INPUT:
    {{ input }}`
  "#   
}

// This function extracts the json from a text or image input (like pdf page).
// You can chain this function to the previous one.
function ExtractJsonFromText(input: string | image) -> string {
  client "openai/gpt-4o-mini"
  prompt #"
    Extract the data from this INPUT in JSON format.

    INPUT:
    {{ input }}`
  "#
}

test TestCytoscapeName {
  functions [GenerateGraph, ExtractJsonFromText]
  args {
    input #"
      With First Fridays and Second Thursdays, Central District and Capitol Hill lovers of painting, photography, sculpture, and community now have two nights a month to mark on the calendar.

The Central District Art Walk is now making First Fridays a time for seeing new things and meeting new creators across the neighborhood.

“There’s a lot of really beautiful art and culture and history. I see [the art walk] as a way… of reminding people of the history and the culture of the Central District, and celebrating those. There’s a lot of art and music and beautiful stuff that came out of the Central District that can sometimes get lost when something like gentrification is happening,” Stephanie Morales of Made Space says about the new monthly event. The second ever walk is today.

Meanwhile, the long running Capitol Hill Art Walk walks on every second Thursday.

“We’re currently working alongside the Capitol Hill Arts District to help push public outreach marketing and venue growth, since it’s such a fantastic and vital community-building event,” coordinator Laurie Kearney tells CHS. “Currently, there’s an average of 20 venues that take place on a regular basis, which fluctuates throughout the seasons.”

Kearney has been a longtime part of the Capitol Hill arts scene even as her Ghost Gallery boutique found new life inside the overhauled Pacific Place downtown.

The Capitol Hill Art Walk takes place on the second Thursday of every month from 5 to 8 PM, with the next edition taking place next week on Thursday, October 10. This walk has grown steadily over the course of 15 years.

“There really is something for everyone month-to-month, so we encourage folks that are exploring Capitol Hill on Art Walk evenings to check the website and see what strikes their fancy,” Kearney said.

Kearney said Capitol Hill Art Walk attendees can expect to see paintings, prints, sculptures, photography, handmade fashion and jewelry. DJs and food or drink specials and workshops might also be available depending on the venue.

Kearney recommends that walkers meet up with friends at a destination spot, like Vermillion, Chophouse Row or the AIDS Memorial Pathway’s start above Capitol Hill Station, then explore from there.

Made Space recently helped hold a “Battle of the Brushes” contest in Pratt Park (Image: Made Space)

In the Central District, Morales of Made Space says the new First Friday walk celebrates the vibrant culture of the walkable neighborhood.

Morales and Made Space provide a boost to Black creators and business owners with “classes, community events, small business pop ups, and open studio/co-working hours” at the E Union space.

She has wanted an active Central District Art Walk for years, and ran into painter and Seattle Arts Commissioner Rodney H. King while at an art fair.  “He initiated introducing me to Amy Tipton, who is the women who started and is running Belltown Art Walk for 12 years,” Morales said.

Morales said Tipton has been pivotal in getting the Central District Art Walk launched through her canvassing efforts, relationship building and technical support, like building out an art walk map.

But those coordination efforts are only the framework. There are strong creative communities throughout the Central District already thriving. The new CD Art Walk is hoped to grow as a new avenue to share the neighborhood’s strengths.

A core of strength has formed in the Midtown Square development at 23rd and Union where Vivian Phillips and the Arté Noir arts center has created a space to grow Black art, artists, and culture. Arté Noir became a surprise anchor to the development after Bartell Drugs walked away from the project.

The CD’s strengths also include a wealth of creativity. Last month’s inaugural Central District Art Walk featured abstract painter Jayda and a collaborative exhibit featuring plants, paintings and mirrors by AMAI and Edimbo Lekea.

Morales said she was nervous about this month’s second ever art walk because she hadn’t heard back from businesses.

“It turned out there were many businesses that are on board and already booked artists and know what they’re doing,” Morales said. “There’s a really beautiful network of artists that are currently in the Central District, and formerly in the Central District, and businesses as well and we want to highlight those.”

The Central District Art Walk takes place the first Friday of every month from 6-9 PM. The walk is self-guided with a starting point at Midtown Square. Recommended locations for this month’s walk include Jackson’s Catfish Corner at 2118 S Jackson, and Central Cafe at 2509 E Cherry.

“There will be live painters,” Morales said. “Other businesses will have their own artists, and some places will have drink specials, like Communion, and 23rd Ave Brewery,” Morales said.

“In the spring my goal is to have the art walk have its own market in Midtown Square with all handmade local stuff like that,” Morales said. “I’m excited for the relationships that are going to be built, for the way that we’re going to have a single day and time and place to organize around, and it just provides that for everybody to get their needs met, whether it’s sharing resources or promoting their business, or sharing their artwork.”
    "#
  }
}
