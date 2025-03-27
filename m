Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0530CC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 22:00:35 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1507.1743112829511819781
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 15:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TXFhn5HU;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52RM0NIa1941242
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 17:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743112823;
	bh=DPHJfBPgloLjz/mJU5LZQuUm5efVbhEqNXqZjfq8Jzo=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=TXFhn5HUYHKg2RRIH6mxBqx/8MqoTqJZLweo6bgblldqHqkriRFBbi/QxUNxJaHZT
	 +Qaw1EnS6ZkqucTFS9vQZt2VvpUQYhL0OdyNNuRimL6e64qtxNX38xScHUKWYlCJYC
	 kGM/m2QIMmVkVT9LoUOSRb0DWNrIPbrlP1Y9XjpM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52RM0NVw091061
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 17:00:23 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 17:00:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 17:00:23 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52RM0Nt2007371;
	Thu, 27 Mar 2025 17:00:23 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Mar 2025 17:00:23 -0500
Message-ID: <D8RDXC64OZPQ.1SGKK0TUEJU4@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] Postinstall scriptlets of ['ti-sgx-ddk-um'] have
 failed.
From: Randolph Sapp <rs@ti.com>
To: Randolph Sapp <rs@ti.com>, <alex.kiernan@gmail.com>,
        <sebastian.krahl@lacon.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <vr9P.1743087135909863464.R6f8@lists.yoctoproject.org>
 <CAO5Uq5QZhqoxA4H0D+b=mTzo_tYOTYU-un1fD2XbCSyLimN3CA@mail.gmail.com>
 <D8RCABOSAGVD.2LWQZFHF2TJCR@ti.com>
In-Reply-To: <D8RCABOSAGVD.2LWQZFHF2TJCR@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 22:00:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18431

Ah, it's a combination of udev and sysvinit parameters. Those two should
actually clash in the recipe, as they clash in the repo Makefile.

Udev, if available should be preferred, falling back to systemd or sysvinit=
 if
we do not have a udev provider. The following patch should resolve that:

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17=
.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.1=
7.4948957.bb
index 98bdec08..849308d9 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.494895=
7.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.494895=
7.bb
@@ -17,14 +17,22 @@ SRCREV =3D "84a396a4fb379f10931421e489ac8a199d6a9f2c"
=20
 INITSCRIPT_NAME =3D "rc.pvr"
 INITSCRIPT_PARAMS =3D "defaults 8"
+SYSTEMD_SERVICE:${PN} =3D "pvrsrvctl.service"
=20
 PACKAGECONFIG ??=3D "udev"
-PACKAGECONFIG[udev] =3D "UDEV=3Dtrue,,,udev"
-
-def use_sysvinit(d):
-    return d.getVar('VIRTUAL-RUNTIME_init_manager') =3D=3D 'sysvinit'
-
-inherit ${@oe.utils.ifelse(use_sysvinit(d), 'update-rc.d', '')}
+PACKAGECONFIG[udev] =3D "UDEV=3Dtrue,UDEV=3Dfalse,,udev,,sysvinit systemd"
+PACKAGECONFIG[sysvinit] =3D ",,,,,udev systemd"
+PACKAGECONFIG[systemd] =3D "SYSTEMD=3Dtrue,SYSTEMD=3Dfalse,,,,udev sysvini=
t"
+
+def pick_init(d):
+    packageconfig =3D d.getVar('PACKAGECONFIG').split()
+    if 'udev' not in packageconfig:
+        if d.getVar('VIRTUAL-RUNTIME_init_manager') =3D=3D 'sysvinit':
+            return "update-rc.d"
+        return "systemd"
+    return ""
+
+inherit ${@pick_init(d)}
=20
 TARGET_PRODUCT:ti33x =3D "ti335x_linux"
 TARGET_PRODUCT:ti43x =3D "ti437x_linux"

On Thu Mar 27, 2025 at 3:43 PM CDT, Randolph Sapp wrote:
> That recipe postinst script should consist of only the following under a =
systemd
> machine:
>
> #!/bin/sh
> set -e
> if [ x"$D" =3D "x" ]; then
> 	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
> fi
>
> Under sysvinit it should be:
>
> #!/bin/sh
> set -e
> if true && type update-rc.d >/dev/null 2>/dev/null; then
> 	if [ -n "$D" ]; then
> 		OPT=3D"-r $D"
> 	else
> 		OPT=3D"-s"
> 	fi
> 	update-rc.d $OPT rc.pvr defaults 8
> fi
> if [ x"$D" =3D "x" ]; then
> 	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
> fi
>
> "Deferring to first boot via 'exit 1'" should not be what's occuring here=
. I'm
> setting up a little test to verify with MACHINE=3Dam335x-evm, but I don't=
 really
> know how you got to this error, aside from missing ldconfig or some issue=
 with
> update-rc.d.
>
> On Thu Mar 27, 2025 at 10:22 AM CDT, Alex Kiernan via lists.yoctoproject.=
org wrote:
>> The postinstall script in ti-sgx-ddk-um failed - look at the
>> referenced log file, hopefully you'll get a clue as to what/why.
>>
>> Assuming its this recipe:
>>
>> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-graphics/p=
owervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone
>>
>> I'd guess its something about the init script setup (update-rc.d adds
>> a postinstall scriptlet).
>>
>> On Thu, Mar 27, 2025 at 2:52=E2=80=AFPM Sebastian via lists.yoctoproject=
.org
>> <sebastian.krahl=3Dlacon.de@lists.yoctoproject.org> wrote:
>>>
>>> Hey there,
>>>
>>> actually I'm frustrated, I don't know where I'm going wrong.
>>>
>>> My setup:
>>> Build Configuration:
>>> BB_VERSION           =3D "2.0.0"
>>> BUILD_SYS            =3D "x86_64-linux"
>>> NATIVELSBSTRING      =3D "universal"
>>> TARGET_SYS           =3D "arm-poky-linux-gnueabi"
>>> MACHINE              =3D "beaglebone"
>>> DISTRO               =3D "poky"
>>> DISTRO_VERSION       =3D "4.0.25"
>>> TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard=
"
>>> TARGET_FPU           =3D "hard"
>>> meta
>>> meta-poky            =3D "kirkstone:b210ed67de098a78a577baf464fae569d02=
0de62"
>>> meta-arm-toolchain
>>> meta-arm             =3D "kirkstone:936c02ec13661bd86a05f7f90e1b920d509=
2d670"
>>> meta-ti-bsp
>>> meta-ti-extras       =3D "kirkstone:98c5c3d732334a26d57cb3534230e858d96=
db0c6"
>>> meta-oe              =3D "kirkstone:7e18b3fc774b7efabf9a20ae3cd6abd0e07=
15b59"
>>>
>>> I want to build the core-image-sato but it fails with:
>>> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti=
-sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
>>> then please place them into pkg_postinst_ontarget:${PN} ().
>>> Deferring to first boot via 'exit 1' is no longer supported.
>>> Details of the failure are in /home/lacon/yocto/build/tmp/work/beaglebo=
ne-poky-linux-gnueabi/core-image-sato/1.0-r0/temp/log.do_rootfs.
>>> ERROR: Logfile of failure stored in: /home/lacon/yocto/build/tmp/work/b=
eaglebone-poky-linux-gnueabi/core-image-sato/1.0-r0/temp/log.do_rootfs.2353=
4
>>> ERROR: Task (/home/lacon/yocto/poky/meta/recipes-sato/images/core-image=
-sato.bb:do_rootfs) failed with exit code '1'
>>>
>>> Can anyone help to progress further?
>>>
>>> Regards,
>>>
>>> Sebastian
>>>
>>>=20
>>>


