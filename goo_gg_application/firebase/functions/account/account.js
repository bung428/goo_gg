const axios = require('axios');
const app = axios.create();

/**
 * Fetches account information by PUUID.
 * @param {string} apiKey - Api key.
 * @param {string} id - The PUUID (Player Universally Unique Identifier) of the summoner.
 * @return {Promise<Object>} - A promise that resolves to the account information.
 */
async function fetchAccountByPuuid(apiKey, id) {
    const apiUrl = 'https://asia.api.riotgames.com/riot/account/v1/accounts/by-puuid/'+id;
    const response = await app.get(apiUrl, {
        headers: {
            'X-Riot-Token': apiKey,
        },
    });
    const data = response.data;
    return {
        'puuid': data.puuid,
        'gameName': data.gameName,
        'tagLine': data.tagLine,
    };
}

module.exports = {
    fetchAccountByPuuid,
};
