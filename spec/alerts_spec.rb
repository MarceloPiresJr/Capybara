describe "Alertas de javascript", :alerts do
  before(:each) do
    visit "/javascript_alerts"
  end

  it "alerta" do
    click_button "Alerta"

    msg = page.driver.browser.switch_to.alert.text
    puts msg
    expect(msg).to eql "Isto é uma mensagem de alerta"
    sleep 2
  end

  it "Confirma", :com1 do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"

    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Mensagem confirmada"
  end
  it "Não Confirma", :com do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"

    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_content "Mensagem não confirmada"
  end

  it "Accept Prompt", :prompt do
    accept_prompt(with: "Marcelo") do
      click_button "Prompt"
      sleep 2
    end
    expect(page).to have_content "Olá, Marcelo"
    sleep 2
  end

  it "Dismiss Prompt", :miss do
    dismiss_prompt() do
      click_button "Prompt"
      sleep 4
    end
    expect(page).to have_content "Olá, null"
    sleep 2
  end
end
