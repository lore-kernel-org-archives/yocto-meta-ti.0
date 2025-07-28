Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7386BC83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 22:59:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.95136.1753743587962294134
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 15:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 08E6040BA9;
	Mon, 28 Jul 2025 22:59:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGZKWEBiGBVs; Mon, 28 Jul 2025 22:59:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7C3A40A2F;
	Mon, 28 Jul 2025 22:59:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2205816D192; Mon, 28 Jul 2025 18:59:42 -0400 (EDT)
Date: Mon, 28 Jul 2025 18:59:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: raj.khem@gmail.com, afd@ti.com, Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH 3/3] wic: sdimage-2part-efi:
 Remove 3 second menu delay
Message-ID: <20250728225942.GN24899@denix.org>
References: <20250728165437.571427-1-afd@ti.com>
 <20250728165437.571427-3-afd@ti.com>
 <20250728182531.GJ24899@denix.org>
 <CAMKF1sod1hFZ6HbcZr6yJztNfos=iQt2_O4SBBFHSTEJPpU0Cw@mail.gmail.com>
 <20250728194528.GM24899@denix.org>
 <CAMKF1sotFpGJeKJG8v13fELk6r-iUvZu+dA+D2ttGsoghG12vw@mail.gmail.com>
 <f96c731a-8d8e-4838-be9e-2e4a81851e43@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f96c731a-8d8e-4838-be9e-2e4a81851e43@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 28 Jul 2025 22:59:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18851

On Mon, Jul 28, 2025 at 03:33:23PM -0500, Ryan Eatmon wrote:
>=20
>=20
> On 7/28/2025 3:20 PM, Khem Raj via lists.yoctoproject.org wrote:
> >On Mon, Jul 28, 2025 at 12:45=E2=80=AFPM Denys Dmytriyenko <denis@deni=
x.org> wrote:
> >>
> >>On Mon, Jul 28, 2025 at 11:28:36AM -0700, Khem Raj wrote:
> >>>On Mon, Jul 28, 2025 at 11:25=E2=80=AFAM Denys Dmytriyenko via
> >>>lists.yoctoproject.org <denis=3Ddenix.org@lists.yoctoproject.org> wr=
ote:
> >>>>
> >>>>On Mon, Jul 28, 2025 at 11:54:37AM -0500, Andrew Davis via lists.yo=
ctoproject.org wrote:
> >>>>>For all our platforms booting with EFI there is only one option to=
day.
> >>>>>The timeout gives the user 3 seconds to choose a different option,=
 but
> >>>>>as there is only one, this just causes a needless 3 second delay i=
n
> >>>>>boot time. Remove this delay and boot the only option immediately.
> >>>>>If we ever have more than one option we can always add this back.
> >>>>
> >>>>Well, menu delay in grub is not only used for selecting among avail=
able
> >>>>predefined options, but also for interactively editing the command =
line
> >>>>on the fly before booting.
> >>>>
> >>>
> >>>for development, this sounds good, for production not so much.
> >>
> >>Sure. And we also disable e.g. U-boot boot prompt delay all the time =
for our
> >>customers during production hardening stage, among many other similar=
 items.
> >>But it is done for the final product - I don't think it should be don=
e in a
> >>generic BSP layer that many use for development.
> >
> >Right, it could be documented somewhere in README or some such would h=
elp
> >the consumers of the layer.
>=20
> Is there already something in the system that we could use to drive
> a variable that we can stick into the file?  Like
> EXTRA_IMAGE_FEATURES?  I know there used to be a debug-tweaks that
> got broken out into multiple features.  Maybe create a new one?
>=20
> TI_WKS_TIMEOUT =3D '${@bb.utils.contains("IMAGE_FEATURES",
> "wks-debug-timeout", "3", "0 ",d)}'

Should probably make it more generic, not wks. I'd imagine it can be shar=
ed=20
for U-boot and EFI/GRUB, so maybe bootloader-timeout or something?


> bootloader --timeout=3D${TI_WKS_TIMEOUT} --append=3D"rootfstype=3Dext4
> rootwait ${TI_WKS_BOOTLOADER_APPEND}"
>=20
>=20
> Would that work?
>=20
>=20
> >>
> >>
> >>>>>Signed-off-by: Andrew Davis <afd@ti.com>
> >>>>>---
> >>>>>  meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
> >>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>>diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bs=
p/wic/sdimage-2part-efi.wks.in
> >>>>>index 7252411c..c1089762 100644
> >>>>>--- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> >>>>>+++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
> >>>>>@@ -3,6 +3,6 @@
> >>>>>  # supports EFI.  Boot files are located in the first vfat partit=
ion with extra
> >>>>>  # reserved space.  We cannot use a GPT here.
> >>>>>
> >>>>>-bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 rootwait $=
{TI_WKS_BOOTLOADER_APPEND}"
> >>>>>+bootloader --timeout=3D0 --append=3D"rootfstype=3Dext4 rootwait $=
{TI_WKS_BOOTLOADER_APPEND}"
> >>>>>  part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVI=
DER}" --fstype=3Dvfat --label boot --active --align 1024 --use-uuid --fix=
ed-size 128M
> >>>>>  part / --source rootfs --fstype=3Dext4 --label root --align 1024=
 --use-uuid
> >>>>>--
> >>>>>2.39.2
> >>>>>
> >>>>>
> >>>>>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>Links: You receive all messages sent to this group.
> >>>>>View/Reply Online (#18848): https://lists.yoctoproject.org/g/meta-=
ti/message/18848
> >>>>>Mute This Topic: https://lists.yoctoproject.org/mt/114416911/65510=
54
> >>>>>Group Owner: meta-ti+owner@lists.yoctoproject.org
> >>>>>Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatm=
on@ti.com]
> >>>>>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>

