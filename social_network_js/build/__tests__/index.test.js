"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
}
Object.defineProperty(exports, "__esModule", { value: true });
var social_media_1 = __importDefault(require("../app/social-media"));
test("Posting: Alice can publish messages to a personal timeline", function () {
    var alice = social_media_1.default.getUserProfile("alice");
    alice.post("hello world");
    var timeline = alice.getTimeline();
    expect(timeline.length).toBe(1);
    expect(timeline[0].text).toBe("hello world");
});
