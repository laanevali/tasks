describe('log in', () => {
  it('log in successful', () => {
    cy.visit('https://www.saucedemo.com/')
    cy.get("[data-test='username']").clear().type('standard_user')
    cy.get("[data-test='password']").clear().type('secret_sauce')
    cy.get("[data-test='login-button']").click()
  })
})