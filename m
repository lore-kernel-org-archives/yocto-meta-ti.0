Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97C8FE00BDC; Fri, 14 Jul 2017 17:59:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.66 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 080B6E00BB1
	for <meta-ti@yoctoproject.org>; Fri, 14 Jul 2017 17:59:49 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id g21so9233320lfk.1
	for <meta-ti@yoctoproject.org>; Fri, 14 Jul 2017 17:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nOtHUjjGI0XHyEBoA3SOwbFKyFYV4SrhHtRjw/VSQYU=;
	b=gVtbQK2uvPGUK7zCGFhfLPEzyu9USHMCX4hqIZtQ6aH6TrX+T/VV7E1Nj90x3mNDRM
	eyMlh6s32zUPse4YmMdieqTrfvAddx9WLHcbpnuIwAYdDadT426khm5mMWAsA70sysoQ
	IBpzzvwp40tEQOFoR2c1sNpm1J36s4pX1Lbff7hCSX22zknQw26MxLgFgG6CPqXZcZ65
	FRCkEOwZ45fWhjF16wgU/RVI9ysZ7HDswWF3Ditq9L9KUfC9D3Ryxh3LTm9UB2enLSnj
	kGiijM1ifSjCsCoeGr6b10WtJ0B6ODaMxnCwODk4FYwPXpfYzo7oOmdn63B799Z1WRny
	hp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nOtHUjjGI0XHyEBoA3SOwbFKyFYV4SrhHtRjw/VSQYU=;
	b=lZ8fXLKxXdHbMJpLfu3+gzB17XxfeeJtgO4mJbAToxPBYZkEmeLXwdZ75jhqjMQKU6
	noomJ7KckFyiLci7Yk5C1r9tAk/eDbAtkCHssX5yRT8gE08uiYfH/DMuZVfy1sMrKXrh
	MoVi/e4YpzYhBV2g8ATvVdVlJPd+zgfMRBAmWVZ06m52E+vVh0S2m7+9uQOi/dvDD3cy
	4A4VZuPcWpOb7TX5MOBi+4LbAw0tCvYGEmn9R30CgL43/ojdHhdXoTw2+vsJvFLKcGu7
	tcYzo+dWHj3pU4cTz4u+luOBdIxUoJf7FIqH0x055l0El7hPhXNyyVxZSEGrS2xr52HU
	OU3Q==
X-Gm-Message-State: AIVw111KAIU05WqzZrSfvATsXjjx3AkMw9TOVx4jP/kEfGYReEL143om
	L3jtpNXFUGfF270k8m2ofeVrQuv0Ew==
X-Received: by 10.25.26.81 with SMTP id a78mr3340566lfa.164.1500080388496;
	Fri, 14 Jul 2017 17:59:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.115.20 with HTTP; Fri, 14 Jul 2017 17:59:17 -0700 (PDT)
In-Reply-To: <CAOCHtYiBXMHC3KkOimO-+8vPmkhYOtxi1kBWiuuAHRjUx8E7UQ@mail.gmail.com>
References: <CAPtqgUxb=NqzZUj6L2aEdbhbO=uTZBHyL8j0820AqSe0Oaxsig@mail.gmail.com>
	<CAOCHtYiBXMHC3KkOimO-+8vPmkhYOtxi1kBWiuuAHRjUx8E7UQ@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 14 Jul 2017 19:59:17 -0500
Message-ID: <CAOCHtYiHo0bHtrHhMZ17Nc6xFRRiboV1x015Z6_dvEZXtk9LaA@mail.gmail.com>
To: Kenny Koller <kenny@understoryweather.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: U-Boot 2017.01 uEnv.txt Resolution (Raw Mode)
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Jul 2017 00:59:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 14, 2017 at 7:58 PM, Robert Nelson <robertcnelson@gmail.com> wrote:
> On Fri, Jul 14, 2017 at 6:18 PM, Kenny Koller
> <kenny@understoryweather.com> wrote:
>> I'm attempting to use the raw mode to boot a Beaglebone Black. I've loaded
>> MLO and U-Boot at 128 kB and 384 kB and it successfully loads and runs
>> U-Boot but fails to find and load a uEnv.txt because I'm unsure where to
>> place it. I tried /boot on an EXT4 root filesystem.
>>
>> I suppose raw mode is a PPL thing and there is no way for U-Boot to know
>> about this and it can only support one way of loading the environment (which
>> is to fatload from partition 1)?
>>
>> I tried to resolve this in the Beaglebone community but I'm told that
>> documentation won't be applicable unless I apply a patch. But I'd prefer to
>> use the stock Yocto build.
>
> Correct, my doc's utilize my patch..
>
> it's weird how you have 10 posts on the community, but only actually
> responded to '1' after someone has replied to most of them.. it's like
> you just want us to do everything for you.. say it aint so...
>
>> I hope you don't mind fielding this question. It's not clear to me how much
>> of U-Boot is mainline from DENX, how much is from Robert Nelso, and how much
>> is from meta-ti.
>
> i do see an issue with pure-mainline u-boot:
>
> 61 #define BOOTENV_DEV_LEGACY_MMC(devtypeu, devtypel, instance) \
> 62         "bootcmd_" #devtypel #instance "=" \
> 63         "setenv mmcdev " #instance"; "\
> 64         "setenv bootpart " #instance":2 ; "\
> 65         "run mmcboot\0"
>
> Change line 64, 2 -> 1
>
> http://git.denx.de/?p=u-boot.git;a=blob;f=include/configs/am335x_evm.h;h=b97f525994d8002a1a44b17636fafc32eccbd20b;hb=HEAD#l64
>
> as it's scanning the second partition by default..
>
> so it should find /uEnv.txt after that fix for a single partition..

and here too:

http://git.denx.de/?p=u-boot.git;a=blob;f=include/configs/am335x_evm.h;h=b97f525994d8002a1a44b17636fafc32eccbd20b;hb=HEAD#l105

lots of hard-coding for the 2nd partition..

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

