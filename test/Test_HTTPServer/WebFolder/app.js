'use strict';

let test = {
    makeReq : (method, url, params) => {
        return new Promise((resolve, reject) => {
            let xhr = new XMLHttpRequest();
            xhr.open(method, url, true);
            xhr.onload = () => {
                if(xhr.readyState === 4 && xhr.status === 200) {
                    resolve(xhr);
                } else {
                    reject(new Error(xhr.statusText));
                }
            };
            xhr.onerror = () => {
                reject(new Error(xhr.statusText));
            };
            if(params && params.accept) {
                xhr.setRequestHeader('Accept', params.accept)
            }
            if(params && params.type) {
                xhr.setRequestHeader('Content-Type', params.type)
            }
            if(params && params.data) {
                xhr.send(params.data);
            } else {
                xhr.send(null);
            }
            
        });
    },
    makeSideNav : () => {

        let i = 0, chapterDivElem;
        let menuBuf = document.createDocumentFragment();

        do {
            i += 1;
            chapterDivElem = document.getElementById('chapter' + i);
            if(chapterDivElem) {
                let h2Elem = chapterDivElem.getElementsByTagName('h2')[0],
                    h2ol = document.createElement('ol'),
                    h2li = document.createElement('li'),
                    h2anchor = document.createElement('a');

                h2anchor.href = '#' + h2Elem.parentNode.id;
                h2anchor.textContent = h2Elem.textContent;
                h2li.appendChild(h2anchor);
                h2ol.appendChild(h2li);
                h2ol.classList.add('h2list');
                menuBuf.appendChild(h2ol);

                let h3Elems = chapterDivElem.getElementsByTagName('h3'),
                    h3ol = document.createElement('ol');
                for (let j = 0, len = h3Elems.length; j < len; j+=1) {
                    let h3li = document.createElement('li'),
                        h3anchor = document.createElement('a');

                    h3anchor.href = '#' + h3Elems[j].parentNode.id;
                    h3anchor.textContent = h3Elems[j].textContent;
                    h3li.appendChild(h3anchor);
                    h3ol.appendChild(h3li);
                    h3ol.classList.add('h3list')
                }
                h2li.appendChild(h3ol);
            }
        } while (chapterDivElem)

        document.getElementById('sideNav').appendChild(menuBuf);
    }
};

(function() {

    test.makeSideNav();

    const test1_1 = new Vue({
        el: "#test1-1",
        data: {
            message_1_1: 'Test result will be displayed here'
        },
        methods: {
            test1_1Func: function() {
                test.makeReq("GET", "/test1-1").then((res) => {
                    this.message_1_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        },
    });
    
    const test1_2 = new Vue({
        el: "#test1-2",
        data: {
            message_1_2: 'Test result will be displayed here'
        },
        methods: {
            test1_2FuncGet: function() {
                test.makeReq("GET", "/test1-2").then((res) => {
                    this.message_1_2 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test1_2FuncPost: function() {
                test.makeReq("POST", "/test1-2").then((res) => {
                    this.message_1_2 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test1_3 = new Vue({
        el: "#test1-3",
        data: {
            message_1_3: 'Test result will be displayed here'
        },
        methods: {
            test1_3Func: function() {
                test.makeReq("GET", "/test1-3/sub").then((res) => {
                    this.message_1_3 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test2_1 = new Vue({
        el: "#test2-1",
        data: {
            message_2_1: 'Test result will be displayed here'
        },
        methods: {
            test2_1Func: function() {
                test.makeReq("GET", "/test2-1", {accept: 'text/plain'}).then((res) => {
                    this.message_2_1 = 'Content-Type: ' + res.getResponseHeader('Content-Type') + '\n';
                    this.message_2_1 += 'Content: ' + res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test2_2 = new Vue({
        el: "#test2-2",
        data: {
            message_2_2: 'Test result will be displayed here'
        },
        methods: {
            test2_2Func: function() {
                test.makeReq("GET", "/test2-2").then((res) => {
                    this.message_2_2 = 'Content-Type: ' + res.getResponseHeader('Content-Type') + '\n';
                    this.message_2_2 += 'Content: ' + res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test2_3 = new Vue({
        el: "#test2-3",
        data: {
            message_2_3: 'Test result will be displayed here'
        },
        methods: {
            test2_3Func: function() {
                test.makeReq("GET", "/test2-3").then((res) => {
                    this.message_2_3 = 'Content-Type: ' + res.getResponseHeader('Content-Type') + '\n';
                    this.message_2_3 += 'Content: ' + res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test2_4 = new Vue({
        el: "#test2-4",
        data: {
            message_2_4: 'Test result will be displayed here'
        },
        methods: {
            test2_4Func: function() {
                test.makeReq("GET", "/test2-4").then((res) => {
                    this.message_2_4 = 'Content-Disposition: ' + res.getResponseHeader('Content-Disposition') + '\n';
                    this.message_2_4 += 'Content-Type: ' + res.getResponseHeader('Content-Type') + '\n';
                    this.message_2_4 += 'Content: ' + res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test2_5 = new Vue({
        el: "#test2-5",
        data: {
            message_2_5: 'Test result will be displayed here'
        },
        methods: {
            test2_5FuncPlain: function() {
                test.makeReq("GET", "/test2-5", {accept: 'text/plain'}).then((res) => {
                    this.message_2_5 = 'Content-Type: ' + res.getResponseHeader('Content-Type') + '\n';
                    this.message_2_5 += 'Content: ' + res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test2_5FuncJson: function() {
                test.makeReq("GET", "/test2-5", {accept: 'application/json'}).then((res) => {
                    this.message_2_5 = 'Content-Type: ' + res.getResponseHeader('Content-Type') + '\n';
                    this.message_2_5 += 'Content: ' + res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test2_5FuncHtml: function() {
                test.makeReq("GET", "/test2-5", {accept: 'text/html'}).then((res) => {
                    this.message_2_5 = 'Content-Type: ' + res.getResponseHeader('Content-Type') + '\n';
                    this.message_2_5 += 'Content: ' + res.responseText;
                }).catch(e => {
                    this.message_2_5 = e;
                })
            }
        }
    });

    const test3_1 = new Vue({
        el: "#test3-1",
        data: {
            message_3_1: 'Test result will be displayed here'
        },
        methods: {
            test3_1FuncMain: function() {
                test.makeReq("GET", "/test3-1").then((res) => {
                    this.message_3_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test3_1FuncVhost: function() {
                test.makeReq("GET", "http://test.mycompany.com/test3-1").then((res) => {
                    this.message_3_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test4_1 = new Vue({
        el: "#test4-1",
        data: {
            message_4_1: 'Test result will be displayed here'
        },
        methods: {
            test4_1_1Func: function() {
                test.makeReq("GET", "/test4-1?param=value").then((res) => {
                    this.message_4_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test4_1_2Func: function() {
                test.makeReq("GET", "/test4-1?param[]=value1&param[]=value2").then((res) => {
                    this.message_4_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },test4_1_3Func: function() {
                test.makeReq("GET", "/test4-1?param[sub1]=value1&param[sub2]=value2").then((res) => {
                    this.message_4_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test4_2 = new Vue({
        el: "#test4-2",
        data: {
            message_4_2: 'Test result will be displayed here'
        },
        methods: {
            test4_2_1FuncForm: function() {
                let params = {
                    type: 'application/x-www-form-urlencoded',
                    data: 'param1=value&param2[]=value1&param2[]=value2&param3[sub1]=value4&param3[sub2]=value5'
                }
                test.makeReq("POST", "/test4-2", params).then((res) => {
                    this.message_4_2 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test4_2_1FuncJson: function() {
                test.makeReq("POST", "/test4-2", {type: 'application/json'}).then((res) => {
                    this.message_4_2 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test4_3 = new Vue({
        el: "#test4-3",
        data: {
            message_4_3: 'Test result will be displayed here'
        },
        methods: {
            test4_3Func: function() {
                test.makeReq("GET", "/users/1234/books/abc").then((res) => {
                    this.message_4_3 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test5_1 = new Vue({
        el: "#test5-1",
        data: {
            message_5_1: 'Test result will be displayed here'
        },
        methods: {
            test5_1FuncUser1234: function() {
                test.makeReq("GET", "/User/1234").then((res) => {
                    this.message_5_1 = 'Content-Type: ' + res.getResponseHeader('Content-Type') + '\n';
                    this.message_5_1 += 'Content: ' + res.responseText;
                }).catch(e => {
                    this.message_5_1 = e;
                })
            },
            test5_1FuncUser5678: function() {
                test.makeReq("GET", "/User/5678").then((res) => {
                    this.message_5_1 = 'Content-Type: ' + res.getResponseHeader('Content-Type') + '\n';
                    this.message_5_1 += 'Content: ' + res.responseText;
                }).catch(e => {
                    this.message_5_1 = e;
                })
            },
            test5_1FuncLogin: function() {
                let params = {
                    type: 'application/x-www-form-urlencoded',
                    data: 'username=user&password=Password'
                }
                test.makeReq("POST", "/login", params).then((res) => {
                    this.message_5_1 = res.responseText + '\n' + document.cookie;
                }).catch(e => {
                    this.message_5_1 = e;
                })
            },
            test5_1FuncLogout: function() {
                test.makeReq("DELETE", "/logout").then((res) => {
                    this.message_5_1 = res.responseText;
                }).catch(e => {
                    this.message_5_1 = e;
                })
            }
        }
    });

    const test6_1 = new Vue({
        el: "#test6-1",
        data: {
            message_6_1: 'Test result will be displayed here'
        },
        methods: {
            test6_1v1Func1: function() {
                test.makeReq("GET", "/v1/func1").then((res) => {
                    this.message_6_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test6_1v1Func2: function() {
                test.makeReq("GET", "/v1/func2").then((res) => {
                    this.message_6_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test6_1v2Func1: function() {
                test.makeReq("GET", "/v2/func1").then((res) => {
                    this.message_6_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test6_1v2Func2: function() {
                test.makeReq("GET", "/v2/func2").then((res) => {
                    this.message_6_1 = res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

    const test7_1 = new Vue({
        el: "#test7-1",
        data: {
            message_7_1: 'Test result will be displayed here'
        },
        methods: {
            test7_1_Code: function() {
                var path = '/test7-1-code?code=1020082';
                test.makeReq("GET", "http://localhost:8080" + path).then((res) => {
                    this.message_7_1 = 'Path : ' + path + '\nresponse : ' + res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            },
            test7_1_Address: function() {
                var path = '/test7-1-address?address=' + encodeURIComponent('東京都千代田区永田町');
                test.makeReq("GET", "http://localhost:8080" + path).then((res) => {
                    this.message_7_1 = 'Path : ' + path + '\nresponse : ' + res.responseText;
                }).catch(e => {
                    console.error(e);
                })
            }
        }
    });

})();