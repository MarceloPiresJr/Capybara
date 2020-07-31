describe "Dynamic Control", :dc do
  before(:each) do
    visit "/dynamic_controls"
  end

  it "quando habilitado o campo" do
    #quando tem a propriedade disabled true o campo esta desabilitado
    #quando não tem a propriedade disable o campo está habilitado

    res = page.has_field? "movie", disabled: true
    puts res

    click_button "Habilita"

    res = page.has_field? "movie", disabled: false
    puts res
  end
end
