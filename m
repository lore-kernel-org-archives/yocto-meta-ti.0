Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8652FD876D
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:39:59 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76123.1773754790292324023
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iPuMoEuf;
 spf=pass (domain: konsulko.com, ip: 209.85.208.182, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38ad4677830so6046161fa.2
        for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 06:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1773754788; x=1774359588; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5lR0wuYMYfTOPGQnDFwB29ifVwoI0dFwFc7yaqsWs0o=;
        b=iPuMoEufiz6sWQSQ2gk2kR7ysbAGHnp/0UoqCXFK1mWGD/ArTGnu1NZB+DGdDpF3UH
         dA5m68RZrNhnTqjOpW9MosdWG0Pxj1UFr/rLZq3OI67fSM/ciSCUQXL09aRec8sg2ilM
         3UNy3dEK6zsVHSvvPInMQHVJr4TatZ61f79jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754788; x=1774359588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lR0wuYMYfTOPGQnDFwB29ifVwoI0dFwFc7yaqsWs0o=;
        b=rYP2lGm0jEJ3ZButBY5OXAd8Ip/jCiOqeUOoSMYgxIZbTpBtIDOggqwxnGKL2oaMhx
         MiiH3FxBAf+apdi7wuqpaPeDTVDkt/MCDL0JaK1ZNq7HI/cFsycDF90Dl2RdB4/yjmFf
         7mbks0/iofHtJPpkq90mjFnXFW3Ea9RwoT7S8vYU5MFEWRNODVBj/xevzHA2hVlK2nXv
         jUIqUdQHYfKSA0ORVyeB5mI1R0/CgRJOuEeTJuYye3U/MzTev0KTWJnAIxDCvUUbXcTo
         MmVFcg2PNmmuzki2R3fKqNX6yuV3mHCUhENuVUwpJjH5r/QFA4TCm4oeWJW9P39A62sN
         LJFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ2AQMhGvj1+0rjSBQGbFv8sKBh6a+vglNPtl8Pd4PPUr0T4ulmloelqMvC8ihxP6myaVeSGIT@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyiLOtE1tYdSpTMSoUXlTUB9rSxZ87jYRmSfWMJzPTJWPAv3g48
	laz/+kwD9+zzwjGymcgmoT+kyUsHetO9jFwFj6Me+oiPSGgBrSYgbXg1TtFZ3YHE+DY=
X-Gm-Gg: ATEYQzzY44evXYuEJacS0YdHq1TZoEckQortaR4/JPiFfENbUPNY0ZCqU9EBqiQFSR8
	WUPlO+mWEc2Ui3Z0e6aUjwOWxipYek3h6/FZyWmHLhVqPR7pLT6pc089lWar6GNpDugTkbULn1L
	cKsWoG4Dwi6L6b59o9kn/4Bkqw/88r4zaUZ8fgUYTg/3fV8MpY3wEJiePFiECH7t9UzckW9tHBF
	1enkms2oBEUgTJWg7iniAbRPOm3Toyow5gqYb81x/8VFC90nX6R0E6Km4SQ/j0JYnNeIKqXNEtK
	y57R0IaY+O6JHOE26iLZOFHms89w0t9fQBjhuQY9AANchP1zMvu/DgjXz4gL5Tf5iWdwBJsfnis
	w/JehWcc6Cwkd4Xkc068UpgOiRVg9k/d9QH66JEJAtZ3HxKkQtK9CH3/naWDnCDLpW0fl8AnGcg
	z6OaKNCI093R2ZGo3NP4impGwfR0Hy3A==
X-Received: by 2002:a05:651c:12c6:b0:37f:8332:6ae0 with SMTP id 38308e7fff4ca-38a897d58aemr57215881fa.33.1773754788133;
        Tue, 17 Mar 2026 06:39:48 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed6esm36988941fa.23.2026.03.17.06.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 06:39:47 -0700 (PDT)
Message-ID: <8fd99aae-b54f-4505-9572-a021240172e1@konsulko.com>
Date: Tue, 17 Mar 2026 15:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-beagle][PATCHv2] u-boot-bb.org: Add a tick-timer
 for PocketBeagle
To: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
References: <20260317083729.1640948-1-leon.anavi@konsulko.com>
 <2eceffc8-71fe-4b1b-b84a-1c27a0c1871d@ti.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <2eceffc8-71fe-4b1b-b84a-1c27a0c1871d@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:39:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19737

Hi Ryan,

On 3/17/26 15:13, Ryan Eatmon wrote:
>
> You need to add the patch to the correct recipe...
>
> u-boot-bb.org-2025.10.bb
> ------------------------
>
> SRC_URI += "file://0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch"
>
> Just adding the patch to the directory is not enough.

Thank you for the quick feedback. Sorry that initially I forgot to git 
add the u-boot-bb.org_2025.10.bb. I've just sent v3 of the patch. Btw 
this change with the tick-timer affects only PocketBeagle so it is with 
SRC_URI:append:beaglebone.

Best regards, Leon

>
>
>
> On 3/17/2026 3:37 AM, Leon Anavi via lists.yoctoproject.org wrote:
>> Add a chosen tick-timer in version 2025.10 to boot on PocketBeagle.
>>
>> Fixes:
>>
>> CPU  : AM335X-GP rev 2.1
>> Model: TI AM335x PocketBeagle
>> DRAM:  512 MiB
>> Core:  155 devices, 16 uclasses, devicetree: separate
>> Could not initialize timer (err -19)
>>
>> The patch is based on the following related discussions:
>>
>> - arm: dts: am335x-*-u-boot: Add chosen tick-timer
>> https://lists.denx.de/pipermail/u-boot/2026-January/608684.html
>>
>> - pocketbeagle stuck in boot loop with timer error
>> https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=269124
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   ...s-am335x-pocketbeagle-Add-tick-timer.patch | 29 +++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>   create mode 100644 
>> meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch
>>
>> diff --git 
>> a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch 
>> b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch 
>>
>> new file mode 100644
>> index 00000000..424a4bb3
>> --- /dev/null
>> +++ 
>> b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.10+git/0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch
>> @@ -0,0 +1,29 @@
>> +From 55ee5fecd68d0858ba6743137162252adedf2f72 Mon Sep 17 00:00:00 2001
>> +From: Leon Anavi <leon.anavi@konsulko.com>
>> +Date: Mon, 16 Mar 2026 18:34:58 +0000
>> +Subject: [PATCH] arm: dts: am335x-pocketbeagle: Add tick-timer
>> +
>> +Add a binding for the tick-timer for PocketBeagle.
>> +
>> +Upstream-Status: Pending 
>> [https://lists.denx.de/pipermail/u-boot/2026-January/608684.html]
>> +
>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> +---
>> + arch/arm/dts/am335x-pocketbeagle.dts | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/arch/arm/dts/am335x-pocketbeagle.dts 
>> b/arch/arm/dts/am335x-pocketbeagle.dts
>> +index b379e3a5570..02e3aac5606 100644
>> +--- a/arch/arm/dts/am335x-pocketbeagle.dts
>> ++++ b/arch/arm/dts/am335x-pocketbeagle.dts
>> +@@ -15,6 +15,7 @@
>> +
>> +     chosen {
>> +         stdout-path = &uart0;
>> ++        tick-timer = &timer2;
>> +     };
>> +
>> +     leds {
>> +--
>> +2.53.0
>> +
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19732): 
>> https://lists.yoctoproject.org/g/meta-ti/message/19732
>> Mute This Topic: https://lists.yoctoproject.org/mt/118361098/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub 
>> [reatmon@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

