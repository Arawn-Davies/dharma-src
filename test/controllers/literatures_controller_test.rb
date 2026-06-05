require "test_helper"

class LiteraturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @literature = literatures(:one)
  end

  test "index is public" do
    get literatures_url
    assert_response :success
  end

  test "show is public" do
    get literature_url(@literature)
    assert_response :success
  end

  test "downloadable resources show source link" do
    @literature.update!(
      resource_url: "https://example.com/file.pdf",
      resource_format: "PDF",
      resource_kind: "Book"
    )

    get literature_url(@literature)

    assert_response :success
    assert_select "a[href='https://example.com/file.pdf']", "Open source"
  end

  test "mirrored resources prefer local copy for preview" do
    @literature.update!(
      resource_url: "https://example.com/file.pdf",
      local_resource_path: "/resources/shasta/file.pdf",
      resource_format: "PDF",
      resource_kind: "Book"
    )

    get literature_url(@literature)

    assert_response :success
    assert_select "a[href='/resources/shasta/file.pdf']", "Open local copy"
    assert_select "a[href='https://example.com/file.pdf']", "Original source"
    assert_select "iframe[src='/resources/shasta/file.pdf']"
  end

  test "pdf resources render inline preview" do
    @literature.update!(
      resource_url: "https://example.com/file.pdf",
      resource_format: "PDF",
      resource_kind: "Book"
    )

    get literature_url(@literature)

    assert_response :success
    assert_select "iframe[src='https://example.com/file.pdf']"
  end

  test "mp3 resources render audio player" do
    @literature.update!(
      resource_url: "https://example.com/file.mp3",
      resource_format: "MP3",
      resource_kind: "Scripture"
    )

    get literature_url(@literature)

    assert_response :success
    assert_select "audio[src='https://example.com/file.mp3']"
  end

  test "zip resources do not render inline preview" do
    @literature.update!(
      resource_url: "https://example.com/file.zip",
      resource_format: "Audio ZIP",
      resource_kind: "Book"
    )

    get literature_url(@literature)

    assert_response :success
    assert_select "iframe", false
    assert_select "audio", false
  end
end
