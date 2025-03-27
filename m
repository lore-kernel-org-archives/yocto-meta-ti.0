Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02165C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 20:43:29 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.6549.1743108204231428690
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 13:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C2EAxmA0;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52RKhJ1R2511609
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 15:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743108199;
	bh=LmCGuye7LCSmRgR/tpFp+svw6m1nP7RQZhyUxmDe5eY=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=C2EAxmA0WG/dbgi+M4k0f/2InJhtX6irIWys5AcXVpcIPGPWBF7ePpP3OybaWbQp9
	 B7/xn2DX3ZjpT1djKUX5GsNwui+H4Leea/0ZLScep+wjT2+Uf3/uDfo85N337iapX+
	 Ckz1z/1P2O8skeuqF6hl/sbvgj3FwG8E2cb4xG6Q=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52RKhJ0C076589
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 15:43:19 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 15:43:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 15:43:18 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52RKhIau053959;
	Thu, 27 Mar 2025 15:43:18 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Mar 2025 15:43:18 -0500
Message-ID: <D8RCABOSAGVD.2LWQZFHF2TJCR@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] Postinstall scriptlets of ['ti-sgx-ddk-um'] have
 failed.
From: Randolph Sapp <rs@ti.com>
To: <alex.kiernan@gmail.com>, <sebastian.krahl@lacon.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <vr9P.1743087135909863464.R6f8@lists.yoctoproject.org>
 <CAO5Uq5QZhqoxA4H0D+b=mTzo_tYOTYU-un1fD2XbCSyLimN3CA@mail.gmail.com>
In-Reply-To: <CAO5Uq5QZhqoxA4H0D+b=mTzo_tYOTYU-un1fD2XbCSyLimN3CA@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 20:43:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18430

That recipe postinst script should consist of only the following under a sy=
stemd
machine:

#!/bin/sh
set -e
if [ x"$D" =3D "x" ]; then
	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
fi

Under sysvinit it should be:

#!/bin/sh
set -e
if true && type update-rc.d >/dev/null 2>/dev/null; then
	if [ -n "$D" ]; then
		OPT=3D"-r $D"
	else
		OPT=3D"-s"
	fi
	update-rc.d $OPT rc.pvr defaults 8
fi
if [ x"$D" =3D "x" ]; then
	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
fi

"Deferring to first boot via 'exit 1'" should not be what's occuring here. =
I'm
setting up a little test to verify with MACHINE=3Dam335x-evm, but I don't r=
eally
know how you got to this error, aside from missing ldconfig or some issue w=
ith
update-rc.d.

On Thu Mar 27, 2025 at 10:22 AM CDT, Alex Kiernan via lists.yoctoproject.or=
g wrote:
> The postinstall script in ti-sgx-ddk-um failed - look at the
> referenced log file, hopefully you'll get a clue as to what/why.
>
> Assuming its this recipe:
>
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-graphics/po=
wervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb?h=3Dkirkstone
>
> I'd guess its something about the init script setup (update-rc.d adds
> a postinstall scriptlet).
>
> On Thu, Mar 27, 2025 at 2:52=E2=80=AFPM Sebastian via lists.yoctoproject.=
org
> <sebastian.krahl=3Dlacon.de@lists.yoctoproject.org> wrote:
>>
>> Hey there,
>>
>> actually I'm frustrated, I don't know where I'm going wrong.
>>
>> My setup:
>> Build Configuration:
>> BB_VERSION           =3D "2.0.0"
>> BUILD_SYS            =3D "x86_64-linux"
>> NATIVELSBSTRING      =3D "universal"
>> TARGET_SYS           =3D "arm-poky-linux-gnueabi"
>> MACHINE              =3D "beaglebone"
>> DISTRO               =3D "poky"
>> DISTRO_VERSION       =3D "4.0.25"
>> TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard"
>> TARGET_FPU           =3D "hard"
>> meta
>> meta-poky            =3D "kirkstone:b210ed67de098a78a577baf464fae569d020=
de62"
>> meta-arm-toolchain
>> meta-arm             =3D "kirkstone:936c02ec13661bd86a05f7f90e1b920d5092=
d670"
>> meta-ti-bsp
>> meta-ti-extras       =3D "kirkstone:98c5c3d732334a26d57cb3534230e858d96d=
b0c6"
>> meta-oe              =3D "kirkstone:7e18b3fc774b7efabf9a20ae3cd6abd0e071=
5b59"
>>
>> I want to build the core-image-sato but it fails with:
>> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['ti-=
sgx-ddk-um'] have failed. If the intention is to defer them to first boot,
>> then please place them into pkg_postinst_ontarget:${PN} ().
>> Deferring to first boot via 'exit 1' is no longer supported.
>> Details of the failure are in /home/lacon/yocto/build/tmp/work/beaglebon=
e-poky-linux-gnueabi/core-image-sato/1.0-r0/temp/log.do_rootfs.
>> ERROR: Logfile of failure stored in: /home/lacon/yocto/build/tmp/work/be=
aglebone-poky-linux-gnueabi/core-image-sato/1.0-r0/temp/log.do_rootfs.23534
>> ERROR: Task (/home/lacon/yocto/poky/meta/recipes-sato/images/core-image-=
sato.bb:do_rootfs) failed with exit code '1'
>>
>> Can anyone help to progress further?
>>
>> Regards,
>>
>> Sebastian
>>
>>=20
>>


