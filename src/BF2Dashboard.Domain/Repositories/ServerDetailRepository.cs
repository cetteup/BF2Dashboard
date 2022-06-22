﻿using System.Runtime.Serialization;
using System.Text.Json;
using BF2Dashboard.Domain.BattlefieldApi;
using BF2Dashboard.Domain.GeoApi;

namespace BF2Dashboard.Domain.Repositories;

/// <summary>
///     https://bflist.io/api-endpoints/battlefield-2/
/// </summary>
public class ServerDetailRepository : HttpRepositoryBase
{
    public static async Task<Server> GetServerDetailForIpAndPort(string ipAndPort)
    {
        var respsonse = await HttpClient.GetAsync($"{Constants.ApiBaseUrl}/servers/{ipAndPort}");
        var json = await respsonse.Content.ReadAsStringAsync();
        var result = JsonSerializer.Deserialize<Server>(json, JsonOptions)
                     ?? throw new SerializationException(json);

        return result;
    }

    public static async Task<GeoLocation> GetServerGeoLocation(string ipAddressOnly)
    {
        var respsonse = await HttpClient.GetAsync($"https://ipapi.co/{ipAddressOnly}/json/");
        var json = await respsonse.Content.ReadAsStringAsync();
        var result = JsonSerializer.Deserialize<GeoLocation>(json, JsonOptions)
                     ?? throw new SerializationException(json);

        return result;
    }
}