package com.nf.vo;

public class ResponseVO {
    private String code;
    private String msg;
    private Object data;
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }


    private ResponseVO(Builder builder) {
        setCode(builder.code);
        setMsg(builder.msg);
        setData(builder.data);
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public static Builder newBuilder(ResponseVO copy) {
        Builder builder = new Builder();
        builder.code = copy.getCode();
        builder.msg = copy.getMsg();
        builder.data = copy.getData();
        return builder;
    }

    //建造模式
    public static final class Builder {
        private String code;
        private String msg;
        private Object data;

        private Builder() {
        }

        public Builder code(String val) {
            code = val;
            return this;
        }

        public Builder msg(String val) {
            msg = val;
            return this;
        }

        public Builder data(Object val) {
            data = val;
            return this;
        }

        public ResponseVO build() {
            return new ResponseVO(this);
        }
    }
}
