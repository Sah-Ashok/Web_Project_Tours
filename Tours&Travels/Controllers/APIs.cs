using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Tours_Travels
{
    public class APIs
    {
        private static readonly HttpClient client = new HttpClient();
        private const string apiBaseUrl = "http://localhost:3000"; // Your API base

        // Get all destinations from the api http://localhost:3000/view
        public static async Task<List<ModelDest>> GetDestinations()
        {
            try
            {
                HttpResponseMessage response = await client.GetAsync($"{apiBaseUrl}/view");
                response.EnsureSuccessStatusCode();

                string json = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<List<ModelDest>>(json);
            }
            catch (Exception ex)
            {
                return new List<ModelDest>();
            }
        }

        // post method to add  new destination to the api http://localhost:3000/add
        public static async Task<bool> AddDestination(ModelDest newDest)
        {
            try
            {
                string json = JsonConvert.SerializeObject(newDest);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await client.PostAsync($"{apiBaseUrl}/add", content);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                
                return false;
            }
        }
        // Method to get specific destination by id from the api http://localhost:3000/view/:id
        public static async Task<ModelDest> GetDestinationById(string id)
        {
            try
            {
                HttpResponseMessage response = await client.GetAsync($"{apiBaseUrl}/view/{id}");
                response.EnsureSuccessStatusCode();

                string json = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<ModelDest>(json);
            }
            catch (Exception ex)
            {
                
                return null;
            }
        }

        // update means use put to the api http://localhost:3000/update/:id
        public static async Task<bool> UpdateDestination(string id, ModelDest updatedDest)
        {
            try
            {
                string json = JsonConvert.SerializeObject(updatedDest);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await client.PutAsync($"{apiBaseUrl}/update/{id}", content);
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
                
                return false;
            }
        }

        // delete destinations from the api http://localhost:3000/delete/:id
        public static async Task<bool> DeleteDestination(string id)
        {
            try
            {
                HttpResponseMessage response = await client.DeleteAsync($"{apiBaseUrl}/delete/{id}");
                return response.IsSuccessStatusCode;
            }
            catch (Exception ex)
            {
               
                return false;
            }
        }
    }
}
