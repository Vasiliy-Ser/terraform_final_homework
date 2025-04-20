# Домашнее задание к занятию 16.6 «Итоговый проект модуля «Облачная инфраструктура. Terraform»
» - Падеев Василий

------


### Задание 1

1. Развертывание инфраструктуры в Yandex Cloud.

- Создайте Virtual Private Cloud (VPC).  
- Создайте подсети.  
- Создайте виртуальные машины (VM):  
- Настройте группы безопасности (порты 22, 80, 443).  
- Привяжите группу безопасности к VM.  
- Опишите создание БД MySQL в Yandex Cloud.  
- Опишите создание Container Registry.  

---
Решение:
  
  1. Для создания VPC использую созданный модуль [VPC](https://github.com/Vasiliy-Ser/terraform_final_homework/tree/1c788223e5ff5e637e480492c3bf7361b028a572/file/modules/vpc)  
  2. Для создания  VM использую модуль [test-vm ](git::https://github.com/udjin10/yandex_compute_instance?ref=1.0.0)   
  ![answer1](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/png/1.png)     
  3. Настройте группы безопасности (порты 22, 80, 443). Добавил дополнительный порт 3306 для MySQL  
  ![answer2](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/png/3.png)  
  4. [Создание БД MySQL в Yandex Cloud. ](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/file/mysql.tf)  
  ![answer3](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/png/5.png)    


------

### Задание 2

1. Используя user-data (cloud-init), установите Docker и Docker Compose (см. Задания 5 модуля «Виртуализация и контейнеризация»).

---
Решение:

  [cloud-init](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/file/cloud-init.yml) 

 ![answer4](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/png/2.png)    

------
### Задание 3  

1. Опишите Docker файл (см. Задания 5 «Виртуализация и контейнеризация») c web-приложением и сохраните контейнер в Container Registry.

---
Решение:

![answer5](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/png/6.png)  
Создание образа Docker  
![answer6](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/png/7.png)
Загрузка контейнера в Container Registry.  
![answer7](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/png/8.png) 
  

------
### Задание 4

1. Завяжите работу приложения в контейнере на БД в Yandex Cloud.

Решение:

Отправляем запросы  
 ![answer8](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/png/9.png)   
Проверяем базу данных  
 ![answer9](https://github.com/Vasiliy-Ser/terraform_final_homework/blob/1c788223e5ff5e637e480492c3bf7361b028a572/png/10.png)   
  

## Дополнительные задания (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.** Их выполнение поможет глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 
------

### Задание 5*

1. Положите пароли от БД в LockBox и настройте интеграцию с Terraform так, чтобы пароль для БД брался из LockBox.  

Решение:
  
 