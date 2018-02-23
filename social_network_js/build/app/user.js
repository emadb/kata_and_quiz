"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var User = /** @class */ (function () {
    function User(username) {
        this.posts = [];
        this.username = username;
        // this.posts = new Array<Post>()
    }
    User.prototype.getTimeline = function () {
        return this.posts;
    };
    User.prototype.post = function (message) {
        this.posts.push({ text: message });
    };
    return User;
}());
exports.default = User;
