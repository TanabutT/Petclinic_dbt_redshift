# Petclinic dbt-redshift

## Getting Started in window 10
ENV is name of virtual environment can name up to user 
example CUTECAT then 
source CUTECAT/bin/active
```sh
python -m venv ENV
.\ENV\Scripts\activate
pip install -r requirements.txt
```

## dbt connect with redshift
### install dbt core and dbt redshift

```sh
pip install dbt-core dbt-redshift
```
It might take some time...  

### start dbt project connect with redshift cluster
```sh
dbt init
```
- ตั้งชื่อ project = dbt_connect_redshift
- choose number to pick redshift
- hostname ใช้ endpoint redshift cluster ตัด ตัวหลัง .com ออก (ที่เป็น port กับชื่อ database name)
  - for example : redshift-cluster-petclinic.cnrhltyzddie.us-east-1.redshift.amazonaws.com
- port default 5439 ถ้าเปลี่ยนก็พิมพ์ตามที่ตั้ง
ี- user ของ cluster 
- password ใส่ของ cluster
- dbname ดูใน cluster detail เลย ที่นี้ ชื่อ petclinic
- schema ดูหน้า query ชื่อ public  
- threads default 1

สำเร็จจะขึ้นแบบนี้  

```sh
Your new dbt project "dbt_connect_redshift" was created!
Happy modeling!
```
และจะสร้าง ตัว folder ชื่อ dbt project ที่เราตั้งไปตะกี้
ลองเข้าไปที่ dbt profile นั้น (ซึ่งจะสร้างครอบอยู่นอก  workspace directory ของตัว project Petclinic_DE เลย) เพราะ ~/ เป็นการออกไป home directory แล้วเข้า folder .dbt ที่เก็บ profile.yml อยู่

```sh
code ~/.dbt/profiles.yml
```
ลงมาล่างสุดดู รายละเอียดการ connection ต่อกับ redshift  


* ต่อมาต้องเข้าไปที่ folder dbt project ที่ทำไว้แล้ว 
```sh
cd dbt_connect_redshift
```

แล้วลอง run dbt debug ทดสอบว่า ระบบต่างๆ dbt ok (file dbt_project.yml ok มั้ย และ file profiles.yml ok หรือไม่)
```sh
dbt debug 
```
ถ้าผ่านจะขึ้นแบบนี้
![dbt debug passed](./resource/dbt_debug_in_folder_pass.png)

### build new model in dbt
go in by click into dbt_connect_redshift/model/ folder 
* create new sql file for new query or make staging table from existing table in cluster
  - try stg_pets.sql
    ```sh 
    select * from pets
    ```  

  - my_fisr_dbt_model.sql edit follow:  

  ```sh 
    {{ config(materialized='view') }}

      with source_data as (

          select ownerid as petownerid
          from owners

      )

    select *
    from source_data

    ```  

  - my_fisr_dbt_model.sql edit follow:  
  ```sh 
    select *
    from {{ ref('my_first_dbt_model') }}
    where petownerid = 2419
    ```  

* when new sql files are made run (dbt will build the new table table)
```sh
dbt run 
```
* go check (view) table or table depend on config dbt in the cluster query page in redshift cluster
![myfirstdbtmodel-and-stg_pets-new-model-create](./resource/dbt_run_stg_pest_created_N_query.png)
from pic here see stg_pets myfirstdbtmodel mysecondbtmodel are there  
query form stg_pets and run success too.  
ดูการ dbt run แก้ไขไม่ให้ error ด้วย


### relationship from dbt
เมื่อลองทำ datawarehouse และ staging table ไว้ใช้งานแล้ว สามารถสร้าง docs ไว้ได้ 
สร้าง doc ใน dbt จากคำสั่ง 

```sh
dbt docs generate
```
และ run  

```sh
dbt docs serve 
```
!!! ลองรัน dbt docs serve --port 8089 แล้วเปลี่ยน ไม่ได้ควรใช้ default ถึงจะขึ้น

ไปกดที่ขวาล่าง สามารถดู lineage graph ของ datawarehouse ของเราได้

![dbt_docs_serve_page>localhost:8080](./resource/dbt_docs_serve_page.png)
![page>lineage_graph](./resource/lineage_graph_example_nomodel.png)









To close all service
- S3 empty bucket
- Delete S3 bucket
- Delete Redshift cluster** with out keeping snapshot** - [ ] snap shot 





## watch cost explorer

![cost](resource/redshift_cost1.jpg)