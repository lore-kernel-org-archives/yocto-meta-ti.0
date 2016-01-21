Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 130B3E007D9; Thu, 21 Jan 2016 14:04:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57B10E0079A
	for <meta-ti@yoctoproject.org>; Thu, 21 Jan 2016 14:03:59 -0800 (PST)
Received: by mail-io0-f170.google.com with SMTP id 77so69219045ioc.2
	for <meta-ti@yoctoproject.org>; Thu, 21 Jan 2016 14:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Pi7oij99o9BFkzccbR0gIh+gtgI0sGDV04s3g/K1rSU=;
	b=UvRbkDsWVnLMCLJaBxL1gczP9nJni0679zEQAYYRBZew3BEiJwsLHUwcZ9+kmoxlFJ
	ZZ7kCt6Q6ZqDlOYpnlm0c7Y6NtCEtXdUPZJ5JWVWnVvaR844UaNWjXWPr3CPA3+q4lYe
	K+3tNs4KmkPNHJtTSwRKiJksYaQN31c/4xCt3tbRS3etQ9iEPlTHN1OaPVZoX0HLt6G/
	2LFZJJDkikasesD5gLPyMY4svxYGsoG4wZ+G5tSKzwHIMxyOGzXyFUNuRfoy9YzWZHXs
	eofEK9a4qxqjHWkF703O7aygpbrOz9QhVcWHTgG+r90UFrmzuVnYUGkbbwiOsX2mLdT5
	gYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pi7oij99o9BFkzccbR0gIh+gtgI0sGDV04s3g/K1rSU=;
	b=beL1bYX2hvn7UthyaFTyqR1NaLtUj9/Zf5CHEXWyvQzj6BvLbWCrDmlcI0XGcTatQl
	bqjdQbehNPu+ZrXQlAHGJeqgE/HpvqB76+KXQmauUMjCPPay7OjYAjjBSWSRIdCEr9Tq
	M7jyu5FI9vsW334ZsncOKtObMsJBZlDjWpqpd8jvExRH4/2JZFylxr5JNfzeTk1RJudb
	Od8969VA9jKtck863fGN2ZG0CWTJ2+ZVOFiW81Wi28pJCzbypc+Ufc/bWuXuBODdR1zG
	p1JT6GXjMdnosNyB5+kfdm02Lm3l641t44OJBP3mjeU3tMP4GGd0+cEgPExlxkomVjSZ
	6T4Q==
X-Gm-Message-State: AG10YOSEWKuSGKg33s03YgVw0fEYGApbOf3CtfHiXu8tWETfCeAS5J1jXHQaeM4r3XJiwIB7Vjh8IKjijLJztw==
X-Received: by 10.107.32.2 with SMTP id g2mr174595iog.39.1453413839164; Thu,
	21 Jan 2016 14:03:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.44.3 with HTTP; Thu, 21 Jan 2016 14:03:29 -0800 (PST)
In-Reply-To: <20160121204813.GD11314@edge>
References: <20160116063631.GB10881@nl.grid.coop> <20160118164615.GC4223@edge>
	<20160118200507.GE10881@nl.grid.coop> <20160119190808.GE4223@edge>
	<20160121015830.GA4311@nl.grid.coop> <20160121204813.GD11314@edge>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 21 Jan 2016 16:03:29 -0600
Message-ID: <CAOCHtYgzATUz5ESXTN3RaATbw+pbN8hQ3WKZ5tMAs2cVDCh_Hw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: regression tests for am3517-evm machine?
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
X-List-Received-Date: Thu, 21 Jan 2016 22:04:03 -0000
Content-Type: text/plain; charset=UTF-8

>> Didn't 3.x kernels start requiring a device tree somewhere along the line?
>>
>> I know the Beaglebone uses a device tree, but I can't seem to manage find
>> all the right pieces to build a working u-boot for am3517-evm that can
>> properly pass it off to the kernel, at least with the Legacy image format(s).
>
> Well, am3517 is one of the legacy platforms and I don't believe it was ever
> converted to use device tree...

Looks like it should atleast boot to mmc rootfs..

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/log/arch/arm/boot/dts/am3517-evm.dts

Regards,

-- 
Robert Nelson
https://rcn-ee.com/

