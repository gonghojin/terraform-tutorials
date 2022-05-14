## Build Infrastructure
### Terraform Block
**terraform{}** 블록은 인프라스트럭처에 프로비저닝하기 위해 요구된 provider가 설정된 테라폼 세팅을 가진다.  
각각의 provider는 다음 설정을 가진다.
+ source
    + 선택적으로 hostname, namespace, type의 속성을 가짐
    +  aws provider의 속성은 hashicorp/aws(registry.terraform.io/hashicorp/aws)로 정의됨
+ version
    + 버전은 선택적이지만, 명시하는 걸 추천
        + 명시하지 않으면 최신버전
    
### Providers
Providers 블록은 지정된 Provider(이 경우 aws)를 구성,  
Provider는 Terraform이 리소스를 생성하고 관리하는 데 사용하는 플러그인  

### Resources
인프라스트럭쳐의 구성 요스를 정의하기 위해서 사용  
resource는 물리적이거나 가상의 component(ec2 인스턴스같은)도 가능하며 논리적 리소스( Heroku application)도 가능

Resource 블록은 {} 전에, resource의 타입과 이름을 가리키는 2 개의 sring을 가지며, resource의 타입이 provider의 이름에 매핑된다.  
이 예제로 가정하면, 테라폼은 **aws** provider를 사용하여 **aws_instance**를 관리한다.

또한 리소스 타입과 이름은 함께 리소스의 고유 ID를 형성한다.  
예를 들어 EC2 인스턴스의 ID는 **aws_instance.app_server**이다.

참조 : https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started