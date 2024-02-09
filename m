Return-Path: <res.sapp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA16C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 03:24:33 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.3341.1707449066719429736
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 19:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rk/uT954;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: res.sapp@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-218e3197784so260524fac.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 08 Feb 2024 19:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707449066; x=1708053866; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNxYVrxAvWbtKhdx4IEtXUYrBXmMZahURxCFydGYV+o=;
        b=Rk/uT954OsekBJK0JHxr1RVIt7TnlN2e+LmC7V0gicH17DhZ7yiKV7j5agFwdF20Np
         jv/63CrWt4hYs4ZWrrpzOapWmrk3pX2bjzLol/l6DFbQA/N7zCjfLbwf2Mvnsmc3yY93
         jv1oKCuQCsgIdzBDVyjS/6+YCwTb8kFSTC3NGQ4KgD1x6F0HqkKlxfvby0eLUV9ERD+f
         SFWBH+8QOW/KuyAfFrdITVhaA0Xu2T9OzskbVXVAlNRccJP2iWKngNAgbnLTXjLKfE9Y
         jCcRCGBTFpsOxqd0HJST84kQexRF2UqKd1pMpJMw9nIttnSxEEqGwN4fgNFodAslTxjs
         iPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707449066; x=1708053866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNxYVrxAvWbtKhdx4IEtXUYrBXmMZahURxCFydGYV+o=;
        b=vj5vasil3HlENmKeg76R4+/9L2qrDSCLBMgcwCwWatTp7R0zdjt9fb6eO7qs1V5pxU
         +k0wxCz0lWhGizmKiQRfmrrdKiozMNRPu5REQ7xohmyfb+KnBXbtx4t6TDJLFC1yP/w1
         MSpCpabUL667spBmOvgNdkBnFcMEmDWRLZIqGVXVrbhhBc3cU7NMd8MwXk6ZIfbDDCE6
         aLG+ICuEDuVJu2AII+jaMSxzwJ8gADZNbMkPnH6z3JjJ4sQTeAF9WAh6BdsWacWljEda
         FO/0qZXM0YxSggwS8z/TJ42NZU6nQwhVcwFYWyn3CnSK1s4NJIzHoPKDwVW5E38/VDec
         QFHQ==
X-Gm-Message-State: AOJu0YzBAWPYYJVvbehaSfb+P4SI6NIefQH6KGHZDP+g7UbLR9nfGHYU
	wmSPT1Co/pWV1UY/RDOXM9zOOlHMygtQMzIpEU/UzuG1vIBelx23
X-Google-Smtp-Source: AGHT+IGBKuGVUabvIBETKHzEWZJZJfQaN1IIHPGtFxu1eysXieHwIk8dX/rpKge66TCM/5H0jz9ZsA==
X-Received: by 2002:a05:6870:e316:b0:210:7f85:c208 with SMTP id z22-20020a056870e31600b002107f85c208mr382169oad.46.1707449065902;
        Thu, 08 Feb 2024 19:24:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVccAK2WoQzIVtSQPFNhnewG/ZVZSmuHZhWRCe22In/+i7QdFqqQPr+CSGAd7V9ZgCB0DaCun6kIt4ByD3f2+ZkP/bQs0zafqWHedMy626GWzL23vQNl+X5clJr0rAt8rE=
Received: from [10.0.0.11] ([104.182.101.14])
        by smtp.gmail.com with ESMTPSA id n21-20020a056870a45500b0021845ede22esm214876oal.23.2024.02.08.19.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 19:24:25 -0800 (PST)
Message-ID: <65c3f407-2c35-48b0-b71a-3d75c76538ce@gmail.com>
Date: Thu, 8 Feb 2024 21:24:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 1/2] ti-img-rogue-*: switch branches to
 new lts
Content-Language: en-US, en-US-large
To: reatmon@ti.com, rs@ti.com, detheridge@ti.com, denys@konsulko.com
Cc: meta-ti@lists.yoctoproject.org
References: <20240208233722.2565237-1-rs@ti.com>
 <20240208233722.2565237-2-rs@ti.com>
 <17B213457AB20D5B.15017@lists.yoctoproject.org>
 <10776d12-3741-4c16-970b-88a6738d03e3@ti.com>
From: Res Sapp <res.sapp@gmail.com>
In-Reply-To: <10776d12-3741-4c16-970b-88a6738d03e3@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Feb 2024 03:24:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17464

On 2/8/24 21:16, Ryan Eatmon via lists.yoctoproject.org wrote:
> On 2/8/2024 9:13 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> On 2/8/2024 5:37 PM, rs@ti.com wrote:
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> Switch the branches to the new LTS names. These are still experimental,
>>> hence the isolation from kirkstone. The upstream branch is now carrying
>>> the equivalent to the kbuild patch so we're dropping it here.
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>>   .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb     | 6 ++----
>>>   .../powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb      | 2 +-
>>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>>
>>> diff --git 
>>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
>>> index 0e894534..02ec9fe9 100644
>>> --- 
>>> a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
>>> +++ 
>>> b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
>>> @@ -16,15 +16,13 @@ COMPATIBLE_MACHINE = 
>>> "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>>>   DEPENDS = "virtual/kernel"
>>> -BRANCH = "linuxws/kirkstone/k6.1/${PV}"
>>> +BRANCH = "linuxws/scarthgap/k6.6/${PV}"
>>>   SRC_URI = 
>>> "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
>>> -SRC_URI:append = " 
>>> file://0001-build-kbuild-Makefile.template-use-SECONDARY.patch"
>>> -
>>
>> NAK.  Your previous patch for bumping the version to 23.3.6512818 did 
>> not build on master because of this patch.  So I went ahead and 
>> removed it and "fixed up" your patch with the removal.  I like to have 
>> as atomic commits as possible.
> 
> Sent that without rereading it...  I was referring to the 
> 0001-build-kbuild-Makefile.template-use-SECONDARY.patch patch file...  I 
> already removed that and deleted it as part of your previous patch when 
> I applied it to master.
> 

Oh, you do know that .SECONDARY thing is based on both the version of 
make and the version of the kernel you are building against right?

Building against 6.1 it isn't necessary but anything after 6.2 with make 
 > 4.4 or something breaks it. Full logic for the fix here: 
https://git.ti.com/cgit/graphics/ti-img-rogue-driver/commit/?h=linuxws/kirkstone/k6.1/23.3.6512818&id=303425c1202a3fee194fda67b8953ca9938c6732

Inspired/required by:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=875ef1a57f32fcb91010dc9bc8bd1166956a579e 


> 
>> I should have said something at that time, but I know you are busy.
>>
>> Please rebase on master-wip and resubmit this patch.
>>
>>
>>>   S = "${WORKDIR}/git"
>>> -SRCREV = "41a494accb30aa2f247e6a4e123a4954982f2a88"
>>> +SRCREV = "2f409b4dd2540e896b54bff02219d4fc51129b81"
>>>   TARGET_PRODUCT:j721e = "j721e_linux"
>>>   TARGET_PRODUCT:j721s2 = "j721s2_linux"
>>> diff --git 
>>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
>>> index 288eb52b..a0a9a295 100644
>>> --- 
>>> a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
>>> +++ 
>>> b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
>>> @@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = 
>>> "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
>>>   PR = "r3"
>>> -BRANCH = "linuxws/kirkstone/k6.1/${PV}"
>>> +BRANCH = "linuxws/scarthgap/k6.6/${PV}"
>>>   SRC_URI = 
>>> "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
>>>   SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
>>>   S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
>>
>>
>>
>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17463): https://lists.yoctoproject.org/g/meta-ti/message/17463
> Mute This Topic: https://lists.yoctoproject.org/mt/104250019/7693777
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [res.sapp@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


