reptiles = [
    {
    id: 1,
    name: "Mittens",
    age: 5,
    enjoys: "sunshine and warm spots",
    image: 'https://i.natgeofe.com/k/c02b35d2-bfd7-4ed9-aad4-8e25627cd481/komodo-dragon-head-on_16x9.jpg?w=1200'
    },
    {
    id: 2,
    name: "Raisins",
    age: 4,
    enjoys: "being queen of the dogs",
    image: "https://dr282zn36sxxg.cloudfront.net/datastreams/f-d%3A0c6d1d4d819098ff1d4013d02eb864d295a5ffb846b7d7f1a7cb4f2c%2BIMAGE_THUMB_POSTCARD_TINY%2BIMAGE_THUMB_POSTCARD_TINY.1"
    },
    {
    id: 3,
    name: "Toast",
    age: 1,
    enjoys: "getting all the attention",
    image: "https://www.nrcm.org/wp-content/uploads/2020/07/turtle-by-Jayne-Winters.jpg"
    }
]

reptiles.each do |each_reptile|
    Reptile.create each_reptile
    puts "creating reptile #{each_reptile}"
end