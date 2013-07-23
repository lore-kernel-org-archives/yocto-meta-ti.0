Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEA43E01528
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 10:12:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NHCHHC009932
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 12:12:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NHCHnk004757
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 12:12:17 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 12:12:17 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NHCHHc027444;
	Tue, 23 Jul 2013 12:12:17 -0500
Date: Tue, 23 Jul 2013 13:12:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130723171216.GP31158@edge>
References: <20130701123155.GA16127@ti.com>
	<7D46E86EC0A8354091174257B2FED1015962B52B@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015962B52B@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Tue, 23 Jul 2013 17:12:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping for addressing Chase's comments?

On Mon, Jul 01, 2013 at 01:45:40PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
> >Sent: Monday, July 01, 2013 7:32 AM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH 2/2] libgles: Added prebuilt userspace
> >libraries for graphics acceleration
> >
> >* These libraries are not distributable in source and hence
> >  are available only as binary. They implement OpenGLES 1.x and
> >  OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
> >  class of devices.
> >
> >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >Signed-off-by: Siddharth Heroor <heroor@ti.com>
> >---
> > .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   24
> >++++++++++++++++++++
> > 1 files changed, 24 insertions(+), 0 deletions(-)
> > create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-
> >linux_1.9.0.10.bb
> >
> >diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
> >linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
> >linux_1.9.0.10.bb
> >new file mode 100644
> >index 0000000..d3a847d
> >--- /dev/null
> >+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> >@@ -0,0 +1,24 @@
> >+DESCRIPTION = "Userspace libraries for sgx"
> >+HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
> >+LICENSE = "TI"
> >+DEPENDS = ""
> 
> Why do you want to blank out the default DEPENDS?
> 
> >+
> >+SRC_URI =
> >"http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/
> >gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-
> >${PV}.tar.gz;protocol=http"
> >+
> >+LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-
> >Manifest.doc;md5=d280df8e94bb2e7b9251c8526078eeb8"
> 
> Is the manifest truly your license file as well?
> 
> >+
> >+PR = "r1"
> 
> Why not start at r0?
> 
> >+
> >+SRC_URI[md5sum] = "3cfb875de031098a4c1eeeaf4e442367"
> 
> Don't you need a sha256sum too?
> 
> >+
> >+S = "${WORKDIR}/${PN}-${PV}"
> >+
> >+do_install () {
> >+    oe_runmake install DESTDIR=${D}
> >+}
> >+
> >+PACKAGES =+ "${PN}-${PV}"
> 
> Why do you want to make a version specific package?  Why not just leave the default PN?  You also don't define any files to be part of that package.
> 
> >+
> >+FILES_${PN} =  "${bindir}/*"
> >+FILES_${PN} += " ${libdir}/*"
> >+FILES_${PN} +=  "${includedir}/*"
> 
> Shouldn't many of these directories already be in the base FILES set?  Why re-set them?
> 
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

