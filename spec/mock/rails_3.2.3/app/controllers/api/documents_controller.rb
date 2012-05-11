# Document Test
class Api::DocumentsController < ApplicationController
  # ちゃんとドキュメントを書いて反映されるかのテスト
  #
  # 書式はRdocだよー
  #
  # @version 1.0
  # @param [optional,int] test パラメータのテスト
  # @param [Hash] hash オプション値のテスト
  # @option hash [String] :title タイトル
  # @option hash [int] :num 数字
  # @todo メモ書き
  #   なんかいろいろ書式ためしとかないとまずいなー
  # @response XML
  #   <xml>
  #     <document>
  #       <title>Sample Document</title>
  #       <content> ... </content>
  #       <views>256</views>
  #     </document>
  #   </xml>
  # @response json
  #   {
  #     "document": {
  #       "title": "Sample Document",
  #       "content": " ... ",
  #       "views": 256
  #     }
  #   }
  # @deprecated こいつは今後一切メンテする気がない！
  #
  # @overload /api/documents.json
  #   テスト！！！
  #   @param [int] test これは！
  # @overload /api/documents.html
  def index
    @api_documents = Api::Document.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_documents }
    end
  end

  # GET /api/documents/1
  # GET /api/documents/1.json
  def show
    @api_document = Api::Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_document }
    end
  end

  # GET /api/documents/new
  # GET /api/documents/new.json
  def new
    @api_document = Api::Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api_document }
    end
  end

  # GET /api/documents/1/edit
  def edit
    @api_document = Api::Document.find(params[:id])
  end

  # 新しいドキュメントを生成します。
  #
  # @param [Hash] doc ドキュメントオブジェクト
  # @option doc [String] title ドキュメントのタイトル
  # @option doc [String] body ドキュメントの本文
  #
  # @response 生成に成功した時
  #   {"status": "ok", "doc_id": 12}
  def create
    @api_document = Api::Document.new(params[:api_document])

    respond_to do |format|
      if @api_document.save
        format.html { redirect_to @api_document, notice: 'Document was successfully created.' }
        format.json { render json: @api_document, status: :created, location: @api_document }
      else
        format.html { render action: "new" }
        format.json { render json: @api_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/documents/1
  # PUT /api/documents/1.json
  def update
    @api_document = Api::Document.find(params[:id])

    respond_to do |format|
      if @api_document.update_attributes(params[:api_document])
        format.html { redirect_to @api_document, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/documents/1
  # DELETE /api/documents/1.json
  def destroy
    @api_document = Api::Document.find(params[:id])
    @api_document.destroy

    respond_to do |format|
      format.html { redirect_to api_documents_url }
      format.json { head :no_content }
    end
  end
end
