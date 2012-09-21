Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DA72E0141D
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 02:11:33 -0700 (PDT)
Received: by vcbgb22 with SMTP id gb22so4536759vcb.35
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qTrKQn9UOz86b8e+lR/CPkyBpQKN9oCmLfFgFNsgUW8=;
	b=tmJ3ivpoBfoRhP36odc5sEIvzILvKrKohuISDhpRsYkXLfk8QRwezResbxEXiU4db1
	vTsPeGadS0OK5jVVe2m+jOARZgHWz50N6UzuD5V1EII8Hu7jih2qUMerGxw/nse0pyEJ
	E7YmaZH01YMyqpdhPo4XnZSQDAk+ZVNiZut8a52Ca+sagsgx2DdWUd7S2UedabLmV+H4
	Y9k18fYaKpN1j8z8DokSi51/5WBR3dRS1+kRB2bfU/pLZozaEIm6nl+2bjqAP74Xsiyl
	cabKvYFt6fLJffU51WsE1+HwQQdbSsnxaO3l2z9pNGtoj4TwmOkyY45kleRJEb+4Lbgx
	98EA==
Received: by 10.58.124.77 with SMTP id mg13mr2719488veb.39.1348218690815; Fri,
	21 Sep 2012 02:11:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Fri, 21 Sep 2012 02:11:10 -0700 (PDT)
In-Reply-To: <D404AEB3-A46E-4313-AA43-226B38F40985@dominion.thruhere.net>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
	<20120919135659.GA589@edge>
	<CAOT3miK4MM-LqDC0AFuZh3hH145qrYoxW1w27P4dXRTCR2X=hQ@mail.gmail.com>
	<20120919162639.GC589@edge>
	<CAOT3miK2M7e5AbYLevSqXD7vx7N_+FUY-8P6k4sFXu1Xxjd4sQ@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E630DAF@DLEE09.ent.ti.com>
	<CAOT3miJNVxKj_v6=w4yT5Dq0MvuXn9COkmGCtL=9u846qoSkQA@mail.gmail.com>
	<D404AEB3-A46E-4313-AA43-226B38F40985@dominion.thruhere.net>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Fri, 21 Sep 2012 11:11:10 +0200
Message-ID: <CAOT3mi+=m71+AhWtnwuadVue+P-oDgSOH6ntxm4tpuShy7KsOg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building yocto images with meta-ti
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
X-List-Received-Date: Fri, 21 Sep 2012 09:11:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 21, 2012 at 10:49 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Build Configuration:
>> BB_VERSION        = "1.15.3"
>> TARGET_ARCH       = "arm"
>> TARGET_OS         = "linux-gnueabi"
>> MACHINE           = "beagleboard"
>> DISTRO            = "poky"
>> DISTRO_VERSION    = "1.2+snapshot-20120921"
>> TUNE_FEATURES     = "armv7a vfp neon cortexa9"
>
> A cortex A9 on a beagleboard, wow.

hehe ... yeah, i am doing funky experiments ;-)

i restarted a panda build right after and messed up with my copy/paste ;-)

