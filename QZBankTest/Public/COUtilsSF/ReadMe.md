# CO框架


## 1. Extension模块

封装了一些扩展的用法,主要是用于简化代码的写法,里面包含了字符串,日期等等的简化写法

## 2. Tool模块
封装了封装了一些常用的工具方法.因为不是扩展,所以调用的时候需要先写类名才可以

## 3. Net模块
封装了UI和Net交互的模块
###需要外部实现以下内容

* 需要外部实现CONet里的几个set方法.
		
		//处理请求和返回的类
		public class func setHttpOperationType(type:COHttpOperation.Type){
		      coHttpOperationType = type
		}
		//根据http返回的内容填充threadM
		public class func setHttpFillThreadMWithReturnContentBlock(block:((String?,NSError?,COThreadM) -> Void)?){
		coHttpFillThreadMWithReturnContentBlock = block
		}
	
		//连接网络的block.跟coHttpConnectType的作用一样,如果实现了COHttpConnect的子类,则下面不需要实现coHttpConnectBlock.
		public class func setHttpConnectType(type:COHttpConnect.Type? = nil ,coHttpConnectBlock coHttpConnectBlock_:((COThreadM) -> (String?,NSError?))? = nil){
		coHttpConnectType = type
		coHttpConnectBlock = coHttpConnectBlock_
		}

* 外部需要创建一个APIEnum的枚举,存放请求网络的url,方法和回调的方法名称

		public enum APIEnum :Int{
		//第一个是枚举的key,第二个是短url,第三个是回调时候的方法名称
		static let BaseUrl = "http://192.168.1.3:18080/WXSearch/test/"
	
		static let APIs:[(APIEnum,String,String?)] = [
		(APIEnum.T1,"testjson","testjson")
		]
		case T1 = 0
	
		func getAPIM() ->COAPIM{

		var url:String = ""
		var methodName:String = ""
		for (apiM,sortUrl_,methodName_) in APIEnum.APIs {
			if apiM == self {
				//改成完整的url
				url = "\(APIEnum.BaseUrl)\(sortUrl_)"
				if let methodName1_ = methodName_ {
					methodName = methodName1_
				}else{
					methodName = sortUrl_
				}
			}
		}
		return COAPIM(url: url,methodName: methodName)
		}
		}



## 4. View模块
主要是BaseV和BaseVC
BaseVC里包含了子类所需要实现的几个方法,而所有的子VC都需要继承BaseVC

	// MARK:子类继承
	//创建的时候绘制View的地方
	public func createViews(){
		
	}
	//创建的时候写数据的地方
	public func createData(){
		
	}
	//创建的时候写事件的地方
	public func createEvets(){
		
	}
	//每次进入界面的时候会被调用
	public func fillViewsOnResume(){
		
	}
	//每次进入界面的时候会被调用
	public func fillDataOnResume(){
		
	}
	//	#pragma mark 风火轮
	// MARK: 风火轮
	public func showProgressV(){
	}
	public func hideProgressV(){
	}

所有的自定义View会继承BaseV
## 5. Other模块

目前是COBaseModel

COBaseModel是所有的数据模型需要继承的类,里面封装了从json创建对象的方法


	//根据字典解析数据
	init(json:NSDictionary){
		super.init()
	}
	
该init方法目前仅仅支持OC支持的基本类型.但需要写默认值

	class UserM: BaseModel {
		var name:String=""
		var age:Int=0
		var address:AddressM?
	}
	
自定义类型的属性,需要自己重载init(json:NSDictionary)方法,自己添加

	override init(json: NSDictionary) {
		super.init(json: json)
		//获取address
		let dict: NSDictionary = json["address"] as NSDictionary
		let address = AddressM(json:dict)
		self.address = address
	}
	
**注意,目前不支持类型转换,比如说json里是int,而属性类型是String,是不会自动转换的..而且会抛异常.这个需要约定好**