describe "Teclado", :key do
  before(:each) do
    visit "/key_presses"
  end

  it "Enviando Teclas" do
    teclas = %i[tab escape space enter shift control alt]

    teclas.each do |t|
      find("#campo-id").send_keys t
      expect(page).to have_content "You entered: " + t.to_s.upcase
      sleep 1
    end
  end

  it "enviando letras" do
    letras = %w[a s d f g h j k l]

    letras.each do |i|
      find("#campo-id").send_keys i
      expect(page).to have_content "You entered: " + i.to_s.upcase
      sleep 1
    end
  end
end
