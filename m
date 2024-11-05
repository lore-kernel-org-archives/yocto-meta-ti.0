Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A92AD1CA0F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 00:21:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6176.1730766100675918515
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 16:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pqWSpNnT;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A50LcJ1097169;
	Mon, 4 Nov 2024 18:21:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730766098;
	bh=Q+okPVIfqXglEVrc0KBYuWshDdPBAtFXePzCT2/y4J0=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=pqWSpNnTShn5xo1YAhpdvQFbIaVbb51wQ4d3LdvnC7iA6BIi7qLgNNyx4EbYQZGqK
	 rqvyrgD1vnMsSxtEt1Eka/Grtdpx+PxsZi17V3AZ2b4/E5qIO92C4JNssTkc9ThWWC
	 JmVcV/cGqfI2nQ/kYTqnjFppxsI85wYlonaat704=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A50LcDE020956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Nov 2024 18:21:38 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 18:21:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 18:21:38 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A50Lchn019411;
	Mon, 4 Nov 2024 18:21:38 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 4 Nov 2024 18:21:38 -0600
Message-ID: <D5DTDL43NXG4.19KQV0GSN7UUG@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] mesa-pvr: Fix build issues
 with llvm 18+
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241104194638.14864-1-reatmon@ti.com>
 <D5DQS43VL7FF.3AYS98PYYLZKQ@ti.com>
 <bdd2942e-a2a5-4bd1-906d-34ef8fba833c@ti.com>
In-Reply-To: <bdd2942e-a2a5-4bd1-906d-34ef8fba833c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Nov 2024 00:21:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18040

On Mon Nov 4, 2024 at 4:37 PM CST, Ryan Eatmon wrote:
> On 11/4/2024 4:19 PM, Randolph Sapp wrote:
> > On Mon Nov 4, 2024 at 1:46 PM CST, Ryan Eatmon via lists.yoctoproject.o=
rg wrote:
> >> Backport two fixes from the latest mesa project to fix two builds issu=
es
> >> related to newer llvm versions.
> >>
> >> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >> ---
> >>   ...allium-Fix-build-with-llvm-18-and-19.patch | 53 +++++++++++++++++=
++
> >>   .../recipes-graphics/mesa/mesa-pvr_23.2.1.bb  |  1 +
> >>   2 files changed, 54 insertions(+)
> >>   create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1=
/0001-gallium-Fix-build-with-llvm-18-and-19.patch
> >>
> >> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-ga=
llium-Fix-build-with-llvm-18-and-19.patch b/meta-ti-bsp/recipes-graphics/me=
sa/mesa-pvr-23.2.1/0001-gallium-Fix-build-with-llvm-18-and-19.patch
> >> new file mode 100644
> >> index 00000000..ad5059f1
> >> --- /dev/null
> >> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-23.2.1/0001-gallium-F=
ix-build-with-llvm-18-and-19.patch
> >> @@ -0,0 +1,53 @@
> >> +From 6c5033bb01a3a1341d4db5007586a5f2e2727b0a Mon Sep 17 00:00:00 200=
1
> >> +From: Ryan Eatmon <reatmon@ti.com>
> >> +Date: Mon, 4 Nov 2024 13:37:29 -0600
> >> +Subject: [PATCH] gallium: Fix build with llvm 18 and 19
> >> +
> >> +- CodeGenOpt::Level changed to CodeGenOoptLevel. [1]
> >> +- llvm::sys::getHostCPUFeatures() now returns the features instead of
> >> +modifying the passed in argument. [2]
> >> +
> >> +Upstream-Status: Backport [1][https://gitlab.freedesktop.org/mesa/mes=
a/-/commit/f79617fe804ea6524651ff1bc3a91098d3199179]
> >> +Upstream-Status: Backport [2][https://gitlab.freedesktop.org/mesa/mes=
a/-/commit/fa9cd89a85b904615ebc11da609445b5b751e68d]
> >> +
> >> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >> +---
> >> + src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 14 ++++++++++++--
> >> + 1 file changed, 12 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gall=
ium/auxiliary/gallivm/lp_bld_misc.cpp
> >> +index 5e7a30a6cc2..dbc777e3096 100644
> >> +--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> >> ++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
> >> +@@ -366,7 +366,11 @@ lp_build_create_jit_compiler_for_module(LLVMExec=
utionEngineRef *OutJIT,
> >> +    builder.setEngineKind(EngineKind::JIT)
> >> +           .setErrorStr(&Error)
> >> +           .setTargetOptions(options)
> >> ++#if LLVM_VERSION_MAJOR >=3D 18
> >> ++          .setOptLevel((CodeGenOptLevel)OptLevel);
> >> ++#else
> >> +           .setOptLevel((CodeGenOpt::Level)OptLevel);
> >> ++#endif
> >> +
> >> + #if DETECT_OS_WINDOWS
> >> +     /*
> >> +@@ -394,8 +398,14 @@ lp_build_create_jit_compiler_for_module(LLVMExec=
utionEngineRef *OutJIT,
> >> +     * which allows us to enable/disable code generation based
> >> +     * on the results of cpuid on these architectures.
> >> +     */
> >> +-   llvm::StringMap<bool> features;
> >> +-   llvm::sys::getHostCPUFeatures(features);
> >> ++   #if LLVM_VERSION_MAJOR >=3D 19
> >> ++      /* llvm-19+ returns StringMap from getHostCPUFeatures.
> >> ++      */
> >> ++      auto features =3D llvm::sys::getHostCPUFeatures();
> >> ++   #else
> >> ++      llvm::StringMap<bool> features;
> >> ++      llvm::sys::getHostCPUFeatures(features);
> >> ++   #endif
> >> +
> >> +    for (StringMapIterator<bool> f =3D features.begin();
> >> +         f !=3D features.end();
> >> +--
> >> +2.17.1
> >> +
> >> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb b/me=
ta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> >> index 21134bc7..33af456d 100644
> >> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> >> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_23.2.1.bb
> >> @@ -16,6 +16,7 @@ SRC_URI =3D " \
> >>       file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
> >>       file://0001-gallium-Fix-build-with-llvm-17.patch \
> >>       file://0001-meson-Disable-cmake-dependency-detector-for-llvm.pat=
ch \
> >> +    file://0001-gallium-Fix-build-with-llvm-18-and-19.patch \
> >>   "
> >>  =20
> >>   S =3D "${WORKDIR}/git"
> >=20
> > Thanks Ryan! Since it's an upstream commit, I can carry it on the power=
vr mesa
> > branches directly, if that's preferable. Up to you.
>
> That's up to you.  But you will need to fix both of the versions.

Suppose it makes more sense to keep it here then. This is a rather unusual
configuration.

> > Worth noting that in my tests right now I'm seeing a runtime fault. Don=
't
> > believe it's related to this patch but I would be cautious enabling
> > gallium-llvmpipe at this moment.
>
> I'll hold off on accepting it while you fully test it.  Just let me know.

Fix for that posted to meta-arago. Good to go here.

> > Reviewed-by: Randolph Sapp <rs@ti.com>

