"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
}
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var axios_1 = __importDefault(require("axios"));
var bodyParser = require('body-parser');
var _a = require('apollo-server-express'), graphqlExpress = _a.graphqlExpress, graphiqlExpress = _a.graphiqlExpress;
var makeExecutableSchema = require('graphql-tools').makeExecutableSchema;
var typeDefs = "\n    type Query { stazioni: [Stazione], stazioniByProv(Prov:String): [Stazione] }\n    type Stazione { NomeGeoStazioni: String, CodiceMIR: String, Indirizzo: String, Comune: String, Cap: String, Prov: String }\n";
// The resolvers
var resolvers = {
    Query: {
        stazioni: function () { return axios_1.default.get('http://trenord.makeitapp.eu/stazioni', { headers: { 'secret': 'trenord_1836157556' } }).then(function (res) { return res.data; }); },
        stazioniByProv: function (arg, arg2) {
            return axios_1.default.get('http://trenord.makeitapp.eu/stazioni', { headers: { 'secret': 'trenord_1836157556' } })
                .then(function (res) { return res.data.filter(function (s) {
                return s.Prov == arg2.Prov;
            }); });
        }
    },
};
// Put together a schema
var schema = makeExecutableSchema({
    typeDefs: typeDefs,
    resolvers: resolvers,
});
var app = express_1.default();
var port = process.env.PORT || "3000";
app.use('/graphql', bodyParser.json(), graphqlExpress({ schema: schema }));
app.get('/graphiql', graphiqlExpress({ endpointURL: '/graphql' })); // if you want GraphiQL enabled
app.get('/', function (req, res) {
    axios_1.default
        .get("http://google.com")
        .then(function (res) {
        console.log(res.data);
    }).then(function () { return res.send('Hello, World!'); });
});
app.listen(parseInt(port, 10), function () {
    console.log("Listening at http://localhost:" + port + "/");
});
