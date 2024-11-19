

export class Logger {
  label: string = '';

  constructor(label?: string) {
    if (label === '' || typeof label === 'undefined') {
      return;
    }

    this.label = label;
  }

  setLabel(label: string) {
    this.label = label;
  }

  sub(label: string): Logger {
    let l = label;
    if (this.label !== '') {
      l = this.label + '.' + label;
    }

    return new Logger(l);
  }

  stringify(item: any): string {
    if (typeof item === null) {
      return 'null';
    }

    if (typeof item === 'object') {
      return JSON.stringify(item, null, 2);
    }

    return item + '';
  }

  format(...msg: any[]): string {
    let prefix = "";
    if (this.label !== "") {
      prefix = `[ ${this.label} ]`;
    }

    const ts = (new Date()).toLocaleTimeString();
    const s = msg.map(this.stringify).join(' ');
    const line = `${prefix} (${ts}) ${s}`;

    return line;
  }

  log(...msg: any[]) {
    const line = this.format(...msg);
    console.log(line);
  }

  error(...msg: any[]) {
    const line = this.format(...msg);
    console.error(line);
  }

  warn(...msg: any[]) {
    const line = this.format(...msg);
    console.warn(line);
  }
}
