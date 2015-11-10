Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC148E00BAB; Tue, 10 Nov 2015 07:46:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C508E00ADB
	for <meta-ti@yoctoproject.org>; Tue, 10 Nov 2015 07:46:33 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAAFkX7f027751
	for <meta-ti@yoctoproject.org>; Tue, 10 Nov 2015 09:46:33 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAAFkXXQ021389
	for <meta-ti@yoctoproject.org>; Tue, 10 Nov 2015 09:46:33 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Nov 2015 09:46:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAAFkWrE030216;
	Tue, 10 Nov 2015 09:46:33 -0600
Date: Tue, 10 Nov 2015 10:46:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20151110154617.GA3272@edge>
References: <1446680984-26212-1-git-send-email-h-gou@ti.com>
	<20151109190252.GV25957@edge>
	<2E957F12D11D904590FA9AF86D366BD926AEE0B7@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2E957F12D11D904590FA9AF86D366BD926AEE0B7@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] omap5-sgx-ddk-um-linux: bump SRCREV and update powervr.ini and .so inclusion for AM3
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
X-List-Received-Date: Tue, 10 Nov 2015 15:46:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, pushed.

On Mon, Nov 09, 2015 at 05:50:38PM -0500, Gou, Hongmei wrote:
> The patch is rebased and submitted.
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Monday, November 09, 2015 2:03 PM
> > To: Gou, Hongmei
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] omap5-sgx-ddk-um-linux: bump SRCREV and
> > update powervr.ini and .so inclusion for AM3
> > 
> > This would need to be rebased due to v2 of previous patch.
> > 
> > 
> > On Wed, Nov 04, 2015 at 06:49:44PM -0500, Hongmei Gou wrote:
> > > * Bump SRCREV for DRM FLIP mode support, and update powervr.ini
> > correspondingly
> > > * Add plugins package to include the necessary .so files
> > >
> > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > ---
> > >  recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini | 3
> > ++-
> > >  recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb       | 7 ++++-
> > --
> > >  2 files changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
> > linux/ti33x/powervr.ini b/recipes-graphics/libgles/omap5-sgx-ddk-um-
> > linux/ti33x/powervr.ini
> > > index 0657ab8..5b5608e 100644
> > > --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
> > > +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti33x/powervr.ini
> > > @@ -1,3 +1,4 @@
> > >  [default]
> > > -WindowSystem=null_libdrm.so
> > > +WindowSystem=libpvrDRMWSEGL_FRONT.so
> > > +#WindowSystem=libpvrDRMWSEGL.so
> > >  DisableHWTQTextureUpload=1
> > > diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > > index 557c442..b8a0445 100644
> > > --- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > > +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
> > > @@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-
> > DDK-UM-Manifest.doc;md5=360d293d
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > >
> > >  BRANCH_omap-a15 = "master"
> > > -BRANCH_ti33x = "am4/k4.1"
> > > +BRANCH_ti33x = "am3/k4.1"
> > >  BRANCH_ti43x = "am4/k4.1"
> > >
> > >  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-
> > linux.git;protocol=git;branch=${BRANCH}"
> > >  SRCREV_omap-a15 = "d63cd6469fff610317a8e1c986f227bb3e7922f6"
> > > -SRCREV_ti33x    = "188575c7ba16c00a15499ed88a126af2506fdba5"
> > > +SRCREV_ti33x    = "b535b96043ae2206e0c3d24b66599ca0fbe706d3"
> > >  SRCREV_ti43x    = "fdf4c0b594ca142a68aabb4c3f82b75be50b46cc"
> > >
> > >  INITSCRIPT_NAME = "pvr-init"
> > > @@ -19,7 +19,7 @@ INITSCRIPT_PARAMS = "defaults 8"
> > >
> > >  inherit update-rc.d
> > >
> > > -PR = "r12"
> > > +PR = "r13"
> > >  PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
> > >
> > >  RDEPENDS_${PN} += "libdrm"
> > > @@ -53,6 +53,7 @@ FILES_${PN} += "${sysconfdir}/powervr.ini"
> > >  PACKAGES =+ "${PN}-plugins"
> > >  FILES_${PN}-plugins = ""
> > >  FILES_${PN}-plugins_ti43x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so
> > ${libdir}/libglslcompiler.so ${libdir}/libpvrws_WAYLAND.so
> > ${libdir}/libpvrws_KMS.so "
> > > +FILES_${PN}-plugins_ti33x = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so
> > ${libdir}/libglslcompiler.so ${libdir}/libpvrDRMWSEGL.so
> > ${libdir}/libpvrDRMWSEGL_FRONT.so "
> > >  RDEPENDS_${PN} += "${PN}-plugins"
> > >
> > >  INHIBIT_PACKAGE_STRIP = "1"
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

