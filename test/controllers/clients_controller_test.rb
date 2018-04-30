require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get clients_url
    assert_response :success
  end

  test "should get new" do
    get new_client_url
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post clients_url, params: { client: { adresse: @client.adresse, categorie_principale: @client.categorie_principale, categorie_secondaire: @client.categorie_secondaire, code_ape: @client.code_ape, code_postal: @client.code_postal, commentaires: @client.commentaires, commune: @client.commune, contact: @client.contact, cote: @client.cote, date_pa: @client.date_pa, mail: @client.mail, nom_pa: @client.nom_pa, profils_recherches: @client.profils_recherches, raison_sociale: @client.raison_sociale, semaine_de_revoir: @client.semaine_de_revoir, telephone: @client.telephone } }
    end

    assert_redirected_to client_url(Client.last)
  end

  test "should show client" do
    get client_url(@client)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_url(@client)
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { adresse: @client.adresse, categorie_principale: @client.categorie_principale, categorie_secondaire: @client.categorie_secondaire, code_ape: @client.code_ape, code_postal: @client.code_postal, commentaires: @client.commentaires, commune: @client.commune, contact: @client.contact, cote: @client.cote, date_pa: @client.date_pa, mail: @client.mail, nom_pa: @client.nom_pa, profils_recherches: @client.profils_recherches, raison_sociale: @client.raison_sociale, semaine_de_revoir: @client.semaine_de_revoir, telephone: @client.telephone } }
    assert_redirected_to client_url(@client)
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
  end
end
