require "test_helper"

class CandidaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidature = candidatures(:one)
  end

  test "should get index" do
    get candidatures_url, as: :json
    assert_response :success
  end

  test "should create candidature" do
    assert_difference('Candidature.count') do
      post candidatures_url, params: { candidature: { jobs_id: @candidature.jobs_id, users_id: @candidature.users_id } }, as: :json
    end

    assert_response 201
  end

  test "should show candidature" do
    get candidature_url(@candidature), as: :json
    assert_response :success
  end

  test "should update candidature" do
    patch candidature_url(@candidature), params: { candidature: { jobs_id: @candidature.jobs_id, users_id: @candidature.users_id } }, as: :json
    assert_response 200
  end

  test "should destroy candidature" do
    assert_difference('Candidature.count', -1) do
      delete candidature_url(@candidature), as: :json
    end

    assert_response 204
  end
end
