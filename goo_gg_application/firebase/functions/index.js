const functions = require('firebase-functions');

const cors = require('cors');
const corsMiddleware = cors({ origin: true });

const account = require('./account/account');
const summoner = require('./summoner/summoner');
const league = require('./league/league');
const match = require('./match/match');
const firestoreService = require('./service/firestore_service');

const apiKey = functions.config().riot.apikey;

exports.summonerInfo = functions.https.onRequest(async (req, res) => {
    corsMiddleware(req, res, async () => {
        try {
            if (!apiKey || Object.keys(apiKey).length === 0) {
                console.error('Riot API key not found in Firebase Config');
                return res.status(500).send('Internal Server Error : ApiKey');
            }
            const name = req.body['name'];
            const isUpdateNeeded = await firestoreService.isUpdateNeededSummonerInfo(name);
            if (isUpdateNeeded) {
                const summonerData = await summoner.fetchSummonerByName(apiKey, name);
                const accountData = await account.fetchAccountByPuuid(apiKey, summonerData.puuid);
                const entries = await league.fetchSummonerEntriesById(apiKey, summonerData.id);
                const result = await firestoreService.saveSummonerInfo(summonerData, accountData, entries);
                res.status(200).json(result);
            } else {
                const result = await firestoreService.getSummonerInfo(name);
                res.status(200).json(result);
            }
        } catch (error) {
            console.error('Error calling Riot API: ', error);
            res.status(500).send('Internal Server Error : ' + error.message);
        }
    });
});

exports.matchIds = functions.https.onRequest(async (req, res) => {
    corsMiddleware(req, res, async () => {
        try {
            if (!apiKey || Object.keys(apiKey).length === 0) {
                console.error('Riot API key not found in Firebase Config');
                return res.status(500).send('Internal Server Error : ApiKey');
            }
            const puuid = req.body['puuid'];
            const start = req.body['start'];
            const result = await match.fetchMatchIdsByPuuid(apiKey, puuid, start);
            res.status(200).json(result);
        } catch (error) {
            console.error('Error calling Riot API: ', error);
            res.status(500).send('Internal Server Error : ' + error.message);
        }
    });
});

exports.matches = functions.https.onRequest(async (req, res) => {
    corsMiddleware(req, res, async () => {
        try {
            if (!apiKey || Object.keys(apiKey).length === 0) {
                console.error('Riot API key not found in Firebase Config');
                return res.status(500).send('Internal Server Error : ApiKey');
            }
            const id = req.body['id'];
            const matchIds = req.body['matchIds'];
            const matches = [];
            for (let idx = 0; idx < matchIds.length; idx++) {
                const matchData = await match.fetchMatchDataById(apiKey, matchIds[idx]);
                matches.push({
                    'matchId': matchIds[idx],
                    ...matchData,
                });
            }
            await firestoreService.saveMatches(matches, id);
            res.status(200).json(matches);
        } catch (error) {
            console.error('Error calling Riot API: ', error);
            res.status(500).send('Internal Server Error : ' + error.message);
        }
    });
});

exports.match = functions.https.onRequest(async (req, res) => {
    corsMiddleware(req, res, async () => {
        try {
            if (!apiKey || Object.keys(apiKey).length === 0) {
                console.error('Riot API key not found in Firebase Config');
                return res.status(500).send('Internal Server Error : ApiKey');
            }
            const id = req.body['id'];
            const matchId = req.body['matchId'];
            const matchData = await match.fetchMatchDataById(apiKey, matchId);
            const data = {
                'matchId': matchId,
                ...matchData,
            }
            await firestoreService.saveMatch(data, id);
            res.status(200).json(data);
        } catch (error) {
            console.error('Error calling Riot API: ', error);
            res.status(500).send('Internal Server Error : ' + error.message);
        }
    });
});
