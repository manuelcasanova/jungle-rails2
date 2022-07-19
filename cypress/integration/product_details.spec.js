///<reference types="cypress" />

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

  it("Navigates from the home page to the product detail page by clicking on a product", () => {
    cy.get('.products article').first().click();
    cy.get('.products article div').should("have.length", 1);
  });


})