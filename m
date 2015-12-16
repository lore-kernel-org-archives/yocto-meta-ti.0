Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9BDD6E00AA6; Wed, 16 Dec 2015 10:24:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AD7CE00404
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 10:24:46 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBGIOg1K007724;
	Wed, 16 Dec 2015 12:24:42 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBGIOgC3007135;
	Wed, 16 Dec 2015 12:24:42 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Wed, 16 Dec 2015 12:24:42 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>,
	=?iso-8859-1?Q?Stefan_M=FCller-Klieser?= <s.mueller-klieser@phytec.de>
Thread-Topic: [meta-ti] [PATCH] linux-ti-staging: Work around to avoid race
	condition with external module
Thread-Index: AQHRNmVCQXTEPs/wKUCVZb/uRNp27J7Kx48AgAHcugCAAUtJ8A==
Date: Wed, 16 Dec 2015 18:24:42 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490582B7EC1@DLEE11.ent.ti.com>
References: <1450093668-30879-1-git-send-email-sam.nelson@ti.com>
	<566EB0CE.5030706@phytec.de> <20151215163253.GG23133@edge>
In-Reply-To: <20151215163253.GG23133@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: Work around to avoid race condition with external module
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
X-List-Received-Date: Wed, 16 Dec 2015 18:24:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok. I will go ahead send an update to the one affected module to take care =
of the other part.
With regards,
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, December 15, 2015 11:33 AM
> To: Stefan M=FCller-Klieser
> Cc: Nelson, Sam; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] linux-ti-staging: Work around to avoid rac=
e
> condition with external module
>=20
> Stefan,
>=20
> Yes, indeed, thanks.
>=20
>=20
> Sam,
>=20
> You only picked up part of the fix:
> http://cgit.openembedded.org/openembedded-
> core/commit/?id=3Dafcea61e8eb39234d336c706fdfd4680dea7c060
>=20
> I don't want to overlay the entire module-base.bbclass, so I guess for ou=
r
> problematic out-of-tree modules we can just add this to their recipes:
>=20
> do_configure[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>=20
> --
> Denys
>=20
>=20
> On Mon, Dec 14, 2015 at 01:06:38PM +0100, Stefan M=FCller-Klieser wrote:
> > Hi,
> >
> > this work around introduces another race condition, as you have to make
> > sure every external module recipe depends on
> > do_compile_kernelmodules, and not shared_workdir.
> >
> > Regards,
> > Stefan
> >
> >
> > On 14.12.2015 12:47, Sam Nelson wrote:
> > >- Currently there is an issue with compiling external kernel module
> > >which depends on symbols from another kernel module which is part of t=
he
> > >list of modules configured to be built as modules in the default confi=
g.
> > >- This work around allows to avoid the issue by copying the module
> > >symbols to the kernel directory after making the kernel modules build.
> > >- This issue is already fixed in oe-core: master branch as of date
> > >- This is just work around before updating to latest oe-core
> > >
> > >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > >---
> > >  recipes-kernel/linux/linux-ti-staging_3.14.bb | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > >diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-
> kernel/linux/linux-ti-staging_3.14.bb
> > >index 54530e4..88950ae 100644
> > >--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > >+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > >@@ -65,3 +65,7 @@ KERNEL_GIT_PROTOCOL =3D "git"
> > >  SRC_URI +=3D
> "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRANCH}
> \
> > >              file://defconfig \
> > >             "
> > >+
> > >+do_compile_kernelmodules_append() {
> > >+	cp Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> > >+}
> > >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

