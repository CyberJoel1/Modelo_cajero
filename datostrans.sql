PGDMP     8    %                z            Cajero3    12.9    12.9                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    41529    Cajero3    DATABASE     ?   CREATE DATABASE "Cajero3" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "Cajero3";
                postgres    false            ?            1259    41550    cuenta_bancaria    TABLE     ?   CREATE TABLE public.cuenta_bancaria (
    id_cuentabancaria integer NOT NULL,
    id_cliente integer,
    tipo_cuentabancaria character(30) NOT NULL,
    fechacreacion_cuentabancaria date,
    saldo_cuentabancaria money
);
 #   DROP TABLE public.cuenta_bancaria;
       public         heap    postgres    false            ?            1259    41548 %   cuenta_bancaria_id_cuentabancaria_seq    SEQUENCE     ?   CREATE SEQUENCE public.cuenta_bancaria_id_cuentabancaria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.cuenta_bancaria_id_cuentabancaria_seq;
       public          postgres    false    207                       0    0 %   cuenta_bancaria_id_cuentabancaria_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.cuenta_bancaria_id_cuentabancaria_seq OWNED BY public.cuenta_bancaria.id_cuentabancaria;
          public          postgres    false    206            ?
           2604    41553 !   cuenta_bancaria id_cuentabancaria    DEFAULT     ?   ALTER TABLE ONLY public.cuenta_bancaria ALTER COLUMN id_cuentabancaria SET DEFAULT nextval('public.cuenta_bancaria_id_cuentabancaria_seq'::regclass);
 P   ALTER TABLE public.cuenta_bancaria ALTER COLUMN id_cuentabancaria DROP DEFAULT;
       public          postgres    false    206    207    207                      0    41550    cuenta_bancaria 
   TABLE DATA           ?   COPY public.cuenta_bancaria (id_cuentabancaria, id_cliente, tipo_cuentabancaria, fechacreacion_cuentabancaria, saldo_cuentabancaria) FROM stdin;
    public          postgres    false    207   ?                  0    0 %   cuenta_bancaria_id_cuentabancaria_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.cuenta_bancaria_id_cuentabancaria_seq', 3, true);
          public          postgres    false    206            ?
           2606    41555 "   cuenta_bancaria pk_cuenta_bancaria 
   CONSTRAINT     o   ALTER TABLE ONLY public.cuenta_bancaria
    ADD CONSTRAINT pk_cuenta_bancaria PRIMARY KEY (id_cuentabancaria);
 L   ALTER TABLE ONLY public.cuenta_bancaria DROP CONSTRAINT pk_cuenta_bancaria;
       public            postgres    false    207            ?
           1259    41556    cuenta_bancaria_pk    INDEX     b   CREATE UNIQUE INDEX cuenta_bancaria_pk ON public.cuenta_bancaria USING btree (id_cuentabancaria);
 &   DROP INDEX public.cuenta_bancaria_pk;
       public            postgres    false    207            ?
           1259    41557    relationship_1_fk    INDEX     S   CREATE INDEX relationship_1_fk ON public.cuenta_bancaria USING btree (id_cliente);
 %   DROP INDEX public.relationship_1_fk;
       public            postgres    false    207            ?
           2606    41580 .   cuenta_bancaria fk_cuenta_b_relations_clientes    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cuenta_bancaria
    ADD CONSTRAINT fk_cuenta_b_relations_clientes FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) ON UPDATE RESTRICT ON DELETE RESTRICT;
 X   ALTER TABLE ONLY public.cuenta_bancaria DROP CONSTRAINT fk_cuenta_b_relations_clientes;
       public          postgres    false    207               S   x?3?4?t??/*?/V?8??u,u?9?,?u5??2?4?t??L?+I%??H????ՐӐ;?,??aZc???? ??$?     