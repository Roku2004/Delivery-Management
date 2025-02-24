PGDMP  &                     }            giaohang    16.3    16.3 C    3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            6           1262    27006    giaohang    DATABASE     �   CREATE DATABASE giaohang WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Vietnamese_Vietnam.1258';
    DROP DATABASE giaohang;
                postgres    false            �            1259    27008    Account    TABLE     �   CREATE TABLE public."Account" (
    account_id integer NOT NULL,
    username character varying NOT NULL,
    password character varying(256) NOT NULL,
    role_id integer NOT NULL,
    active boolean NOT NULL
);
    DROP TABLE public."Account";
       public         heap    postgres    false            �            1259    27295    Driver    TABLE     �   CREATE TABLE public."Driver" (
    "Driver_id" integer NOT NULL,
    "Driver_name" character varying(30) NOT NULL,
    "Driver_phone" character varying(11) NOT NULL,
    "Status" boolean NOT NULL
);
    DROP TABLE public."Driver";
       public         heap    postgres    false            �            1259    27294    Driver_Driver_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Driver_Driver_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Driver_Driver_id_seq";
       public          postgres    false    226            7           0    0    Driver_Driver_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Driver_Driver_id_seq" OWNED BY public."Driver"."Driver_id";
          public          postgres    false    225            �            1259    27346    Order    TABLE       CREATE TABLE public."Order" (
    "Order_id" integer NOT NULL,
    "Sender" character varying(30) NOT NULL,
    "Receiver" character varying(30) NOT NULL,
    "Origin_address" character varying(50) NOT NULL,
    "Destination_address" character varying(50) NOT NULL,
    "Sender_phone" character varying(11) NOT NULL,
    "Receiver_phone" character varying(11) NOT NULL,
    "Status" character varying(20),
    "Weight" integer NOT NULL,
    "Total Cost" double precision,
    "Payment status" boolean,
    "Account_id" integer
);
    DROP TABLE public."Order";
       public         heap    postgres    false            �            1259    27345    Order_Order_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Order_Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Order_Order_id_seq";
       public          postgres    false    230            8           0    0    Order_Order_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Order_Order_id_seq" OWNED BY public."Order"."Order_id";
          public          postgres    false    229            �            1259    27153    Role    TABLE     g   CREATE TABLE public."Role" (
    role_id integer NOT NULL,
    role_name character varying NOT NULL
);
    DROP TABLE public."Role";
       public         heap    postgres    false            �            1259    27152    Role_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Role_role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Role_role_id_seq";
       public          postgres    false    222            9           0    0    Role_role_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Role_role_id_seq" OWNED BY public."Role".role_id;
          public          postgres    false    221            �            1259    27329    Route    TABLE     �   CREATE TABLE public."Route" (
    "Route_id" integer NOT NULL,
    "Startpoint" character varying(100) NOT NULL,
    "Endpoint" character varying(100) NOT NULL,
    "Driver_id" integer NOT NULL,
    "Vehical_id" integer NOT NULL
);
    DROP TABLE public."Route";
       public         heap    postgres    false            �            1259    27136    Route-Order    TABLE     �   CREATE TABLE public."Route-Order" (
    "Track_id" integer NOT NULL,
    "Route_id" integer NOT NULL,
    "Order_id" integer NOT NULL,
    "Address" character varying NOT NULL,
    "Time" date NOT NULL
);
 !   DROP TABLE public."Route-Order";
       public         heap    postgres    false            �            1259    27135    Route-Order_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Route-Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Route-Order_id_seq";
       public          postgres    false    220            :           0    0    Route-Order_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Route-Order_id_seq" OWNED BY public."Route-Order"."Track_id";
          public          postgres    false    219            �            1259    27328    Route_Route_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Route_Route_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Route_Route_id_seq";
       public          postgres    false    228            ;           0    0    Route_Route_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Route_Route_id_seq" OWNED BY public."Route"."Route_id";
          public          postgres    false    227            �            1259    27076    User    TABLE     �   CREATE TABLE public."User" (
    user_id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    phone character varying(11) NOT NULL,
    account_id integer NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    27007    User_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."User_user_id_seq";
       public          postgres    false    216            <           0    0    User_user_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."User_user_id_seq" OWNED BY public."Account".account_id;
          public          postgres    false    215            �            1259    27075    User_user_id_seq1    SEQUENCE     �   CREATE SEQUENCE public."User_user_id_seq1"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."User_user_id_seq1";
       public          postgres    false    218            =           0    0    User_user_id_seq1    SEQUENCE OWNED BY     J   ALTER SEQUENCE public."User_user_id_seq1" OWNED BY public."User".user_id;
          public          postgres    false    217            �            1259    27288    Vehical    TABLE     �   CREATE TABLE public."Vehical" (
    "Vehical_id" integer NOT NULL,
    "Vehicaltype" character varying(30) NOT NULL,
    "Capacity(KG)" double precision NOT NULL,
    "NumberPlate" character varying(11) NOT NULL
);
    DROP TABLE public."Vehical";
       public         heap    postgres    false            �            1259    27287    Vehical_Vehical_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Vehical_Vehical_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Vehical_Vehical_id_seq";
       public          postgres    false    224            >           0    0    Vehical_Vehical_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Vehical_Vehical_id_seq" OWNED BY public."Vehical"."Vehical_id";
          public          postgres    false    223            s           2604    27011    Account account_id    DEFAULT     v   ALTER TABLE ONLY public."Account" ALTER COLUMN account_id SET DEFAULT nextval('public."User_user_id_seq"'::regclass);
 C   ALTER TABLE public."Account" ALTER COLUMN account_id DROP DEFAULT;
       public          postgres    false    216    215    216            x           2604    27298    Driver Driver_id    DEFAULT     z   ALTER TABLE ONLY public."Driver" ALTER COLUMN "Driver_id" SET DEFAULT nextval('public."Driver_Driver_id_seq"'::regclass);
 C   ALTER TABLE public."Driver" ALTER COLUMN "Driver_id" DROP DEFAULT;
       public          postgres    false    225    226    226            z           2604    27349    Order Order_id    DEFAULT     v   ALTER TABLE ONLY public."Order" ALTER COLUMN "Order_id" SET DEFAULT nextval('public."Order_Order_id_seq"'::regclass);
 A   ALTER TABLE public."Order" ALTER COLUMN "Order_id" DROP DEFAULT;
       public          postgres    false    229    230    230            v           2604    27156    Role role_id    DEFAULT     p   ALTER TABLE ONLY public."Role" ALTER COLUMN role_id SET DEFAULT nextval('public."Role_role_id_seq"'::regclass);
 =   ALTER TABLE public."Role" ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    221    222    222            y           2604    27332    Route Route_id    DEFAULT     v   ALTER TABLE ONLY public."Route" ALTER COLUMN "Route_id" SET DEFAULT nextval('public."Route_Route_id_seq"'::regclass);
 A   ALTER TABLE public."Route" ALTER COLUMN "Route_id" DROP DEFAULT;
       public          postgres    false    227    228    228            u           2604    27139    Route-Order Track_id    DEFAULT     |   ALTER TABLE ONLY public."Route-Order" ALTER COLUMN "Track_id" SET DEFAULT nextval('public."Route-Order_id_seq"'::regclass);
 G   ALTER TABLE public."Route-Order" ALTER COLUMN "Track_id" DROP DEFAULT;
       public          postgres    false    220    219    220            t           2604    27079    User user_id    DEFAULT     q   ALTER TABLE ONLY public."User" ALTER COLUMN user_id SET DEFAULT nextval('public."User_user_id_seq1"'::regclass);
 =   ALTER TABLE public."User" ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    217    218    218            w           2604    27291    Vehical Vehical_id    DEFAULT     ~   ALTER TABLE ONLY public."Vehical" ALTER COLUMN "Vehical_id" SET DEFAULT nextval('public."Vehical_Vehical_id_seq"'::regclass);
 E   ALTER TABLE public."Vehical" ALTER COLUMN "Vehical_id" DROP DEFAULT;
       public          postgres    false    224    223    224            "          0    27008    Account 
   TABLE DATA           T   COPY public."Account" (account_id, username, password, role_id, active) FROM stdin;
    public          postgres    false    216   O       ,          0    27295    Driver 
   TABLE DATA           X   COPY public."Driver" ("Driver_id", "Driver_name", "Driver_phone", "Status") FROM stdin;
    public          postgres    false    226   �O       0          0    27346    Order 
   TABLE DATA           �   COPY public."Order" ("Order_id", "Sender", "Receiver", "Origin_address", "Destination_address", "Sender_phone", "Receiver_phone", "Status", "Weight", "Total Cost", "Payment status", "Account_id") FROM stdin;
    public          postgres    false    230   �O       (          0    27153    Role 
   TABLE DATA           4   COPY public."Role" (role_id, role_name) FROM stdin;
    public          postgres    false    222   qP       .          0    27329    Route 
   TABLE DATA           b   COPY public."Route" ("Route_id", "Startpoint", "Endpoint", "Driver_id", "Vehical_id") FROM stdin;
    public          postgres    false    228   �P       &          0    27136    Route-Order 
   TABLE DATA           ^   COPY public."Route-Order" ("Track_id", "Route_id", "Order_id", "Address", "Time") FROM stdin;
    public          postgres    false    220   �P       $          0    27076    User 
   TABLE DATA           G   COPY public."User" (user_id, full_name, phone, account_id) FROM stdin;
    public          postgres    false    218   Q       *          0    27288    Vehical 
   TABLE DATA           _   COPY public."Vehical" ("Vehical_id", "Vehicaltype", "Capacity(KG)", "NumberPlate") FROM stdin;
    public          postgres    false    224   �Q       ?           0    0    Driver_Driver_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Driver_Driver_id_seq"', 2, true);
          public          postgres    false    225            @           0    0    Order_Order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Order_Order_id_seq"', 2, true);
          public          postgres    false    229            A           0    0    Role_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Role_role_id_seq"', 3, true);
          public          postgres    false    221            B           0    0    Route-Order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Route-Order_id_seq"', 1, true);
          public          postgres    false    219            C           0    0    Route_Route_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Route_Route_id_seq"', 1, true);
          public          postgres    false    227            D           0    0    User_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."User_user_id_seq"', 14, true);
          public          postgres    false    215            E           0    0    User_user_id_seq1    SEQUENCE SET     B   SELECT pg_catalog.setval('public."User_user_id_seq1"', 14, true);
          public          postgres    false    217            F           0    0    Vehical_Vehical_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Vehical_Vehical_id_seq"', 1, true);
          public          postgres    false    223            �           2606    27300    Driver Driver_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Driver"
    ADD CONSTRAINT "Driver_pkey" PRIMARY KEY ("Driver_id");
 @   ALTER TABLE ONLY public."Driver" DROP CONSTRAINT "Driver_pkey";
       public            postgres    false    226            �           2606    27351    Order Order_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY ("Order_id");
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    230            �           2606    27160    Role Role_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (role_id);
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    222            �           2606    27141    Route-Order Route-Order_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Route-Order"
    ADD CONSTRAINT "Route-Order_pkey" PRIMARY KEY ("Track_id");
 J   ALTER TABLE ONLY public."Route-Order" DROP CONSTRAINT "Route-Order_pkey";
       public            postgres    false    220            �           2606    27334    Route Route_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Route"
    ADD CONSTRAINT "Route_pkey" PRIMARY KEY ("Route_id");
 >   ALTER TABLE ONLY public."Route" DROP CONSTRAINT "Route_pkey";
       public            postgres    false    228            |           2606    27015    Account User_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (account_id);
 ?   ALTER TABLE ONLY public."Account" DROP CONSTRAINT "User_pkey";
       public            postgres    false    216            ~           2606    27081    User User_pkey1 
   CONSTRAINT     V   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey1" PRIMARY KEY (user_id);
 =   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey1";
       public            postgres    false    218            �           2606    27293    Vehical Vehical_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Vehical"
    ADD CONSTRAINT "Vehical_pkey" PRIMARY KEY ("Vehical_id");
 B   ALTER TABLE ONLY public."Vehical" DROP CONSTRAINT "Vehical_pkey";
       public            postgres    false    224            �           2606    27161    Account Account_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_role_id_fkey" FOREIGN KEY (role_id) REFERENCES public."Role"(role_id) NOT VALID;
 J   ALTER TABLE ONLY public."Account" DROP CONSTRAINT "Account_role_id_fkey";
       public          postgres    false    4738    216    222            �           2606    27352    Order Order_Account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_Account_id_fkey" FOREIGN KEY ("Account_id") REFERENCES public."Account"(account_id);
 I   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_Account_id_fkey";
       public          postgres    false    230    216    4732            �           2606    27362 %   Route-Order Route-Order_Order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Route-Order"
    ADD CONSTRAINT "Route-Order_Order_id_fkey" FOREIGN KEY ("Order_id") REFERENCES public."Order"("Order_id") NOT VALID;
 S   ALTER TABLE ONLY public."Route-Order" DROP CONSTRAINT "Route-Order_Order_id_fkey";
       public          postgres    false    220    230    4746            �           2606    27357 %   Route-Order Route-Order_Route_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Route-Order"
    ADD CONSTRAINT "Route-Order_Route_id_fkey" FOREIGN KEY ("Route_id") REFERENCES public."Route"("Route_id") NOT VALID;
 S   ALTER TABLE ONLY public."Route-Order" DROP CONSTRAINT "Route-Order_Route_id_fkey";
       public          postgres    false    4744    220    228            �           2606    27335    Route Route_Driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Route"
    ADD CONSTRAINT "Route_Driver_id_fkey" FOREIGN KEY ("Driver_id") REFERENCES public."Driver"("Driver_id");
 H   ALTER TABLE ONLY public."Route" DROP CONSTRAINT "Route_Driver_id_fkey";
       public          postgres    false    228    4742    226            �           2606    27340    Route Route_Vehical_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Route"
    ADD CONSTRAINT "Route_Vehical_id_fkey" FOREIGN KEY ("Vehical_id") REFERENCES public."Vehical"("Vehical_id");
 I   ALTER TABLE ONLY public."Route" DROP CONSTRAINT "Route_Vehical_id_fkey";
       public          postgres    false    224    4740    228            �           2606    27082    User User_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_account_id_fkey" FOREIGN KEY (account_id) REFERENCES public."Account"(account_id);
 G   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_account_id_fkey";
       public          postgres    false    216    218    4732            "   s   x�M�K� ׏�T5���dc�[)�Jp��UD��ȶG�y�� ���]�?їZ/i�	��7|:��wd-2�"�AO�$��+Į~a6oD�~�G�&���lb��|q���1>      ,   ?   x�3�t)��KWp! 6���Z�[�r�pq�d�e(�%�)8r���[XZZ��db���� <E�      0   w   x�3������,M�K��HT�r�����������%�������r�'f�(���d��Ur�q�r�pqq��'sf�Vr�e�e($	ΌD�<4���MM�,M������� �(d      (      x�3�LL����2�,-N-����� : �      .   "   x�3��HT��������Pp����\1z\\\ j*�      &   '   x�3�4����t���<N##]C#]#c�=... �f      $   �   x�5��n!���)x�h�`�w�VʏTi�S/���,�p��wHT�,3�1Sn{���M�r�9Qb��g���1;Z��Ǹ��«��4)TO�Z��;|+r���1�~�$��K:� -a�cB:R�6���ΠSM�ǯ��j+����L��He"�y����}�'%`��s�T�u��D�O�'T�g��V�}k�� ������~Z$�( ���:c� LgGU      *   %   x�3�)*M��440�4�3�5�4�3������ f!�     