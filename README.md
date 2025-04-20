# 📝 로그인 어플 SafeLogin

## 목차
1. [프로젝트 소개](#pushpin-프로젝트-소개)
2. [프로젝트 일정](#alarm_clock-프로젝트-일정)
3. [기술 스택](#hammer_and_wrench-기술-스택)
4. [주요 기능](#sparkles-주요-기능)
5. [설치 및 실행 방법](#inbox_tray-설치-및-실행-방법)
6. [테스트](#white_check_mark-테스트)
<br><br>

## :pushpin: 프로젝트 소개

이 프로젝트는 바로인턴 11기 과제로, 회원가입 및 로그인 기능을 구현하는 로그인 앱입니다.

### 미리보기
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/c3ff6a92-afae-444b-b92b-992b79d3d73a" style="width: 150px; height: 326px; object-fit: cover;" /></td>
    <td><img src="https://github.com/user-attachments/assets/c8657656-482d-468c-bf6f-ee31aadadc09" style="width: 150px; height: 326px; object-fit: cover;" /></td>
    <td><img src="https://github.com/user-attachments/assets/afca0a74-f02f-4619-9ef3-b95adb0c4b06" style="width: 150px; height: 326px; object-fit: cover;" /></td>
    <td><img src="https://github.com/user-attachments/assets/2d98d02d-746b-422b-96ce-ee35de640ec9" style="width: 150px; height: 326px; object-fit: cover;" /></td>
  </tr>
</table>

## :alarm_clock: 프로젝트 일정

- **시작일**: 25/04/18  
- **종료일**: 25/04/20

---

## :hammer_and_wrench: 기술 스택

### ReactiveX
- RxSwift
- RxCocoa

### UI Frameworks
- UIKit
- AutoLayout

### 데이터 처리
- UserDefaults
- CoreData

### 📝 Technologies & Tools

<p>
  <!-- Swift -->
  <img src="https://img.shields.io/badge/Swift-F05138?style=flat-square&logo=Swift&logoColor=white"/>
  <!-- UIKit -->
  <img src="https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=apple&logoColor=white"/>
  <!-- UserDefaults -->
  <img src="https://img.shields.io/badge/UserDefaults-808080?style=flat-square&logo=apple&logoColor=white"/>
  <!-- CoreData -->
  <img src="https://img.shields.io/badge/CoreData-007AFF?style=flat-square&logo=apple&logoColor=white"/>
  <!-- RxSwift -->
  <img src="https://img.shields.io/badge/RxSwift-B7178C?style=flat-square&logo=reactivex&logoColor=white"/>
  <!-- RxCocoa -->
  <img src="https://img.shields.io/badge/RxCocoa-B7178C?style=flat-square&logo=reactivex&logoColor=white"/>
  <!-- SnapKit -->
  <img src="https://img.shields.io/badge/SnapKit-0C78FF?style=flat-square&logo=swift&logoColor=white"/>
  <!-- GitHub -->
  <img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white"/>
<p>

---

## :sparkles: 주요 기능

1. **회원가입 기능**

   사용자가 아이디, 비밀번호, 닉네임으로 계정을 생성할 수 있습니다.

2. **로그인 기능**

   등록된 계정으로 로그인하여 앱을 사용할 수 있습니다.
   
3. **로그아웃 기능**

   로그인된 계정에서 안전하게 로그아웃할 수 있습니다.

4. **회원탈퇴 기능**

   계정을 완전히 삭제할 수 있으며, 관련 데이터도 함께 제거됩니다.

5. **입력값 유효성 검사**

   아이디 형식 및 비밀번호 조건을 만족하지 않으면 경고 메시지를 보여줍니다.

---

## :inbox_tray: 설치 및 실행 방법
1. 이 저장소를 클론합니다.
```bash
https://github.com/name-mun/SafeLogin.git
```
2. 프로젝트 디렉토리로 이동합니다.
```bash
cd SafeLogin

```
3. Xcode에서 `SafeLogin.xcodeproj` 파일을 엽니다.

---

## :white_check_mark: 테스트

- `SafeLoginTests` 폴더에 유닛 테스트 코드가 포함되어 있습니다.  
- 주요 기능의 정상 동작을 검증하며, 테스트는 다음과 같이 실행할 수 있습니다.

### ✅ 실행 방법
1. Xcode에서 프로젝트를 열고 `⌘ + U` 를 눌러 테스트를 실행합니다.  
2. 또는 Xcode 상단 메뉴에서 **Product > Test** 를 선택합니다.

### 🧪 테스트 대상
- 입력값 유효성 검사 (아이디, 비밀번호 등)

