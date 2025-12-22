Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F94DE6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:34:11 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78465.1766403250730562264
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 03:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0YhieVoN;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: romain.naour@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso15457045e9.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 22 Dec 2025 03:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766403249; x=1767008049; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Kt4rcOfPU2oL7oGYvJq9t28mDFk/yTrhL/f56PKsBM=;
        b=0YhieVoNUxDgn9whjKTcrGZHeK5mN+Pyd9dy0gFz4Kl8yPrze6LehVuIrTzeF3YLil
         8MCFjX4v5Q6Ilbs0VHbmvmwpz23ya+xgw7VC/I8vegMn8xro+R97qTXz27/B6HMTx8JK
         qXxW2p1ZYll77NGlNnIPcTJttW2SKyYwolTqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766403249; x=1767008049;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Kt4rcOfPU2oL7oGYvJq9t28mDFk/yTrhL/f56PKsBM=;
        b=LtqZ9xg4p81yOltKjpInhW+xM6qO7V3p5uWw7Gf0+JAKUxBM2l5P37NohVGeqPexhT
         dC3BTfZrWdv9vxKMotF2RnW+Y9F+34zbsziyzCndAUqyQN+MXqWcHDveuFQKviT6Dne9
         6kApOJNFkTgp8Qv2tV/2DXBsDNNLrIR/HwfDYNO/mY7buXzyhS4QNar+TzUcwUT/LmrC
         rrtGydMHK903OMH3be5JrRMIGDGbnyMRlzP+D992+CZOa+BcYJdTMiQ5AhJnRUf3TFfh
         O5NlnIamPS0/yLZRtwkoW3O7/e0q6j2WsYoTqLqXrAS8oMc0q7q0usqqCwx70RAkO6O4
         GOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmGyPrDnnBU4GN0klWgDs4RDYQOw6fKF/HfRFCLNptF7j3IHoDWPOslw/Cl6ixbXTidRe2+Yol@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzrbhJsTL9Ji/S9jodgyl6tLD+T6LO/fCOQ4PqoBu/bjnuCKwjx
	EV+AIa2Ani9Ogtr04zQeW+Z9g4cv8+N0jQVQCE0LJCn26myklUL8W1Q5Qji2Z4zHeSc=
X-Gm-Gg: AY/fxX6Ref33kdiGFekLprwqthxlGq9V3R57AGCI5+aS8VybWMXOuLxgB5BmMRBP4pV
	uKsWgPvYBt6gnwWvsltbOjLiUwyTtW0gWvZ09ePLKyZKpgJGZSfWMpiR4hWCSRE8yitoWDTXPQk
	LZ0uiG0NstQx1p/QqT5f7xtVXFU0JWfMwGXaN44ND3aKqVhIcGVmzUHtPOQlAvup970krqSdhVP
	4MXsznN9eDReytoIm+Ya1f+5/TRklbN2Vt/aC5gKPlqZCyuNOaY7vFL7d5XfD0jNhnXZ2k0hrHh
	knl+64CmJj3is8gQqz1XioGnTIuk8N65E0yPPjLnZhP+4cBGoIKPYyNaaMTgTepyRHd1cn2QCT/
	Xggkoc62H+6Rf+ELlYM2XHVwK7D0VI59CuQHjHkH1YnSK1GKjijOFcrwQWba9GlRwO2mQSm04FY
	bDv7b1eBpB1No6P4gyKneEnwQADVBRKiRYTqzMLBpm3A/Z6fykh+ZpeMf9VTAMNGz5fJVjCkHpW
	oBrUP8Rm8JtlwO+LAnMJnXROyLnvMffA56sOdJFA4XKmZaUWm29JFIFFG9vU2c2
X-Google-Smtp-Source: AGHT+IGKNe9zeDlVk43yNqRvh7O6Zf+2o6Fm8d5Gq4yH40pVkW0A47KgrmTiyXDL2ryZl3uvI20p/Q==
X-Received: by 2002:a05:600c:1c21:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-47d19583142mr125552825e9.31.1766403248962;
        Mon, 22 Dec 2025 03:34:08 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a? (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr. [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ad0c60sm99572675e9.5.2025.12.22.03.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:34:08 -0800 (PST)
Message-ID: <ffb128e1-ec2b-4ec0-a4f5-8a3f94fe8dca@smile.fr>
Date: Mon, 22 Dec 2025 12:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH 1/4] linux-ti-staging: Add
 v6.12 recipe
To: "Bajjuri, Praneeth" <praneeth@ti.com>, reatmon@ti.com,
 Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org,
 Bryan Brattlof <bb@ti.com>
References: <20241004151857.24578-1-reatmon@ti.com>
 <cdc9c53a-4299-41b6-8da7-a65577dc11c2@smile.fr>
 <9496e24f-a730-415f-ad0a-f72510ec8040@ti.com>
From: Romain Naour <romain.naour@smile.fr>
Content-Language: fr
In-Reply-To: <9496e24f-a730-415f-ad0a-f72510ec8040@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Dec 2025 11:34:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19388

Hello Bajjuri,

Le 19/12/2025 à 21:58, Bajjuri, Praneeth a écrit :
> Hi Romain,
> 
> On 12/19/2025 11:31 AM, Romain Naour wrote:
>> Hello,
>>
>> Le 04/10/2024 à 17:18, Ryan Eatmon via lists.yoctoproject.org a écrit :
>>> Adding needed recipes for initial testing and development of the 6.12
>>> kernel for the next LTS.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>> ...
>>>   .../linux/linux-ti-staging-rt_6.12.bb         |  9 +++++
>>>   create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-
>>> rt_6.12.bb
>> ...
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/
>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>>> new file mode 100644
>>> index 00000000..9e5c4ee4
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
>>> @@ -0,0 +1,9 @@
>>> +require linux-ti-staging_6.12.bb
>>> +
>>> +KERNEL_LOCALVERSION:append = "-rt"
>>> +
>>> +# Look in the generic major.minor directory for files
>>> +# This will have priority over generic non-rt path
>>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
>>
>> Previous linux-ti-staging-rt recipes [1] used a specific branch
>> "ti-rt-linux-6.1.y" obtained by merging the TI vendor "ti-linux-6.1.y" branch
>> and the preempt-rt v6.1-rt branch [2].
>>
>>    BRANCH = "ti-rt-linux-6.1.y"
>>
>> Since preempt-rt is now merged in the kernel 6.12, indeed we can use the same
>> kernel sources with a specific configuration fragment (hence there is no
>> ti-rt-linux-6.12.y [3]).
>>
>> But the preempt-rt project still maintain a v6.12-rt branch with all remaining
>> patches [4]. Actually the project still recommend to apply the latest PREEMPT_RT
>> patches [5].
>>
>> Should the linux-ti-staging-rt recipe follow the preempt-rt stable branch as
>> before?
>>
>> Porting existing project (kirkstone 6.1 -> scarthgap 6.12) using
>> linux-ti-staging-rt recipe, users may expect that this recipe still use the
>> preempt-rt stable branch.
>>
>> Thoughts?
> 
> Indeed when we started 6.12 LTS baseline migration, Since PREEMPT_RT is part of
> mainline we have started using a unified kernel branch ( With config fragment
> switch) to build RT and non RT baselines.
> 
> The preempt-rt project didnt have a 6.12 branch till august in the year at
> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/
> 
> The development and hosting of v6.12-rt including additional on the fly features
> is something new and i hope it continue with next LTS (6.18 as well)

Preempt-rt issues are fixed over the time, especially for the 6.12 kernel since
it's the first release with preempt-rt included. But Preempt-rt specific changes
might be too risky to backport to linux-stable branches. We can hope that
v6.18-rt will never exist but who knows...

In other hand, it's only a few dozen of commits (as of today), some of them not
related to TI SoCs.

> 
> As you can see with https://patchwork.yoctoproject.org/project/ti/list/?
> series=41242 , we are in process of switching development with master and next
> LTS yocto to 6.18 baseline and we are assessing how and if RT need to be
> maintained as linux-ti-staging-rt-6.18 recipe based on the feature differences
> in v6.18-rt vs mainline kernel.

The linux-ti-staging-6.18 is too recent, some TI specific changes (like the
DMA-BUF support in remoteproc) is not yet rebased:

https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/drivers/remoteproc/remoteproc_cdev.c?h=ti-linux-6.12.y&id=3119d723957038270225867130678d76081dee0c

> 
> 6.12 combination with scarthgap is in maintenance mode at this moment.

Ok.

> The evaluation of linux-ti-staging-rt moving forward will be for master and
> wrynose in 2026.

kernel 6.18 was released only few weeks ago (uboot 2026.01 is not released yet)

We will consider switching to Wrynose as soons as the TI-SDK will be released.

Best regards,
Romain

> 
> 
>>
>> [1]
>> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/
>> linux-ti-staging-rt_6.1.bb?h=kirkstone#n9
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/log/?
>> h=v6.1-rt
>> [3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
>> [4]
>> https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/log/?
>> h=v6.12-rt
>> [5] https://realtime-linux.org/getting-started-with-preempt_rt-guide/
>>
>> Best regards,
>> Romain
>>
>>
>>> +
>>> +include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS')
>>> else ''}


