describe('Product Details', () => {
  it('click on Product and show details', () => {
    cy.visit('/')

    cy.get('.products article').first().as('product')

    // Verify that the product name is displayed
    cy.get('@product').find('h1 span').first().should('exist')

    // Verify that the add to cart button is displayed
    cy.get('@product').find('button[type="submit"]').should('exist')

    // Click on the product to view its details
    cy.get('@product').click()

    // Verify that the URL path contains "product" and the product ID
    cy.url().should('match', /\/products\/\d+/)

    // Verify that the product details page contains "in stock at" text
    cy.get('.quantity').should('exist')
    cy.contains('in stock at').should('exist')
  })
})