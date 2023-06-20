Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF1BEB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 20:39:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.827.1687293575802889648
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 13:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8265B40C88;
	Tue, 20 Jun 2023 20:39:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eg5V0IzGsska; Tue, 20 Jun 2023 20:39:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 45D3D40A47;
	Tue, 20 Jun 2023 20:39:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 490D0163B14; Tue, 20 Jun 2023 16:39:29 -0400 (EDT)
Date: Tue, 20 Jun 2023 16:39:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] kernel-rdepends: Add
 ti-eth-fw as an RDEPENDS
Message-ID: <20230620203929.GK1518@denix.org>
References: <20230620170925.19023-1-reatmon@ti.com>
 <20230620180537.GJ1518@denix.org>
 <9f070406-bc65-bfa1-b718-4fe935594183@ti.com>
 <68317d6f-8c87-a0db-12ab-232d2b7403c8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <68317d6f-8c87-a0db-12ab-232d2b7403c8@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Jun 2023 20:39:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16749

On Tue, Jun 20, 2023 at 03:06:01PM -0500, Andrew Davis wrote:
> On 6/20/23 2:17 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >
> >
> >On 6/20/2023 1:05 PM, Denys Dmytriyenko wrote:
> >>On Tue, Jun 20, 2023 at 12:09:25PM -0500, Ryan Eatmon via lists.yocto=
project.org wrote:
> >>>When the ti-eth-fw recipe was split out from the ti-rtos-firmware re=
cipe
> >>>we forgot to add it as a dependency.
> >>>
> >>>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>---
> >>>=A0 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 +++
> >>>=A0 1 file changed, 3 insertions(+)
> >>>
> >>>diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/=
meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> >>>index 18984e80..1f0c1ee8 100644
> >>>--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> >>>+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> >>>@@ -31,3 +31,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =
=3D " vxd-dec-fw"
> >>>=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cnm-wav=
e-fw"
> >>>=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 =3D " cnm-wav=
e-fw"
> >>>=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx =3D " cnm-wa=
ve-fw"
> >>>+
> >>>+# Add run-time dependency for TI ETH firmware to the rootfs
> >>>+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:k3 =3D " ti-eth-fw"
> >>
> >>Though, ETH FW is only enabled on j721e, j7200 and j784s4:
> >>
> >>https://git.yoctoproject.org/meta-ti/commit/?id=3D91e5a1ca6541012e3d4=
285479ecf5a9f353307f9
> >>
> >>ETH_FW_LIST =3D ""
> >>ETH_FW_LIST:j721e =3D=A0=A0 "${ETH_FW}"
> >>ETH_FW_LIST:j7200 =3D=A0=A0 "${ETH_FW}"
> >>ETH_FW_LIST:j721s2 =3D=A0 ""
> >>ETH_FW_LIST:j784s4 =3D=A0 "${ETH_FW}"
> >>ETH_FW_LIST:am65xx =3D=A0 ""
> >>ETH_FW_LIST:am64xx =3D=A0 ""
> >>ETH_FW_LIST:am62xx =3D=A0 ""
> >>ETH_FW_LIST:am62axx =3D ""
> >>
> >>Other platforms generate an empty package w/o the binary in it. So I =
guess for
> >>simpler dependency pulling it for all K3 platforms is an option? On o=
ne hand
> >>it makes kernel dependencies simpler, but executes build/packaging pr=
ocess for
> >>the firmware that ends up being no-op and produce an empty output...
> >
> >Andrew and I talked about.=A0 It seems annoying to have to update two =
files to add a platform, BUT doing it this way does mean we execute the r=
ecipe when the recipe does nothing...
> >
> >This is sort of a holdover from the ti-rtos-firmware way of doing thin=
gs.
> >
> >Let me think about it...
> >
>=20
> Another thing we may want to do is not have this recipe be device speci=
fic,
> it is just a small firmware, no good reason to only deploy one per devi=
ce.
> I'd say we ship all unconditionally in this package, then it won't have=
 to
> be re-built for each device either.

Is the binary identical between the platforms?


> Andrew
>=20
> >>Similar question for DM FW? E.g.:
> >>
> >>https://git.yoctoproject.org/meta-ti/commit/?id=3Db21d29d94694ac49b97=
a1f4ba428c7d8cd6fb64a
> >>
> >>DM_FW_LIST =3D ""
> >>DM_FW_LIST:j721e =3D=A0=A0 "${DM_FIRMWARE}"
> >>DM_FW_LIST:j7200 =3D=A0=A0 "${DM_FIRMWARE}"
> >>DM_FW_LIST:j721s2 =3D=A0 "${DM_FIRMWARE}"
> >>DM_FW_LIST:j784s4 =3D=A0 "${DM_FIRMWARE}"
> >>DM_FW_LIST:am65xx =3D=A0 ""
> >>DM_FW_LIST:am64xx =3D=A0 ""
> >>DM_FW_LIST:am62xx =3D=A0 "${DM_FIRMWARE}"
> >>DM_FW_LIST:am62axx =3D "${DM_FIRMWARE}"

