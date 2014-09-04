Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92126E006EF; Thu,  4 Sep 2014 12:03:19 -0700 (PDT)
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
	*      [209.85.213.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E72D3E004A0
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 12:03:08 -0700 (PDT)
Received: by mail-ig0-f169.google.com with SMTP id r2so111751igi.0
	for <meta-ti@yoctoproject.org>; Thu, 04 Sep 2014 12:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8css/tNI1rf1e5+/QKcVZ3PxWJiskpuoip83PDgFVSo=;
	b=aSm2I+DkzXH3KEU5kC63lB65wie9YV2IbRHGD/WUzzvD/ScXnCg0+M5FnBko7ALiNc
	emAiMvmGfUFrj+u4KzOyLj0IewNrVb3b3HXw3qCQ6oZ2PMNpXh1qtZbb6unsBBISec5T
	aKKDnrQ7HAOCMZlrzYOso3vuifNjwlKshnlOir75GZVB7KMhq+8Ah4h94BGTOyNzRi47
	/s9K8Pa/6IjH85FJeE9DNlH6PzLcHY/gLnQLfWYroUhA6m3HW0hmqJzCth+0V8THPNir
	s6pHbDnqQK8CvJX+iD0Ja51B+Wjh+4Li60vhu8A1xwHMiRTXxASC8VjzYB29IvBPmuY0
	nHVw==
MIME-Version: 1.0
X-Received: by 10.43.138.65 with SMTP id ir1mr8479115icc.55.1409857387334;
	Thu, 04 Sep 2014 12:03:07 -0700 (PDT)
Received: by 10.107.166.16 with HTTP; Thu, 4 Sep 2014 12:03:07 -0700 (PDT)
In-Reply-To: <20140904181056.GO18620@edge>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
	<20140904150022.GD18620@edge> <54088734.1090204@pabigot.com>
	<20140904154819.GH18620@edge>
	<CAOCHtYgkaixBwP84Ocqa4y9H1_9__Y1BR-2UKGeiUXn0Bhk_+Q@mail.gmail.com>
	<20140904181056.GO18620@edge>
Date: Thu, 4 Sep 2014 14:03:07 -0500
Message-ID: <CAOCHtYg3JOnTaGkxh9TTzUACUcgGsGYSG1SyZbKjdkX13xoOow@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on, BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 19:03:19 -0000
Content-Type: text/plain; charset=UTF-8

> Robert, Peter,
>
> So, after some internal discussion, here's an update:
>
> 1. In TI kernel we do dynamic opp setting based on eFuse check in the file
> arch/arm/mach-omap2/opp33xx_data.c
>
> 2. Since most of our EVMs and EVM-SKs use 2.1 Si, everything works properly
> with eFuse check and dynamic opp setting.
>
> 3. But eFuse was not available in 2.0 rev of silicon, only in 2.1 rev. There
> were many BBB boards made with 2.0 Si that were binned to run at 1GHz. And
> older 1.0 Si revs were not 1GHz capable. Currently checking with HW and
> marketing teams if all/most 2.0 chips are safe to run at 1GHz... As w/o eFuse
> there's no way to determine if the chip is 1GHz capable or not.
>
> 4. If your BBB board has 2.1 Si rev, then you should get 1GHz automatically.
> We'll try to figure something out for 2.0 Si boards, but setting opps
> statically in dts is considered incorrect and risky...

Thanks Denys!!!

I'll take look at my bbb collection, i have a few of the "beta" bbb's
which have the earliest non-production silicon, so i can find out what
rev we started with.

BTW, since we at bb.org, are moving to this 3.14 ti base, i'll be
patching this for 1Ghz operation. ;)

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/

