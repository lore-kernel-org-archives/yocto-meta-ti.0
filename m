Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4C8C7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 23:28:27 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.2536.1750375699653399804
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jun 2025 16:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yH3kKJTr;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55JNR6nI750205;
	Thu, 19 Jun 2025 18:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750375626;
	bh=2lIBulizmxyRI9t3vUzr0P+mbsAK0TYlHt1ll+ICVfw=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=yH3kKJTr0+tcW3Wdb9iTm1kHBXne0tEj4SV9y7SNNbS1zUeT7VbAeVInmntv1ypPh
	 1OhduxlozwCROARBLmUdARlBXZ2kkMv4BqotH35jHcQRiUwdkLVviRyOBK80R2/Bl5
	 A4wO4ZZkKMjfSsVlhEsldCX2TLdLvHqmpbbKf+HQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55JNR6Kk1727381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 19 Jun 2025 18:27:06 -0500
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 19
 Jun 2025 18:27:06 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.55; Thu, 19 Jun
 2025 18:27:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 19 Jun 2025 18:27:02 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55JNR23I2191696;
	Thu, 19 Jun 2025 18:27:02 -0500
Message-ID: <ee9fb18b-d0b4-40cd-bb1d-b1e883ed86c8@ti.com>
Date: Thu, 19 Jun 2025 18:27:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] is this the right place to ask about building for
 PocketBeagle 2?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
        <meta-ti@lists.yoctoproject.org>
References: <23a7970c-aeb0-9441-7740-d0324aecce55@crashcourse.ca>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <23a7970c-aeb0-9441-7740-d0324aecce55@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Jun 2025 23:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18659

On 6/19/25 6:50 AM, Robert P. J. Day wrote:
> is this the right place to ask about building for PocketBeagle 2?

The Beagle forums and Discord channel are probably the best place,
but we are friendly here so let's see if we can help you out :)

>    I'm trying to build a simple core-image-minimal for the
> PocketBeagle 2; I've checked out the walnascar branch for Poky, and
> the master branches for all of meta-ti and meta-arm. (I'm using
> MACHINE "pocketbeagle2").
> 
Why use walnascar for Poky but master for the other branches? You shouldn't
mix like that, if you want master then all branches should be master. Note
though that master is a moving target and there is no guarantee to build.

We don't provide a walnascar branch for meta-ti, but if you want to set
all your layers back to scarthgap then you should have no issue building
for pocketbeagle2.

Looking at the actual issue, seems to be some failure building re2c
which is provided by the oe-core layer, nothing specific to TI or
the PocketBeagle2. Also looks like re2c was updated to 4.2 back in
May so I'd also guess you haven't updated your branches in a while,
start with that.

Andrew

>    I started a fresh build by building the kernel first, and that
> worked. So I then fired off a build of core-image-minimal, but I can't
> get past this point:
> 
> $ bitbake core-image-minimal
> 
> ...snip ...
> 
> | /home/rpjday/oe/builds/pocket2/tmp-k3r5/hosttools/ld:
> src/options/re2d-symtab.o: in function
> `re2c::add_named_def(std::map<char const*, re2c::AstNode const*,
> re2c::symtab_cmp_t, std::allocator<std::pair<char const* const,
> re2c::AstNode const*> > >&, char const*, re2c::AstNode const*,
> re2c::Input&)':
> | symtab.cc:(.text+0x1f2): undefined reference to
> `re2c::Input::error_at_tok(char const*, ...) const'
> | /home/rpjday/oe/builds/pocket2/tmp-k3r5/hosttools/ld: warning:
> creating DT_TEXTREL in a PIE
> | collect2: error: ld returned 1 exit status
> | make[2]: Leaving directory
> '/home/rpjday/oe/builds/pocket2/tmp-k3r5/work/x86_64-linux/re2c-native/4.1/build'
> | make[2]: *** [Makefile:4410: re2d] Error 1
> | make[1]: Leaving directory
> '/home/rpjday/oe/builds/pocket2/tmp-k3r5/work/x86_64-linux/re2c-native/4.1/build'
> | make[1]: *** [Makefile:16347: all-recursive] Error 1
> | make: *** [Makefile:3670: all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> ERROR: Task
> (mc:k3r5:virtual:native:/home/rpjday/oe/layers/walnascar/poky/meta/recipes-support/re2c/re2c_4.1.bb:do_compile)
> failed with exit code '1'
> 
> I can clean everything and start from scratch, but does this any of
> this look familiar?  Am I using the correct branches?
> 
> rday
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18657): https://lists.yoctoproject.org/g/meta-ti/message/18657
> Mute This Topic: https://lists.yoctoproject.org/mt/113723766/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

