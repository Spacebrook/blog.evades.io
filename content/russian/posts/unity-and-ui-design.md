+++
title = "Кратко о том, почему Unity это лучший выбор для создания пользовательских интерфейсов"
date = "2022-02-20T15:00:00-00:00"
author = "Stovoy"
cover = ""
tags = ["unity", "c#", "ui", "blogging-out-loud"]
keywords = ["unity", "ui", "native"]
description = "Using Unity for non-gameplay UI? Yes!"
showFullContent = false
readingTime = false
+++

Привет! У меня были некоторые размышления о разработке пользовательских интерфейсов - которые как либо были бы связанны с игровым процессом, и я подумал, что было бы интересно поделиться моими мыслями с вами.

К примеру, при переходе на движок на базе Unity, есть огромное количество различных страниц в пользовательском интерфейсе, которые мне нужно будет на него перенести, такие как:

- Управление Профилем
- Просмотр Профилей
- Управление Аккаунтом
- Редактор Карт
- И многое другое

Я также обдумывал идею создания собственных локальных серверов для Evades, как к примеру в Minecraft, где каждый может создать свой сервер. Для этого нам нужен будет интерфейс для управления сервером! Для его создания так же будут задействованы многие другие пользовательские интерфейсы

Итак, какие же есть варианты? Ну, изначально я сильно опасался использования Unity для создания всех этих интерфейсов, так как я был совершенно не знаком с Unity.

В качестве эксперимента, для решения этой проблемы я разработал простенький редактор данных, предназначенный для интеграции с игрой на Unity. Однако, я хотел бы сразу сделать вполне рабочий интерфейс, поэтому в качестве текста я подумал об подключении локального сервера к React. Unity написан на #С, а я хотел бы, что бы код сервера и клиента был согласован друг с другом, поэтому мне пришлось использовать ASP.NET’s Blazor, для их соединения. И хотя это выглядело так, как будто все работало нормально, существует так много различий в том, как это делается с использованием обычного #С, и с использованием “Unity #С”. На самом деле это совершенно другая экосистема. Это горькая правда.

В конце концов, после достаточного количества экспериментов, я понял, что использование  только Unity для создания пользовательского интерфейса - это лучшее доступное мне решение.

## Что насчет веб-сайта?
Для веб-сайтов и мобильных веб-сайтов по-прежнему необходимо использовать пользовательские интерфейсы, отличные от Unity, для поддержания определенных страниц. В таких случаях я, вероятно, выберу Go + React. Я не думаю что я собираюсь заниматься оптимизацией для этого, хотя возможно мне придется этим заняться в будущем. Тем не менее - это шаблон, наблюдаемый и используемый во многих и многих мобильных играх, где веб-сайт используется только для таких вещей, как: поддержка, дополнительная информация, примечания к патчу и так далее, а все важное происходит внутри клиента.

## Альтернативы
Давайте поговорим о некоторых других альтернативах и проблемах, которые у меня с ними возникли и из за которых я отказался от них в дальнейшем. Самая большая проблема с веб-подходом, будь то (Go, C#, какой либо другой язык) + React или Blazor, заключается в том, что соединение не особо хорошо синхронизируется. Electron - это способ соединить и синхронизировать их, но его тяжело использовать; По сути, это просто отдельный экземпляр Google Chrome (технически Chromium), завернутый в собственное окно. Я работал с Electron в прошлом, но это был достаточно плохой опыт. Мне не нравится как это работает.

Другая не менее важная проблема заключается в том, что использование JS (или C#, хотя в нашем случае это Blazor) для этих битов на самом деле несовместимо напрямую с Unity. Как я упоминал выше, Unity C# — это отдельная экосистема. Чтобы сделать Unity правильно, обычно нужно использовать модель Unity GameObject и Component. Таким образом все, что делается за пределами Unity, требует шаблонных уровней сериализации/десериализации, что довольно неудобно.

## Пользовательский интерфейс Unity — слишком запутанный?
Экосистема пользовательского интерфейса Unity поначалу кажется немного запутанной. Есть несколько аналогов, в том числе более новый UIElement, однако он все еще находится в предварительной версии. Поэтому я решился и использовал встроенную систему пользовательского интерфейса Unity с TextMeshPro и прочими сервисами, и на самом деле это не так уж и плохо! По крайней мере, для создания простых вещей. Я попробовал свои силы в создании редактора данных, и это не сложно, хоть и медленно. К счастью, есть такие активы, как эти новые виджеты пользовательского интерфейса, использование которых сохранит много свободного времени, которое я смогу потратить что бы перейти к более важным этапам разработки!

## Отдельные приложения?
Если бы я хотел, чтобы редактор карт можно было бы использовать или запускать независимо от игры, то это, скорее всего, будет работать через Unity в том числе. Его можно извлечь из остальной части проекта Unity, так как это будет отдельная сцена в проекте.

## Заключение
Я решил создать все игровые интерфейсы непосредственно используя Unity! Некоторые экраны, возможно, придется в конечном итоге заново пересобрать для веб-сайта, а другие должны будут работать как встроенные в браузер Unity, например редактор карт, однако я считаю, что так будет лучше. Таким образом, Evades придерживается не только C#, но и Unity C#, и только одного основного способа создания пользовательских интерфейсов.

Дополнительным преимуществом этого является то, что чем больше я работаю в Unity, тем лучше у меня получается. У меня уже есть довольно хороший прогресс!


## Есть ли скриншоты, которыми я могу поделиться?
Еще нет! Но оставайтесь на связи :)