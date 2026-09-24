-- 쇼핑 리스트 항목 테이블 (로그인 없는 공용 목록, 공부용)
create table public.shopping_items (
  id text primary key,
  name text not null check (char_length(btrim(name)) between 1 and 100),
  done boolean not null default false,
  created_at timestamptz not null default now()
);

create index shopping_items_created_at_idx on public.shopping_items (created_at);

alter table public.shopping_items enable row level security;

grant select, insert, update, delete on public.shopping_items to anon, authenticated;

create policy "public read" on public.shopping_items
  for select to anon, authenticated using (true);
create policy "public insert" on public.shopping_items
  for insert to anon, authenticated with check (true);
create policy "public update" on public.shopping_items
  for update to anon, authenticated using (true) with check (true);
create policy "public delete" on public.shopping_items
  for delete to anon, authenticated using (true);
