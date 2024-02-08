const axios = require('axios');
const app = axios.create();

/**
 * fetchSummonerEntriesById method.
 * @param {string} apiKey
 * @param {string} id
 * @return {Promise<Array<Object>>}
 */
async function fetchSummonerEntriesById(apiKey, id) {
    const apiUrl = 'https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/' + id;
    const response = await app.get(apiUrl, {
        headers: {
            'X-Riot-Token': apiKey,
        },
    });
    return response.data;
}

// /**
//  * Fetches league entries information.
//  * @param {string} apiKey - Api key.
//  * @param {string} division - The Name (Player Universally Unique Identifier) of the summoner.
//  * @param {string} tier - The Name (Player Universally Unique Identifier) of the summoner.
//  * @param {string} queue - The Name (Player Universally Unique Identifier) of the summoner.
//  * @param {number} page - The Name (Player Universally Unique Identifier) of the summoner.
//  * @return {Promise<Object>} - A promise that resolves to the account information.
//  */
// async function fetchLeagueEntries(apiKey, division, tier, queue, page) {
//     const apiUrl = "https://kr.api.riotgames.com/lol/league/v4/entries/" + queue + "/" + tier + "/" + division + "?page=" + page;
//     return await app.get(apiUrl, {
//         headers: {
//             "X-Riot-Token": apiKey,
//         },
//     })
// }

module.exports = {
    fetchSummonerEntriesById,
    // fetchLeagueEntries,
};
