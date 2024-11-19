import App from '@/content/App.vue';
import { createApp } from 'vue';

const rootClassName = "extension--app-root";

const elem = document.createElement('div');
elem.className = rootClassName;

document.querySelector("body").appendChild(elem);

const app = createApp(App);
app.mount('.' + rootClassName);

console.log('mounted: ', app);


