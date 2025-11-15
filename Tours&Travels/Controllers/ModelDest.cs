using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace Tours_Travels
{
    public class ModelDest
    {
        [JsonProperty("_id")]
        public string Id { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("tagline")]
        public string Tagline { get; set; }

        [JsonProperty("duration")]
        public string Duration { get; set; }

        [JsonProperty("groupSize")]
        public string GroupSize { get; set; }

        [JsonProperty("region")]
        public string Region { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }

        [JsonProperty("included")]
        public string Included { get; set; }

        [JsonProperty("price")]
        public decimal Price { get; set; }

        [JsonProperty("category")]
        public string Category { get; set; }

        [JsonProperty("mainImage")]
        public string MainImage { get; set; }

        [JsonProperty("images")]
        public List<string> Images { get; set; }

        [JsonProperty("dateAdded")]
        public DateTime DateAdded { get; set; }
    }
}