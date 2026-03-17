Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5784FD877E
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:17:00 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77016.1773757008625593547
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 07:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qzvnUOH6;
 spf=pass (domain: konsulko.com, ip: 209.85.208.176, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38aef9cc451so5144741fa.0
        for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 07:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1773757007; x=1774361807; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gJZbLxA1auXQI3bQJyYK8evHnAqO6dNNMEFS/GazsY4=;
        b=qzvnUOH6LzPnpCYZfgQSnMcljyJGvuiamL45aU/Opw6WvafmR26E/74XWOnl50h1gl
         vf9bu6NfoRB9e+oYBtbJZ6U1++t+iYb7odWBWx3vQwj02NHedKE4a3Wdceu1scrtTQIF
         F1BHBnMBMjwzb8Txlz0jiwfuxJiaxrEWf1Qx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757007; x=1774361807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJZbLxA1auXQI3bQJyYK8evHnAqO6dNNMEFS/GazsY4=;
        b=nhWUwB+x8HsmXkJ8+VjhCzhAYbGV4o5nwFdC92Jj3Eszr99bfByN6uArhCTABXdqQx
         b6FhRxS7Sm9YHaOIEqeV/VNrmQ2G0qlejbQTpwsJ5dFLgf1AOCQb4sRYbG+aDKEDKuC/
         pZeWxuhfhUQy57V319fDAitnVnubF7HTejdozVPwhagBSeYeRJMyBM5NPCXraLvv7EXf
         Gij4xQHqIIUoVmkK0jOvBKTF7RhEASeskPOHjZLLKXUnn5bjtH4jr39ik2kfO+fgP9PY
         dmy0OhayKRO11++QI1kdABulQ8VjMgVv1g5mMR0QTS4N2liTzEcfSJjXWhag6/a1QAbq
         mbxA==
X-Forwarded-Encrypted: i=1; AJvYcCUcAUBBvC7YychyEnsvrRHwSyUsSCd9U33x4uYMNr8CGB4RQl1IjtQh4Iq3gHHHM8u8y5hckUKp@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy6wnHfspcmqkO3+/yYJQapJPttTSnhwrjy+Ax3aawD8PrAAofZ
	vbarC2knOd2NmBsqIpehCQ5h02SkY8mmXAMYqkGiVzMiFOzc9TBImdRBbXiXDAHdMXY=
X-Gm-Gg: ATEYQzzgDYyal0TG3Mr3VJH/UTNHzK1y0wbN3JRbzDEHCd2JNrizSTwoTxX8s11kl4f
	iyHVIxFgDrV6RcAVqGBfgPKD0YJtoRq3IyB0Tg/RLqCekLq8KOx3e8v+vr4Z1XPG6bBTgMwjJVb
	EXlDCdDEq26UYx2QnViQSAc0rEwQsddHqWBFNOHms7MUtcOkf6evPA09RSXomsU1C/g2WR67++f
	roSbHQEnDP6HtNAqIIoVF9OBdr1l72MN+VYdVdRmZQjYA6JY0Ew3TZrkq9/ROV5eNIsEFm1kUmU
	pbR0GG2RBO76kXRO0Ye30eayK9llXVKX7kVIokgCkhJp3I7Aa45rLMBuuMjUUqgObWKa+L7rS0W
	478wrrREc9g8i6GXDh/ktkyYjs+pjXAcw7hrjL6wIgPJaBOT0KPsqXQ6/Gu8CkMilhR7L1treBj
	MPDOWxIPwct7+z/fVtwdSkAasyVtUU7w5jhZ03+qn2
X-Received: by 2002:a05:651c:41ca:b0:38a:269e:fbe5 with SMTP id 38308e7fff4ca-38a8968a219mr54883571fa.18.1773757006694;
        Tue, 17 Mar 2026 07:16:46 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd20403bdsm542331fa.39.2026.03.17.07.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:16:45 -0700 (PDT)
Message-ID: <26f999c5-22b7-438e-b59b-294b3141915b@konsulko.com>
Date: Tue, 17 Mar 2026 16:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-beagle][PATCHv3] u-boot-bb.org: Add a tick-timer
 for PocketBeagle
To: Ryan Eatmon <reatmon@ti.com>, meta-ti@lists.yoctoproject.org
References: <20260317133743.419092-1-leon.anavi@konsulko.com>
 <f15d818c-96cc-4b3e-bcde-bd618c7890b6@ti.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <f15d818c-96cc-4b3e-bcde-bd618c7890b6@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 14:17:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19741

Hi Ryan,

On 3/17/26 16:05, Ryan Eatmon wrote:
> Is this for beaglebone or pocketbeagle?

This U-Boot patch is required to successfully boot PocketBeagle (version 
1). There is no separate machine in meta-ti/meta-beagle for it so as far 
as I know we should use beaglebone because the configurations contain 
appropriate Linux kernel device tree variant for PocketBeagle (version 1):
https://git.yoctoproject.org/meta-ti/tree/meta-beagle/conf/machine/beaglebone.conf#n53

Best regards, Leon


