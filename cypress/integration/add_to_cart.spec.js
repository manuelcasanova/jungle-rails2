/// <reference types="cypress" />


describe('jungle rails app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it ("Increases the amount of items in the cart by one when users click the Add to cart", () => {
    cy.get(".btn").first().click({force:true});
    cy.get('.nav-link').contains(1);
  }); 


})