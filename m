Return-Path: <fcooper@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DB57E008CD; Thu, 26 Feb 2015 07:17:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46AB0E00779
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:17:28 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QFHSrR014960
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 09:17:28 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QFHRhf009345
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 09:17:27 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Thu, 26 Feb 2015 09:17:27 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware
	which	runs on the accelerators.
Thread-Index: AQHQUckVbziwrt+0lUyUf5BcB059TJ0C9SfAgAB6TAD//5tnQA==
Date: Thu, 26 Feb 2015 15:17:26 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C82C62B@DFLE08.ent.ti.com>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
	<1424957651-5207-5-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C82B2BF@DFLE08.ent.ti.com>
	<20150226151640.GB6052@edge>
In-Reply-To: <20150226151640.GB6052@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [RFC PATCH 4/6] opencl-monitor: OpenCL firmware which	runs on the accelerators.
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
X-List-Received-Date: Thu, 26 Feb 2015 15:17:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, February 26, 2015 9:17 AM
> To: Cooper Jr., Franklin
> Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware
> which runs on the accelerators.
>=20
> On Thu, Feb 26, 2015 at 02:02:22PM +0000, Cooper Jr., Franklin wrote:
> > Mesa as a whole as a MIT license based on the recipe. Looking at the
> > license for those headers your using they are also using a MIT
> > license. So this program should have a BSD and MIT license.
> > Also your missing a PR which I think Denys still wants to include for
> > package upgrading purposes. But it's up to him.
>=20
> But this one is not an upgrade, so not sure why do you need a PR?
[Franklin] Without a PR people tend to forget to bump it.
>=20
>=20
> > > -----Original Message-----
> > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> > > Sent: Thursday, February 26, 2015 7:34 AM
> > > To: meta-ti@yoctoproject.org
> > > Subject: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware
> > > which runs on the accelerators.
> > >
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  recipes-ti/ocl/opencl-monitor_git.bb |   41
> > > ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > >  create mode 100644 recipes-ti/ocl/opencl-monitor_git.bb
> > >
> > > diff --git a/recipes-ti/ocl/opencl-monitor_git.bb
> > > b/recipes-ti/ocl/opencl- monitor_git.bb new file mode 100644 index
> > > 0000000..54b3f45
> > > --- /dev/null
> > > +++ b/recipes-ti/ocl/opencl-monitor_git.bb
> > > @@ -0,0 +1,41 @@
> > > +DESCRIPTION =3D "TI OpenCL"
> > > +HOMEPAGE =3D "https://gitorious.design.ti.com/ocl"
> > > +LICENSE =3D "BSD"
> > > +
> > > +include ocl.inc
> > > +
> > > +inherit cmake
> > > +
> > > +COMPATIBLE_MACHINE =3D "dra7xx"
> > > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > +
> > > +SRC_URI_append =3D " \
> > > +    ${SRC_URI_OPENCL} \
> > > +    ${SRC_URI_MONITOR} \
> > > +    ${SRC_URI_BUILTINS} \
> > > +    ${SRC_URI_LIBM} \
> > > +    ${SRC_URI_MONITOR_IMAGE} \
> > > +    ${MONITOR_PATCHES} \
> > > +    ${OPENCL_PATCHES} \
> > > +    ${OPENGL_HEADERS} \
> > > +"
> > > +
> > > +S =3D "${WORKDIR}/git/opencl_monitor"
> > > +
> > > +
> > > +do_compile_append() {
> > > +    cp -rv ${WORKDIR}/opencl_monitor-vayu-0.12.0/* ${S}/ }
> > > +
> > > +do_install_append() {
> > > +    cp -v ${D}${datadir}/ti/opencl/dsp0.out
> ${D}${datadir}/ti/opencl/dsp.out
> > > +    cp -v ${D}${datadir}/ti/opencl/dsp0.syms
> > > +${D}${datadir}/ti/opencl/dsp.syms }
> > > +
> > > +FILES_${PN} +=3D " \
> > > +    ${datadir}/ti/opencl/* \
> > > +    ${base_libdir}/firmware/* \
> > > +"
> > > +
> > > +INSANE_SKIP_${PN} =3D "arch"
> > > +
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

