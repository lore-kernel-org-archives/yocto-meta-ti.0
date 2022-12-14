Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E488CC4332F
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 00:00:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.90594.1670976026616843317
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 16:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8C0C140C2B;
	Wed, 14 Dec 2022 00:00:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o56QMkyU_diw; Wed, 14 Dec 2022 00:00:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C3E740A3F;
	Wed, 14 Dec 2022 00:00:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 427C81636B0; Tue, 13 Dec 2022 19:00:11 -0500 (EST)
Date: Tue, 13 Dec 2022 19:00:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: reatmon@ti.com, Daniel =?iso-8859-1?Q?D=EDaz?= <mrchapp@gmail.com>,
	meta-ti@lists.yoctoproject.org,
	Ricardo Salveti <ricardo@foundries.io>
Subject: Re: [meta-ti] [master/kirkstone][PATCH] ti-sci-fw: make dependency
 on meta-ti-extras soft
Message-ID: <20221214000011.GO22689@denix.org>
References: <1728C9EC4C3A35F2.13174@lists.yoctoproject.org>
 <20221207222351.GB22689@denix.org>
 <1047cedf-f3ab-b519-63a9-081e8d371480@ti.com>
 <CAELJN2kY3gjcamCXPC=7n7ss961KH3OJkRFEXc9Ai0bEVeiX+w@mail.gmail.com>
 <fa914b1d-0108-4311-ea6e-10314c856954@ti.com>
 <CANPvuRngHTO=tFTbWn0dFq-CwjS0z0nQWy+830_WjgZ1ZrMEuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuRngHTO=tFTbWn0dFq-CwjS0z0nQWy+830_WjgZ1ZrMEuQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Dec 2022 00:00:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15470

Everything you said was already mentioned in the commit log below:

> As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DIR
> for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and building
> for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extras,
> the soft dependency will still work fine and give a build error
> "Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.

--=20
Denys


On Mon, Dec 12, 2022 at 12:19:41PM +0000, Jose Quaresma wrote:
> Hi,
>=20
> This is not enough to fix the issue, the layer is still broken
> because ti-k3-secdev is needed as well and it is on meta-ti-extras.
> I tested this patch in kirkstone but maybe master is affected too.
>=20
> builder@ac8b892cdf40:/lmp/build-am64xx-evm$ grep ti-k3-secdev
> /lmp/build-am64xx-evm/conf/../../layers/meta-ti/meta-ti-bsp/recipes-bsp=
/ti-sci-fw/
> ti-sci-fw_git.bb
> DEPENDS:append =3D "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else '
> ti-k3-secdev-native' }"
>=20
>=20
> Without the meta-ti-extras layer bitbake fails with:
>=20
> ERROR: Nothing PROVIDES 'ti-k3-secdev-native' (but
> mc:k3r5-sr2-hs-fs:/lmp/build-am64xx-evm/conf/../../layers/meta-ti/meta-=
ti-bsp/recipes-bsp/ti-sci-fw/
> ti-sci-fw_git.bb DEPENDS on or otherwise requires it). Close matches:
>   libtspi-dev-native
>   makedevs-native
> ERROR: Required build target 'ti-sci-fw' has no buildable providers.
> Missing or unbuildable dependency chain was: ['ti-sci-fw',
> 'ti-k3-secdev-native']
>=20
>=20
> Jose
>=20
> Ryan Eatmon via lists.yoctoproject.org <reatmon=3D
> ti.com@lists.yoctoproject.org> escreveu no dia quarta, 7/12/2022 =E0(s)=
 22:42:
>=20
> >
> > The test builds for this are running right now.  I would expect that =
I
> > can merge it over to kirkstone tomorrow morning sometime.
> >
> >
> > On 12/7/2022 4:39 PM, Daniel D=EDaz wrote:
> > > Hello!
> > >
> > > On Wed, Dec 7, 2022 at 4:34 PM Ryan Eatmon via lists.yoctoproject.o=
rg
> > > <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
> > >> I literally merged this out to master about 30mins ago.
> > >
> > > We can this be expected to land on Kirkstone?
> > >
> > > Thanks and greetings!
> > >
> > > Daniel D=EDaz
> > > yosoy@danieldiaz.org
> > >
> > >
> > >
> > >> On 12/7/2022 4:23 PM, Denys Dmytriyenko wrote:
> > >>> Ping?
> > >>>
> > >>>
> > >>> On Fri, Nov 18, 2022 at 09:07:49PM +0000, Denys Dmytriyenko wrote=
:
> > >>>> From: Denys Dmytriyenko <denys@konsulko.com>
> > >>>>
> > >>>> Replace "require" with "include" to load ti-paths.inc and not br=
eak
> > >>>> parsing when meta-ti-extras is not in the BBLAYERS list.
> > >>>>
> > >>>> As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DI=
R
> > >>>> for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and buildi=
ng
> > >>>> for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extra=
s,
> > >>>> the soft dependency will still work fine and give a build error
> > >>>> "Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.
> > >>>>
> > >>>> Also, since TI_K3_SECDEV_INSTALL_DIR can now be undefined, use
> > >>>> d.getVar() to access it ensuring it doesn't break the condition.
> > >>>>
> > >>>> Reported-by: Daniel D=EDaz <mrchapp@gmail.com>
> > >>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > >>>> ---
> > >>>>    meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
> > >>>>    1 file changed, 2 insertions(+), 2 deletions(-)
> > >>>>
> > >>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > >>>> index e89a6855..c99cd660 100644
> > >>>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > >>>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> > >>>> @@ -1,5 +1,5 @@
> > >>>>    require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> > >>>> -require recipes-ti/includes/ti-paths.inc
> > >>>> +include recipes-ti/includes/ti-paths.inc
> > >>>>
> > >>>>    DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native
> > virtual/bootloader"
> > >>>>    DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
> > >>>> @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D "null"
> > >>>>
> > >>>>    PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > >>>>
> > >>>> -TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or
> > '${TI_K3_SECDEV_INSTALL_DIR}' }"
> > >>>> +TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or
> > d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
> > >>>>    export TI_SECURE_DEV_PKG
> > >>>>
> > >>>>    SYSFW_SOC ?=3D "unknown"
> > >>>> --
> > >>>> 2.25.1

