Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93DE9E005B7; Mon, 30 Nov 2015 09:01:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F2FFE00457
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 09:01:49 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAUH1nOD010014
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 11:01:49 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAUH1ncV015487
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 11:01:49 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 30 Nov 2015 11:01:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAUH1m2I025076;
	Mon, 30 Nov 2015 11:01:48 -0600
Date: Mon, 30 Nov 2015 12:01:33 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20151130170132.GN28188@edge>
References: <1448489243-26741-1-git-send-email-sam.nelson@ti.com>
	<20151125221639.GE28188@edge>
	<4F9216F96E5DF9428610502835A9F4905828C245@DLEE11.ent.ti.com>
	<20151125224115.GF28188@edge>
	<4F9216F96E5DF9428610502835A9F4905828C27A@DLEE11.ent.ti.com>
	<20151125225456.GG28188@edge>
	<4F9216F96E5DF9428610502835A9F4905828C2F9@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905828C2F9@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] mpm-transport: Update to new version 2.0.0.0
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
X-List-Received-Date: Mon, 30 Nov 2015 17:01:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

After bunch of fixes to pull the necessary dependencies for k2g, mpm-transport 
still fails due to this:

| sharedmem/mpm_transport_sharedmem.c:44:28: fatal error: uio_module_drv.h: No such file or directory
|  #include "uio_module_drv.h"

The version of uio_module_drv we have doesn't even have the necessary header 
file:
http://git.ti.com/gitweb/?p=keystone-linux/uio-module-drv.git;a=tree

If it expects said header to be part of mpm-transport, it's not in that repo 
either:
http://git.ti.com/gitweb/?p=keystone-linux/mpm-transport.git;a=tree;h=refs/heads/linux41;hb=refs/heads/linux41

-- 
Denys


On Wed, Nov 25, 2015 at 06:16:19PM -0500, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, November 25, 2015 5:55 PM
> > To: Nelson, Sam
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH 1/2] mpm-transport: Update to new version
> > 2.0.0.0
> > 
> > On Wed, Nov 25, 2015 at 05:47:53PM -0500, Nelson, Sam wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Wednesday, November 25, 2015 5:41 PM
> > > > To: Nelson, Sam
> > > > Cc: meta-ti@yoctoproject.org
> > > > Subject: Re: [meta-ti] [PATCH 1/2] mpm-transport: Update to new
> > > > version
> > > > 2.0.0.0
> > > >
> > > > On Wed, Nov 25, 2015 at 05:33:54PM -0500, Nelson, Sam wrote:
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Dmytriyenko, Denys
> > > > > > Sent: Wednesday, November 25, 2015 5:17 PM
> > > > > > To: Nelson, Sam
> > > > > > Cc: meta-ti@yoctoproject.org
> > > > > > Subject: Re: [meta-ti] [PATCH 1/2] mpm-transport: Update to new
> > > > > > version
> > > > > > 2.0.0.0
> > > > > >
> > > > > > On Wed, Nov 25, 2015 at 05:07:22PM -0500, Sam Nelson wrote:
> > > > > > > - Updates to work with kernel version 4.1 and other uio driver
> > > > > > > changes
> > > > > > > - Making the package machine specific and hence the
> > > > > > > dependencies according to the platform is updated
> > > > > > > - Add use of oe_runmake instead of direct call to make
> > > > > > >
> > > > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > > > ---
> > > > > > >  recipes-ti/mpm-transport/mpm-transport_git.bb | 30
> > > > > > > ++++++++++++++++-----------
> > > > > > >  1 file changed, 18 insertions(+), 12 deletions(-)
> > > > > > >
> > > > > > > diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > > > > > b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > > > > > index 752ada5..cc211ce 100644
> > > > > > > --- a/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > > > > > +++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
> > > > > > > @@ -3,16 +3,27 @@ HOMEPAGE =
> > > > > > > "http://git.ti.com/cgit/cgit.cgi/keystone-
> > > > > > linux/mpm-transport.git"
> > > > > > >  LICENSE = "BSD-3-Clause & MIT"
> > > > > > >  LIC_FILES_CHKSUM =
> > > > > > "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
> > > > > > >  COMPATIBLE_MACHINE = "keystone"
> > > > > > > -DEPENDS = "common-csl-ip hyplnk-lld edma3-lld mmap-lld cmem
> > > > > > > rm-lld
> > > > > > qmss-lld cppi-lld srio-lld"
> > > > > > > +
> > > > > > > +DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld
> > > > > > > +qmss-lld
> > > > > > cppi-lld uio-module-drv syslog-ng"
> > > > > >
> > > > > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-b
> > > > > > sp/m
> > > > > > map-
> > > > > > lld/mmap-lld.inc?h=fido#n3
> > > > > > Will fail for k2l and k2g...
> > > > > The mmap-lld recipes need to be updated to build for k2l and k2g.
> > > > > My
> > > > understanding is same drivers should work.
> > > >
> > > > Well, at least the test part has only k/h/e devices in the list:
> > > >
> > > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/m
> > > > map-
> > > > lld/mmap-lld-test_git.bb?h=fido#n11
> > > Test part may need update per device. Currently hope this is not a show
> > stopper.
> > 
> > So, are you saying mmap-lld can lax the restrictions in the same version? Or
> > do you mean a new version is required?
> > 
> Same version can work. 
> > 
> > > > > > > +DEPENDS_append_k2hk-evm += "hyplnk-lld srio-lld"
> > > > > > > +DEPENDS_append_k2e-evm += "hyplnk-lld"
> > > > > > > +
> > > > > > > +RDEPENDS_${PN} = "syslog-ng"
> > > > > > > +
> > > > > > > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > > > >
> > > > > > >  SRC_URI = "git://git.ti.com/keystone-linux/mpm-
> > > > > > transport.git;protocol=git;branch=${BRANCH}"
> > > > > > >
> > > > > > > -BRANCH = "master"
> > > > > > > -# This commit corresponds to tag DEV.MPM-TRANSPORT-
> > 01.00.08.03
> > > > > > > -SRCREV = "f6c5426d68c2be832903b6d215370c94e134167f"
> > > > > > > +BRANCH = "linux41"
> > > > > > > +# This commit corresponds to tag DEV.MPM-TRANSPORT-
> > > > > > 02.00.00.00_ENG
> > > > > > > +SRCREV = "892e93238b7f9f480ddceb7ade042026a4d178bd"
> > > > > > >
> > > > > > > -PV = "1.0.8.3"
> > > > > > > -PR = "r1"
> > > > > > > +PV = "2.0.0.0"
> > > > > > > +PR = "r0"
> > > > > > > +
> > > > > > > +EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
> > > > > > > +EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true
> > > > > > SRIO_TRANSPORT=true"
> > > > > > > +EXTRA_OEMAKE_append_k2e-evm += "HYPLNK_TRANSPORT=true"
> > > > > > >
> > > > > > >  S = "${WORKDIR}/git"
> > > > > > >
> > > > > > > @@ -25,13 +36,8 @@ FILES_${PN}-test =
> > > > > > "${bindir}/mpm_transport_test.out \
> > > > > > >
> > > > > > 	${bindir}/mpm_transport_qmss_arm_mt.out \
> > > > > > >
> > > > > > 	${bindir}/mpm_transport_srio_arm_mt.out"
> > > > > > >
> > > > > > > -do_compile () {
> > > > > > > -	cd ${S}
> > > > > > > -	make PDK_INSTALL_PATH=${STAGING_INCDIR}
> > > > > > > -}
> > > > > > > -
> > > > > > >  do_install() {
> > > > > > > -	make installbin BASE_DIR=${S}
> > > > > > INSTALL_BIN_BASE_DIR=${D}/${bindir}
> > > > > > > +	oe_runmake installbin BASE_DIR=${S}
> > > > > > > +INSTALL_BIN_BASE_DIR=${D}/${bindir}
> > > > > > >
> > > > > > >  	install -d ${D}${includedir}/
> > > > > > >  	install -c -m 755 ${S}/include/* ${D}${includedir}/
> > > > > > > --
> > > > > > > 1.9.1
> > > > > > >
> > > > > > > --
> > > > > > > _______________________________________________
> > > > > > > meta-ti mailing list
> > > > > > > meta-ti@yoctoproject.org
> > > > > > > https://lists.yoctoproject.org/listinfo/meta-ti

