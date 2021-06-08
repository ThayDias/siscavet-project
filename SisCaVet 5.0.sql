create database SisCaVet
go

use SisCaVet
go




create table pessoas                                              --<-----mod
(
  id              int           not null primary key identity,    
  nome            varchar(50)   not null,
  cpf             varchar(15)   not null unique,
  rg              varchar(13)   not null,
  dataNascimento  date          not null,
  telefone        varchar(20)   not null,
  rua             varchar(100)  not null,
  bairro          varchar(100)  not null,
  cep             varchar(10)   not null,
  cidade          varchar(100)  not null,
  estado          varchar(2)    not null,   
  status          int           check(status in (0,1))
)
go



create table clientes								--<-----mod
(
	pessoaId	                  int	    not null primary key references pessoas,
    quantidadeConsultasAberto	  int       null     
)
go


create table veterinarios
(	
	pessoaId	        int			  not null primary key references pessoas,
	salario				decimal(10,2) not null,
	especialidade       varchar(100)  not null,
	crmv                int           not null unique	
)
go


create table animais
(	
    id              int            not null primary key identity,
	nome            varchar(100)   not null,
	idade           int            not null,
	peso            decimal(10,2)  not null,  
	raca            varchar(50)    not null,
	descricao       varchar(500)   null,
	clienteId	    int		       not null references clientes,
	especie         varchar(100)   not null,
	status          int           check(status in (0,1))
)
go

create table consultas
(	
    id              int            not null primary key identity,
	data            date           not null,	
	descricao       varchar(100)   null,
	clienteId	    int		       not null references clientes,
	veterinarioId	int	           not null references veterinarios,
	animalId	    int	           not null references animais,	
	valorTotal		decimal(10,2)  not null,
	status          int           check(status in (0,1))         
)
go

create table procedimentos
(
    id        int			not null primary key identity,
	descricao varchar(100)	not null,
	valor     decimal(10,2)	not null,
	status          int           check(status in (0,1)) 
)
go
select * from procedimentos

create table consultas_procedimentos
(	
	procedimentoId	    int		        not null references procedimentos,
	consultaId	        int		        not null references consultas,  
	resultado           varchar(50)	null,
	primary key(procedimentoId, consultaId)
)
go

create table usuarios
(	
	veterinarioId	    int							primary key references veterinarios,
	login				varchar(50)		not null,
	senha				varchar(10)		not null	
)
go

insert into pessoas values ('Alvaro de Campos', '3030', '0303', '1980-02-17', '3434','Rua Limões', 'Bairro Violeta', '15043333', 'Rio Preto', 'SP', 1)	--<-----mod
insert into pessoas values ('Alberto Carreiro', '4040', '0404', '1980-02-18' , '35335','Rua Laranja', 'Bairro Girassol', '15044444', 'Rio Preto', 'SP', 1)
insert into pessoas values ('Ricardo Reis', '5050', '0505', '1980-02-19', '3636','Rua ', 'Bairro Violeta', '15043333', 'Rio Preto', 'SP', 1)
Select * from pessoas
go

insert into pessoas values ('Clark Kent', '1111', '2222', '1980-02-17', '3434', 'rua almeida','bairro cabare','15010600','mirassol', 'SP', 1)
insert into pessoas values ('Superman', '2222', '3333', '1980-02-18' , '35335', 'rua aparecida', 'bairro messias', '15048123','Rio Preto', 'SP', 1)
insert into pessoas values ('Homem de Aço', '3333', '1111', '1980-02-19', '3636','rua espinole de franca', 'bairro Sam Francisco','15063666', 'Rio Preto', 'SP', 1)
Select * from pessoas
go

insert into procedimentos values ('Hemograma', 30,0)						
insert into procedimentos values ('Adenograma', 30,0)
insert into procedimentos values ('Retirada de Pontos', 10,0)
Select * from procedimentos
go


delete from clientes 
insert into clientes values (1,0)								--<-----mod
insert into clientes values (2,0)
insert into clientes values (3,1)
SELECT * FROM clientes
go

insert into animais values ('tobias', 10, 10, 'SRD', 'preto', 1, 'pug',1)
insert into animais values ('reginaldo', 10, 10, 'SRD', 'branco', 1, 'buldogue',1)
insert into animais values ('zebra', 10, 10, 'SRD', 'preto', 1, 'beagle',1)
select * from animais
go

insert into veterinarios values (6,7000, 'castração', 10010)
insert into veterinarios values (7,8000,'castração', 10011)
insert into veterinarios values (8,10000,'medicação', 10100)
SELECT * FROM veterinarios
go


insert into consultas values ('2019-10-03', 'rotina', 1, 6, 1, 20.20, 1)
insert into consultas values ('31/05/2019', 'rotina', 2, 6, 2, 10.10, 1)
insert into consultas values ('31/05/2019', 'rotina', 3, 6, 3, 10.30, 1)
select * from consultas
go

insert into consultas_procedimentos values(1, 1, 'pronto')
insert into consultas_procedimentos values(2, 2, 'em espera')
insert into consultas_procedimentos values(3, 3, 'em espera')
select * from consultas_procedimentos
go

insert into usuarios values (4, 'teste@teste.com', '123')
insert into usuarios values (6, 'teste2@teste.com', '456')
insert into usuarios values (8, 'teste3@teste.com', '789')
/*
insert into medicamentos values ('ciprofaxilico','13/03/1999', '12/03/2005',1)
insert into medicamentos values ('covélico','13/03/1999', '12/03/2005', 2)
insert into medicamentos values ('doxilina','13/03/1999', '12/03/2005',3)
select * from medicamentos

insert into pagamentos values (1, 4, 4, 200)
insert into pagamentos values (1, 5, 4, 300)
insert into pagamentos values (1, 6, 4, 400)
select * from pagamentos

insert into medicamentos_procedimentos values(1, 1, 10)
insert into medicamentos_procedimentos values(2, 2, 10)
insert into medicamentos_procedimentos values(3, 3, 10)
select * from medicamentos_procedimentos


insert into funcionarios values (4, 2500)
insert into funcionarios values (5, 2500)
insert into funcionarios values (6, 2500)
SELECT * FROM funcionarios

insert into categorias values ('Antibiótico');
insert into categorias values ('Antiviral');
insert into categorias values ('Antifúngico');
Select * from categorias

*/
---------------------------------------------------------------------------------------------------------------
----------------- procedures ----------------------------------------------
-------------------------------------------------------------------------------

    


-- ----- cadastro procedimentos ------------------------------------------------------
create procedure cadProc
(
    @descricao varchar(100),
	@valor money ,
	@status int  
)
as
begin
     insert into procedimentos values (@descricao, @valor, @status)
end
go

exec cadProc 'vacinação', 30, 0
go

create procedure altProc
(
    @id int,
    @descricao varchar(100), 
    @valor money,
	@status int
)
as
begin
     update procedimentos set 
            descricao = @descricao,  
            valor = @valor,
			status = @status
      where id = @id
end
go
exec altProc 1,'tosa', 30, 1
go

----- cadastro cliente ----------------------------------------------------------------//////////mod

create procedure cadCli
(
	@nome						varchar(100),
	@cpf						varchar(12),
	@rg							varchar(10),
	@dataNascimento				date,
	@telefone					varchar(20),
	@rua						varchar(100),
	@bairro						varchar(100),
	@cep						varchar(10),
	@cidade						varchar(100),
	@estado						varchar(2),
	@quantidadeConsultasAberto  int,
	@status				        int
)
as
begin
	begin try
		begin tran
			insert into pessoas values (@nome, @cpf, @rg, @dataNascimento, @telefone,@rua, @bairro, @cep, @cidade, @estado, @status)
			insert into clientes values (@@IDENTITY, @quantidadeConsultasAberto)
		commit
		return 0
	end try
	begin catch
		rollback
		return 1
	end catch
end
go
select * from pessoas
exec cadCli 'carlos', '99999', '00001','1998-03-25','22333', 'Rua Limões', 'Bairro Violeta', '15043333', 'Rio Preto', 'SP', 1, 1
go

create procedure altCli
(
    @id							int,
	@nome						varchar(100),
	@cpf						varchar(12),
	@rg							varchar(10),
	@dataNascimento				date,
	@telefone					varchar(20),
	@rua						varchar(100),
	@bairro						varchar(100),
	@cep						varchar(10),
	@cidade						varchar(100),
	@estado						varchar(2),
	@quantidadeConsultasAberto  int,
	@status				        int   
)
as
begin
	begin try
		begin tran
			 update pessoas set 
					nome = @nome,
					cpf = @cpf,
					rg = @rg, 
					dataNascimento = @dataNascimento,
					telefone = @telefone,
					rua = @rua,
					bairro = @bairro,
					cep = @cep,
					cidade = @cidade,
					estado = @estado,
					status = @status
			  where id = @id
			  update clientes set 
					quantidadeConsultasAberto = @quantidadeConsultasAberto
			  where pessoaId = @id
		commit
		return 0
	end try
	begin catch
		rollback
		return 1
	end catch
end
go
exec altCli 10, 'Carla', '99999', '00001','1998-03-25','22333', 'Rua Limões', 'Bairro Violeta', '15043333', 'Rio Preto', 'SP', 1, 1
go

-- ------ cadastrar veterinarios ----------------------------------------------------////////////////////mod

create procedure cadVet
(
    @nome						varchar(100),
	@cpf						varchar(12),
	@rg							varchar(10),
	@dataNascimento				date,
	@telefone					varchar(20),							--<-----------------------mod
	@rua						varchar(100),
	@bairro						varchar(100),
	@cep						varchar(10),
	@cidade						varchar(100),
	@estado						varchar(2),
	@status						int,
	@especialidade				varchar(100),
	@salario					money,  
	@crmv						int,
	@login						varchar(50),
	@senha						varchar(10)
)
as
begin
	begin try
		begin tran
			insert into pessoas values (@nome, @cpf, @rg, @dataNascimento, @telefone,@rua,@bairro,@cep,@cidade,@estado, @status) --<-----mod
			insert into veterinarios values (@@IDENTITY, @especialidade, @salario,@crmv)
			insert into usuarios values (@@IDENTITY,@login, @senha)
		commit
		return 0
	end try
	begin catch
		rollback
		return 1
	end catch
end
go

exec cadVet 'Camila', '99999', '00001','1998-03-25','22333','rua joaquim','bairro Sam Pedro','15048666','Rio Preto','SP', 1, 'este', 20000, 00112233, 'teste@teste.com', '112233'    --<-----mod
go

create procedure altVet
(
    @id							int,
	@nome						varchar(100),
	@cpf						varchar(12),
	@rg							varchar(10),
	@dataNascimento				date,
	@telefone					varchar(20),							--<-----------------------mod
	@rua						varchar(100),
	@bairro						varchar(100),
	@cep						varchar(10),
	@cidade						varchar(100),
	@estado						varchar(2),
	@status						int,
	@especialidade				varchar(100),
	@salario					money,  
	@crmv						int	                                --<-----------------------------------------------adicionei o crmv para alterar tbm
)
as
begin
	begin try 
		begin tran
			 update pessoas set 
					nome = @nome,
					cpf = @cpf,
					rg = @rg, 
					dataNascimento = @dataNascimento,
					telefone = @telefone, 
					rua = @rua,
					bairro = @bairro,
					cep = @cep,
					cidade = @cidade,
					estado = @estado,
					status = @status
			  where id = @id
			  update veterinarios set 
					especialidade = @especialidade, 	--<------------------------------ adicionei o campo especialidade para altera tbm, alem do crmv embaixo		
					salario       = @salario,
					crmv          = @crmv					
			  where pessoaId = @id
		commit
		return 0
	end try
	begin catch
		rollback
		return 1
	end catch
end
go

exec altVet 6, 'Camila', '99909', '00001','1998-03-25','22333','rua joaquim','bairro Sam Pedro','15048999','Rio Preto','SP', 1, 'este', 20000, 00112233 
go

-------- cadastro animais -----------------------------------------------------------------
create procedure cadAni
(
    @nome		varchar(100),
	@idade		int,
	@peso		decimal(10,2),
	@raca		varchar(50),
	@descricao	varchar(100),
	@clienteId	int,
	@especie	varchar(100),
	@status     int
)
as
begin
	begin try
     insert into animais values (@nome, @idade, @peso, @raca, @descricao, @clienteId, @especie, @status)
	 return 0
	end try
	begin catch
		return 1
	end catch
end
go

exec cadAni 'nini', 10, 10, 'SRD', 'branco', 1, 'gato siames',0 --<------------------trocado
go

create procedure altAni
(
	@id			int,
    @nome		varchar(100),
	@idade		int,
	@peso		decimal(10,2),
	@raca		varchar(50),
	@descricao	varchar(100) = null,
	@clienteId	int,
	@especie	varchar(100),
	@status     int

)
as
begin
	begin try
		 update animais set 
			 nome = @nome,
			 idade = @idade,
			 peso = @peso,
			 raca = @raca,
			 descricao = @descricao,
			 clienteId = @clienteId,
			 especie = @especie,
			 status = @status
		  where id = @id  
	return 0
	end try
	begin catch
		return 1 
	end catch   
end
go

exec altAni 4,'bibi', 10, 10.10, 'SRD', 'branco', 1, 'gato siames', 0
go

select * from animais
----- cadastro consultas ----------------------------------------------------------------------------------

create procedure cadConsul
(
    @data			date,	
	@descricao		varchar(100),
	@clienteId		int,
	@veterinarioId int,
	@animalId		int,
	@valorTotal     decimal(10,2),
	@status			int
)
as
begin
	begin try
		insert into consultas values (@data, @descricao, @clienteId, @veterinarioId, @animalId,@valorTotal, @status)
	return 0
	end try
	begin catch
		return 1
	end catch
end
go 

exec cadConsul '2019-05-20', 'vacinação cinomose', 1, 1, 6, 10.2, 1
go

create procedure altConsul
(
	@id int,
    @data			date,	
	@descricao		varchar(100),
	@clienteId		int,
	@veterinarioId int,
	@animalId		int,
	@valorTotal     decimal(10,2),
	@status			int
)
as
begin
     update consultas set 
        data = @data,	
		descricao = @descricao,
		clienteId = @clienteId,
		veterinarioId = @veterinarioId,
		animalId = @animalId,
		valorTotal = @valorTotal,
		status = @status
      where id = @id      
end
go
exec altConsul 1,'31/05/2019', 'vacinação cinomose', 1, 6, 1,10.2,  1
go

--------- consultas procedimentos ----------------------------------------------

create procedure cadConsulProc
(

	@procedimentoId    int,
	@consultaId		int,    
	@resultado			Varchar(100)

)
as
begin	
	begin try
		insert into consultas_procedimentos values (@procedimentoId, @consultaId, @resultado)
	return 0
	end try
	begin catch
		return 1
	end catch
end
go 

exec cadConsulProc 1, 5, 'teste'      --<----------------------------------------------------------------------------Deixei sem nd, pode ser nulo
go

create procedure altConsulProc
(
	@procedimentoId		int,
	@consultaId			int,    
	@resultado			Varchar(100)
)
as
begin
	begin try
		update consultas_procedimentos set 
			resultado = @resultado

		where 
		procedimentoId = @procedimentoId and consultaId = @consultaId
	return 0
	end try   
	begin catch
		return 1
	end catch 
end
go

exec altConsulProc 1, 5, 'pronto'
go

create procedure AltUsu
(
	@veterinarioId int, 
	@login		   varchar(50),
	@senha          varchar(10)
)
as 
begin
	begin try 
		update usuarios set 
			login = @login,
			senha = @senha 
		where veterinarioId = @veterinarioId
		return 0
		end try
		begin catch 
			return 1 
		end catch
end
go


/*
----- funcionarios -------------------------------------------------------------------------------
create procedure CadFunc
(
    @nome varchar(100),
	@cpf varchar(12),
	@rg varchar(10),
	@data_nascimento date,
	@telefone varchar(20),
	@status int,
	@salario money  
)
as
begin
     insert into pessoas values (@nome, @cpf, @rg, @data_nascimento, @telefone, @status)
	 insert into funcionarios values (@@IDENTITY, @salario)
end

exec CadFunc 'Camila', '99999', '00001','1998-03-25','22333', 1, 20000

create procedure altFunc
(
    @id int,
	 @nome varchar(100),
	@cpf varchar(12),
	@rg varchar(10),
	@data_nascimento date,
	@telefone varchar(20),
	@status int,
	@salario money  
)
as
begin
     update pessoas set 
            nome = @nome,
            cpf = @cpf,
            rg = @rg, 
            data_nascimento = @data_nascimento,
            telefone = @telefone, 
            status = @status	
      where id = @id
      update funcionarios set 
			salario = @salario
		where pessoa_id = @id
end

exec altFunc 4,'Camilo', '99999', '00001','1998-03-25','22333', 1, 2000

----- categorias -----------------------------------------------------------------------------

create procedure cadCat
(
    @descricao varchar(100)    
)
as
begin
     insert into categorias values (@descricao)
end
exec cadCat 'homeopatico' 

create procedure altCategorias
(
    @id int,
    @descricao varchar(100)  
)
as
begin
     update categorias set 
            descricao = @descricao            
      where id = @id
end

exec altCategorias 1, 'remedio para peixe'

----- cadastro medicamentos -----------------------------------------------------------------------------

create procedure CadMed
(
    @descricao varchar(100),
	@data_vencimento date,
	@data_fabricacao date,
	@categoria_id int 
)
as
begin
     insert into medicamentos values (@descricao, @data_vencimento, @data_fabricacao, @categoria_id)
	
end

exec CadMed 'amoxicilina','13/03/1999', '12/03/2005',1

create procedure altMed
(
	@id int,
    @descricao varchar(100),
	@data_vencimento date,
	@data_fabricacao date,
	@categoria_id int 
)
as
begin
     update medicamentos set 
         descricao =  @descricao,
		 data_vencimento = @data_vencimento,
		 data_fabricacao = @data_fabricacao,
		 categoria_medicamento_id = @categoria_id 
      where id = @id      
end
exec altMed 1,'amoxicilina','13/03/1999', '12/03/2005',1

-- ------- cadastro pagamentos -------------------------------------------------------------------------

create procedure cadPag
(

	@cliente_id	    int,
	@consulta_id	int,    
	@funcionario_id	 int,
	@total		money
)
as
begin
     insert into pagamentos values (@cliente_id, @consulta_id, @funcionario_id, @total)
end
exec cadPAg 1, 1, 10, 30

create procedure altPag
(
	@id int,
    @cliente_id	    int,
	@consulta_id	int,    
	@funcionario_id	 int,
	@total		money
)
as
begin
     update pagamentos set 
			cliente_id = @cliente_id,
			consulta_id = @consulta_id,  
			funcionario_id = @funcionario_id,
			total = @total
      where id = @id      
end
exec altPag 1, 1, 1, 10, 30

----------------- medicamentos procedimentos -----------------------------

create procedure cadMedProc
(

	@procedimento_id    int,
	@medicamento_id	int,    
	@quantidade	 int

)
as
begin
     insert into medicamentos_procedimentos values (@procedimento_id, @medicamento_id, @quantidade)
end
exec cadMedProc 1, 1, 10

create procedure altMedProc
(
	@procedimento_id    int,
	@medicamento_id	int,    
	@quantidade	 int
)
as
begin
     update medicamentos_procedimentos set 
			quantidade = @quantidade

      where 
	  procedimento_id = @procedimento_id and medicamento_id = @medicamento_id
	         
end

exec altMedProc 1, 1, 12
*/
-----------------------------------------------------------------------------------------------
------------------------------- VIEWS --------------------------------------------------------
----------------------------------------------------------------------------------------------


------------- cliente join ---------------------------------------------------------------------------------------

create view v_clientes
as
	select p.id, p.nome, p.cpf, p.rg, p.dataNascimento, p.telefone, p.rua, p.bairro, p.cep, p.cidade, p.estado, p.status, c.quantidadeConsultasAberto    --<-------mod
	from clientes c, pessoas p
	where p.id = c.pessoaId and p.status = 0
go
select * from v_clientes
go

------------- veterinarios join ------------------------------------------------------------------------------------//////////////?

create view v_veterinarios
as
	select p.id, p.nome, p.cpf, p.rg, p.dataNascimento, p.telefone, p.rua, p.bairro, p.cep, p.cidade, p.estado, v.especialidade, v.salario, 
	v.crmv, u.login, p.status
	from veterinarios v, pessoas p, usuarios u
	where p.id = v.pessoaId and p.status = 0
go
select * from v_veterinarios
go

update animais set status = 0

------------- animais join ------------------------------------------------------------------------------------

create view v_animais
as
	select a.id, p.nome Cliente, a.nome Animal, a.idade, a.peso, a.raca, a.descricao, a.especie, a.status
	from clientes c, pessoas p, animais a
	where p.id = c.pessoaId and p.id = a.clienteId and a.status = 0
go
select * from v_animais
go
------------- consultas join ------------------------------------------------------------------------------------ ///////? 

create view v_consultas
as
	select con.id, c.nome Cliente, vt.nome Veterinario, a.nome Animal, a.raca, con.descricao,
	 con.valorTotal, con.data, con.status
	
	from v_clientes c, animais a, consultas con, v_veterinarios vt
	
	where  c.id = con.clienteId and vt.id = con.veterinarioId 
	and a.id = con.animalId 
	--and a.id = con.animalId and p.id = con.procedimentoId  --<-------------------------------é o procedimento id de consulta? da pra tirar sem bugar
go
select * from v_consultas
go

------------- procedimentos ------------------------------------------------------------------------------------
create view v_procedimentos
as
	select id, descricao, valor
	from procedimentos where status = 0
go
select * from v_procedimentos
go


------------- consultas procedimentos join ------------------------------------------------------------------------------------///////?

create view v_consultas_procedimentos
as
	select c.id, cli.nome Cliente, vet.nome Veterinario, ani.nome Animal, c.descricao Resultado, p.descricao Procedimento, c.valorTotal --<-----mudei
	from consultas c, consultas_procedimentos cp, procedimentos p, v_clientes cli, v_veterinarios vet, animais ani

	where  cp.consultaId = c.id and cp.procedimentoId = p.id 
	and c.clienteId = cli.id and c.veterinarioId = vet.id and c.animalId = ani.id
	and cli.id = ani.ClienteId
go

select * from v_consultas_procedimentos
go

select * from consultas_procedimentos

create view v_usuarios 
as
	select p.id, p.nome, p.dataNascimento,p.cpf, v.especialidade, u.login, u.senha
	from veterinarios v, pessoas p, usuarios u
	where v.pessoaId = p.id and u.veterinarioId = v.pessoaId
go
/*

------------- especialidades ------------------------------------------------------------------------------------

create view v_especialidades
as
	select id, descricao
	from Especialidades
go

select * from v_especialidades
------------- categorias ------------------------------------------------------------------------------------
create view v_categorias
as
	select id, descricao
	from categorias
go

select * from v_categorias
------------- especie ------------------------------------------------------------------------------------

create view v_especie
as
	select id, descricao
	from especies
go
select * from v_especie
------------- funcionarios join ------------------------------------------------------------------------------------

create view v_funcionarios
as
	select p.id, p.nome, p.cpf, p.rg, p.data_nascimento, p.telefone, f.salario
	from funcionarios f, pessoas p
	where p.id = f.pessoa_id
go
select * from v_funcionarios
------------- medicamentos join ------------------------------------------------------------------------------------

create view v_medicamentos
as
	select m.id, m.descricao, m.data_vencimento, m.data_fabricacao, m.categoria_medicamento_id, cm.descricao descricaoCategoria
	from medicamentos m, categorias cm
	where m.categoria_medicamento_id = cm.id
go
select * from v_medicamentos
------------- pagamentos join ------------------------------------------------------------------------------------
create view v_pagamentos
as
	select pag.id, p.nome, p.cpf, p.rg, pag.total, con.descricao, f.salario
	from clientes c, pessoas p, pagamentos pag, consultas con, funcionarios f
	where p.id = c.pessoa_id and pag.cliente_id = p.id 
	and pag.consulta_id = con.id and p.id = pag.funcionario_id
go

select * from v_pagamentos
------------- medicamentos procedimentos join ------------------------------------------------------------------------------------
create view v_medicamentos_procedimentos
as
	select m.descricao, m.data_vencimento, m.data_fabricacao, 
	cm.descricao CategoriaMedicamento, p.descricao Procedimento, p.valor,
	mp.quantidade 
	from medicamentos m, categorias cm, procedimentos p, 
	medicamentos_procedimentos mp
	where m.categoria_medicamento_id = cm.id and 
	p.id = mp.procedimento_id and m.id = mp.medicamento_id
go
select * from v_medicamentos_procedimentos
