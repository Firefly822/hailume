package me.hailu.http;

/**
 * Created with IntelliJ IDEA.
 * User: liming_liu
 * Date: 14-9-15
 * Time: 下午5:11
 * To change this template use File | Settings | File Templates.
 */
public abstract class Response {

    public int code;

    public String info;

    public Object entity;

    public static ResponseBuilder status(int code) {
        return new ResponseBuilder(code);
    }

    public static class ResponseBuilder {

        Response response = new Response(){};

        protected ResponseBuilder(int code) {
            response.code = code;
        }

        public ResponseBuilder info(String info) {
            response.info = info;
            return this;
        }

        public ResponseBuilder entity(Object entity) {
            response.entity = entity;
            return this;
        }

        public Response build() {
            return response;
        }
    }
}
