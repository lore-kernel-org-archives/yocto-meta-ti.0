Return-Path: <kaijun61@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901BEC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 10:41:02 +0000 (UTC)
Subject: out-of-tree kernel module build issue against another out-of-tree one for kernel 5.19.10
To: meta-ti@lists.yoctoproject.org
From: kaijun61@gmail.com
X-Originating-Location: Slough, England, GB (151.230.125.231)
X-Originating-Platform: Linux Chrome 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 18 Jul 2025 03:40:57 -0700
Message-ID: <C736.1752835257965092422.JNxg@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Jul 2025 10:41:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18799

I am rebuilding out-of-tree ti-local-power manager module lpm_omap3530 for =
kernel 5.19.10, the module depends on ti-dsplink module which has been buil=
t out-of-tree. When the module tries to link to ti-dsplink module, it can n=
ot find some exported symbols from ti-dsplink.
Those symbols have been EXPORT_SYMBOLed in ti-dsplink, and ti-dsplink Modul=
e.symvers has been copied to the module directory too.
When I built them under kernel 3.10 long time ago, it had no problem, here =
is log
|   CC [M]  /home/kaijun/Projects/build/tmp/work/beagleboard-poky-linux-gnu=
eabi/ti-local-power-manager/1_1_24_03_11-r0/git/packages/ti/bios/power/modu=
les/omap3530/lpm/lpm_driver.o
|   CC [M]  /home/kaijun/Projects/build/tmp/work/beagleboard-poky-linux-gnu=
eabi/ti-local-power-manager/1_1_24_03_11-r0/git/packages/ti/bios/power/modu=
les/omap3530/lpm/lpm_omap.o
|   CC [M]  /home/kaijun/Projects/build/tmp/work/beagleboard-poky-linux-gnu=
eabi/ti-local-power-manager/1_1_24_03_11-r0/git/packages/ti/bios/power/modu=
les/omap3530/lpm/tal_dsplink_gpp.o
|   LD [M]  /home/kaijun/Projects/build/tmp/work/beagleboard-poky-linux-gnu=
eabi/ti-local-power-manager/1_1_24_03_11-r0/git/packages/ti/bios/power/modu=
les/omap3530/lpm/lpm_omap3530.o
|   MODPOST /home/kaijun/Projects/build/tmp/work/beagleboard-poky-linux-gnu=
eabi/ti-local-power-manager/1_1_24_03_11-r0/git/packages/ti/bios/power/modu=
les/omap3530/lpm/Module.symvers
| ERROR: modpost: "IPS_notify" [/home/kaijun/Projects/build/tmp/work/beagle=
board-poky-linux-gnueabi/ti-local-power-manager/1_1_24_03_11-r0/git/package=
s/ti/bios/power/modules/omap3530/lpm/lpm_omap3530.ko] undefined!
| ERROR: modpost: "IPS_register" [/home/kaijun/Projects/build/tmp/work/beag=
leboard-poky-linux-gnueabi/ti-local-power-manager/1_1_24_03_11-r0/git/packa=
ges/ti/bios/power/modules/omap3530/lpm/lpm_omap3530.ko] undefined!
| ERROR: modpost: "IPS_unregister" [/home/kaijun/Projects/build/tmp/work/be=
agleboard-poky-linux-gnueabi/ti-local-power-manager/1_1_24_03_11-r0/git/pac=
kages/ti/bios/power/modules/omap3530/lpm/lpm_omap3530.ko] undefined!
| ERROR: modpost: "LDRV_PROC_setState" [/home/kaijun/Projects/build/tmp/wor=
k/beagleboard-poky-linux-gnueabi/ti-local-power-manager/1_1_24_03_11-r0/git=
/packages/ti/bios/power/modules/omap3530/lpm/lpm_omap3530.ko] undefined!
| ERROR: modpost: "LDRV_PROC_getState" [/home/kaijun/Projects/build/tmp/wor=
k/beagleboard-poky-linux-gnueabi/ti-local-power-manager/1_1_24_03_11-r0/git=
/packages/ti/bios/power/modules/omap3530/lpm/lpm_omap3530.ko] undefined!
| ERROR: modpost: "PMGR_PROC_getSymbolAddress" [/home/kaijun/Projects/build=
/tmp/work/beagleboard-poky-linux-gnueabi/ti-local-power-manager/1_1_24_03_1=
1-r0/git/packages/ti/bios/power/modules/omap3530/lpm/lpm_omap3530.ko] undef=
ined!
| make[2]: *** [/home/kaijun/Projects/build/tmp/work-shared/beagleboard/ker=
nel-source/scripts/Makefile.modpost:128: /home/kaijun/Projects/build/tmp/wo=
rk/beagleboard-poky-linux-gnueabi/ti-local-power-manager/1_1_24_03_11-r0/gi=
t/packages/ti/bios/power/modules/omap3530/lpm/Module.symvers] Error 1
| make[1]: *** [/home/kaijun/Projects/build/tmp/work-shared/beagleboard/ker=
nel-source/Makefile:1757: modules] Error 2
| make[1]: Leaving directory '/home/kaijun/Projects/build/tmp/work-shared/b=
eagleboard/kernel-build-artifacts'

