Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B60EE77188
	for <webhook@archiver.kernel.org>; Sat, 11 Jan 2025 00:46:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6569.1736556354368246819
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 16:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6E47B40C2B;
	Sat, 11 Jan 2025 00:45:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5P0dpHGjq9wd; Sat, 11 Jan 2025 00:45:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4239540021;
	Sat, 11 Jan 2025 00:45:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9F01A16415A; Fri, 10 Jan 2025 19:45:50 -0500 (EST)
Date: Fri, 10 Jan 2025 19:45:50 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: afd@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH v2] ti-bsp: Disable GC320
 support conditionally on BSP version
Message-ID: <20250111004550.GF21836@denix.org>
References: <20250108205145.542754-1-afd@ti.com>
 <20250110180624.GE21836@denix.org>
 <18196B9D6FC9E354.10803@lists.yoctoproject.org>
 <3021224f-197b-46ef-8218-7862100f3ce7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3021224f-197b-46ef-8218-7862100f3ce7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 11 Jan 2025 00:46:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18187

On Fri, Jan 10, 2025 at 02:00:26PM -0600, Ryan Eatmon wrote:
>=20
>=20
> On 1/10/2025 1:30 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> >On 1/10/2025 12:06 PM, Denys Dmytriyenko wrote:
> >>On Wed, Jan 08, 2025 at 02:51:45PM -0600, Andrew Davis via
> >>lists.yoctoproject.org wrote:
> >>>Like we do with GPU support, GC320 support is conditional on the
> >>>kernel we are building and so should be disabled here for kernels
> >>>on which it is not functional yet.
> >>>
> >>>We can then remove these disabling lines as the driver is updated
> >>>for each supported kernel, instead of blanket disabling in the
> >>>distro layer as done currently.
> >>>
> >>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>---
> >>>
> >>>Changes for v2:
> >>>=A0 - Rebased on latest with new meta-beagle layer
> >>>
> >>>=A0 meta-beagle/conf/machine/include/beagle-bsp.inc |=A0 6 ++++++
> >>>=A0 meta-ti-bsp/conf/machine/include/ti-bsp.inc=A0=A0=A0=A0 | 15 +++=
++++++++++++
> >>>=A0 2 files changed, 21 insertions(+)
> >>>
> >>>diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc
> >>>b/meta-beagle/conf/machine/include/beagle-bsp.inc
> >>>index 34889b41..06483ba9 100644
> >>>--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
> >>>+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
> >>>@@ -23,6 +23,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 =3D "23%"
> >>>=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 =3D "23%"
> >>>=A0 BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 =3D "22%"
> >>>+# GC320 support requires out-of-tree drivers not yet
> >>>available in bb.org 6.1
> >>>+MACHINE_FEATURES:remove:bsp-bb_org-6_1 =3D "gc320"
> >>>+
> >>>=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>=A0 # bb_org-6_6
> >>>=A0 # BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
> >>>@@ -41,3 +44,6 @@ BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D
> >>>"ti-img-rogue-driver"
> >>>=A0 BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "24%"
> >>>=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 =3D "24%"
> >>>=A0 BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "23%"
> >>>+
> >>>+# GC320 support requires out-of-tree drivers not yet
> >>>available in bb.org 6.6
> >>>+MACHINE_FEATURES:remove:bsp-bb_org-6_6 =3D "gc320"
> >>>diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>>b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>>index 4bbe7668..6773bb7a 100644
> >>>--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>>+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>>@@ -22,6 +22,9 @@ BSP_BOOTLOADER_VERSION:bsp-mainline =3D "%"
> >>>=A0 # in mainline, usually present in TI staging or derivative like =
BB.org
> >>>=A0 MACHINE_FEATURES:remove:bsp-mainline =3D "gpu"
> >>>+# GC320 support requires out-of-tree drivers not available in mainl=
ine
> >>>+MACHINE_FEATURES:remove:bsp-mainline =3D "gc320"
> >>>+
> >>>=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>=A0 # next
> >>>=A0 # upcoming upstream/mainline kernel, u-boot
> >>>@@ -35,6 +38,9 @@ BSP_BOOTLOADER_VERSION:bsp-next =3D "%"
> >>>=A0 # in next, usually present in TI staging or derivative like BB.o=
rg
> >>>=A0 MACHINE_FEATURES:remove:bsp-next =3D "gpu"
> >>>+# GC320 support requires out-of-tree drivers not available in next
> >>>+MACHINE_FEATURES:remove:bsp-next =3D "gc320"
> >>
> >>Andrew, Ryan,
> >>
> >>Something went wrong here ^^^
> >>Instead of removing "gc320" for bsp-next, like in the patch here, it =
got
> >>committed removing it for bsp-ti-6_12 twice:
> >>
> >>https://git.yoctoproject.org/meta-ti/commit/?h=3Dmaster-wip&id=3Dfe0b=
35f5f135b98d1ee0f8fe2488b10fbe9a7bb3
> >>
> >>Was there any manual massaging involved?
> >
> >Yes.=A0 I did.=A0 Let me look at it.
>=20
> Fixed on master-wip, scarthgap-wip was correct.

bsp-ti-6_next ?


> >>>+
> >>>=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>=A0 # ti-6_12
> >>>=A0 # TI staging kernel 6.12, u-boot 2024.10
> >>>@@ -48,6 +54,9 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 =3D "2024.10%"
> >>>=A0 # in 6.12 yet
> >>>=A0 MACHINE_FEATURES:remove:bsp-ti-6_12 =3D "gpu"
> >>>+# GC320 support requires out-of-tree drivers not yet available in 6=
.12
> >>>+MACHINE_FEATURES:remove:bsp-ti-6_12 =3D "gc320"
> >>>+
> >>>=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>=A0 # ti-6_6
> >>>=A0 # TI staging kernel 6.6, u-boot 2024.04
> >>>@@ -65,6 +74,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "24%"
> >>>=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 =3D "24%"
> >>>=A0 BSP_MESA_PVR_VERSION:bsp-ti-6_6 =3D "23%"
> >>>+# GC320 support requires out-of-tree drivers not yet available in 6=
.6
> >>>+MACHINE_FEATURES:remove:bsp-ti-6_6 =3D "gc320"
> >>>+
> >>>=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>=A0 # ti-6_1
> >>>=A0 # TI staging kernel 6.1, u-boot 2023.04
> >>>@@ -82,6 +94,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 =3D "23%"
> >>>=A0 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 =3D "23%"
> >>>=A0 BSP_MESA_PVR_VERSION:bsp-ti-6_1 =3D "22%"
> >>>+# GC320 support requires out-of-tree drivers not yet available in 6=
.1
> >>>+MACHINE_FEATURES:remove:bsp-ti-6_1 =3D "gc320"
> >>>+
> >>>=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>=A0 # sane fallback defaults
> >>>=A0 # if specific values are not defined or bsp is set incorrectly
> >>>--=20
> >>>2.39.2

