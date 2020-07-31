describe "Mouse Hover", :hovers do
  before(:each) do
    visit "/hovers"
  end

  it "quando passo o mousesobre o blade" do
    card = find("img[alt*=Blade]")
    card.hover

    expect(page).to have_content "Nome: Blade"
  end
  it "quando passo o mousesobre o Pantera Negra" do
    card1 = find("img[alt^=Pantera]")
    card1.hover

    expect(page).to have_content "Nome: Pantera Negra"
  end
  it "quando passo o mousesobre o Homem Aranha" do
    card2 = find("img[alt$=Aranha]")
    card2.hover

    expect(page).to have_content "Nome: Homem Aranha"
  end
  after(:each) do
    sleep 0.5
  end
end
