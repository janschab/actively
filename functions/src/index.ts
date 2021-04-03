import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {serviceAccount} from "../config";

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://actively-796ad-default-rtdb.europe-west1.firebasedatabase.app",
});

const db = admin.database();

export const jsonData = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send({
    json: {
      name: "dupa",
    },
  });
});
