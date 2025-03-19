Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A469DC35FFF
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:08 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.2913.1742372159225090675
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 01:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=HF7QczZc;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=QIgMS7tf;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742372159; x=1773908159;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=s70dn2RKx1v5jAw6pMlImVu22uL/fiJ96m+CIvL8Sl0=;
  b=HF7QczZcgIDDbpMl2ZLJusgyYbsIEwBiJJBpAdHWPLK2aOnV5gTfl0Sz
   zCyurR3FlDC5671iRgj2A2WxHAb0bsFxpL/BkVhcnbBOhSfhEgKnr2UhQ
   LULeY9xUpexvy0I/s6nGf7gKKplzn5nj1x68Thfj9Q0nUJd3aDYqk9dMf
   s5zLJ671hVk215DP9IG4gEx1FlybUCW63Zbk6jk7+uSFKZMJiey1F0Rbf
   YJn/XShMbDGPzMiWdm+5SzDaxnw7SMVe6xV/2cLo+8BwB3M9xYFbODF37
   C2Ho3X0kt5c4KZg73LqMHI6Y9p4faI3RFMdU2+Fdk5xAA2oJReWyRjOiy
   A==;
X-CSE-ConnectionGUID: Whw62Y6LQJ+7sQqWizeubw==
X-CSE-MsgGUID: OjpStmc7Qqe3gCgdPE4tQA==
X-IronPort-AV: E=Sophos;i="6.14,259,1736809200"; 
   d="scan'208";a="43037470"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Mar 2025 09:15:56 +0100
X-CheckPoint: {67DA7D3C-10-7141A0B0-E6EDEC14}
X-MAIL-CPID: A4E25DDB0C25B78E4C79C3D83738002F_3
X-Control-Analysis: str=0001.0A00639A.67DA7D33.0022,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3BB11678AF;
	Wed, 19 Mar 2025 09:15:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742372151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s70dn2RKx1v5jAw6pMlImVu22uL/fiJ96m+CIvL8Sl0=;
	b=QIgMS7tfIj8mD9wVSx/zplUD7E+msKib1UY3j2MPNHHdPjQb8SI/+mUoqx6bPDYK4d8+rZ
	D0kgKJ0/8pGFwibWzR1En9S0s1ltYxoiHLNDz5LvaHldXf5vvMGkbahcxiNlD/W17qSFez
	1n0Do9Hj+zJV2PxZD9TNFW5F91kvanYTUwX5cInp5y9TSwos9LmKYPVUZoxJzH5dMol3qN
	Nu4whqgNc2jN5+nNZErRiWqxevtuL+Ye2tvqJwlVHIlPpFFC+u73xh19ir/501XygODjDy
	ow4cxiNPSJve4CuTxya5GSkWfEPyASAD4gUvIfBSoMaDRkMOVLiSWr8e1r62Xg==
Message-ID: <4a92c80fc3268c5a259e1f672c99b78c25d48469.camel@ew.tq-group.com>
Subject: Re: [meta-ti] [scarthgap/master][PATCH] ti-sgx-ddk-km: work around
 incorrect target name selection
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Randolph Sapp <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org, oss@ew.tq-group.com
Date: Wed, 19 Mar 2025 09:15:50 +0100
In-Reply-To: <D8JNHWJT52ZV.3PUFIM5MHPPES@ti.com>
References: <20250306141217.346689-1-matthias.schiffer@ew.tq-group.com>
	 <20250314214144.GG23729@denix.org> <D8JNHWJT52ZV.3PUFIM5MHPPES@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Mar 2025 08:16:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18405

On Tue, 2025-03-18 at 14:49 -0500, Randolph Sapp wrote:
> ********************
> Achtung externe E-Mail: =C3=96ffnen Sie Anh=C3=A4nge und Links nur, wenn =
Sie wissen, dass diese aus einer sicheren Quelle stammen und sicher sind. L=
eiten Sie die E-Mail im Zweifelsfall zur Pr=C3=BCfung an den IT-Helpdesk we=
iter.
> Attention external email: Open attachments and links only if you know tha=
t they are from a secure source and are safe. In doubt forward the email to=
 the IT-Helpdesk to check it.
> ********************
>=20
> On Fri Mar 14, 2025 at 4:41 PM CDT, Denys Dmytriyenko wrote:
> > + Randolph Sapp as a domain expert here
> >=20
> >=20
> > On Thu, Mar 06, 2025 at 03:12:17PM +0100, Matthias Schiffer via lists.y=
octoproject.org wrote:
> > > The omap5-sgx-ddk-linux Makefiles contain a list of target triple
> > > patterns that are detected as "Yocto" to deal with arm vs. armhf targ=
et
> > > selection. This breaks for Yocto distros that override TARGET_VENDOR,
> > > requiring patches like [1]; similar patches can also be found in othe=
r
> > > vendors' machine layers.
> > >=20
> > > Work around the incorrect target selection by passing TARGET_PRIMARY_=
ARCH
> > > via EXTRA_OEMAKE.
> > >=20
> > > [1] https://github.com/tq-systems/meta-tq/blob/scarthgap.TQ.ARM.BSP.0=
003/meta-tq/dynamic-layers/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-d=
dk-km/linux-5.10/0001-ti-sgx-ddk-km-properly-handle-more-OE-YP-compiler-pr.=
patch
> > >=20
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > ---
> > >=20
> > > Tested with meta-tq + meta-ti scarthgap for am335x.
> > >=20
> > >  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb     | 11 +++++----=
--
> > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.=
17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.=
4948957.bb
> > > index 49376221..aaeee1d2 100644
> > > --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948=
957.bb
> > > +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948=
957.bb
> > > @@ -28,8 +28,11 @@ TARGET_PRODUCT:am65xx =3D "ti654x_linux"
> > >  PVR_BUILD =3D "release"
> > >  PVR_WS =3D "lws-generic"
> > > =20
> > > +TARGET_PRIMARY_ARCH =3D "target_armhf"
> > > +TARGET_PRIMARY_ARCH:aarch64 =3D "target_aarch64"
> > > +
> > >  EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR=
_BUILD} \
> > > -WINDOW_SYSTEM=3D${PVR_WS} PVR_BUILD_DIR=3D${TARGET_PRODUCT}'
> > > +WINDOW_SYSTEM=3D${PVR_WS} PVR_BUILD_DIR=3D${TARGET_PRODUCT} TARGET_P=
RIMARY_ARCH=3D${TARGET_PRIMARY_ARCH}'
> > > =20
> > >  # There are useful flags here that are interpreted by the final kbui=
ld pass
> > >  # These variables are not necessary when compiling outside of Yocto
> > > @@ -40,11 +43,7 @@ export KERNEL_OBJCOPY
> > >  export KERNEL_STRIP
> > > =20
> > >  do_install() {
> > > -    make -C ${STAGING_KERNEL_DIR} M=3D${B}/eurasiacon/binary_${TARGE=
T_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=3D${=
D}${root_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install
> > > -}
> > > -
> > > -do_install:am65xx() {
> > > -    make -C ${STAGING_KERNEL_DIR} M=3D${B}/eurasiacon/binary_${TARGE=
T_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D=
${D}${root_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install
> > > +    make -C ${STAGING_KERNEL_DIR} M=3D${B}/eurasiacon/binary_${TARGE=
T_PRODUCT}_${PVR_WS}_${PVR_BUILD}/${TARGET_PRIMARY_ARCH}/kbuild INSTALL_MOD=
_PATH=3D${D}${root_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install
> > >  }
> > > =20
> > >  RRECOMMENDS:${PN} +=3D "ti-sgx-ddk-um"
>=20
> NAK, in my opinion this should not be handled by the Yocto recipe and ins=
tead
> the compiler patterns need to be updated to properly match the given comp=
iler.
> I'll update the source repo and this recipe to resolve the issue outlined=
 above.

Thanks, that makes sense.

The whole point of matching these patterns appears to be to detect Yocto
compilers, which do not add the "hf" suffix in their target names. The prob=
lem
is that there is no single pattern that matches all (and only) Yocto compil=
ers
because many BSP vendors include their own name in the toolchain tuple.

However, I'm not sure why that even matters - there don't seem to be any fl=
ags
set specifically for hard or soft float. Maybe the whole detection should j=
ust
be removed, using whatever CROSS_COMPILER is set and not caring about the t=
arget
name at all?

Best,
Matthias



--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

