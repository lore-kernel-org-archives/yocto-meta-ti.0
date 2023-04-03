Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29652C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 13:48:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.70868.1680529688660181539
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Apr 2023 06:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ME5pNu6a;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7F4051BF215;
	Mon,  3 Apr 2023 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680529687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Du+VHAHaNLAhqp1Ko0CcPypKg3Yl+1ei9BoFe0usqDE=;
	b=ME5pNu6aw8C6f8i84y5jP5KWwgjQT1hoq8e+zD3GX52Cyy2qE5JlEpq7blwc0wz3rU8r6H
	GpWMl6KOmzmxoHvvOGIXYWR414NuDmLM11EF/z9044F2FMrzhBHqtyhVYk7Ymg2mNJ//Hw
	vHRJrpTUXCt1pknxkx2t/WOCNC44wD6fB6H1JfNhjJxKwJfPOB2c6FHxVBHkACsm97AiHL
	63HAjuIhU+rY0s5t9L/JEtetp5XbwLdoAts7hKkDv8K1veQJJcgfn505cZNr6THMp6PBB5
	lg8b00W97zZRPBSfH4bD361XAMa5l6SPFbH5BGaR76PS+tguPc0hhPoaZ9nV2w==
Date: Mon, 3 Apr 2023 15:48:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: check-layer failures for meta-ti
Message-ID: <202304031348055bba498e@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Apr 2023 13:48:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16284

Hello,

meta-ti is currently failing check-layer-nightly:


https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1272/steps/19/logs/stdio

AssertionError: Adding layer meta-ti-bsp changed signatures.
10 signatures changed, initial differences (first hash before, second after):
   optee-client:do_prepare_recipe_sysroot: 3f4e44718ab8f2398d5cc145fcdd481d1813a7afb7d028aa5ff67617fec69885 -> 06b063bf17bd8534f2ffc2506780d02c221cca3273863d3ca2548f2031c3ff92
      bitbake-diffsigs --task optee-client do_prepare_recipe_sysroot --signature 3f4e44718ab8f2398d5cc145fcdd481d1813a7afb7d028aa5ff67617fec69885 06b063bf17bd8534f2ffc2506780d02c221cca3273863d3ca2548f2031c3ff92
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['cmake/cmake-native_3.22.3.bb:do_populate_sysroot gcc/gcc-cross_11.3.bb:do_populate_sysroot gcc/gcc-runtime_11.3.bb:do_populate_sysroot glibc/glibc_2.35.bb:do_populate_sysroot ninja/ninja_1.10.2.bb:do_populate_sysroot:virtual:native optee/optee-client_3.16.0.bb:do_fetch', +pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native, 'pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot']
      Number of task dependencies changed
      Dependency on task pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virtual:native was added with hash cf8a9ff6ed2d492aeeeeeb3972365104425b5424377cf5e4a4fc76bb53a4f628


There as also this one over the week end:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1268/steps/20/logs/stdio


AssertionError: 3 != 0 : Found following patches with malformed or missing upstream status:
/home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw/0001-Add-Makefile-to-install-firmware-files.patch
/home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
/home/pokybuild/yocto-worker/check-layer-nightly/build/meta-ti/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts/0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

