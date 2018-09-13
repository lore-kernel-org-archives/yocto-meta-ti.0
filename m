Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F914E0093B; Thu, 13 Sep 2018 08:28:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,T_FILL_THIS_FORM_SHORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C566E005B1
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 08:28:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DFSAeN061020
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 10:28:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536852490;
	bh=8DyMIKAt/eh9QKw8tQdAVEcKr0FhNDQwSDrQX6vS30c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EyKIbaEuWEl3UdDyl/4h5IjrbhXB1lrFM6dxr/cttE+d9pr13s3iXAnU6GyRdnaUV
	6/RxkfcrpprTnZLJkVh9dof5AQ4w4Hs+m6EszXQzNAv8p1MojkWBXLw1nRPL0aiScM
	7dDEyyK6Kdh/r6YUUkFZEs2xiG4dX9CbAmzJsQvs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DFSAbj006951
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 10:28:10 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 10:28:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 10:28:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DFSAkx029166;
	Thu, 13 Sep 2018 10:28:10 -0500
Date: Thu, 13 Sep 2018 11:26:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180913152644.GO12296@beryl>
References: <1536255983-16162-1-git-send-email-xuj@ti.com>
	<674173dd-2a6b-b932-49f3-e3c30fbfd050@ti.com>
	<20180912191313.GB12296@beryl>
	<0edace8daec141e48401dfaf972f69af@ti.com>
	<20180912202038.GF12296@beryl>
	<f1fe357da2074bee88e9c56c6b5663f1@ti.com>
	<20180912225256.GJ12296@beryl>
	<cf942c47-0bea-3824-969f-c0d748dd422b@ti.com>
MIME-Version: 1.0
In-Reply-To: <cf942c47-0bea-3824-969f-c0d748dd422b@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to build DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and DSPLIB.
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
X-List-Received-Date: Thu, 13 Sep 2018 15:28:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 13, 2018 at 07:26:12AM -0400, Jacob Stiffler wrote:
> 
> 
> On 9/12/2018 6:52 PM, Denys Dmytriyenko wrote:
> >Same for dra7xx-evm...
> >
> >
> >On Wed, Sep 12, 2018 at 04:37:48PM -0400, Dmytriyenko, Denys wrote:
> >>And it crashed and burned right away:
> >>
> >>ERROR: Nothing PROVIDES 'dsplib-c66x' (but /OE/arago-rocko-next-build/sources/meta-arago/meta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb DEPENDS on or otherwise requires it)
> >>dsplib-c66x was skipped: incompatible with machine am57xx-hs-evm (not in COMPATIBLE_MACHINE)
> >>NOTE: Runtime target 'qt-opencv-opencl-opengl-multithreaded-src' is unbuildable, removing...
> >>
> >>Jake,
> >>
> >>Did you tested it on am57xx-hs-evm?
> 
> I had only built for am57xx-evm as there are no machine overrides in these
> recipes because they are DSP architecture-specific.
> 
> Looks like we should change "COMPATIBLE_MACHINE" to, at the very least,
> include what was there before (omap-a15|keystone). But as these are specific
> to the DSP architecture, should COMPATIBLE_MACHINE even be necessary?

Either way should be fine. Currently those patches break too many platforms - 
dra7 GP and both am5/dra7 HS.


> >>Denys
> >>
> >>
> >>>-----Original Message-----
> >>>From: Denys Dmytriyenko [mailto:denys@ti.com]
> >>>Sent: Wednesday, September 12, 2018 4:21 PM
> >>>To: Xu, Jianzhong
> >>>Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> >>>Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to build
> >>>DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and DSPLIB.
> >>>
> >>>Thanks, merged into rocko-next for testing.
> >>>
> >>>There were lots of small non-critical things I had to fix, like whitespaces,
> >>>indentation, etc. But the biggest one is that you have to follow OpenEmbedded
> >>>Commit Message Guidelines:
> >>>
> >>>https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> >>>
> >>>
> >>>On Wed, Sep 12, 2018 at 03:40:42PM -0400, Xu, Jianzhong wrote:
> >>>>    Denys,
> >>>>
> >>>>
> >>>>
> >>>>    You're right. The versioning was inconsistent. Please use
> >>>>    [EXTERNAL,3/3,v2] and newer versions of [EXTERNAL,2/3], [EXTERNAL,1/3].
> >>>>    The latter two should have had v2 in it. Please see highlights below.
> >>>>
> >>>>
> >>>>
> >>>>    +------------------------------------------------------------------------+
> >>>>    |[EXTERNAL,3/3,v2] Added DSPLIB recipe to   |          |            ||   |
> >>>>    |build DSPLIB from source. Updated          |2018-09-06|Jianzhong Xu||New|
> >>>>    |includes/ti-paths.inc for MATHLIB and      |          |            ||   |
> >>>>    |DSPLIB.                                    |          |            ||   |
> >>>>    |-------------------------------------------+----------+------------++---|
> >>>>    |[EXTERNAL] Added DSPLIB recipe to build    |          |            ||   |
> >>>>    |DSPLIB from source. Updated                |2018-09-06|Jianzhong Xu||New|
> >>>>    |includes/ti-paths.inc for MATHLIB and      |          |            ||   |
> >>>>    |DSPLIB.                                    |          |            ||   |
> >>>>    |-------------------------------------------+----------+------------++---|
> >>>>    |[EXTERNAL,3/3] Added DSPLIB recipe to build|2018-09-04|Jianzhong
> >>>Xu||New|
> >>>>    |DSPLIB from source.                        |          |            ||   |
> >>>>    |-------------------------------------------+----------+------------++---|
> >>>>    |[EXTERNAL,2/3] Added MATHLIB recipe to     |2018-09-04|Jianzhong
> >>>Xu||New|
> >>>>    |build MATHLIB from source.                 |          |            ||   |
> >>>>    |-------------------------------------------+----------+------------++---|
> >>>>    |[EXTERNAL,1/3] Added SWTOOLS which is      |          |            ||   |
> >>>>    |needed to build processor libs (DSPLIB,    |2018-09-04|Jianzhong Xu||New|
> >>>>    |MATHLIB, etc) from source.                 |          |            ||   |
> >>>>    +------------------------------------------------------------------------+
> >>>>
> >>>>
> >>>>
> >>>>    Thanks,
> >>>>
> >>>>    Jianzhong
> >>>>
> >>>>
> >>>>
> >>>>    -----Original Message-----
> >>>>    From: Dmytriyenko, Denys
> >>>>    Sent: Wednesday, September 12, 2018 3:13 PM
> >>>>    To: Stiffler, Jacob
> >>>>    Cc: Xu, Jianzhong; meta-ti@yoctoproject.org
> >>>>    Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to
> >>>>    build DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and
> >>>>    DSPLIB.
> >>>>
> >>>>
> >>>>
> >>>>    Jake,
> >>>>
> >>>>
> >>>>
> >>>>    I'll give it a look - I assume you want the 3 most recent patches, I don't
> >>>>
> >>>>    think versioning was consistent...
> >>>>
> >>>>
> >>>>
> >>>>    Denys
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>    On Tue, Sep 11, 2018 at 09:17:49AM -0400, Jacob Stiffler wrote:
> >>>>
> >>>>    > ACK
> >>>>
> >>>>    >
> >>>>
> >>>>    >
> >>>>
> >>>>    > Denys,
> >>>>
> >>>>    >
> >>>>
> >>>>    > Can you apply these patches to the ti2018.03 branch?
> >>>>
> >>>>    >
> >>>>
> >>>>    >
> >>>>
> >>>>    > Thank you,
> >>>>
> >>>>    >
> >>>>
> >>>>    > Jake
> >>>>
> >>>>    >
> >>>>
> >>>>    >
> >>>>
> >>>>    > On 9/6/2018 1:46 PM, Jianzhong Xu wrote:
> >>>>
> >>>>    > >Signed-off-by: Jianzhong Xu <xuj@ti.com>
> >>>>
> >>>>    > >---
> >>>>
> >>>>    > >Change from previous version of patch
> >>>>
> >>>>    > >Corrected typo: MATHLIB_C674INSTALL_XXX should have been
> >>>>    MATHLIB_C674_INSTALL_XXX
> >>>>
> >>>>    > >---
> >>>>
> >>>>    > >---
> >>>>
> >>>>    > >  recipes-ti/dsplib/dsplib-c64xp_git.bb    |  9 ++++
> >>>>
> >>>>    > >  recipes-ti/dsplib/dsplib-c66x.inc        | 30 ------------
> >>>>
> >>>>    > >  recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb |  9 ----
> >>>>
> >>>>    > >  recipes-ti/dsplib/dsplib-c66x_git.bb     | 10 ++++
> >>>>
> >>>>    > >  recipes-ti/dsplib/dsplib-c674x_git.bb    |  9 ++++
> >>>>
> >>>>    > >  recipes-ti/dsplib/dsplib.inc             | 79
> >>>>    ++++++++++++++++++++++++++++++++
> >>>>
> >>>>    > >  recipes-ti/includes/ti-paths.inc         |  8 +++-
> >>>>
> >>>>    > >  7 files changed, 114 insertions(+), 40 deletions(-)
> >>>>
> >>>>    > >  create mode 100644 recipes-ti/dsplib/dsplib-c64xp_git.bb
> >>>>
> >>>>    > >  delete mode 100644 recipes-ti/dsplib/dsplib-c66x.inc
> >>>>
> >>>>    > >  delete mode 100644 recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> >>>>
> >>>>    > >  create mode 100644 recipes-ti/dsplib/dsplib-c66x_git.bb
> >>>>
> >>>>    > >  create mode 100644 recipes-ti/dsplib/dsplib-c674x_git.bb
> >>>>
> >>>>    > >  create mode 100644 recipes-ti/dsplib/dsplib.inc
> >>>>
> >>>>    > >
> >>>>
> >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c64xp_git.bb
> >>>>    b/recipes-ti/dsplib/dsplib-c64xp_git.bb
> >>>>
> >>>>    > >new file mode 100644
> >>>>
> >>>>    > >index 0000000..1038d44
> >>>>
> >>>>    > >--- /dev/null
> >>>>
> >>>>    > >+++ b/recipes-ti/dsplib/dsplib-c64xp_git.bb
> >>>>
> >>>>    > >@@ -0,0 +1,9 @@
> >>>>
> >>>>    > >+MATHLIB_INSTALL_DIR = "${MATHLIB_C64P_INSTALL_DIR}/packages"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR_RECIPE = "${DSPLIB_C64P_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR = "${DSPLIB_C64P_INSTALL_DIR}"
> >>>>
> >>>>    > >+DSPLIB_BUILD_TARGET = "c64Px"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DEPENDS = ""
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+include dsplib.inc
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c66x.inc
> >>>>    b/recipes-ti/dsplib/dsplib-c66x.inc
> >>>>
> >>>>    > >deleted file mode 100644
> >>>>
> >>>>    > >index 7ff99c2..0000000
> >>>>
> >>>>    > >--- a/recipes-ti/dsplib/dsplib-c66x.inc
> >>>>
> >>>>    > >+++ /dev/null
> >>>>
> >>>>    > >@@ -1,30 +0,0 @@
> >>>>
> >>>>    > >-DESCRIPTION = "DSPLIB contains optimized general-purpose
> >>>>    signal-processing routines for TI DSPs"
> >>>>
> >>>>    > >-HOMEPAGE = "http://www.ti.com/tool/sprc265"
> >>>>
> >>>>    > >-SECTION = "devel"
> >>>>
> >>>>    > >-LICENSE = "BSD-3-Clause"
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-require ../includes/ti-paths.inc
> >>>>
> >>>>    > >-require ../includes/ti-staging.inc
> >>>>
> >>>>    > >-require ../includes/ti-unpack.inc
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-COMPATIBLE_MACHINE = "omap-a15|keystone"
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-SRC_URI =
> >>>>    "http://software-
> >>>dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE};name=d
> >>>splib"
> >>>>    > >-
> >>>>
> >>>>    > >-BINFILE = "dsplib_c66x_${PV}_Linux.bin"
> >>>>
> >>>>    > >-TI_BIN_UNPK_ARGS = "--mode silent --prefix ${S}"
> >>>>
> >>>>    > >-TI_BIN_UNPK_CMDS = ""
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-do_install() {
> >>>>
> >>>>    > >-    CP_ARGS="-Prf --preserve=mode,timestamps --no-
> >>>preserve=ownership"
> >>>>    > >-    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >-    cp ${CP_ARGS} ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >-}
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-ALLOW_EMPTY_${PN} = "1"
> >>>>
> >>>>    > >-FILES_${PN}-dev += "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-INHIBIT_PACKAGE_STRIP = "1"
> >>>>
> >>>>    > >-INHIBIT_SYSROOT_STRIP = "1"
> >>>>
> >>>>    > >-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >>>>
> >>>>    > >-INSANE_SKIP_${PN}-dev = "arch"
> >>>>
> >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> >>>>    b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> >>>>
> >>>>    > >deleted file mode 100644
> >>>>
> >>>>    > >index f1273f3..0000000
> >>>>
> >>>>    > >--- a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> >>>>
> >>>>    > >+++ /dev/null
> >>>>
> >>>>    > >@@ -1,9 +0,0 @@
> >>>>
> >>>>    > >-require dsplib-c66x.inc
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-PV = "3_4_0_0"
> >>>>
> >>>>    > >-PR = "r1"
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-LIC_FILES_CHKSUM =
> >>>>
> >>>"file://packages/ti/dsplib/dsplib.h;beginline=9;endline=35;md5=17733f9e1100f8
> >>>a628512f47c4bf676a"
> >>>>    > >-
> >>>>
> >>>>    > >-SRC_URI[dsplib.md5sum] = "66785604729c153dcad5282097dee8bf"
> >>>>
> >>>>    > >-SRC_URI[dsplib.sha256sum] =
> >>>>
> >>>"e88909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668eb35888785ce8"
> >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c66x_git.bb
> >>>>    b/recipes-ti/dsplib/dsplib-c66x_git.bb
> >>>>
> >>>>    > >new file mode 100644
> >>>>
> >>>>    > >index 0000000..cbc25d0
> >>>>
> >>>>    > >--- /dev/null
> >>>>
> >>>>    > >+++ b/recipes-ti/dsplib/dsplib-c66x_git.bb
> >>>>
> >>>>    > >@@ -0,0 +1,10 @@
> >>>>
> >>>>    > >+MATHLIB_INSTALL_DIR = "${MATHLIB_C66_INSTALL_DIR}/packages"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR_RECIPE = "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR = "${DSPLIB_C66_INSTALL_DIR}"
> >>>>
> >>>>    > >+DSPLIB_BUILD_TARGET = "c66x"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DEPENDS = "mathlib-c66x"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+include dsplib.inc
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c674x_git.bb
> >>>>    b/recipes-ti/dsplib/dsplib-c674x_git.bb
> >>>>
> >>>>    > >new file mode 100644
> >>>>
> >>>>    > >index 0000000..07c6892
> >>>>
> >>>>    > >--- /dev/null
> >>>>
> >>>>    > >+++ b/recipes-ti/dsplib/dsplib-c674x_git.bb
> >>>>
> >>>>    > >@@ -0,0 +1,9 @@
> >>>>
> >>>>    > >+MATHLIB_INSTALL_DIR = "${MATHLIB_C674_INSTALL_DIR}/packages"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR_RECIPE = "${DSPLIB_C674_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR = "${DSPLIB_C674_INSTALL_DIR}"
> >>>>
> >>>>    > >+DSPLIB_BUILD_TARGET = "c674x"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DEPENDS = "mathlib-c674x"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+include dsplib.inc
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >diff --git a/recipes-ti/dsplib/dsplib.inc
> >>>>    b/recipes-ti/dsplib/dsplib.inc
> >>>>
> >>>>    > >new file mode 100644
> >>>>
> >>>>    > >index 0000000..66fe0fb
> >>>>
> >>>>    > >--- /dev/null
> >>>>
> >>>>    > >+++ b/recipes-ti/dsplib/dsplib.inc
> >>>>
> >>>>    > >@@ -0,0 +1,79 @@
> >>>>
> >>>>    > >+SUMMARY = "DSPLIB contains optimized signal processing functions for
> >>>>    TI DSPs"
> >>>>
> >>>>    > >+HOMEPAGE = "http://git.ti.com/ep-processor-libraries/dsplib"
> >>>>
> >>>>    > >+LICENSE = "BSD-3-Clause"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+require ../includes/ti-paths.inc
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+PV = "3_4_0_1"
> >>>>
> >>>>    > >+PR = "r0"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+COMPATIBLE_MACHINE = "am57xx-evm|keystone|c66x|omapl1"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DEPENDS += "ti-cgt6x-native \
> >>>>
> >>>>    > >+           ti-xdctools-native \
> >>>>
> >>>>    > >+           ti-sysbios \
> >>>>
> >>>>    > >+           doxygen-native \
> >>>>
> >>>>    > >+           zip-native \
> >>>>
> >>>>    > >+           swtools "
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+S = "${WORKDIR}/git"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+SRC_URI =
> >>>>    "git://git.ti.com/ep-processor-
> >>>libraries/dsplib.git;protocol=git;branch=master"
> >>>>    > >+SRCREV = "bf5a51cba462c5cb03ed20a6a1bb1bd16c0683e1"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+LIC_FILES_CHKSUM =
> >>>>
> >>>"file://ti/dsplib/src/common/c66/lnk.cmd;beginline=1;endline=37;md5=0f0c9c4
> >>>d51d8af75419781591ace190b"
> >>>>    > >+
> >>>>
> >>>>    > >+export DSPLIB_WORK_DIR="${S}"
> >>>>
> >>>>    > >+export CGTOOLS_INSTALL_DIR  =
> >>>>    "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> >>>>
> >>>>    > >+export C64PCODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
> >>>>
> >>>>    > >+export C674CODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
> >>>>
> >>>>    > >+export C66CODEGENTOOL ="${CGTOOLS_INSTALL_DIR}"
> >>>>
> >>>>    > >+export SWTOOLS_PATH = "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"
> >>>>
> >>>>    > >+export XDCBUILDCFG="${SWTOOLS_PATH}/config.bld"
> >>>>
> >>>>    > >+export INCDIR="${MATHLIB_INSTALL_DIR}/"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+PATH_append = ":${XDC_INSTALL_DIR}"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    >
> >>>>
> >>>>+XDCPATH.="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBI
> >>>OS_INSTALL_DIR}/packages;"
> >>>>    >
> >>>>
> >>>>+XDCPATH.="${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_
> >>>WORK_DIR};"
> >>>>    > >+
> >>>>
> >>>>    > >+export XDCPATH
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DSPLIB_PACKAGE_NAME = "dsplib_${DSPLIB_BUILD_TARGET}_${PV}"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+do_compile() {
> >>>>
> >>>>    > >+       cd ${DSPLIB_WORK_DIR}/ti/dsplib;
> >>>>
> >>>>    > >+       xdc XDCARGS="${DSPLIB_BUILD_TARGET} bundle" XDCOPTIONS="-
> >>>v"
> >>>>    > >+}
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+do_install() {
> >>>>
> >>>>    > >+       install -d ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+       find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d
> >>>>    ${D}${DSPLIB_INSTALL_DIR_RECIPE} \;
> >>>>
> >>>>    > >+       mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/*
> >>>>    ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >+       mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata
> >>>>    ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >+       rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
> >>>>
> >>>>    > >+}
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+inherit deploy
> >>>>
> >>>>    > >+addtask deploy before do_build after do_install
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+do_deploy() {
> >>>>
> >>>>    > >+       install -d ${DEPLOYDIR}
> >>>>
> >>>>    > >+       # zip up files in ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >+       # and place the zip file in ${DEPLOYDIR}
> >>>>
> >>>>    > >+       mkdir ./${DSPLIB_PACKAGE_NAME}
> >>>>
> >>>>    > >+       cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/*
> >>>>    ./${DSPLIB_PACKAGE_NAME}
> >>>>
> >>>>    > >+       cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata
> >>>>    ./${DSPLIB_PACKAGE_NAME}
> >>>>
> >>>>    > >+       zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip
> >>>>    ./${DSPLIB_PACKAGE_NAME}
> >>>>
> >>>>    > >+       rm -r ./${DSPLIB_PACKAGE_NAME}
> >>>>
> >>>>    > >+}
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+ALLOW_EMPTY_${PN} = "1"
> >>>>
> >>>>    > >+FILES_${PN}-dev += "${DSPLIB_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+INSANE_SKIP_${PN}-dev = "arch"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >diff --git a/recipes-ti/includes/ti-paths.inc
> >>>>    b/recipes-ti/includes/ti-paths.inc
> >>>>
> >>>>    > >index 4f99d5e..8740b6a 100644
> >>>>
> >>>>    > >--- a/recipes-ti/includes/ti-paths.inc
> >>>>
> >>>>    > >+++ b/recipes-ti/includes/ti-paths.inc
> >>>>
> >>>>    > >@@ -17,6 +17,7 @@ export DMAI_INSTALL_DIR_RECIPE       =
> >>>>    "${installdir}/ti-dmai-tree"
> >>>>
> >>>>    > >  export DSP_BENCHMARK_INSTALL_DIR_RECIPE =
> >>>>    "${installdir}/ti-dsp-benchmark-tree"
> >>>>
> >>>>    > >  export DSPLIB_C64P_INSTALL_DIR_RECIPE =
> >>>>    "${installdir}/ti-dsplib-c64p-tree"
> >>>>
> >>>>    > >  export DSPLIB_C674_INSTALL_DIR_RECIPE =
> >>>>    "${installdir}/ti-dsplib-c674x-tree"
> >>>>
> >>>>    > >+export DSPLIB_C66_INSTALL_DIR_RECIPE  =
> >>>>    "${installdir}/ti-dsplib-c66x-tree"
> >>>>
> >>>>    > >  export DSPLIB_INSTALL_DIR_RECIPE     = "${installdir}/ti-dsplib-tree"
> >>>>
> >>>>    > >  export DVSDK_DEMOS_INSTALL_DIR_RECIPE=
> >>>>    "${installdir}/ti-dvsdk-demos-tree"
> >>>>
> >>>>    > >  export DVTB_INSTALL_DIR_RECIPE       = "${installdir}/ti-dvtb-tree"
> >>>>
> >>>>    > >@@ -39,6 +40,7 @@ export OSAL_INSTALL_DIR_RECIPE       =
> >>>>    "${installdir}/ti-osal-tree"
> >>>>
> >>>>    > >  export RTFS_INSTALL_DIR_RECIPE       = "${installdir}/ti-rtfs-tree"
> >>>>
> >>>>    > >  export SYSBIOS_INSTALL_DIR_RECIPE    =
> >>>>    "${installdir}/ti-sysbios-tree"
> >>>>
> >>>>    > >  export SYSLINK_INSTALL_DIR_RECIPE    =
> >>>>    "${installdir}/ti-syslink-tree"
> >>>>
> >>>>    > >+export SWTOOLS_INSTALL_DIR_RECIPE    = "${installdir}/ti-swtools-tree"
> >>>>
> >>>>    > >  export UIA_INSTALL_DIR_RECIPE        = "${installdir}/ti-uia-tree"
> >>>>
> >>>>    > >  export VICPLIB_INSTALL_DIR_RECIPE    =
> >>>>    "${installdir}/ti-vicplib-tree"
> >>>>
> >>>>    > >  export XDAIS_INSTALL_DIR_RECIPE      = "${installdir}/ti-xdais-tree"
> >>>>
> >>>>    > >@@ -48,8 +50,8 @@ export OSAL_INSTALL_DIR_RECIPE       =
> >>>>    "${installdir}/ti-osal-tree"
> >>>>
> >>>>    > >  export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    =
> >>>>    "${installdir}/ti-cgt-arm"
> >>>>
> >>>>    > >  export GCC_ARM_NONE_TOOLCHAIN_RECIPE      =
> >>>>    "${installdir}/gcc-arm-none-eabi"
> >>>>
> >>>>    > >  export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
> >>>>
> >>>>    > >-export DSPLIB_C66_INSTALL_DIR_RECIPE      =
> >>>>    "${installdir}/ti-dsplib-c66x-tree"
> >>>>
> >>>>    > >  export MATHLIB_C66_INSTALL_DIR_RECIPE     =
> >>>>    "${installdir}/ti-mathlib-c66x-tree"
> >>>>
> >>>>    > >+export MATHLIB_C674_INSTALL_DIR_RECIPE    =
> >>>>    "${installdir}/ti-mathlib-c674x-tree"
> >>>>
> >>>>    > >  export IMGLIB_C66_INSTALL_DIR_RECIPE      =
> >>>>    "${installdir}/ti-imglib-c66x-tree"
> >>>>
> >>>>    > >  export VLIB_C66_INSTALL_DIR_RECIPE        =
> >>>>    "${installdir}/ti-vlib-c66x-tree"
> >>>>
> >>>>    > >  export CG_XML_INSTALL_DIR_RECIPE     = "${installdir}/ti-cg-xml-tree"
> >>>>
> >>>>    > >@@ -95,7 +97,11 @@ export OSAL_INSTALL_DIR       =
> >>>>    "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >  export M4_TOOLCHAIN_INSTALL_DIR    =
> >>>>    "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export GCC_ARM_NONE_TOOLCHAIN      =
> >>>>    "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
> >>>>
> >>>>    > >  export TI_CGT_PRU_INSTALL_DIR      =
> >>>>    "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+export SWTOOLS_INSTALL_DIR         =
> >>>>    "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+export DSPLIB_C64P_INSTALL_DIR     =
> >>>>    "${STAGING_DIR_TARGET}${DSPLIB_C64P_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+export DSPLIB_C674_INSTALL_DIR     =
> >>>>    "${STAGING_DIR_TARGET}${DSPLIB_C674_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export DSPLIB_C66_INSTALL_DIR      =
> >>>>    "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+export MATHLIB_C674_INSTALL_DIR    =
> >>>>    "${STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export MATHLIB_C66_INSTALL_DIR     =
> >>>>    "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export IMGLIB_C66_INSTALL_DIR      =
> >>>>    "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export VLIB_C66_INSTALL_DIR        =
> >>>>    "${STAGING_DIR_TARGET}${VLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    >
> >>>>
> >>>>    > --
> >>>>
> >>>>    > _______________________________________________
> >>>>
> >>>>    > meta-ti mailing list
> >>>>
> >>>>    > meta-ti@yoctoproject.org
> >>>>
> >>>>    > https://lists.yoctoproject.org/listinfo/meta-ti
> 

