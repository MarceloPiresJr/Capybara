describe "login 3", :login3 do
  before(:each) do
    visit "/acess"
  end
  it "Login com sucesso" do
    # login_form = find("#login")

    # login_form.find("input[name=username]").set "stark"
    # login_form.find("input[name=password]").set "jarvis!"

    within("#login") do
      find("input[name=username]").set "stark"
      find("input[name=password]").set "jarvis!"
      click_button "Entrar"
    end

    # click_button "Entrar"
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end

  it "Cadastro com Sucesso" do
    whitin("#signup") do
      find("input[name=username]").set "Vall"
      find("input[name=password]").set "123456"
      click_link "Criar Conta"
    end
    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
