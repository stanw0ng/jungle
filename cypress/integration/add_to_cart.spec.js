describe('Add to Cart', () => {

  // Verifies that the cart count is 0 when the user initially lands on the homepage
  it('increases the cart count by 1', () => {
    cy.visit('/')
    cy.get('.nav-item.end-0').should('contain.text', 'My Cart (0)');
    
    // Selects the first product and clicks the 'Add to Cart' button
    cy.get('.products article').first().as('product').within(() => {
      cy.get('.btn').click({force: true})
    })
    
    // Verifies that the cart count has increased by 1 after adding the product to the cart
    cy.get('.nav-item.end-0').should('contain.text', 'My Cart (1)');
  })
})