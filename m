Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0634C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 06:18:13 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.16130.1707200286311280179
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 22:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MovWioLv;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: res.sapp@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-595b3644acbso112758eaf.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 05 Feb 2024 22:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707200285; x=1707805085; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuIfskIxX1DoYMLxycnEGyrJFdsYHK73DgBwm+7Wd90=;
        b=MovWioLv8CZTy7+poUHS2rEcfS+zdlYqQSApS3c6mLGFar5N7aJKz5xJxXZvLZ88Mj
         pRlAYVT/Hwif25S3vucliSHQNTVMFu1eIt93CJuuIr4oASQn1+QteXjIjVZA2XCPu/d0
         3dI4Y4R2YkMNjCLCFRLg3d2lD0GWC4NYh5Tg39wTs+kV8QqtfU7kin00a4pLiXK3PVPo
         3iFCyNrbfNMcK9aY/0jsvjExPGI6UQQzeBnJniJOvb7LsoBqOgiO+/5P+HrnqMIc9bGf
         E1u5SaiKyls6CsHa7s0FzkHlkMyxcCOWo0QOklN0XcSIu6cv6hsB0cEVwvl+GD8DaPC2
         viWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707200285; x=1707805085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuIfskIxX1DoYMLxycnEGyrJFdsYHK73DgBwm+7Wd90=;
        b=mfb6HyQSyj58a8V9P/Vh9M4LbIlVgZ41Y5OAYNJH4dHp0AsUOe3SRix6jcDcsTEIxC
         d/yhdQMPY6h3YdmK0UaAnEaRrEGjHaqpebyQgGFwh13Rh7ALVorXfSPWnzxrKYA0PkmS
         f9j+RfTs+CqMKRo3tsmUgHVuMAxA6kghrjuiX7JvHpR75PTVcW4zUnUXFnu9t5ysNS9l
         ALexmAX9VZKxZHA9WZwPNG1+773F30V0zo/NOeSIInRINo9u5IfGlWYr3lPKVQclpC/f
         LbhdvO1XVNUOaIrdsOL/WLdV58yTfJGp7JGm503RDOleXf4aPjZrnLOIB7YwzjdQrUaS
         A8JQ==
X-Gm-Message-State: AOJu0YzLT5L6kJVhiFdVh43VjADIDy2pP80TfqKcwZHG3EIyP1ZT+Qja
	hT+MsN6wNUNpv+5xm3JzP/9k0IQmv5eX6lWixcDQEOKgKKPmdfHy
X-Google-Smtp-Source: AGHT+IGmAf8oimh1eV3YYlUno0iDRhK+YcYvxwSLVsg0TiZ4e+SZrlMFT6SOIOxpZhQjIEJXylj5yA==
X-Received: by 2002:a05:6871:750b:b0:219:9203:80a3 with SMTP id ny11-20020a056871750b00b00219920380a3mr1824631oac.10.1707200285402;
        Mon, 05 Feb 2024 22:18:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWdXPaaCNJcs/Na6SCAxaTwBML0vhBppK6SasIwnIefG71mCfZTm9fnGgVFmfSGuS5MZOdsuWReyfEdCoVpWmxqjtvRgJ9qLtAQrXhcOChkWNvdKp1maFSH6WB8CgmWZcGhshbUx0DYjikjya0o8LvFxVs8o2DgzFrxOt6PGQ==
Received: from [10.0.0.11] ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id os10-20020a0568715c4a00b0021850f946d5sm321304oac.42.2024.02.05.22.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 22:18:05 -0800 (PST)
Message-ID: <4281236a-08b6-4d91-9855-21ba43fd3345@gmail.com>
Date: Tue, 6 Feb 2024 00:18:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] cairo: remove cairo append and include
To: Denys Dmytriyenko <denis@denix.org>, rs@ti.com
Cc: detheridge@ti.com, reatmon@ti.com, denys@konsulko.com,
 meta-ti@lists.yoctoproject.org
References: <20240206000254.2916314-1-rs@ti.com>
 <20240206002757.GD15614@denix.org>
Content-Language: en-US, en-US-large
From: Res Sapp <res.sapp@gmail.com>
In-Reply-To: <20240206002757.GD15614@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Feb 2024 06:18:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17445

On 2/5/24 18:27, Denys Dmytriyenko wrote:
> NAK
> 
> On Mon, Feb 05, 2024 at 06:02:54PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Cairo versions >= 1.17.8 dropped all GL render backends entirely,
>> invalidating both the opengl and glesv2 PACKAGECONFIGS. As such this
>> override is no longer necessary.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 1 -
>>   meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc    | 5 -----
>>   2 files changed, 6 deletions(-)
>>   delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>>   delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>> deleted file mode 100644
>> index 459d8d09..00000000
>> --- a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-cairo.inc', '', d)}
>> diff --git a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc b/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
>> deleted file mode 100644
>> index b41f1a01..00000000
>> --- a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
>> +++ /dev/null
>> @@ -1,5 +0,0 @@
>> -# This is required since cairo expects the opengl distro feature to refer to
>> -# the desktop version of OpenGL. Imagination drivers only provide OpenGLES.
>> -
>> -PACKAGECONFIG:remove = "opengl"
>> -PACKAGECONFIG:append = " glesv2"
>> -- 
>> 2.43.0

Alright, what's wrong with it? Oe-core is currently using cairo 1.18, 
this append currently just introduces a warning. Are you already 
carrying this in a private branch?

