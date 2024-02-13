const axios = require('axios');
const app = axios.create();

/**
 * fetchMatchesByPuuid method.
 * @param {string} apiKey
 * @param {string} puuid
 * @param {number} start
 * @return {Promise<Array<Object>>}
 */
async function fetchMatchIdsByPuuid(apiKey, puuid, start) {
    const endDate = Date();
    const apiUrl = 'https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/' + puuid + '/ids?endTiem=' + endDate + '&start=' + start + '&count=7';
    const response = await app.get(apiUrl, {
        headers: {
            'X-Riot-Token': apiKey,
        },
    });
    return response.data;
}

/**
 * fetchMatchDataById method.
 * @param {string} apiKey
 * @param {string} id
 * @return {Promise<Object>}
 */
async function fetchMatchDataById(apiKey, id) {
    const apiUrl = 'https://asia.api.riotgames.com/lol/match/v5/matches/' + id;
    const response = await app.get(apiUrl, {
        headers: {
            'X-Riot-Token': apiKey,
        },
    });
    return response.data;
}

module.exports = {
    fetchMatchIdsByPuuid,
    fetchMatchDataById,
};
