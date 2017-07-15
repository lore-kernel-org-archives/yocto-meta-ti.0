Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42CE4E00BDC; Fri, 14 Jul 2017 17:58:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.49 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.49 listed in list.dnswl.org]
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08A1FE00BB1
	for <meta-ti@yoctoproject.org>; Fri, 14 Jul 2017 17:58:41 -0700 (PDT)
Received: by mail-lf0-f49.google.com with SMTP id t72so61752931lff.1
	for <meta-ti@yoctoproject.org>; Fri, 14 Jul 2017 17:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kmHabsOr6/kzVF5mfZN6yrZGJePt+1wVHfi+RNuWZNo=;
	b=p30YtC4vJsuR/fBT5q4Je5TSgc8wA18V48pW/gvSgCkoDMoTn/8Fb4uPYtCQBMofrd
	pxLOW7HhwkcfKoCBXp+FQyYExEcHVq1R3npOEi96hepK3aGkdFuEwewuKES52euqs67A
	fNvKCuzYKaEw/rJ1CMOcfSnzWXGyJS5MCap7o9M+v7oqpQyEXFNR81cy+4U219K7o8ks
	/QKUFeRHwWIFGEwdemJXqY0hbng5Zdwj8qNKOniTHnuU7ov47exDkDnYliQR4YSKAhJ2
	GoCfsk8j4LDiZEE4W2TH/vQkSoZCT9NCkeF13UecNpcbCA7aPXMbeIZrPURWQdpBhkmi
	7y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kmHabsOr6/kzVF5mfZN6yrZGJePt+1wVHfi+RNuWZNo=;
	b=LpLLsCKAy1oDIJeXPk+9OhkRa8b/TwdfQl2f4nEEvHANj0KQKbNOotTOJfAtEmfNgz
	9bTuw6cmWsCSPjVOr/m0Yu12cqlzDrwuknNwMtaXQPwwrEBXnTarDj8dHiqFAbcRbHhc
	CodFVoz38hng5q5w6mPxyQfygYhJovQryPEB6rfbRvToY9QAXAOS8xXw0+jiu8YznxWw
	j7s+jvYVg6VV8aemvBke6/a6/d8DgAm/TD7uSyXSqRk85WAIHpQOereh8Lxd2FQTLQfd
	vh07Ja1az122a/FEsDhnSyiwahNyA0HrTUpSCwEklveu6yLCxM9awpQAliTcb4JYYlXP
	Rxmw==
X-Gm-Message-State: AIVw111cjyRHtKX15JkWFYJohcr7q01Vwwq8jLOkyVAqauT5+WG984+X
	o675p60d39t5zm6+uzIBRbKhDsG0m848
X-Received: by 10.25.1.130 with SMTP id 124mr3364482lfb.138.1500080319881;
	Fri, 14 Jul 2017 17:58:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.115.20 with HTTP; Fri, 14 Jul 2017 17:58:08 -0700 (PDT)
In-Reply-To: <CAPtqgUxb=NqzZUj6L2aEdbhbO=uTZBHyL8j0820AqSe0Oaxsig@mail.gmail.com>
References: <CAPtqgUxb=NqzZUj6L2aEdbhbO=uTZBHyL8j0820AqSe0Oaxsig@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 14 Jul 2017 19:58:08 -0500
Message-ID: <CAOCHtYiBXMHC3KkOimO-+8vPmkhYOtxi1kBWiuuAHRjUx8E7UQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 15 Jul 2017 00:58:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 14, 2017 at 6:18 PM, Kenny Koller
<kenny@understoryweather.com> wrote:
> I'm attempting to use the raw mode to boot a Beaglebone Black. I've loaded
> MLO and U-Boot at 128 kB and 384 kB and it successfully loads and runs
> U-Boot but fails to find and load a uEnv.txt because I'm unsure where to
> place it. I tried /boot on an EXT4 root filesystem.
>
> I suppose raw mode is a PPL thing and there is no way for U-Boot to know
> about this and it can only support one way of loading the environment (which
> is to fatload from partition 1)?
>
> I tried to resolve this in the Beaglebone community but I'm told that
> documentation won't be applicable unless I apply a patch. But I'd prefer to
> use the stock Yocto build.

Correct, my doc's utilize my patch..

it's weird how you have 10 posts on the community, but only actually
responded to '1' after someone has replied to most of them.. it's like
you just want us to do everything for you.. say it aint so...

> I hope you don't mind fielding this question. It's not clear to me how much
> of U-Boot is mainline from DENX, how much is from Robert Nelso, and how much
> is from meta-ti.

i do see an issue with pure-mainline u-boot:

61 #define BOOTENV_DEV_LEGACY_MMC(devtypeu, devtypel, instance) \
62         "bootcmd_" #devtypel #instance "=" \
63         "setenv mmcdev " #instance"; "\
64         "setenv bootpart " #instance":2 ; "\
65         "run mmcboot\0"

Change line 64, 2 -> 1

http://git.denx.de/?p=u-boot.git;a=blob;f=include/configs/am335x_evm.h;h=b97f525994d8002a1a44b17636fafc32eccbd20b;hb=HEAD#l64

as it's scanning the second partition by default..

so it should find /uEnv.txt after that fix for a single partition..

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

