const axios = require('axios');
const app = axios.create();

/**
 * Fetches summoner information by Name.
 * @param {string} apiKey - Api key.
 * @param {string} name - The Name (Player Universally Unique Identifier) of the summoner.
 * @return {Promise<Object>} - A promise that resolves to the account information.
 */
async function fetchSummonerByName(apiKey, name) {
    const apiUrl = 'https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/'+name;
    const response = await app.get(apiUrl, {
        headers: {
            'X-Riot-Token': apiKey,
        },
    });
    const data = response.data;
    return {
        'id': data.id,
        'puuid': data.puuid,
        'accountId': data.accountId,
        'name': data.name,
        'profileImg': 'http://ddragon.leagueoflegends.com/cdn/14.1.1/img/profileicon/' + data.profileIconId + '.png',
        'summonerLevel': data.summonerLevel,
    };
}

module.exports = {
    fetchSummonerByName,
};
