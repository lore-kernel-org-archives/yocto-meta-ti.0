Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.2987.1636406121094250722
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 13:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=mZQcAyqd;
 spf=pass (domain: baylibre.com, ip: 209.85.221.52, mailfrom: aouledameur@baylibre.com)
Received: by mail-wr1-f52.google.com with SMTP id u18so29231814wrg.5
        for <meta-ti@lists.yoctoproject.org>; Mon, 08 Nov 2021 13:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2MXCSy3Ub4KykuGZ8oA0FsklXxGlqS2jxf3tqqaEGOc=;
        b=mZQcAyqdM4QJRBlOkbD+oYCk6vvotkJ/zAs8o51iKEiVDfLHDmr58Adxc1Xxxwtv34
         kc/0gITvWH18YQJypE2QNJY4KUX+t3T+l4piXodQBnGeHVm91LQ25zliSoS0y8aOTo15
         pjH2qaCOj5HZipL+zLN25PBf9LYkWBBUnWxbq7vkcIgpWwelQMKM3YzGn70bLkSOlB8I
         TDcmKCqQVpIYVtOppMN0a3dffXITtuBQNCO/hsRIB/rcQBvjiViO7WqbU1VhvRRy3kjI
         uzJvys3zelp3VLY0fte4IbNCQVjmvuY4DYxuTOCWOf+PC4u9k8bgdM+SvnTAiS9mcro6
         LH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2MXCSy3Ub4KykuGZ8oA0FsklXxGlqS2jxf3tqqaEGOc=;
        b=D/OJflh3xO6X5537Xi/BT8RhsWJV6P4FbhWszA65CRFXOjkGqOTnMS0UCkgOidXcEk
         fBxQgsdaq6X2PYmr5xeP6ITEnCQN4KeYnPxAFtUnyc1lftVnBNKv6VyMO390a9pG0nCv
         M2eJVxlauWU4KgTT5LGZAuFby6hut17xKYz+weTEXaAm3uNoyKA4Mq8owpN7daW/R3Im
         Mv1NGR6+X/KipmIa/cEETZSucpKuEZEn6deZYohWK7Y9OtAwpOU/Gp1P4h+r09ATAn2b
         NjYiYdx+dchWaFFbiNOPuAdC7+DbyEq3Sqvm+2iJpRpim8DtESNtLEoQJdM+tW+Ceu5o
         ISZg==
X-Gm-Message-State: AOAM530YUwd1tiUa0rKVzyXjAW05W30k27SQ/Ms2zK9QwIbV/wdsLbqV
	uc0pl8jM9RmGheNLlh57fhdchA==
X-Google-Smtp-Source: ABdhPJxTEo+65n2ZPxGYBt9kNYhcmDidcGU2OOkNMtlw1xz1vHsYD+34NfG49EXa3qe2e0s39KCpUQ==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr2561192wrm.431.1636406119547;
        Mon, 08 Nov 2021 13:15:19 -0800 (PST)
Return-Path: <aouledameur@baylibre.com>
Received: from [192.168.1.24] (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.gmail.com with ESMTPSA id g4sm17789971wro.12.2021.11.08.13.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:15:19 -0800 (PST)
Subject: Re: [PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.10 release
From: "Amjad Ouled-Ameur" <aouledameur@baylibre.com>
To: meta-ti@lists.yoctoproject.org, denys@konsulko.com,
 "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: khilman@baylibre.com, dfustini@baylibre.com
References: <20211108105214.34533-1-aouledameur@baylibre.com>
 <8f075a28-83ef-1062-faea-3e6a0603a81a@baylibre.com>
Message-ID: <20c106dc-b76d-e94b-c69d-8dcfaf4de428@baylibre.com>
Date: Mon, 8 Nov 2021 22:15:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8f075a28-83ef-1062-faea-3e6a0603a81a@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

This was not successfully sent to "meta-ti@lists.yoctoproject.org" since

I was not subscribed to it. Re-sending !


Sorry for the noise,

Amjad

On 08/11/2021 12:01, Amjad Ouled-Ameur wrote:
> Sending to maintainer Praneeth as well.
>
> On 08/11/2021 11:52, Amjad Ouled-Ameur wrote:
>> This introduces a critical fix for both AM335X EVM and AM43XX EVM, which
>> can no longer boot because "uuid" is undefined.
>>
>> v2021.10 has these two fixes, one for each platform:
>> - commit ff8f277e9121 ("ti: am335x_evm: Switch to DISTRO_BOOT only")
>> - commit e0c91ae24e5b ("ti: am43xx_evm: Switch to DISTRO_BOOT only")
>>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> ---
>>   recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb 
>> b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
>> index 2db9899609d0..76aaa4b24ac0 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
>> +++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = 
>> "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
>>     PR = "r0"
>>   -PV = "2021.07"
>> +PV = "2021.10"
>>     # For the un-initiated:
>>   # The actual URL you'd use with a git clone for example would be:
>> @@ -15,4 +15,4 @@ PV = "2021.07"
>>   # b) and we want git fetcher to use https protocol, hence 
>> GIT_PROTOCOL as https
>>   UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
>>   UBOOT_GIT_PROTOCOL = "https"
>> -SRCREV = "840658b093976390e9537724f802281c9c8439f5"
>> +SRCREV = "d80bb749fab53da72c4a0e09b8c2d2aaa3103c91"
