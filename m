Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DFF9E00288
	for <meta-ti@yoctoproject.org>; Wed,  5 Feb 2014 16:15:17 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s160FGZi028543
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 18:15:16 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s160FGFT003096
	for <meta-ti@yoctoproject.org>; Wed, 5 Feb 2014 18:15:16 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 5 Feb 2014 18:15:16 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2] linux-keystone-rt: Add new recipe for
	build rt-kernel
Thread-Index: AQHPIsmI8XhY9NxRcUKnjcEcJnFBGpqns+kA//+eXCA=
Date: Thu, 6 Feb 2014 00:15:16 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549F0C40@DLEE11.ent.ti.com>
References: <1391642718-24978-1-git-send-email-sam.nelson@ti.com>
	<20140205233154.GC18784@edge>
In-Reply-To: <20140205233154.GC18784@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2] linux-keystone-rt: Add new recipe for build rt-kernel
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Feb 2014 00:15:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, February 05, 2014 6:32 PM
> To: Nelson, Sam
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH v2] linux-keystone-rt: Add new recipe for b=
uild
> rt-kernel
>=20
> On Wed, Feb 05, 2014 at 06:25:18PM -0500, Sam Nelson wrote:
> > - Builds kernel tree with RT patches
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>=20
> Ack.
>=20
> Just to check in general for your kernels and SDKs - you don't want
> devicetree
> files to be in the /boot directory of your rootfs, right?
[Sam] In general my thinking is that,  it is not required.=20
But I am not sure if there is some kernel recovery procedure which may requ=
ire this.
>=20
>=20
> > ---
> > Changed from previous patch
> > * Added PV 3.10.10
> > * Renamed linux-keystone-rt-3.10/defconfig
> >   -->linux-keystone-rt/defconfig
> > ---
> > ---
> >  recipes-kernel/linux/linux-keystone-rt/defconfig   |    1 +
> >  ...-keystone_3.10.bb =3D> linux-keystone-rt_3.10.bb} |    8 ++++----
> >  2 files changed, 5 insertions(+), 4 deletions(-)
> >  create mode 100644 recipes-kernel/linux/linux-keystone-rt/defconfig
> >  copy recipes-kernel/linux/{linux-keystone_3.10.bb =3D> linux-keystone-
> rt_3.10.bb} (76%)
> >
> > diff --git a/recipes-kernel/linux/linux-keystone-rt/defconfig b/recipes=
-
> kernel/linux/linux-keystone-rt/defconfig
> > new file mode 100644
> > index 0000000..731bb00
> > --- /dev/null
> > +++ b/recipes-kernel/linux/linux-keystone-rt/defconfig
> > @@ -0,0 +1 @@
> > +use-kernel-config=3Dkeystone2_fullrt_defconfig
> > diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-
> kernel/linux/linux-keystone-rt_3.10.bb
> > similarity index 76%
> > copy from recipes-kernel/linux/linux-keystone_3.10.bb
> > copy to recipes-kernel/linux/linux-keystone-rt_3.10.bb
> > index 2384ede..9c2f904 100644
> > --- a/recipes-kernel/linux/linux-keystone_3.10.bb
> > +++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
> > @@ -1,5 +1,5 @@
> >  SECTION =3D "kernel"
> > -DESCRIPTION =3D "Linux kernel for TI Keystone devices"
> > +DESCRIPTION =3D "Linux RT kernel for TI Keystone devices"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> >
> > @@ -17,11 +17,11 @@ KERNEL_DEVICETREE_keystone-evm =3D "k2hk-
> evm.dtb"
> >
> >  KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
> >
> > -#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> > -SRCREV =3D "335d14b1c2ce23585835243126c6acba89067ecf"
> > +#This commit corresponds to "K2_RT_LINUX_03.10.10_13.12"
> > +SRCREV =3D "8fa9091d0f9c91a048a975ddebbf2f492e73bf61"
> >  PV =3D "3.10.10"
> >
> > -BRANCH =3D "master"
> > +BRANCH =3D "master-rt"
> >  SRC_URI =3D "git://git.ti.com/keystone-
> linux/linux.git;protocol=3Dgit;branch=3D${BRANCH}\
> >             file://defconfig\
> >             "
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

