Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D4CF34C5D
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:35:41 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.274130.1776090933845342360
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 07:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@dolcini.it header.s=default header.b=xGE0eU2K;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id B83C11FE54;
	Mon, 13 Apr 2026 16:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1776090931;
	bh=axrTZUllDFVjFQ6t6fWbtpAlnmXOlm+86j6IJBpCrGM=; h=From:To:Subject;
	b=xGE0eU2KxSFSp+D2N494EcQlLM5VmaLm5c+Q4XYxa2Ty4U5dhVH22Tkbcz6IT7DwB
	 xGjRsrzsJLTESpeSZ6YSSUdYnFALTEM2toJdDUyMSLjA/38J1IxypVKkHpZNG3RiUG
	 cGpq5c8rWFkEX5n3d7f0G/RLJpf6S9Lg5OvoXBinVnakEI5ccoxI+ZHHo79vH9qWPd
	 CA6KDNT//OCmKITXHoVceVZdKTZZPfEdbH78uDyky3OQUQS6YLyrpygLuKKBfyMOEj
	 JEKPTM+KPauphBh7M4jhEq6QnghBFc8OxbyWSLRETQQaUe03mgllzVufnvsXQJ+YN8
	 eFitaSyR+Uwqg==
Date: Mon, 13 Apr 2026 16:35:26 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Vitor Soares <ivitro@gmail.com>, meta-ti@lists.yoctoproject.org,
	denys@konsulko.com, vitor.soares@toradex.com
Subject: Re: [meta-ti] BSP version selection forces initramfs integration
Message-ID: <20260413143526.GA325122@francesco-nb>
References: <78ec394aae8a141ceb87a6b67f109665e7c96122.camel@gmail.com>
 <af751f95-21e8-4965-ab98-4c973287ca67@ti.com>
 <f209ae25048674fe300084b618138e6216d83afb.camel@gmail.com>
 <205a16be-e76e-4658-966a-f585eb84943e@ti.com>
 <4b862070791c1b8fca67bf19a09a34d5c1180684.camel@gmail.com>
 <20260413071235.GA249967@francesco-nb>
 <a9c86782-7d72-4b09-9b9a-01da1471058e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9c86782-7d72-4b09-9b9a-01da1471058e@ti.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Apr 2026 14:35:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19842

On Mon, Apr 13, 2026 at 09:15:42AM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 4/13/2026 2:12 AM, Francesco Dolcini wrote:
> > Hello Ryan,
> >=20
> > On Wed, Feb 11, 2026 at 06:48:16PM +0000, Vitor Soares wrote:
> > > On Wed, 2026-02-11 at 11:50 -0600, Ryan Eatmon wrote:
> > > >=20
> > > >=20
> > > > On 2/9/2026 10:31 AM, Vitor Soares via lists.yoctoproject.org wro=
te:
> > > > > On Mon, 2026-02-09 at 09:11 -0600, Ryan Eatmon wrote:
> > > > > >=20
> > > > > >=20
> > > > > > On 2/9/2026 5:21 AM, Vitor Soares via lists.yoctoproject.org =
wrote:
> > > > > > > Hi meta-ti maintainers,
> > > > > > >=20
> > > > > > > We've hit an issue where selecting a BSP version (e.g. TI_P=
REFERRED_BSP
> > > > > > > =3D
> > > > > > > "mainline") also forces initramfs integration via ti-soc.in=
c (lines 32-
> > > > > > > 49).
> > > > > > > The
> > > > > > > bsp-mainline, bsp-next, and bsp-ti_6_18 overrides all uncon=
ditionally
> > > > > > > set
> > > > > > > BUILD_CORE_INITRAMFS_IMAGE_STEP, TI_WKS_INITRAMFS, and IMAG=
E_BOOT_FILES.
> > > > > > >=20
> > > > > > > This means we can't use bsp-mainline without also pulling i=
n ti-core-
> > > > > > > initramfs =E2=80=94
> > > > > > > even when our images don't need it.
> > > > > > >=20
> > > > > > > Since we can't use bsp-mainline, we also lose the correct o=
verride
> > > > > > > context
> > > > > > > for
> > > > > > > other components. For example, we end up having to manually=
 override all
> > > > > > > the
> > > > > > > mesa-pvr.inc virtual providers in our machine config to use=
 upstream
> > > > > > > mesa =E2=80=94
> > > > > > > something that bsp-mainline would handle naturally.
> > > > > > >=20
> > > > > > > The root issue is that initramfs integration (an image-leve=
l concern) is
> > > > > > > tied to
> > > > > > > BSP version selection (a machine-level concern) in ti-soc.i=
nc.
> > > > > > >=20
> > > > > > > A possible fix would be to move the initramfs logic to an i=
mage class
> > > > > > > (e.g.
> > > > > > > ti-
> > > > > > > image.bbclass) that images explicitly opt into. This would =
be a breaking
> > > > > > > change
> > > > > > > for images relying on the current automatic behavior, but i=
t would
> > > > > > > properly
> > > > > > > separate these concerns.
> > > > > >=20
> > > > > > I recognize what you are saying as an issue.
> > > > > >=20
> > > > > > We are in the process of moving to require an initramfs for a=
ll of our
> > > > > > platforms as we transition to using modules for kernel featur=
es that the
> > > > > > upstream kernel is unwilling to turn on by default (to keep t=
he kernel
> > > > > > small).=C2=A0 We have been turning these features on by defau=
lt in our vendor
> > > > > > kernel, and we moving away from that.
> > > > > >=20
> > > > > > So there is a need to balance our need to make sure that ever=
ything is
> > > > > > in place at the BSP level, and the need for downstream custom=
ers in
> > > > > > distro layers to build upon that initramfs and include their =
own changes.
> > > > > >=20
> > > > > > As I see it, we have two options.
> > > > > >=20
> > > > > > 1) Provide a mechanism to extend the ti-core-initramfs recipe=
 to allow
> > > > > > you to put more stuff in there.
> > > > > >=20
> > > > > > 2) Go the class route and make it so that your initramfs (usi=
ng the
> > > > > > class) would make sure to include ALL of the needed modules i=
nto your
> > > > > > initramfs and still register your initramfs with the images.
> > > > > >=20
> > > > > > Can you point me at the recipe that your initramfs is using s=
o that we
> > > > > > can get an example of usage so we can plan for the best solut=
ion?
> > > > > >=20
> > > > > >=20
> > > > >=20
> > > > > Thanks for the quick response.
> > > > >=20
> > > > > For context: we don't plan to use initramfs (at least not curre=
ntly) - our
> > > > > images boot directly to rootfs. The issue is that selecting bsp=
-mainline
> > > > > forces
> > > > > initramfs integration we don't need, and prevents us from benef=
iting from
> > > > > bsp-
> > > > > mainline's other configurations.
> > > > >=20
> > > > > Proposed solution:
> > > > > Move initramfs logic from ti-soc.inc to classes/ti-image.bbclas=
s, and images
> > > > > that need initramfs explicitly inherit ti-image. This separates=
 machine-
> > > > > level
> > > > > BSP selection from image-level features (standard Yocto pattern=
). Breaking
> > > > > change: your reference images need inherit ti-image added.
> > > > >=20
> > > > > Thoughts?
> > > >=20
> > > > I'm not sure you are 100% understanding what I'm saying.
> > > >=20
> > > > Starting with 6.18 and forward (including mainline and next since=
 they
> > > > are always "forward"), we are requiring the initramfs for some of=
 the
> > > > platforms (am62a, j721e, j784s4).=C2=A0 Without the initramfs pro=
viding the
> > > > needed kernel modules you will not boot to the rootfs.=C2=A0 The =
board will
> > > > just not work.
> > > >=20
> > > > So even if right now you are not using an initramfs, then for tho=
se
> > > > platforms you will need to start unless you take extra steps to f=
orce
> > > > the required modules to be compiled into the kernel via config fr=
agments.
> > > >=20
> > > > Those modules were previously turned on in our vendor kernel (and=
 never
> > > > for mainline/next), and we are no longer going to do that.
> > > >=20
> > > > That all being said, I will send a patch soon (need to test thing=
s
> > > > first) that will do the following:
> > > >=20
> > > > 1) Limit creation/requirement for the ti-core-initramfs to just
> > > > platforms that require it.
> > > >=20
> > > > 2) Allow you to disable the ti-core-initramfs completely by setti=
ng a
> > > > variable.=C2=A0 BUT... you will be required to provide the needed=
 modules in
> > > > some way to get your image to boot either by adding a config frag=
ment in
> > > > the kernel, or doing your own initramfs and including the needed =
modules
> > > > (which you can use the variable from the machine conf files to ge=
t that
> > > > list).
> > > >=20
> > > Thanks for the detailed explanation and apologies for not providing=
 enough
> > > context upfront.
> > >=20
> > > We're Toradex, maintaining meta-toradex-ti BSP layer for our TI-bas=
ed SoMs,
> > > including Aquila AM69. We use our own kernel and bootloader recipes=
 based on
> > > vanilla mainline with our own defconfigs.
> > >=20
> > > Since we control our own kernel config, we can build needed drivers=
 as built-in
> > > if necessary. Currently we don't plan to use initramfs.
> > >=20
> > > The issue we're trying to solve: we want to use `TI_PREFERRED_BSP =3D=
 "mainline"`
> > > to get the BSP override context without being forced into the initr=
amfs
> > > workflow.
> > >=20
> > > Your proposed opt-out variable would work for our immediate need. W=
e'd disable
> > > ti-core-initramfs and manage our own kernel configuration as needed=
.
> > >=20
> > > That said, I still think the class-based approach is cleaner long-t=
erm
> > > architecture - it properly separates BSP selection (machine-level) =
from
> > > initramfs integration (image-level). If you're open to exploring th=
at direction,
> > > I'm happy to help.
> >=20
> >=20
> > Any update on this? Just a reminder that meta-ti is used both for you=
r
> > EVK/SK, and just for the SoC support. Specifically you should not
> > enforce anything like an initramfs to users of your SoC.
> >=20
> > Can you please prioritize this? This is creating issues to us since
> > weeks and I do not see any progress.
>=20
> There are a number of cases where we do things in the SOC common includ=
e
> files to centralize things for the evm/sk boards.

The fact that you have something common with your EVM/SK boards does not
implies that you should put it in the SOC conf file.
The SoC configuration file, should be about the SoC.

If you have a need of something common, name it
"ti-sk-evm-common-${whatever}.${ext}" and include it in from the related
TI machine conf file. You should opt-in for this common part from the
boards file you need, not force every user of your SoC and OE layer to
opt-out from it.

Francesco



