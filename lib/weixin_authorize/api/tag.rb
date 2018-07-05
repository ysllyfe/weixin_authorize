# encoding: utf-8
module WeixinAuthorize
  module Api
    module Tag

      def batch_add_users_tag(openids = [], tagid)
        raise '每次传入的openid列表个数不能超过50个' if openids.count > 50
        http_post("/tags/members/batchtagging", {
          openid_list: openids,
          tagid: tagid
        })
      end

      def batch_cancel_users_tag(openids = [], tagid)
        raise '每次传入的openid列表个数不能超过50个' if openids.count > 50
        http_post("/tags/members/batchuntagging", {
          openid_list: openids,
          tagid: tagid
        })
      end

      def get_user_tags(openid)
        http_post("/tags/getidlist", {openid: openid})
      end

      # 获取公众号已创建的标签
      def get_tags
        http_get("/tags/get")
      end

      # 创建标签
      def create_tag(tagname)
        tag = {
          tag: {
            name: tagname
          }
        }
        http_post("/tags/create", tag)
      end

      # 编辑标签
      def update_tag(id, name)
        tag = {
          tag: {id: id, name: name}
        }
        http_post("/tags/update", tag)
      end

      # 删除标签
      def delete_tag(id)
        http_post("/tags/delete", {tag: {id: id}})
      end

    end
  end
end
