Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B033E0088A; Thu, 26 Feb 2015 07:16:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CFEFE00779
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 07:16:41 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QFGftm006370
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 09:16:41 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QFGecd015599
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 09:16:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 09:16:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QFGeX2015547;
	Thu, 26 Feb 2015 09:16:40 -0600
Date: Thu, 26 Feb 2015 10:16:40 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150226151640.GB6052@edge>
References: <1424957651-5207-1-git-send-email-j-stiffler@ti.com>
	<1424957651-5207-5-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C82B2BF@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C82B2BF@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 26 Feb 2015 15:16:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 26, 2015 at 02:02:22PM +0000, Cooper Jr., Franklin wrote:
> Mesa as a whole as a MIT license based on the recipe. Looking at the license 
> for those headers your using they are also using a MIT license. So this 
> program should have a BSD and MIT license.
> Also your missing a PR which I think Denys still wants to include for 
> package upgrading purposes. But it's up to him.

But this one is not an upgrade, so not sure why do you need a PR?


> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> > Sent: Thursday, February 26, 2015 7:34 AM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] [RFC PATCH 4/6] opencl-monitor: OpenCL firmware which
> > runs on the accelerators.
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  recipes-ti/ocl/opencl-monitor_git.bb |   41
> > ++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 recipes-ti/ocl/opencl-monitor_git.bb
> > 
> > diff --git a/recipes-ti/ocl/opencl-monitor_git.bb b/recipes-ti/ocl/opencl-
> > monitor_git.bb
> > new file mode 100644
> > index 0000000..54b3f45
> > --- /dev/null
> > +++ b/recipes-ti/ocl/opencl-monitor_git.bb
> > @@ -0,0 +1,41 @@
> > +DESCRIPTION = "TI OpenCL"
> > +HOMEPAGE = "https://gitorious.design.ti.com/ocl"
> > +LICENSE = "BSD"
> > +
> > +include ocl.inc
> > +
> > +inherit cmake
> > +
> > +COMPATIBLE_MACHINE = "dra7xx"
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +SRC_URI_append = " \
> > +    ${SRC_URI_OPENCL} \
> > +    ${SRC_URI_MONITOR} \
> > +    ${SRC_URI_BUILTINS} \
> > +    ${SRC_URI_LIBM} \
> > +    ${SRC_URI_MONITOR_IMAGE} \
> > +    ${MONITOR_PATCHES} \
> > +    ${OPENCL_PATCHES} \
> > +    ${OPENGL_HEADERS} \
> > +"
> > +
> > +S = "${WORKDIR}/git/opencl_monitor"
> > +
> > +
> > +do_compile_append() {
> > +    cp -rv ${WORKDIR}/opencl_monitor-vayu-0.12.0/* ${S}/ }
> > +
> > +do_install_append() {
> > +    cp -v ${D}${datadir}/ti/opencl/dsp0.out ${D}${datadir}/ti/opencl/dsp.out
> > +    cp -v ${D}${datadir}/ti/opencl/dsp0.syms
> > +${D}${datadir}/ti/opencl/dsp.syms }
> > +
> > +FILES_${PN} += " \
> > +    ${datadir}/ti/opencl/* \
> > +    ${base_libdir}/firmware/* \
> > +"
> > +
> > +INSANE_SKIP_${PN} = "arch"
> > +
> > --
> > 1.7.9.5
> > 
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

