Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAADC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 10:02:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.18431.1684749775796318227
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 May 2023 03:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZyDBeBxl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3DAF41BF21A;
	Mon, 22 May 2023 10:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684749774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ufx1KuRwyi3vgStUX8caBLFeCYXpmky+7EvJT3CGxPI=;
	b=ZyDBeBxl2LeXrRO3oviERAJg0DeIgwgiVGvrfW+N80Kluer1+qXbGzCzCaP1pVl8NqS3k8
	w2fY35gXHvnxATR+NuwNqEC8lD+V2z28m23bz5FTXVUYvoFTCUpqMKJVRuUGqLooDBhIc3
	W6jnLC4FHtwjwElckmrC6x8MTEwuSobOtnl1ATd+TFLAsRR9y8eFhVkdB5eynyRdEBJ/Nh
	2J5tmOsEiNENHaT4S18tGmOkd53Nn+3dk1EQWLOtmxx+xaFjB2UCjS73JotQCdRarsTj+b
	exSOLWSnrK8llOkuY5I7S1dCEaaDGdVw7Uflx1FUAqCVnouSc1ua/fWJK9jl8w==
Date: Mon, 22 May 2023 12:02:52 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] check-layer failures for meta-ti
Message-ID: <2023052210025257f03d87@mail.local>
References: <202305021517546e066d50@mail.local>
 <20230502194743.GD9226@denix.org>
 <202305111450394ec6a4fb@mail.local>
 <20230511153603.GX9226@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511153603.GX9226@denix.org>
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 May 2023 10:02:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16571

Hello,

there is a remaining issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1363/steps/19/logs/stdio

AssertionError: Adding layer meta-ti-bsp changed signatures.
10 signatures changed, initial differences (first hash before, second after):
   optee-client:do_prepare_recipe_sysroot: d05547a4e057b50bff1357add7383c39c968542c7ca5027c41cd0e073196ac56 -> 8148d8a68b8570d0e1cd0d5fc2d790ab685c45a8beb18e62f227153a790b1198
      bitbake-diffsigs --task optee-client do_prepare_recipe_sysroot --signature d05547a4e057b50bff1357add7383c39c968542c7ca5027c41cd0e073196ac56 8148d8a68b8570d0e1cd0d5fc2d790ab685c45a8beb18e62f227153a790b1198
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['cmake/cmake-native_3.22.3.bb:do_populate_sysroot gcc/gcc-cross_11.3.bb:do_populate_sysroot gcc/gcc-runtime_11.3.bb:do_populate_sysroot glibc/glibc_2.35.bb:do_populate_sysroot ninja/ninja_1.10.2.bb:do_populate_sysroot:virtual:native optee/optee-client_3.16.0.bb:do_fetch', +pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native, 'pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot']
      Number of task dependencies changed
      Dependency on task pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native was added with hash cf8a9ff6ed2d492aeeeeeb3972365104425b5424377cf5e4a4fc76bb53a4f628

On 11/05/2023 11:36:03-0400, Denys Dmytriyenko wrote:
> On Thu, May 11, 2023 at 04:50:39PM +0200, Alexandre Belloni wrote:
> > Hello,
> > 
> > Did you make any progress? The plan is to disable testing meta-ti next
> > week if this isn't fixed by then.
> 
> Yes, I have necessary patches I'm about to send out.
> 
> 
> > On 02/05/2023 15:47:43-0400, Denys Dmytriyenko wrote:
> > > On Tue, May 02, 2023 at 05:17:54PM +0200, Alexandre Belloni via lists.yoctoproject.org wrote:
> > > > Hello,
> > > > 
> > > > meta-ti is currently failing check-layer-nightly:
> > > 
> > > Yeah, I think I know what's going on and it's a bit more complicated... I'll 
> > > take a look at it.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

