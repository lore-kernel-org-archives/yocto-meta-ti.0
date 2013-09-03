Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67808E00734
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 10:46:40 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r83HkdKF023277
	for <meta-ti@yoctoproject.org>; Tue, 3 Sep 2013 12:46:39 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83HkdTw010964
	for <meta-ti@yoctoproject.org>; Tue, 3 Sep 2013 12:46:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 3 Sep 2013 12:46:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r83HkcL2009473	for
	<meta-ti@yoctoproject.org>; Tue, 3 Sep 2013 12:46:38 -0500
Date: Tue, 3 Sep 2013 13:46:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Message-ID: <20130903174638.GH22235@edge>
References: <CF956B779D819D41BBC043B7082161D54445D0@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101596CBD7C@DLEE11.ent.ti.com>
	<20130819154524.GC7460@edge>
MIME-Version: 1.0
In-Reply-To: <20130819154524.GC7460@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCHv2] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Tue, 03 Sep 2013 17:46:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Mrinmayee,

Ping on this one too.


On Mon, Aug 19, 2013 at 11:45:24AM -0400, Denys Dmytriyenko wrote:
> On Mon, Aug 19, 2013 at 03:09:55PM +0000, Maupin, Chase wrote:
> > >-----Original Message-----
> > >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > >bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
> > >Sent: Sunday, August 18, 2013 11:55 PM
> > >To: meta-ti@yoctoproject.org
> > >Subject: [meta-ti] [PATCHv2] libgles: Added prebuilt userspace
> > >libraries for graphics acceleration
> > >
> > >
> > >Subject: [PATCHv2] libgles: Added prebuilt userspace libraries for
> > >graphics acceleration
> > >
> > >* These libraries are not distributable in source and hence
> > >  are available only as binary. They implement OpenGLES 1.x and
> > >  OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
> > >  class of devices.
> > >
> > >v2:
> > >
> > >Addressed Chases's comments:
> > >* Updated the PR
> > >* Added shasum for the tarball
> > >* Removed redundant FILES section.
> > >
> > >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > >Signed-off-by: Siddharth Heroor <heroor@ti.com>
> > >---
> > > .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   20
> > >++++++++++++++++++++
> > > 1 file changed, 20 insertions(+)
> > > create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-
> > >linux_1.9.0.10.bb
> > >
> > >diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
> > >linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
> > >linux_1.9.0.10.bb
> > >new file mode 100644
> > >index 0000000..052f343
> > >--- /dev/null
> > >+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> > >@@ -0,0 +1,20 @@
> > >+DESCRIPTION = "Userspace libraries for sgx"
> > >+HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
> > >+LICENSE = "TI"
> > >+
> > >+SRC_URI =
> > >"http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/
> > >gfxsdk/OMAP5_1_09_00_10//exports/omap5-sgx-ddk-um-linux-
> > >${PV}.tar.gz;protocol=http"
> > >+
> > >+LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-
> > >Manifest.doc;md5=d280df8e94bb2e7b9251c8526078eeb8"
> > >+
> > >+PR = "r0"
> > >+
> > >+SRC_URI[md5sum] = "3cfb875de031098a4c1eeeaf4e442367"
> > >+SRC_URI[shasum] = "773299242fc72a5837b7e17053123ad55d69723b"
> > 
> > This should be a sha256sum.  So your checksum is too small and you need to specify SRC_URI[sh256sum]
> 
> You can also just run a recipe once through bitbake and it will tell you there 
> are no checksums and provide a handy cut and paste lines to populate them.
> 
> 
> > >+
> > >+S = "${WORKDIR}/${PN}-${PV}"
> > >+
> > >+do_install () {
> > >+    oe_runmake install DESTDIR=${D}
> > >+}
> > >+
> > >+FILES_${PN} += " ${libdir}/gbm/"
> > >--
> > >1.7.9.5
> > >
> > >_______________________________________________
> > >meta-ti mailing list
> > >meta-ti@yoctoproject.org
> > >https://lists.yoctoproject.org/listinfo/meta-ti
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

