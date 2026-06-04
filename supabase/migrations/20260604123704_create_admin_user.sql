/*
  # Create Admin User

  Creates the initial admin user for the RightSpot admin panel.
  Uses Supabase's auth.users table with a bcrypt-hashed password.

  Admin credentials:
  - Email: admin@rightspot.fi
  - Password: RightSpot2025!
*/

INSERT INTO auth.users (
  id,
  instance_id,
  email,
  encrypted_password,
  email_confirmed_at,
  raw_app_meta_data,
  raw_user_meta_data,
  is_super_admin,
  role,
  aud,
  created_at,
  updated_at,
  confirmation_token,
  recovery_token,
  email_change_token_new,
  email_change
)
SELECT
  gen_random_uuid(),
  '00000000-0000-0000-0000-000000000000',
  'admin@rightspot.fi',
  crypt('RightSpot2025!', gen_salt('bf')),
  NOW(),
  '{"provider":"email","providers":["email"]}',
  '{"name":"Admin"}',
  false,
  'authenticated',
  'authenticated',
  NOW(),
  NOW(),
  '',
  '',
  '',
  ''
WHERE NOT EXISTS (
  SELECT 1 FROM auth.users WHERE email = 'admin@rightspot.fi'
);

INSERT INTO auth.identities (
  id,
  user_id,
  identity_data,
  provider,
  last_sign_in_at,
  created_at,
  updated_at,
  provider_id
)
SELECT
  gen_random_uuid(),
  u.id,
  jsonb_build_object('sub', u.id::text, 'email', u.email),
  'email',
  NOW(),
  NOW(),
  NOW(),
  u.id::text
FROM auth.users u
WHERE u.email = 'admin@rightspot.fi'
  AND NOT EXISTS (
    SELECT 1 FROM auth.identities i WHERE i.provider_id = u.id::text AND i.provider = 'email'
  );
