const admin = require('firebase-admin');

admin.initializeApp();
const db = admin.firestore();

/**
 * saveSummonerInfo method.
 * @param {Object} summonerData
 * @param {Object} accountData
 * @param {Array<Object>} entries
 * @return {Object}
 */
async function saveSummonerInfo(summonerData, accountData, entries) {
    const data = {
        'name': summonerData.name,
        'tagLine': accountData.tagLine,
        'id': summonerData.id,
        'puuid': summonerData.puuid,
        'accountId': summonerData.accountId,
        'profileImg': summonerData.profileImg,
        'summonerLevel': summonerData.summonerLevel,
        'updatedAt': Date.now(),
    };
    try {
        const collectionRef = db.collection('summoners');
        const docRef = collectionRef.doc(summonerData.id).get();
        if ((await docRef).exists) {
            await collectionRef.doc(summonerData.id).update(data);
        } else {
            await collectionRef.doc(summonerData.id).set(data);
        }
        return {
            'data': data,
            'entries': entries,
        };
    } catch (error) {
        return {
            'error': 'error saving',
        }
    }
}

/**
 * isUpdateNeededSummonerInfo method.
 * @param {string} name
 * @return {Promise<boolean>}
 */
async function isUpdateNeededSummonerInfo(name) {
    const query = await db.collection('summoners').where('name', '==', name).get();
    if (!query.empty) {
        const data = query.docs[0].data();
        const now = Date.now();
        const updatedAt = data['updatedAt'];
        const timeDifference = updatedAt > now ? updatedAt - now : now - updatedAt;
        const daysDifference = timeDifference / (1000 * 60 * 60 * 24);
        return daysDifference > 0 ? true : false;
    } else {
        return true;
    }
}

/**
 * getSummonerInfo method.
 * @param {string} name
 * @return {Promise<Object>}
 */
async function getSummonerInfo(name) {
    const query = await db.collection('summoners').where('name', '==', name).get();
    return query.docs[0].data();
}

/**
 * saveMatches method.
 * @param {Array<Object>} matches
 * @param {string} id
 */
async function saveMatches(matches, id) {
    const summonerDocRef = db.collection('summoners').doc(id);
    for (let idx = 0; idx < matches.length; idx++) {
        await summonerDocRef.collection('matches').add(matches[idx]);
    }
}

/**
 * getMatches method.
 * @param {Array<string>} matchIds
 * @param {string} id
 * @return {Promise<Object>}
 */
async function getMatches(matchIds, id) {
    const summonerDocRef = db.collection('summoners').doc(id);
    const query = await summonerDocRef.collection('matches').get();
    if (!query.empty) {
        const savedMatchIds = [];
        for (let idx = 0; idx < query.size; idx++) {
            savedMatchIds.push(query.docs[idx].data()['matchId']);
        }
        const diffMatchIds = matchIds.filter((value) => !savedMatchIds.includes(value));
        const data = await summonerDocRef
            .collection('matches')
            .where('matchId', 'in', matchIds)
            .get();
        const saveMatches = [];
        data.docs.forEach((doc) => saveMatches.push(doc.data()));
        return {
            'matchIds': diffMatchIds,
            'saveMatches': saveMatches,
        }
    } else {
        return {
            'matchIds': matchIds,
            'saveMatches': [],
        }
    }
}


module.exports = {
    getSummonerInfo,
    saveSummonerInfo,
    isUpdateNeededSummonerInfo,
    saveMatches,
    getMatches,
};
