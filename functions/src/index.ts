import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {serviceAccount} from "../config";

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://actively-796ad-default-rtdb.europe-west1.firebasedatabase.app",
});

const db = admin.firestore();

exports.onUserCreate = functions.auth.user().onCreate((user) => {
  db.collection('users').doc(user.uid).create({
    first_name: '',
    last_name: '',
    email: user.email
  }).then(value => {
    console.log(value);
  });
});

export const getGroups = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send([
    {
      name: "grupa 1",
      users: [1, 2, 3, 4],
    },
    {
      name: "grupa 2",
      users: [1, 2, 3, 4],
    },
    {
      name: "grupa 3",
      users: [1, 2, 3, 4],
    },
  ]);
});
