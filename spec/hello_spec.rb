describe "meu primeiro script", :hello1 do
  it "visitar a pagina" do
    visit "/"
    expect(page.title).to eql "Training Wheels Protocol"
  end
end
