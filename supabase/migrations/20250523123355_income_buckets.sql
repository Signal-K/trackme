create table public.income_buckets (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.profiles(id) on delete cascade,
  bucket_name text not null,
  income numeric not null,
  start_date date not null,
  end_date date not null check (end_date > current_date),
  frequency text not null check (frequency in ('weekly', 'fortnightly', 'monthly', 'quarterly', 'yearly')),
  currency text not null,
  colour text not null,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);