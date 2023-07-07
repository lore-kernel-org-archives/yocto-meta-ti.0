Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E79EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 21:19:45 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6343.1688764775787436857
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Jul 2023 14:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 05B1240C83;
	Fri,  7 Jul 2023 21:19:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-IQxPUMhB-x; Fri,  7 Jul 2023 21:19:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D379640C30;
	Fri,  7 Jul 2023 21:19:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8DF1F163BF0; Fri,  7 Jul 2023 17:19:33 -0400 (EDT)
Date: Fri, 7 Jul 2023 17:19:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf: switch k3r5
 multiconfig to baremetal
Message-ID: <20230707211933.GJ1518@denix.org>
References: <20230706193122.1891075-1-denis@denix.org>
 <CANPvuRkq3qONAsF6ar3ngGd4KEJ_uZ+8u8ZvuDKCQZKmnh3Ljw@mail.gmail.com>
 <CANPvuR=bbiHkBG9BgrOkBj=oUvatC4vpJNDO79y4k5OYR8q3ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CANPvuR=bbiHkBG9BgrOkBj=oUvatC4vpJNDO79y4k5OYR8q3ww@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Jul 2023 21:19:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16835

On Fri, Jul 07, 2023 at 05:02:37PM +0100, Jose Quaresma wrote:
> Foreword to the mailing list.
>=20
> ---------- Forwarded message ---------
> De: Jose Quaresma <quaresma.jose@gmail.com>
> Date: sexta, 7/07/2023 =E0(s) 10:51
> Subject: Re: [meta-ti] [master/kirkstone][PATCH] conf: switch k3r5
> multiconfig to baremetal
> To: Denys Dmytriyenko <denis@denix.org>
>=20
>=20
> Hi Denys,
>=20
> Thanks for doing that, I will do some tests with this on kirstone.
>=20
> Denys Dmytriyenko <denis@denix.org> escreveu no dia quinta, 6/07/2023 =E0=
(s)
> 20:31:
>=20
> > From: Denys Dmytriyenko <denys@konsulko.com>
> >
> > There are couple of k3r5 components that need to be built for the tar=
get
> > and they are self-contained and don't use glibc. Moreover, when build=
ing
> > a cross-compile toolchain for k3r5, there's no need to build glibc an=
d
> > all its dependencies. While build-time speed up is nice, the main ben=
efit
> > comes when packaging a nativesdk toolchain for distribution, reducing=
 the
> > number of packages and the resulting size of the toolchain installer.
> >
> > To avoid potential namespace conflict in package feeds between native=
sdk
> > binary packages of Linux glibc and k3r5 baremetal toolchains, adjust =
the
> > package suffix accordingly.
> >
> > This also requires a rather impactful change in the deployment struct=
ure,
> > which affects CIs and user experience. By default different TCLIBC bu=
ilds
> > (e.g. glibc and baremetal in this case) are built in separate TMPDIRs=
 to
> > avoid conflicts, especially on the nativesdk side. Also the default c=
onfig
> > has DEPLOY_DIR residing under corresponding TMPDIR. Of course, this c=
an be
> > changed by local.conf or <distro>.conf, which meta-ti-bsp has no cont=
rol
> > over. Unlike multiconfig-image-packager example that can access deplo=
yed
> > artifacts across multiconfigs to package in an image, we use wic and =
its
> > IMAGE_BOOT_FILES list to package a final image. Unfortunately, wic ca=
nnot
> > access deployed artifacts across multiconfigs in separate TMPDIRs, as=
 it
> > uses DEPLOY_DIR_IMAGE to collect the artifacts. To overcome this, we =
need
> > to set up a "common" deploy directory for images and sdks produced by
> > multiconfigs, which is located outside of TMPDIRs, set by TI_COMMON_D=
EPLOY
> > variable that can be changed or adjusted by distros as needed.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  meta-ti-bsp/conf/layer.conf            | 4 ++++
> >  meta-ti-bsp/conf/multiconfig/k3r5.conf | 4 +++-
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.con=
f
> > index bb286c2b..db6f9de9 100644
> > --- a/meta-ti-bsp/conf/layer.conf
> > +++ b/meta-ti-bsp/conf/layer.conf
> > @@ -23,3 +23,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> >  "
> >
> >  HOSTTOOLS_NONFATAL +=3D "truncate xxd comm"
> > +
> > +TI_COMMON_DEPLOY ?=3D "${TOPDIR}/deploy-ti"
> > +DEPLOY_DIR_IMAGE:ti-soc =3D "${TI_COMMON_DEPLOY}/images/${MACHINE}"
> > +SDK_DEPLOY:ti-soc =3D "${TI_COMMON_DEPLOY}/sdk"
> > diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > index deb07210..04b9a746 100644
> > --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> > @@ -1,5 +1,7 @@
> >  MAINMACHINE :=3D "${MACHINE}"
> >
> > -DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${MAINMACHINE}"
> > +DEPLOY_DIR_IMAGE:k3r5 =3D "${TI_COMMON_DEPLOY}/images/${MAINMACHINE}=
"
>=20
> What is the reason to use a machine override here as this conf is alrea=
dy
> used only on k3r5 machines?

To override the value set in the layer.conf above.


> >  MACHINE:append =3D "-k3r5"
> > +TCLIBC =3D "baremetal"
> > +SDKPKGSUFFIX =3D "k3r5-nativesdk"
> > --
> > 2.25.1

