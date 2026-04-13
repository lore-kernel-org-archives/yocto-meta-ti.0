Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD16EBFD09
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 07:12:49 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.266733.1776064362641948974
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 00:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@dolcini.it header.s=default header.b=t94WuQYG;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 73F301F92A;
	Mon, 13 Apr 2026 09:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1776064359;
	bh=Vb93VPEw5KKph4hgLZ6pyw9cp6oYMfpSrKA89b5GK7c=; h=From:To:Subject;
	b=t94WuQYGKFi3LkBY9hpGqSZGTzckbkKOsNEoQ2RjGGDRN3EKn162b1DdPcsOs/HUL
	 3NUQFXxP/Ab7t1fLL/IZqH5L5zTUv2RiGbfR4n2GVrLdmBVcdCZsr51LcE6PZv1lH2
	 NcoW7BJuopFm0dact2zrD/HdScfYJplAdhk/KVA7shPHNXYh0zDGg2zcIonmXyOfzq
	 R2n5w1FyTWU6HHnzR0E9u5SbHG5oDSrBhjilp49JPLz9/8y0NUglfg/SvtmWXyDn66
	 GFXtblCnKMOmBBnutro28SbEyt3TT7OzFq4PV141n0GgQUPmrTU6RbeHc8LVWNKPAj
	 mKZoZ4U0wpb0g==
Date: Mon, 13 Apr 2026 09:12:35 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Ryan Eatmon <reatmon@ti.com>, Vitor Soares <ivitro@gmail.com>
Cc: meta-ti@lists.yoctoproject.org, denys@konsulko.com,
	vitor.soares@toradex.com
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
Message-ID: <20260413071235.GA249967@francesco-nb>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
 <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
 <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
 <205a16be-e76e-4658-966a-f585eb84943e@ti.com>
 <4b862070791c1b8fca67bf19a09a34d5c1180684.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b862070791c1b8fca67bf19a09a34d5c1180684.camel@gmail.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Apr 2026 07:12:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19840

Hello Ryan,

On Wed, Feb 11, 2026 at 06:48:16PM +0000, Vitor Soares wrote:
> On Wed, 2026-02-11 at 11:50 -0600, Ryan Eatmon wrote:
> >=20
> >=20
> > On 2/9/2026 10:31 AM, Vitor Soares via lists.yoctoproject.org wrote:
> > > On Mon, 2026-02-09 at 09:11 -0600, Ryan Eatmon wrote:
> > > >=20
> > > >=20
> > > > On 2/9/2026 5:21 AM, Vitor Soares via lists.yoctoproject.org wrot=
e:
> > > > > Hi meta-ti maintainers,
> > > > >=20
> > > > > We've hit an issue where selecting a BSP version (e.g. TI_PREFE=
RRED_BSP
> > > > > =3D
> > > > > "mainline") also forces initramfs integration via ti-soc.inc (l=
ines 32-
> > > > > 49).
> > > > > The
> > > > > bsp-mainline, bsp-next, and bsp-ti_6_18 overrides all unconditi=
onally
> > > > > set
> > > > > BUILD_CORE_INITRAMFS_IMAGE_STEP, TI_WKS_INITRAMFS, and IMAGE_BO=
OT_FILES.
> > > > >=20
> > > > > This means we can't use bsp-mainline without also pulling in ti=
-core-
> > > > > initramfs =E2=80=94
> > > > > even when our images don't need it.
> > > > >=20
> > > > > Since we can't use bsp-mainline, we also lose the correct overr=
ide
> > > > > context
> > > > > for
> > > > > other components. For example, we end up having to manually ove=
rride all
> > > > > the
> > > > > mesa-pvr.inc virtual providers in our machine config to use ups=
tream
> > > > > mesa =E2=80=94
> > > > > something that bsp-mainline would handle naturally.
> > > > >=20
> > > > > The root issue is that initramfs integration (an image-level co=
ncern) is
> > > > > tied to
> > > > > BSP version selection (a machine-level concern) in ti-soc.inc.
> > > > >=20
> > > > > A possible fix would be to move the initramfs logic to an image=
 class
> > > > > (e.g.
> > > > > ti-
> > > > > image.bbclass) that images explicitly opt into. This would be a=
 breaking
> > > > > change
> > > > > for images relying on the current automatic behavior, but it wo=
uld
> > > > > properly
> > > > > separate these concerns.
> > > >=20
> > > > I recognize what you are saying as an issue.
> > > >=20
> > > > We are in the process of moving to require an initramfs for all o=
f our
> > > > platforms as we transition to using modules for kernel features t=
hat the
> > > > upstream kernel is unwilling to turn on by default (to keep the k=
ernel
> > > > small).=C2=A0 We have been turning these features on by default i=
n our vendor
> > > > kernel, and we moving away from that.
> > > >=20
> > > > So there is a need to balance our need to make sure that everythi=
ng is
> > > > in place at the BSP level, and the need for downstream customers =
in
> > > > distro layers to build upon that initramfs and include their own =
changes.
> > > >=20
> > > > As I see it, we have two options.
> > > >=20
> > > > 1) Provide a mechanism to extend the ti-core-initramfs recipe to =
allow
> > > > you to put more stuff in there.
> > > >=20
> > > > 2) Go the class route and make it so that your initramfs (using t=
he
> > > > class) would make sure to include ALL of the needed modules into =
your
> > > > initramfs and still register your initramfs with the images.
> > > >=20
> > > > Can you point me at the recipe that your initramfs is using so th=
at we
> > > > can get an example of usage so we can plan for the best solution?
> > > >=20
> > > >=20
> > >=20
> > > Thanks for the quick response.
> > >=20
> > > For context: we don't plan to use initramfs (at least not currently=
) - our
> > > images boot directly to rootfs. The issue is that selecting bsp-mai=
nline
> > > forces
> > > initramfs integration we don't need, and prevents us from benefitin=
g from
> > > bsp-
> > > mainline's other configurations.
> > >=20
> > > Proposed solution:
> > > Move initramfs logic from ti-soc.inc to classes/ti-image.bbclass, a=
nd images
> > > that need initramfs explicitly inherit ti-image. This separates mac=
hine-
> > > level
> > > BSP selection from image-level features (standard Yocto pattern). B=
reaking
> > > change: your reference images need inherit ti-image added.
> > >=20
> > > Thoughts?
> >=20
> > I'm not sure you are 100% understanding what I'm saying.
> >=20
> > Starting with 6.18 and forward (including mainline and next since the=
y=20
> > are always "forward"), we are requiring the initramfs for some of the=
=20
> > platforms (am62a, j721e, j784s4).=C2=A0 Without the initramfs providi=
ng the=20
> > needed kernel modules you will not boot to the rootfs.=C2=A0 The boar=
d will=20
> > just not work.
> >=20
> > So even if right now you are not using an initramfs, then for those=20
> > platforms you will need to start unless you take extra steps to force=
=20
> > the required modules to be compiled into the kernel via config fragme=
nts.
> >=20
> > Those modules were previously turned on in our vendor kernel (and nev=
er=20
> > for mainline/next), and we are no longer going to do that.
> >=20
> > That all being said, I will send a patch soon (need to test things=20
> > first) that will do the following:
> >=20
> > 1) Limit creation/requirement for the ti-core-initramfs to just=20
> > platforms that require it.
> >=20
> > 2) Allow you to disable the ti-core-initramfs completely by setting a=
=20
> > variable.=C2=A0 BUT... you will be required to provide the needed mod=
ules in=20
> > some way to get your image to boot either by adding a config fragment=
 in=20
> > the kernel, or doing your own initramfs and including the needed modu=
les=20
> > (which you can use the variable from the machine conf files to get th=
at=20
> > list).
> >=20
> Thanks for the detailed explanation and apologies for not providing eno=
ugh
> context upfront.
>=20
> We're Toradex, maintaining meta-toradex-ti BSP layer for our TI-based S=
oMs,
> including Aquila AM69. We use our own kernel and bootloader recipes bas=
ed on
> vanilla mainline with our own defconfigs.
>=20
> Since we control our own kernel config, we can build needed drivers as =
built-in
> if necessary. Currently we don't plan to use initramfs.
>=20
> The issue we're trying to solve: we want to use `TI_PREFERRED_BSP =3D "=
mainline"`
> to get the BSP override context without being forced into the initramfs
> workflow.
>=20
> Your proposed opt-out variable would work for our immediate need. We'd =
disable
> ti-core-initramfs and manage our own kernel configuration as needed.
>=20
> That said, I still think the class-based approach is cleaner long-term
> architecture - it properly separates BSP selection (machine-level) from
> initramfs integration (image-level). If you're open to exploring that d=
irection,
> I'm happy to help.


Any update on this? Just a reminder that meta-ti is used both for your
EVK/SK, and just for the SoC support. Specifically you should not
enforce anything like an initramfs to users of your SoC.

Can you please prioritize this? This is creating issues to us since
weeks and I do not see any progress.

Thanks
Francesco


