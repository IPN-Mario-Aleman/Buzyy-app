const fetch  = require('node-fetch');
const { database } = require('../server/keys');
const pool = require('../server/database');
/*const app = require('../server/app');
const sayHello = require('../server/app').sayHello;
const addNumbers = require('../server/app').addNumbers;
//const assert = require('chai').assert;
//Results testing
sayHelloResult = app.sayHello();
addNumbersResult = app.addNumbers(5,5);

describe('App', function(){
    describe('sayHello()', function(){
      it('sayHello should return hello', function(){
        //let result = app.sayHello();
        assert.equal(sayHelloResult, 'hello');
      });

      it('sayHello should return type string', function(){
        //let result = app.sayHello();
      assert.typeOf(sayHelloResult, 'string');
      });
    });

    describe('addNumbers()', function(){
      it('addNumbers should be above 5', function(){
        //let result = app.addNumbers(5,5);
        assert.isAbove(addNumbersResult, 5);
      });
      
      it('addNumbers should be above 5', function(){
        //let result = app.addNumbers(5,5);
        assert.typeOf(addNumbersResult, 'number');
      });
    });
});*/

//Assertion style
//let chai = require('chai');
const chai = require("chai");
const chaiHttp = require('chai-http');
const server = require('../server/routes/index');
//const expect = chai.expect;


chai.should();
//chai.use(require("chai-http"));
chai.use(chaiHttp);

const expect = require('chai').expect;
 

describe('Tasks API', () => {
    /**
     * Test routes GETS
     */
    /*const serv = 'http://localhost:3000/usuarios';
    describe("GET /perfil", function(){
      it("It should GET all the perfil information from user logged", async () =>{
        const res = await fetch(serv);
        expect(res.status).to.be.equal(200);
      })
    })*/

    describe("GET /usuarios", () => {
        it("It should GET all the perfil information from user logged", (done) => {
            chai.request(server)
                .get("http://localhost:3000/usuarios")
                .end((err, res)=>{
                  console.log(server);
                  res.should.have.status(200);
                  res.body.should.be.an('array');
                  res.body.length.should.be.eq(3);
                done();
                }).done();
        });
    });

    describe("GET /usuarios", () => {
      it("It should GET all the perfil information from user logged", (done) => {
          chai.request(server)
              .get("http://localhost:3000/usuarios")
              .end((err, res)=>{
                console.log(server);
                res.should.have.status(200);
                res.body.should.be.an('array');
                res.body.length.should.be.eq(3);
              done();
              }).done();
      });
    });

  describe("GET /usuarios", () => {
    it("It should GET all the perfil information from user logged", (done) => {
        chai.request(server)
            .get("http://localhost:3000/usuarios")
            .end((err, res)=>{
              console.log(server);
              res.should.have.status(200);
              res.body.should.be.an('array');
              res.body.length.should.be.eq(3);
            done();
            }).done();
    });
  });

     /**
      * Test routes GETS (by id) on route
      */

    /**
     * Test routes POST
     */
})