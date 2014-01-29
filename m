Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EB6DE0049B
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 15:29:36 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0TNTYml018886
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 17:29:34 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TNTXv4027984
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 17:29:33 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 29 Jan 2014 17:29:33 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH] linux-keystone: Create recipe for
	linux-keystone kernel version 3.10
Thread-Index: AQHPG+CbysOsdHEi9kiqRqLYfqsxKpqZ8XkAgAKsxgD//53XsA==
Date: Wed, 29 Jan 2014 23:29:32 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490549E9975@DLEE11.ent.ti.com>
References: <1390882969-22545-1-git-send-email-sam.nelson@ti.com>
	<20140128043508.GC6814@edge> <20140129212602.GB6321@denix.org>
In-Reply-To: <20140129212602.GB6321@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] linux-keystone: Create recipe for linux-keystone kernel version 3.10
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
X-List-Received-Date: Wed, 29 Jan 2014 23:29:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Wednesday, January 29, 2014 4:26 PM
> To: Nelson, Sam; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] linux-keystone: Create recipe for linux-
> keystone kernel version 3.10
>=20
> Sam,
>=20
> Do you need any help with updating this patch? Please let me know if
> something
> is not very clear or you just need more time. I don't want to lose moment=
um
> :)
> Thanks.
>=20
> --
> Denys
>=20
>=20
> On Mon, Jan 27, 2014 at 11:35:08PM -0500, Denys Dmytriyenko wrote:
> > On Mon, Jan 27, 2014 at 11:22:49PM -0500, Sam Nelson wrote:
> > > - Updated Source URL & version
> > > - Added device tree file
> >
> > Do you need to keep 3.8.4 version around? If not, why not upgrade
> instead?
[Sam] You are asking to delete the linux-keystone_3.8.4.bb  and the corresp=
onding directory linux-keystone-3.8.4?
> > Also, I would strongly recommend using linux-ti-kernel_3.12.bb as an
> example.
[Sam].
I could not find a recipe named: linux-ti-kernel_3.12.bb. Appreciate your h=
elp.
(I can see meta-ti/recipes-kernel/linux-ti-staging_3.12.bb. Is that what yo=
u are referring to?)
> >
> >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  recipes-kernel/linux/linux-keystone_3.10.bb |   36
> +++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >  create mode 100644 recipes-kernel/linux/linux-keystone_3.10.bb
> > >
> > > diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-
> kernel/linux/linux-keystone_3.10.bb
> > > new file mode 100644
> > > index 0000000..b37a404
> > > --- /dev/null
> > > +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> > > @@ -0,0 +1,36 @@
> > > +SECTION =3D "kernel"
> > > +DESCRIPTION =3D "Linux kernel for TI Keystone devices"
> > > +LICENSE =3D "GPLv2"
> > > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> > > +
> > > +COMPATIBLE_MACHINE =3D "keystone"
> > > +
> > > +inherit kernel
> > > +
> > > +do_deploy_append() {
> > > +    cd ${S}
> > > +}
> >
> > I don't remember if this is still needed...
[Sam] Not sure either why this is needed. I can remove and check.
> >
> >
> > > +require recipes-kernel/linux/linux-dtb.inc
> > > +require recipes-kernel/linux/setup-defconfig.inc
> > > +
> > > +MACHINE_KERNEL_PR_append =3D "a"
> > > +
> > > +CORTEXA8FIXUP =3D "no"
> > > +
> > > +KERNEL_DEVICETREE_keystone-evm =3D "arch/${ARCH}/boot/dts/k2hk-
> evm.dts"
> >
> > You can use just "k2hk-evm.dtb" instead.
> >
[Sam] Ok.
> >
> > > +#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> > > +SRCREV =3D "335d14b1c2ce23585835243126c6acba89067ecf"
> > > +
> > > +BRANCH =3D "master"
> > > +
> > > +# for nightly switch the three lines below
> >
> > ^^^ ?
> >
[Sam]  Missed to remove this line.
> >
> > > +SRC_URI =3D "git://git.ti.com/keystone-
> linux/linux.git;protocol=3Dgit;branch=3D${BRANCH}\
> > > +           file://defconfig\
> > > +           "
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +RDEPENDS_kernel-base =3D ""
> > > +
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >

