# 🛒 쇼핑리스트 앱

빌드나 설치 없이 `index.html` 파일 하나로 동작하는 쇼핑 리스트 웹 앱입니다. 목록은 [Supabase](https://supabase.com) 데이터베이스에 저장됩니다.

## 기능

- 항목 추가 (Enter 또는 "추가" 버튼, 앞뒤 공백 제거, 빈 입력 무시, 최대 100자)
- 체크해서 구매 완료 표시 / 해제
- `×` 버튼으로 항목 삭제
- "완료한 항목 지우기"로 체크한 항목 한 번에 삭제
- "전체 n개 · 남은 것 n개" 요약 표시
- Supabase `shopping_items` 테이블에 저장 (새로고침하거나 다른 기기에서 열어도 같은 목록)
- 예전 버전에서 `localStorage`에 저장해 둔 목록은 처음 열 때 한 번 자동으로 옮겨짐

## 실행 방법

`index.html`을 브라우저로 열면 바로 사용할 수 있습니다. (인터넷 연결 필요)

처음 설정할 때는 Supabase 대시보드의 SQL Editor에서 [`supabase/schema.sql`](supabase/schema.sql)을 한 번 실행해 테이블을 만듭니다.

## 기술

- HTML / CSS / 바닐라 JavaScript (프레임워크 없음)
- [supabase-js](https://github.com/supabase/supabase-js) v2 (CDN, SRI 해시로 무결성 확인)
- 사용자 입력은 `textContent`로만 화면에 넣어 XSS를 막습니다.

## 주의

공부용이라 로그인 없이 누구나 목록을 읽고 고칠 수 있게 RLS 정책을 열어 두었습니다. 코드에 들어 있는 Supabase 키는 공개용(publishable) 키이지만, 이 정책 때문에 앱 주소와 키를 아는 사람은 누구나 목록을 바꿀 수 있습니다. 개인 정보는 넣지 마세요.
