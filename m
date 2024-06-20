Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334D2C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 22:19:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.60069.1718921946404040996
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 15:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zUAKbBcH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KMJ2ww084541;
	Thu, 20 Jun 2024 17:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718921942;
	bh=GVqe4Ien305cUK3K7W5415q+CHWEmVH62d9mVmD0e08=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=zUAKbBcHhrYkdZCtM5m1jOsROLmDjjiqJOSEeUE9MoO/b92l5gPK//FJkse1QLK+L
	 iOeD1tu4XD0178/o+ptkNGc5Zl2DsdQ+x0tBxQPAvG7v91x4vu/6ezUxFnNV+jI153
	 Hmp12gp4Qybe/YHNz5zo2fUe9vDOe1juFy7gl/EA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KMJ26g122958
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 17:19:02 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 17:19:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 17:19:02 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KMJ2XD126525;
	Thu, 20 Jun 2024 17:19:02 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 20 Jun 2024 17:19:02 -0500
Message-ID: <D256Z2T8ODIQ.3QHIKMFVM8NSY@ti.com>
CC: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-ti][PATCH] ti-img-rogue-driver_23.3.6512818: fix compile
 time error
From: Randolph Sapp <rs@ti.com>
To: Max Krummenacher <max.oss.09@gmail.com>, <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.17.0
References: <20240619173253.1484039-1-max.oss.09@gmail.com>
In-Reply-To: <20240619173253.1484039-1-max.oss.09@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 22:19:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17786

On Wed Jun 19, 2024 at 12:32 PM CDT, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> GCC-14 set more warnings to errors, demote the ones which trigger to a wa=
rning.
> This is when building bsp-ti-6_1. I did not notice it when building bsp-t=
i-6_6
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  ...dvars.mk-demote-some-errors-to-warni.patch | 35 +++++++++++++++++++
>  .../ti-img-rogue-driver_23.3.6512818.bb       |  5 ++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-=
driver-23.3.6512818/0001-build-linux-buildvars.mk-demote-some-errors-to-war=
ni.patch
>
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver-=
23.3.6512818/0001-build-linux-buildvars.mk-demote-some-errors-to-warni.patc=
h b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver-23.3.651281=
8/0001-build-linux-buildvars.mk-demote-some-errors-to-warni.patch
> new file mode 100644
> index 000000000000..deb6dfbe1c52
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver-23.3.65=
12818/0001-build-linux-buildvars.mk-demote-some-errors-to-warni.patch
> @@ -0,0 +1,35 @@
> +From 9800beec79d13690a80f1796d67be8346c31b27d Mon Sep 17 00:00:00 2001
> +From: Max Krummenacher <max.krummenacher@toradex.com>
> +Date: Thu, 13 Jun 2024 14:46:52 +0000
> +Subject: [PATCH] build/linux/buildvars.mk: demote some errors to warning=
s
> +
> +With GCC-14 I get compile time errors with the following patterns:
> +
> +.../work-shared/am62xx-evm/kernel-source/arch/arm64/include/asm/cpufeatu=
re.h:696:21: error: comparison of unsigned expression in '>=3D 0' is always=
 true [-Werror=3Dtype-limits]
> +  696 |         return (val >=3D ID_AA64MMFR0_EL1_TGRAN4_SUPPORTED_MIN) =
&&
> +
> +| .../work/am62xx_evm-oe-linux/ti-img-rogue-driver/23.3.6512818/git/bina=
ry_am62_linux_lws-generic_release/target_aarch64/kbuild/services/server/dev=
ices/rgxfwcmnctx.c:144:9: error: missing initializer for field 'psCCB' of '=
RGXFWIF_FWCOMMONCONTEXT' {aka 'struct RGXFWIF_FWCOMMONCONTEXT_'} [-Werror=
=3Dmissing-field-initializers]
> +|  144 |         RGXFWIF_FWCOMMONCONTEXT sFWCommonContext =3D { { 0 } };
> +
> +Upstream-Status: Pending
> +Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> +---
> + build/linux/buildvars.mk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/build/linux/buildvars.mk b/build/linux/buildvars.mk
> +index ec5b14a01197..e387a56584b9 100644
> +--- a/build/linux/buildvars.mk
> ++++ b/build/linux/buildvars.mk
> +@@ -51,7 +51,7 @@
> +=20
> + # These flags are used for kernel, User C and User C++
> + #
> +-COMMON_FLAGS :=3D -W -Wall
> ++COMMON_FLAGS :=3D -W -Wall -Wno-error=3Dmissing-field-initializers -Wno=
-error=3Dtype-limits
> +=20
> + # Enable 64-bit file & memory handling on 32-bit systems.
> + #
> +--=20
> +2.42.0
> +
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driv=
er_23.3.6512818.bb
> index 34c22cb2adf5..a7318fd6cf9c 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
> @@ -15,7 +15,10 @@ DEPENDS =3D "virtual/kernel"
> =20
>  BRANCH =3D "linuxws/scarthgap/k6.6/${PV}"
> =20
> -SRC_URI =3D "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
> +SRC_URI =3D " \
> +    git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=3Dhtt=
ps;branch=3D${BRANCH} \
> +    file://0001-build-linux-buildvars.mk-demote-some-errors-to-warni.pat=
ch \
> +"
> =20
>  S =3D "${WORKDIR}/git"
> =20

Do not merge this patch.

Thanks for bringing this to my attention. This workaround actually pointed =
out
that the build/linux/tools/cc-check.sh script that both the um and km compo=
nents
use to check compiler flags was actually flawed for GCC 14.

I hadn't noticed because the build hides logs from that script but it was
passing a program known to fail to GCC and then expecting that to return 0.=
 In
GCC 14 this returns 1 and does not produce an output object. On top of that
unrecognized command line flags moved from warnings to notes. These changes
break every check in that script.

I'll update upstream for this.

