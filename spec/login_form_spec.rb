describe "forms" do
  it "login com sucesso" do
    visit "/login"

    fill_in "username", with: "stark"
    fill_in "password", with: "jarvis!"

    click_button "Login"

    expect(find("#flash").visible?).to be true

    #expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!"

    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end
  it "senha incorreta" do
    visit "/login"

    fill_in "username", with: "stark"
    fill_in "password", with: "jarvis"

    click_button "Login"

    expect(find("#flash").visible?).to be true

    expect(find("#flash")).to have_content "Senha é invalida!"
  end

  it "usuário não cadastrado" do
    visit "/login"

    fill_in "username", with: "www"
    fill_in "password", with: "www"

    click_button "Login"

    expect(find("#flash").visible?).to be true

    expect(find("#flash")).to have_content "O usuário informado não está cadastrado!"
  end
end
