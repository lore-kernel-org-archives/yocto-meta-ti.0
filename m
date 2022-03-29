Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C545C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 23:27:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.967.1648596442757628617
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Mar 2022 16:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D85B40C2C;
	Tue, 29 Mar 2022 23:26:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACYV2R_RqLvY; Tue, 29 Mar 2022 23:26:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 53E2140A47;
	Tue, 29 Mar 2022 23:26:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8BF171748C5; Tue, 29 Mar 2022 19:26:37 -0400 (EDT)
Date: Tue, 29 Mar 2022 19:26:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Etheridge, Darren" <detheridge@ti.com>
Cc: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
	reatmon@ti.com
Subject: Re: [meta-ti][dunfell][PATCH v2] ti-graphics: gpu enable and move
 all platforms to ddk 1.15
Message-ID: <20220329232637.GZ23554@denix.org>
References: <20220323193707.28162-1-detheridge@ti.com>
 <20220325201007.GG23554@denix.org>
 <9c974b1d-0501-51a8-26ab-b88c617fab5c@ti.com>
 <20220325213849.GI23554@denix.org>
 <1c4a7e86-9d2b-eaf0-f2bb-be04109e4f43@ti.com>
 <20220325220609.GJ23554@denix.org>
 <16DFC054FC61A9B3.21339@lists.yoctoproject.org>
 <29965fda-5ada-3a75-e142-ed84e7dbf524@ti.com>
 <f3526050-3e0a-fc75-446a-023e7bbc005a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <f3526050-3e0a-fc75-446a-023e7bbc005a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 29 Mar 2022 23:27:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14580

On Tue, Mar 29, 2022 at 04:48:43PM -0500, Etheridge, Darren wrote:
> On 3/25/2022 5:36 PM, Andrew Davis wrote:
> >On 3/25/22 5:30 PM, Andrew F. Davis via lists.yoctoproject.org wrote:
> >>On 3/25/22 5:06 PM, Denys Dmytriyenko wrote:
> >>>On Fri, Mar 25, 2022 at 04:54:56PM -0500, Andrew F. Davis via
> >>>lists.yoctoproject.org wrote:
> >>>>On 3/25/22 4:38 PM, Denys Dmytriyenko wrote:
> >>>>>On Fri, Mar 25, 2022 at 04:21:38PM -0500, Andrew Davis wrote:
> >>>>>>On 3/25/22 3:10 PM, Denys Dmytriyenko wrote:
> >>>>>>>On Wed, Mar 23, 2022 at 02:37:07PM -0500, Darren Etheridge wrote=
:
> >>>>>>>>Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15
> >>>>>>>>
> >>>>>>>>Migrate Imagination DDK 1.13 to DDK 1.15 for J721e
> >>>>>>>
> >>>>>>>Overall looks good, please see inline below.
> >>>>>>>
> >>>>>>>
> >>>>>>>>Signed-off-by: Darren Etheridge <detheridge@ti.com>
> >>>>>>>>---
> >>>>>>>>
> >>>>>>>>rename from recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.1=
3.5776728.bb
> >>>>>>>>rename to recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.=
6133109.bb
> >>>>>>>>index a05de0f2..fbff6c51 100644
> >>>>>>>>--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.5776=
728.bb
> >>>>>>>>+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133=
109.bb
> >>>>>>>>@@ -7,17 +7,17 @@ inherit module features_check
> >>>>>>>>=A0 REQUIRED_MACHINE_FEATURES =3D "gpu"
> >>>>>>>>-MACHINE_KERNEL_PR_append =3D "b"
> >>>>>>>>+MACHINE_KERNEL_PR_append =3D "a"
> >>>>>>>>=A0 PR =3D "${MACHINE_KERNEL_PR}"
> >>>>>>>>=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>>>>>>-COMPATIBLE_MACHINE =3D "j7"
> >>>>>>>>+COMPATIBLE_MACHINE =3D "j7-evm|j721s2-evm|am62xx"
> >>>>>>>>=A0 DEPENDS =3D "virtual/kernel"
> >>>>>>>>=A0 PROVIDES =3D "virtual/gpudriver"
> >>>>>>>>-BRANCH =3D "1.13-5776728/linux-k5.10"
> >>>>>>>>+BRANCH =3D "linuxws/dunfell/k5.10/${PV}"
> >>>>>>>>=A0 SRC_URI =3D " \
> >>>>>>>>       git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=
=3D${BRANCH}
> >>>>>>>>\
> >>>>>>>>@@ -26,15 +26,19 @@ SRC_URI =3D " \
> >>>>>>>>=A0 S =3D "${WORKDIR}/git"
> >>>>>>>>-SRCREV =3D "35a25875ae8738f82c7cabc6b077ef992b0cca84"
> >>>>>>>>+SRCREV =3D "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
> >>>>>>>>-PVR_SOC =3D "j721e_linux"
> >>>>>>>
> >>>>>>>I was actually thinking of keeping PVR_SOC variable and moving i=
t to
> >>>>>>>corresponding machine configs.
> >>>>>>>
> >>>>>>
> >>>>>>
> >>>>>>PVR_SOC is a bit of a legacy name, especially since PVR is now IM=
G.
> >>>>>
> >>>>>PVR or PowerVR name is still used as an overall umbrella for all o=
f
> >>>>>Imagination's graphics, vision and AI chips, including SGX
> >>>>>and Rogue/RGX:
> >>>>>https://en.wikipedia.org/wiki/PowerVR
> >>>>>
> >>>>
> >>>>
> >>>>On the wiki page:
> >>>>
> >>>>>These GPUs are no longer called PowerVR, they are called IMG.[58]
> >>>>
> >>>>For their next gen GPUs they are distancing themselves from
> >>>>the PVR name,
> >>>>the GPU in AM62xx is one such next gen GPU, so it's already
> >>>>not correct here
> >>>>as is.
> >>>
> >>>So, then why AM62xx is being added to Rogue driver/DDK? Should
> >>>there be a
> >>>separate Albiorix driver and DDK then?
> >>>
> >>
> >>
> >>We asked IMG very nicely to not fork the DDK for each new gen of
> >>device (like
> >>what happened with SGX -> Rogue), so now we have he same driver code =
base
> >>supporting multiple generations of GPU. The name "Rogue" just
> >>stuck around.
> >>We should probably rename some of this stuff to also be more generic.
> >>
> >>
> >>>
> >>>>>>Thinking on this, the mapping between SoC family and the
> >>>>>>internal names
> >>>>>>like "RGX_BVNC" and "TARGET_PRODUCT" are specific to the
> >>>>>>version of this
> >>>>>>driver. For instance in the next DDK I may want the target name t=
o
> >>>>>>go from "am62_linux" to "axb_128_linux", I would have to
> >>>>>>change things here (update the SRCREV) AND in the machine config.
> >>>>>
> >>>>>1. I totally agree that "axb_128_linux" makes more sense
> >>>>>than "am62_linux".
> >>>>>2. Changes like that happen very rarely.
> >>>>>3. You can call it PVR_MODEL or PVR_PRODUCT if you want,
> >>>>>instead of PVR_SOC.
> >>>>>
> >>>>>
> >>>>>>Mapping here feels like the right spot to me. I'd even argue the =
same
> >>>>>>for OPTEEMACHINE and the like, should go in the
> >>>>>>optee.bbappends with the
> >>>>>>rest of our platform specific recipe fixups, etc.
> >>>>>
> >>>>>The number of overrides in the recipe will keep on
> >>>>>growing, as each new
> >>>>>platform will need to add own config. That's the whole
> >>>>>point of the machine
> >>>>>configuration file to have those defined centrally.
> >>>>>
> >>>>>The goal is to have a recipe as machine-agnostic and
> >>>>>clean, as possible. Do
> >>>>>not overwhelm it with tons of conditionals like that - any
> >>>>>machine-specific
> >>>>>configuration should be set in the machine config file.
> >>>>>
> >>>>
> >>>>
> >>>>Having all the fixups related to a package inside that
> >>>>package's definition sounds
> >>>>more central to me, and easier to reason about. But I can
> >>>>see the argument both
> >>>>ways.
> >>>>
> >>>>Maybe the better solution would be to splitup this(and the
> >>>>SGX) recipe. So we
> >>>>get a package per GPU type. It's already how the bins are
> >>>>organized/shipped. Then
> >>>>we just pick the right GPU package for our SoC in
> >>>>arago-prefs.inc. (again like
> >>>>we already do to select between SGX/RGX)
> >>>
> >>>Yeah, I think keeping each series of GPU (SGX, Rogue,
> >>>Albiorix) in their own
> >>>separate recipes would be fine. Or are you suggesting
> >>>splitting even further
> >>>into separate recipes for SGX530 vs SGX540, etc?
> >>>
> >>
> >>
> >>I'm suggesting even further. The driver/package for SGX530 is
> >>not compatible
> >>and conflicts with the driver package for SGX540. So lets not
> >>have a single named
> >>package (ti-sgx-ddk-um) that can have very different contents,
> >>that's just confusing.
> >>
> >
> >
> >Oh, and not separate recipes, separate packages, they can all be provi=
ded
> >by the same one or two recipes.
> >
> >ti-sgx-530-um
> >ti-sgx-544-um
> >ti-axe1-16m-um
> >etc..
> >
> >Then:
> >
> >PREFERRED_PROVIDER_virtual/libgles2:am62xx =3D "ti-axe1-16m-um"
> >...
> >
> >Andrew
>=20
> Can we merge for Dunfell and then improve significantly for
> Kirkstone, or do I still need to make changes here for Dunfell?

This is fine with me for Dunfell.

--=20
Denys

