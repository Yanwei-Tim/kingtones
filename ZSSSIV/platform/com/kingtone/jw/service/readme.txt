关于榆林警务通 service服务端程序开发规范：

1、可以在com.kingtone.jw.service下创建 服务类 例如JWService

2、xml与obj互转 使用XmlParseTool工具类

3、ServiceTool 终端调用webservice工具类

4、com.kingtone.jw.service.domain下可以定义业务所需的bean

   其中ServiceData是公共数据交互类！所以其他业务类可以再其内部注册！