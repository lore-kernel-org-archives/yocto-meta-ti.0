Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3035BE0093B; Thu, 13 Sep 2018 09:01:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED,
	T_FILL_THIS_FORM_SHORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63500E005B1
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 09:01:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DG1Wan070202
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 11:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536854492;
	bh=o6e93PaxMsE4ax9QYi2+b0pvS495ChnygCbO4MYsXNE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=umDGoLGvva6fEDI4Tk7ivOgtizGnzomcO0H6n0Ex57+GgnNcTKB023w+VPcl0XnZO
	/TGRk5NgFvWPI8vOvfTelol5Fs/Vnr+MlRifmd55NltWrZa7W1eYu2uV2l4uG6hIml
	WK/Z90b8aB+87g1sHvijdQEo41zkt0Wh51e2kQR8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DG1WSF009485
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 11:01:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 11:01:32 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1466.003; Thu, 13 Sep 2018 11:01:32 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Xu, Jianzhong" <xuj@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to build
	DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB
	and DSPLIB.
Thread-Index: AQHUSszaFnU8Q2yPOUGcujGT05IflKTtXzIAgAALKQCAAATMAIAAJcEAgAB+pACAAJcHgIAABQcA//+uZHA=
Date: Thu, 13 Sep 2018 16:01:32 +0000
Message-ID: <2fcb0ee9597541678597a5019c117160@ti.com>
References: <1536255983-16162-1-git-send-email-xuj@ti.com>
	<674173dd-2a6b-b932-49f3-e3c30fbfd050@ti.com>
	<20180912191313.GB12296@beryl>
	<0edace8daec141e48401dfaf972f69af@ti.com>
	<20180912202038.GF12296@beryl>
	<f1fe357da2074bee88e9c56c6b5663f1@ti.com>
	<20180912225256.GJ12296@beryl>
	<cf942c47-0bea-3824-969f-c0d748dd422b@ti.com>,
	<20180913152644.GO12296@beryl>
	<54721d798ca04e03b26319cb76db9300@ti.com>
In-Reply-To: <54721d798ca04e03b26319cb76db9300@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.191]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 13 Sep 2018 16:01:37 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2fcb0ee9597541678597a5019c117160ticom_"

--_000_2fcb0ee9597541678597a5019c117160ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That will work as c66x is a subset of the keystone SOC family.

I just don't think that specifying COMPATIBLE_MACHINE is necessary as these=
 packages are independent of the architecture that is running Linux.

And due to this, we should also remove the 'PACKAGE_ARCH =3D ${MACHINE_ARCH=
}"' as there is no difference between the resulting packages for any machin=
e.

IMHO, COMPATIBLE_MACHINE has been overused and it creates more problems tha=
t it solves.

- Jake

From: Xu, Jianzhong
Sent: Thursday, September 13, 2018 11:45 AM
To: Dmytriyenko, Denys; Stiffler, Jacob
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to bui=
ld DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and DSPLIB=
.


Denys,



Would the following fix the problems you've seen:

COMPATIBLE_MACHINE =3D "omap-a15|keystone"

This was in DSPLIB recipes before.



Thanks,

Jianzhong

________________________________
From: Dmytriyenko, Denys
Sent: Thursday, September 13, 2018 11:26:45 AM
To: Stiffler, Jacob
Cc: Xu, Jianzhong; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to bui=
ld DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and DSPLIB=
.

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
> >>ERROR: Nothing PROVIDES 'dsplib-c66x' (but /OE/arago-rocko-next-build/s=
ources/meta-arago/meta-arago-extras/recipes-apps/video-analytics-demo/qt-op=
encv-opencl-opengl-multithreaded_git.bb DEPENDS on or otherwise requires it=
)
> >>dsplib-c66x was skipped: incompatible with machine am57xx-hs-evm (not i=
n COMPATIBLE_MACHINE)
> >>NOTE: Runtime target 'qt-opencv-opencl-opengl-multithreaded-src' is unb=
uildable, removing...
> >>
> >>Jake,
> >>
> >>Did you tested it on am57xx-hs-evm?
>
> I had only built for am57xx-evm as there are no machine overrides in thes=
e
> recipes because they are DSP architecture-specific.
>
> Looks like we should change "COMPATIBLE_MACHINE" to, at the very least,
> include what was there before (omap-a15|keystone). But as these are speci=
fic
> to the DSP architecture, should COMPATIBLE_MACHINE even be necessary?

Either way should be fine. Currently those patches break too many platforms=
 -
dra7 GP and both am5/dra7 HS.


> >>Denys
> >>
> >>
> >>>-----Original Message-----
> >>>From: Denys Dmytriyenko [mailto:denys@ti.com]
> >>>Sent: Wednesday, September 12, 2018 4:21 PM
> >>>To: Xu, Jianzhong
> >>>Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> >>>Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe t=
o build
> >>>DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and DSPL=
IB.
> >>>
> >>>Thanks, merged into rocko-next for testing.
> >>>
> >>>There were lots of small non-critical things I had to fix, like whites=
paces,
> >>>indentation, etc. But the biggest one is that you have to follow OpenE=
mbedded
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
> >>>>    [EXTERNAL,3/3,v2] and newer versions of [EXTERNAL,2/3], [EXTERNAL=
,1/3].
> >>>>    The latter two should have had v2 in it. Please see highlights be=
low.
> >>>>
> >>>>
> >>>>
> >>>>    +----------------------------------------------------------------=
--------+
> >>>>    |[EXTERNAL,3/3,v2] Added DSPLIB recipe to   |          |         =
   ||   |
> >>>>    |build DSPLIB from source. Updated          |2018-09-06|Jianzhong=
 Xu||New|
> >>>>    |includes/ti-paths.inc for MATHLIB and      |          |         =
   ||   |
> >>>>    |DSPLIB.                                    |          |         =
   ||   |
> >>>>    |-------------------------------------------+----------+---------=
---++---|
> >>>>    |[EXTERNAL] Added DSPLIB recipe to build    |          |         =
   ||   |
> >>>>    |DSPLIB from source. Updated                |2018-09-06|Jianzhong=
 Xu||New|
> >>>>    |includes/ti-paths.inc for MATHLIB and      |          |         =
   ||   |
> >>>>    |DSPLIB.                                    |          |         =
   ||   |
> >>>>    |-------------------------------------------+----------+---------=
---++---|
> >>>>    |[EXTERNAL,3/3] Added DSPLIB recipe to build|2018-09-04|Jianzhong
> >>>Xu||New|
> >>>>    |DSPLIB from source.                        |          |         =
   ||   |
> >>>>    |-------------------------------------------+----------+---------=
---++---|
> >>>>    |[EXTERNAL,2/3] Added MATHLIB recipe to     |2018-09-04|Jianzhong
> >>>Xu||New|
> >>>>    |build MATHLIB from source.                 |          |         =
   ||   |
> >>>>    |-------------------------------------------+----------+---------=
---++---|
> >>>>    |[EXTERNAL,1/3] Added SWTOOLS which is      |          |         =
   ||   |
> >>>>    |needed to build processor libs (DSPLIB,    |2018-09-04|Jianzhong=
 Xu||New|
> >>>>    |MATHLIB, etc) from source.                 |          |         =
   ||   |
> >>>>    +----------------------------------------------------------------=
--------+
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
> >>>>    Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB rec=
ipe to
> >>>>    build DSPLIB from source. Updated includes/ti-paths.inc for MATHL=
IB and
> >>>>    DSPLIB.
> >>>>
> >>>>
> >>>>
> >>>>    Jake,
> >>>>
> >>>>
> >>>>
> >>>>    I'll give it a look - I assume you want the 3 most recent patches=
, I don't
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
> >>>>    > >+MATHLIB_INSTALL_DIR =3D "${MATHLIB_C64P_INSTALL_DIR}/packages=
"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR_RECIPE =3D "${DSPLIB_C64P_INSTALL_DIR_RECI=
PE}"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR =3D "${DSPLIB_C64P_INSTALL_DIR}"
> >>>>
> >>>>    > >+DSPLIB_BUILD_TARGET =3D "c64Px"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DEPENDS =3D ""
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
> >>>>    > >-DESCRIPTION =3D "DSPLIB contains optimized general-purpose
> >>>>    signal-processing routines for TI DSPs"
> >>>>
> >>>>    > >-HOMEPAGE =3D "http://www.ti.com/tool/sprc265"
> >>>>
> >>>>    > >-SECTION =3D "devel"
> >>>>
> >>>>    > >-LICENSE =3D "BSD-3-Clause"
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
> >>>>    > >-COMPATIBLE_MACHINE =3D "omap-a15|keystone"
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-SRC_URI =3D
> >>>>    "http://software-
> >>>dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE};name=
=3Dd
> >>>splib"
> >>>>    > >-
> >>>>
> >>>>    > >-BINFILE =3D "dsplib_c66x_${PV}_Linux.bin"
> >>>>
> >>>>    > >-TI_BIN_UNPK_ARGS =3D "--mode silent --prefix ${S}"
> >>>>
> >>>>    > >-TI_BIN_UNPK_CMDS =3D ""
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-do_install() {
> >>>>
> >>>>    > >-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-
> >>>preserve=3Downership"
> >>>>    > >-    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >-    cp ${CP_ARGS} ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >-}
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-ALLOW_EMPTY_${PN} =3D "1"
> >>>>
> >>>>    > >-FILES_${PN}-dev +=3D "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-INHIBIT_PACKAGE_STRIP =3D "1"
> >>>>
> >>>>    > >-INHIBIT_SYSROOT_STRIP =3D "1"
> >>>>
> >>>>    > >-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> >>>>
> >>>>    > >-INSANE_SKIP_${PN}-dev =3D "arch"
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
> >>>>    > >-PV =3D "3_4_0_0"
> >>>>
> >>>>    > >-PR =3D "r1"
> >>>>
> >>>>    > >-
> >>>>
> >>>>    > >-LIC_FILES_CHKSUM =3D
> >>>>
> >>>"file://packages/ti/dsplib/dsplib.h;beginline=3D9;endline=3D35;md5=3D1=
7733f9e1100f8
> >>>a628512f47c4bf676a"
> >>>>    > >-
> >>>>
> >>>>    > >-SRC_URI[dsplib.md5sum] =3D "66785604729c153dcad5282097dee8bf"
> >>>>
> >>>>    > >-SRC_URI[dsplib.sha256sum] =3D
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
> >>>>    > >+MATHLIB_INSTALL_DIR =3D "${MATHLIB_C66_INSTALL_DIR}/packages"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR_RECIPE =3D "${DSPLIB_C66_INSTALL_DIR_RECIP=
E}"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR =3D "${DSPLIB_C66_INSTALL_DIR}"
> >>>>
> >>>>    > >+DSPLIB_BUILD_TARGET =3D "c66x"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DEPENDS =3D "mathlib-c66x"
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
> >>>>    > >+MATHLIB_INSTALL_DIR =3D "${MATHLIB_C674_INSTALL_DIR}/packages=
"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR_RECIPE =3D "${DSPLIB_C674_INSTALL_DIR_RECI=
PE}"
> >>>>
> >>>>    > >+DSPLIB_INSTALL_DIR =3D "${DSPLIB_C674_INSTALL_DIR}"
> >>>>
> >>>>    > >+DSPLIB_BUILD_TARGET =3D "c674x"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DEPENDS =3D "mathlib-c674x"
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
> >>>>    > >+SUMMARY =3D "DSPLIB contains optimized signal processing func=
tions for
> >>>>    TI DSPs"
> >>>>
> >>>>    > >+HOMEPAGE =3D "http://git.ti.com/ep-processor-libraries/dsplib=
"
> >>>>
> >>>>    > >+LICENSE =3D "BSD-3-Clause"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+require ../includes/ti-paths.inc
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+PV =3D "3_4_0_1"
> >>>>
> >>>>    > >+PR =3D "r0"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+COMPATIBLE_MACHINE =3D "am57xx-evm|keystone|c66x|omapl1"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DEPENDS +=3D "ti-cgt6x-native \
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
> >>>>    > >+S =3D "${WORKDIR}/git"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+SRC_URI =3D
> >>>>    "git://git.ti.com/ep-processor-
> >>>libraries/dsplib.git;protocol=3Dgit;branch=3Dmaster"
> >>>>    > >+SRCREV =3D "bf5a51cba462c5cb03ed20a6a1bb1bd16c0683e1"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+LIC_FILES_CHKSUM =3D
> >>>>
> >>>"file://ti/dsplib/src/common/c66/lnk.cmd;beginline=3D1;endline=3D37;md=
5=3D0f0c9c4
> >>>d51d8af75419781591ace190b"
> >>>>    > >+
> >>>>
> >>>>    > >+export DSPLIB_WORK_DIR=3D"${S}"
> >>>>
> >>>>    > >+export CGTOOLS_INSTALL_DIR  =3D
> >>>>    "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> >>>>
> >>>>    > >+export C64PCODEGENTOOL=3D"${CGTOOLS_INSTALL_DIR}"
> >>>>
> >>>>    > >+export C674CODEGENTOOL=3D"${CGTOOLS_INSTALL_DIR}"
> >>>>
> >>>>    > >+export C66CODEGENTOOL =3D"${CGTOOLS_INSTALL_DIR}"
> >>>>
> >>>>    > >+export SWTOOLS_PATH =3D "${SWTOOLS_INSTALL_DIR}/ti/mas/swtool=
s"
> >>>>
> >>>>    > >+export XDCBUILDCFG=3D"${SWTOOLS_PATH}/config.bld"
> >>>>
> >>>>    > >+export INCDIR=3D"${MATHLIB_INSTALL_DIR}/"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+PATH_append =3D ":${XDC_INSTALL_DIR}"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    >
> >>>>
> >>>>+XDCPATH.=3D"${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBI
> >>>OS_INSTALL_DIR}/packages;"
> >>>>    >
> >>>>
> >>>>+XDCPATH.=3D"${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_
> >>>WORK_DIR};"
> >>>>    > >+
> >>>>
> >>>>    > >+export XDCPATH
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+DSPLIB_PACKAGE_NAME =3D "dsplib_${DSPLIB_BUILD_TARGET}_${PV}"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+do_compile() {
> >>>>
> >>>>    > >+       cd ${DSPLIB_WORK_DIR}/ti/dsplib;
> >>>>
> >>>>    > >+       xdc XDCARGS=3D"${DSPLIB_BUILD_TARGET} bundle" XDCOPTIO=
NS=3D"-
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
> >>>>    > >+       find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o=
 {} -d
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
> >>>>    > >+       zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zi=
p
> >>>>    ./${DSPLIB_PACKAGE_NAME}
> >>>>
> >>>>    > >+       rm -r ./${DSPLIB_PACKAGE_NAME}
> >>>>
> >>>>    > >+}
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+ALLOW_EMPTY_${PN} =3D "1"
> >>>>
> >>>>    > >+FILES_${PN}-dev +=3D "${DSPLIB_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+
> >>>>
> >>>>    > >+INSANE_SKIP_${PN}-dev =3D "arch"
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
> >>>>    > >@@ -17,6 +17,7 @@ export DMAI_INSTALL_DIR_RECIPE       =3D
> >>>>    "${installdir}/ti-dmai-tree"
> >>>>
> >>>>    > >  export DSP_BENCHMARK_INSTALL_DIR_RECIPE =3D
> >>>>    "${installdir}/ti-dsp-benchmark-tree"
> >>>>
> >>>>    > >  export DSPLIB_C64P_INSTALL_DIR_RECIPE =3D
> >>>>    "${installdir}/ti-dsplib-c64p-tree"
> >>>>
> >>>>    > >  export DSPLIB_C674_INSTALL_DIR_RECIPE =3D
> >>>>    "${installdir}/ti-dsplib-c674x-tree"
> >>>>
> >>>>    > >+export DSPLIB_C66_INSTALL_DIR_RECIPE  =3D
> >>>>    "${installdir}/ti-dsplib-c66x-tree"
> >>>>
> >>>>    > >  export DSPLIB_INSTALL_DIR_RECIPE     =3D "${installdir}/ti-d=
splib-tree"
> >>>>
> >>>>    > >  export DVSDK_DEMOS_INSTALL_DIR_RECIPE=3D
> >>>>    "${installdir}/ti-dvsdk-demos-tree"
> >>>>
> >>>>    > >  export DVTB_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-d=
vtb-tree"
> >>>>
> >>>>    > >@@ -39,6 +40,7 @@ export OSAL_INSTALL_DIR_RECIPE       =3D
> >>>>    "${installdir}/ti-osal-tree"
> >>>>
> >>>>    > >  export RTFS_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-r=
tfs-tree"
> >>>>
> >>>>    > >  export SYSBIOS_INSTALL_DIR_RECIPE    =3D
> >>>>    "${installdir}/ti-sysbios-tree"
> >>>>
> >>>>    > >  export SYSLINK_INSTALL_DIR_RECIPE    =3D
> >>>>    "${installdir}/ti-syslink-tree"
> >>>>
> >>>>    > >+export SWTOOLS_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-sw=
tools-tree"
> >>>>
> >>>>    > >  export UIA_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-u=
ia-tree"
> >>>>
> >>>>    > >  export VICPLIB_INSTALL_DIR_RECIPE    =3D
> >>>>    "${installdir}/ti-vicplib-tree"
> >>>>
> >>>>    > >  export XDAIS_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-x=
dais-tree"
> >>>>
> >>>>    > >@@ -48,8 +50,8 @@ export OSAL_INSTALL_DIR_RECIPE       =3D
> >>>>    "${installdir}/ti-osal-tree"
> >>>>
> >>>>    > >  export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    =3D
> >>>>    "${installdir}/ti-cgt-arm"
> >>>>
> >>>>    > >  export GCC_ARM_NONE_TOOLCHAIN_RECIPE      =3D
> >>>>    "${installdir}/gcc-arm-none-eabi"
> >>>>
> >>>>    > >  export TI_CGT_PRU_INSTALL_DIR_RECIPE      =3D "${installdir}=
/cgt-pru"
> >>>>
> >>>>    > >-export DSPLIB_C66_INSTALL_DIR_RECIPE      =3D
> >>>>    "${installdir}/ti-dsplib-c66x-tree"
> >>>>
> >>>>    > >  export MATHLIB_C66_INSTALL_DIR_RECIPE     =3D
> >>>>    "${installdir}/ti-mathlib-c66x-tree"
> >>>>
> >>>>    > >+export MATHLIB_C674_INSTALL_DIR_RECIPE    =3D
> >>>>    "${installdir}/ti-mathlib-c674x-tree"
> >>>>
> >>>>    > >  export IMGLIB_C66_INSTALL_DIR_RECIPE      =3D
> >>>>    "${installdir}/ti-imglib-c66x-tree"
> >>>>
> >>>>    > >  export VLIB_C66_INSTALL_DIR_RECIPE        =3D
> >>>>    "${installdir}/ti-vlib-c66x-tree"
> >>>>
> >>>>    > >  export CG_XML_INSTALL_DIR_RECIPE     =3D "${installdir}/ti-c=
g-xml-tree"
> >>>>
> >>>>    > >@@ -95,7 +97,11 @@ export OSAL_INSTALL_DIR       =3D
> >>>>    "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}
> >>>>
> >>>>    > >  export M4_TOOLCHAIN_INSTALL_DIR    =3D
> >>>>    "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export GCC_ARM_NONE_TOOLCHAIN      =3D
> >>>>    "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
> >>>>
> >>>>    > >  export TI_CGT_PRU_INSTALL_DIR      =3D
> >>>>    "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+export SWTOOLS_INSTALL_DIR         =3D
> >>>>    "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+export DSPLIB_C64P_INSTALL_DIR     =3D
> >>>>    "${STAGING_DIR_TARGET}${DSPLIB_C64P_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+export DSPLIB_C674_INSTALL_DIR     =3D
> >>>>    "${STAGING_DIR_TARGET}${DSPLIB_C674_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export DSPLIB_C66_INSTALL_DIR      =3D
> >>>>    "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >+export MATHLIB_C674_INSTALL_DIR    =3D
> >>>>    "${STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export MATHLIB_C66_INSTALL_DIR     =3D
> >>>>    "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export IMGLIB_C66_INSTALL_DIR      =3D
> >>>>    "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
> >>>>
> >>>>    > >  export VLIB_C66_INSTALL_DIR        =3D
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

--_000_2fcb0ee9597541678597a5019c117160ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:1.0pt;
	margin-bottom:.0001pt;
	border:none;
	padding:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">That will work as c66x is=
 a subset of the keystone SOC family.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">I just don&#8217;t think =
that specifying COMPATIBLE_MACHINE is necessary as these packages are indep=
endent of the architecture that is running Linux.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">And due to this, we shoul=
d also remove the &#8216;PACKAGE_ARCH =3D ${MACHINE_ARCH}&#8221;&#8217; as =
there is no difference between the resulting packages for any machine.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">IMHO, COMPATIBLE_MACHINE =
has been overused and it creates more problems that it solves.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">- Jake<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Xu, Jian=
zhong
<br>
<b>Sent:</b> Thursday, September 13, 2018 11:45 AM<br>
<b>To:</b> Dmytriyenko, Denys; Stiffler, Jacob<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe=
 to build DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and=
 DSPLIB.<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div id=3D"x_divtagdefaultwrapper">
<p><span style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;co=
lor:black">Denys,<o:p></o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;co=
lor:black"><o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;co=
lor:black">Would the following fix the problems you've seen:<o:p></o:p></sp=
an></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,&quot=
;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,&quot=
;sans-serif&quot;;color:black">COMPATIBLE_MACHINE =3D &quot;omap-a15|keysto=
ne&quot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,&quot=
;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,&quot=
;sans-serif&quot;;color:black">This was in DSPLIB recipes before.&nbsp;
<o:p></o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;co=
lor:black"><o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;co=
lor:black">Thanks,<o:p></o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;co=
lor:black">Jianzhong<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,&quot;sans-serif&quot;;color:black">From:</span></b><span st=
yle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&qu=
ot;;color:black"> Dmytriyenko, Denys<br>
<b>Sent:</b> Thursday, September 13, 2018 11:26:45 AM<br>
<b>To:</b> Stiffler, Jacob<br>
<b>Cc:</b> Xu, Jianzhong; meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe=
 to build DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and=
 DSPLIB.</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">On Thu, Sep 13, 201=
8 at 07:26:12AM -0400, Jacob Stiffler wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 9/12/2018 6:52 PM, Denys Dmytriyenko wrote:<br>
&gt; &gt;Same for dra7xx-evm...<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;On Wed, Sep 12, 2018 at 04:37:48PM -0400, Dmytriyenko, Denys wrote=
:<br>
&gt; &gt;&gt;And it crashed and burned right away:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;ERROR: Nothing PROVIDES 'dsplib-c66x' (but /OE/arago-rocko-nex=
t-build/sources/meta-arago/meta-arago-extras/recipes-apps/video-analytics-d=
emo/qt-opencv-opencl-opengl-multithreaded_git.bb DEPENDS on or otherwise re=
quires it)<br>
&gt; &gt;&gt;dsplib-c66x was skipped: incompatible with machine am57xx-hs-e=
vm (not in COMPATIBLE_MACHINE)<br>
&gt; &gt;&gt;NOTE: Runtime target 'qt-opencv-opencl-opengl-multithreaded-sr=
c' is unbuildable, removing...<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Jake,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Did you tested it on am57xx-hs-evm?<br>
&gt; <br>
&gt; I had only built for am57xx-evm as there are no machine overrides in t=
hese<br>
&gt; recipes because they are DSP architecture-specific.<br>
&gt; <br>
&gt; Looks like we should change &quot;COMPATIBLE_MACHINE&quot; to, at the =
very least,<br>
&gt; include what was there before (omap-a15|keystone). But as these are sp=
ecific<br>
&gt; to the DSP architecture, should COMPATIBLE_MACHINE even be necessary?<=
br>
<br>
Either way should be fine. Currently those patches break too many platforms=
 - <br>
dra7 GP and both am5/dra7 HS.<br>
<br>
<br>
&gt; &gt;&gt;Denys<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;-----Original Message-----<br>
&gt; &gt;&gt;&gt;From: Denys Dmytriyenko [<a href=3D"mailto:denys@ti.com">m=
ailto:denys@ti.com</a>]<br>
&gt; &gt;&gt;&gt;Sent: Wednesday, September 12, 2018 4:21 PM<br>
&gt; &gt;&gt;&gt;To: Xu, Jianzhong<br>
&gt; &gt;&gt;&gt;Cc: Stiffler, Jacob; meta-ti@yoctoproject.org<br>
&gt; &gt;&gt;&gt;Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSP=
LIB recipe to build<br>
&gt; &gt;&gt;&gt;DSPLIB from source. Updated includes/ti-paths.inc for MATH=
LIB and DSPLIB.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;Thanks, merged into rocko-next for testing.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;There were lots of small non-critical things I had to fix,=
 like whitespaces,<br>
&gt; &gt;&gt;&gt;indentation, etc. But the biggest one is that you have to =
follow OpenEmbedded<br>
&gt; &gt;&gt;&gt;Commit Message Guidelines:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<a href=3D"https://www.openembedded.org/wiki/Commit_Patch_=
Message_Guidelines">https://www.openembedded.org/wiki/Commit_Patch_Message_=
Guidelines</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;On Wed, Sep 12, 2018 at 03:40:42PM -0400, Xu, Jianzhong wr=
ote:<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Denys,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; You're right. The versioning was in=
consistent. Please use<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; [EXTERNAL,3/3,v2] and newer version=
s of [EXTERNAL,2/3], [EXTERNAL,1/3].<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; The latter two should have had v2 i=
n it. Please see highlights below.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &#43;------------------------------=
------------------------------------------&#43;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTERNAL,3/3,v2] Added DSPLIB rec=
ipe to&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp=
;&nbsp; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |build DSPLIB from source. Updated&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |2018-09-06|Jianzhong=
 Xu||New|<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |includes/ti-paths.inc for MATHLIB =
and&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |DSPLIB.&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |----------------------------------=
---------&#43;----------&#43;------------&#43;&#43;---|<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTERNAL] Added DSPLIB recipe to =
build&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||=
&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |DSPLIB from source. Updated&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |2018-09-06|Jianzhong Xu||New|<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |includes/ti-paths.inc for MATHLIB =
and&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |DSPLIB.&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |----------------------------------=
---------&#43;----------&#43;------------&#43;&#43;---|<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTERNAL,3/3] Added DSPLIB recipe=
 to build|2018-09-04|Jianzhong<br>
&gt; &gt;&gt;&gt;Xu||New|<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |DSPLIB from source.&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |----------------------------------=
---------&#43;----------&#43;------------&#43;&#43;---|<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTERNAL,2/3] Added MATHLIB recip=
e to&nbsp;&nbsp;&nbsp;&nbsp; |2018-09-04|Jianzhong<br>
&gt; &gt;&gt;&gt;Xu||New|<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |build MATHLIB from source.&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbs=
p; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |----------------------------------=
---------&#43;----------&#43;------------&#43;&#43;---|<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTERNAL,1/3] Added SWTOOLS which=
 is&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |needed to build processor libs (DS=
PLIB,&nbsp;&nbsp;&nbsp; |2018-09-04|Jianzhong Xu||New|<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |MATHLIB, etc) from source.&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbs=
p; |<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &#43;------------------------------=
------------------------------------------&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Thanks,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Jianzhong<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; -----Original Message-----<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; From: Dmytriyenko, Denys<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Sent: Wednesday, September 12, 2018=
 3:13 PM<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; To: Stiffler, Jacob<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Cc: Xu, Jianzhong; meta-ti@yoctopro=
ject.org<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Subject: Re: [meta-ti] [EXTERNAL] [=
PATCH 3/3 v2] Added DSPLIB recipe to<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; build DSPLIB from source. Updated i=
ncludes/ti-paths.inc for MATHLIB and<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; DSPLIB.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Jake,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; I'll give it a look - I assume you =
want the 3 most recent patches, I don't<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; think versioning was consistent...<=
br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Denys<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; On Tue, Sep 11, 2018 at 09:17:49AM =
-0400, Jacob Stiffler wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; ACK<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; Denys,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; Can you apply these patches to=
 the ti2018.03 branch?<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; Thank you,<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; Jake<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; On 9/6/2018 1:46 PM, Jianzhong=
 Xu wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;Signed-off-by: Jianzhong X=
u &lt;xuj@ti.com&gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;---<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;Change from previous versi=
on of patch<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;Corrected typo: MATHLIB_C6=
74INSTALL_XXX should have been<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; MATHLIB_C674_INSTALL_XXX<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;---<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;---<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; recipes-ti/dsplib/d=
splib-c64xp_git.bb&nbsp;&nbsp;&nbsp; |&nbsp; 9 &#43;&#43;&#43;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; recipes-ti/dsplib/d=
splib-c66x.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 30 ------------<=
br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; recipes-ti/dsplib/d=
splib-c66x_3.4.0.0.bb |&nbsp; 9 ----<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; recipes-ti/dsplib/d=
splib-c66x_git.bb&nbsp;&nbsp;&nbsp;&nbsp; | 10 &#43;&#43;&#43;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; recipes-ti/dsplib/d=
splib-c674x_git.bb&nbsp;&nbsp;&nbsp; |&nbsp; 9 &#43;&#43;&#43;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; recipes-ti/dsplib/d=
splib.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 79<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; recipes-ti/includes=
/ti-paths.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 &#4=
3;&#43;&#43;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; 7 files changed, 11=
4 insertions(&#43;), 40 deletions(-)<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; create mode 100644 =
recipes-ti/dsplib/dsplib-c64xp_git.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; delete mode 100644 =
recipes-ti/dsplib/dsplib-c66x.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; delete mode 100644 =
recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; create mode 100644 =
recipes-ti/dsplib/dsplib-c66x_git.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; create mode 100644 =
recipes-ti/dsplib/dsplib-c674x_git.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; create mode 100644 =
recipes-ti/dsplib/dsplib.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;diff --git a/recipes-ti/ds=
plib/dsplib-c64xp_git.bb<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recipes-ti/dsplib/dsplib-c64xp_gi=
t.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;new file mode 100644<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;index 0000000..1038d44<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;--- /dev/null<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&#43;&#43; b/recipes-=
ti/dsplib/dsplib-c64xp_git.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -0,0 &#43;1,9 @@<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;MATHLIB_INSTALL_DIR =
=3D &quot;${MATHLIB_C64P_INSTALL_DIR}/packages&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_INSTALL_DIR_RE=
CIPE =3D &quot;${DSPLIB_C64P_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_INSTALL_DIR =
=3D &quot;${DSPLIB_C64P_INSTALL_DIR}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_BUILD_TARGET =
=3D &quot;c64Px&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DEPENDS =3D &quot;&qu=
ot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;include dsplib.inc<br=
>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;diff --git a/recipes-ti/ds=
plib/dsplib-c66x.inc<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recipes-ti/dsplib/dsplib-c66x.inc=
<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;deleted file mode 100644<b=
r>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;index 7ff99c2..0000000<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;--- a/recipes-ti/dsplib/ds=
plib-c66x.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&#43;&#43; /dev/null<=
br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -1,30 &#43;0,0 @@<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-DESCRIPTION =3D &quot;DSP=
LIB contains optimized general-purpose<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; signal-processing routines for TI D=
SPs&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-HOMEPAGE =3D &quot;<a hre=
f=3D"http://www.ti.com/tool/sprc265">http://www.ti.com/tool/sprc265</a>&quo=
t;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-SECTION =3D &quot;devel&q=
uot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-LICENSE =3D &quot;BSD-3-C=
lause&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-require ../includes/ti-pa=
ths.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-require ../includes/ti-st=
aging.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-require ../includes/ti-un=
pack.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-COMPATIBLE_MACHINE =3D &q=
uot;omap-a15|keystone&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-SRC_URI =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;http://software-<br>
&gt; &gt;&gt;&gt;dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${B=
INFILE};name=3Dd<br>
&gt; &gt;&gt;&gt;splib&quot;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-BINFILE =3D &quot;dsplib_=
c66x_${PV}_Linux.bin&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-TI_BIN_UNPK_ARGS =3D &quo=
t;--mode silent --prefix ${S}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-TI_BIN_UNPK_CMDS =3D &quo=
t;&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-do_install() {<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-&nbsp;&nbsp;&nbsp; CP_ARG=
S=3D&quot;-Prf --preserve=3Dmode,timestamps --no-<br>
&gt; &gt;&gt;&gt;preserve=3Downership&quot;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-&nbsp;&nbsp;&nbsp; instal=
l -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-&nbsp;&nbsp;&nbsp; cp ${C=
P_ARGS} ${S}/* ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-ALLOW_EMPTY_${PN} =3D &qu=
ot;1&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-FILES_${PN}-dev &#43;=3D =
&quot;${DSPLIB_C66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-INHIBIT_PACKAGE_STRIP =3D=
 &quot;1&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-INHIBIT_SYSROOT_STRIP =3D=
 &quot;1&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-INHIBIT_PACKAGE_DEBUG_SPL=
IT =3D &quot;1&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-INSANE_SKIP_${PN}-dev =3D=
 &quot;arch&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;diff --git a/recipes-ti/ds=
plib/dsplib-c66x_3.4.0.0.bb<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recipes-ti/dsplib/dsplib-c66x_3.4=
.0.0.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;deleted file mode 100644<b=
r>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;index f1273f3..0000000<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;--- a/recipes-ti/dsplib/ds=
plib-c66x_3.4.0.0.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&#43;&#43; /dev/null<=
br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -1,9 &#43;0,0 @@<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-require dsplib-c66x.inc<b=
r>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-PV =3D &quot;3_4_0_0&quot=
;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-PR =3D &quot;r1&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-LIC_FILES_CHKSUM =3D<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&quot;file://packages/ti/dsplib/dsplib.h;beginline=3D9;end=
line=3D35;md5=3D17733f9e1100f8<br>
&gt; &gt;&gt;&gt;a628512f47c4bf676a&quot;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-SRC_URI[dsplib.md5sum] =
=3D &quot;66785604729c153dcad5282097dee8bf&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-SRC_URI[dsplib.sha256sum]=
 =3D<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&quot;e88909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668e=
b35888785ce8&quot;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;diff --git a/recipes-ti/ds=
plib/dsplib-c66x_git.bb<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recipes-ti/dsplib/dsplib-c66x_git=
.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;new file mode 100644<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;index 0000000..cbc25d0<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;--- /dev/null<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&#43;&#43; b/recipes-=
ti/dsplib/dsplib-c66x_git.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -0,0 &#43;1,10 @@<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;MATHLIB_INSTALL_DIR =
=3D &quot;${MATHLIB_C66_INSTALL_DIR}/packages&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_INSTALL_DIR_RE=
CIPE =3D &quot;${DSPLIB_C66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_INSTALL_DIR =
=3D &quot;${DSPLIB_C66_INSTALL_DIR}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_BUILD_TARGET =
=3D &quot;c66x&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DEPENDS =3D &quot;mat=
hlib-c66x&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;include dsplib.inc<br=
>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;diff --git a/recipes-ti/ds=
plib/dsplib-c674x_git.bb<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recipes-ti/dsplib/dsplib-c674x_gi=
t.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;new file mode 100644<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;index 0000000..07c6892<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;--- /dev/null<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&#43;&#43; b/recipes-=
ti/dsplib/dsplib-c674x_git.bb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -0,0 &#43;1,9 @@<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;MATHLIB_INSTALL_DIR =
=3D &quot;${MATHLIB_C674_INSTALL_DIR}/packages&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_INSTALL_DIR_RE=
CIPE =3D &quot;${DSPLIB_C674_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_INSTALL_DIR =
=3D &quot;${DSPLIB_C674_INSTALL_DIR}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_BUILD_TARGET =
=3D &quot;c674x&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DEPENDS =3D &quot;mat=
hlib-c674x&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;include dsplib.inc<br=
>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;diff --git a/recipes-ti/ds=
plib/dsplib.inc<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recipes-ti/dsplib/dsplib.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;new file mode 100644<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;index 0000000..66fe0fb<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;--- /dev/null<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&#43;&#43; b/recipes-=
ti/dsplib/dsplib.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -0,0 &#43;1,79 @@<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;SUMMARY =3D &quot;DSP=
LIB contains optimized signal processing functions for<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; TI DSPs&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;HOMEPAGE =3D &quot;<a=
 href=3D"http://git.ti.com/ep-processor-libraries/dsplib">http://git.ti.com=
/ep-processor-libraries/dsplib</a>&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;LICENSE =3D &quot;BSD=
-3-Clause&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;require ../includes/t=
i-paths.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;PV =3D &quot;3_4_0_1&=
quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;PR =3D &quot;r0&quot;=
<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;COMPATIBLE_MACHINE =
=3D &quot;am57xx-evm|keystone|c66x|omapl1&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DEPENDS &#43;=3D &quo=
t;ti-cgt6x-native \<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-xdctools-native \<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-sysbios \<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doxygen-native \<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zip-native \<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swtools &quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;S =3D &quot;${WORKDIR=
}/git&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;SRC_URI =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;git://git.ti.com/ep-processor=
-<br>
&gt; &gt;&gt;&gt;libraries/dsplib.git;protocol=3Dgit;branch=3Dmaster&quot;<=
br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;SRCREV =3D &quot;bf5a=
51cba462c5cb03ed20a6a1bb1bd16c0683e1&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;LIC_FILES_CHKSUM =3D<=
br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&quot;file://ti/dsplib/src/common/c66/lnk.cmd;beginline=3D=
1;endline=3D37;md5=3D0f0c9c4<br>
&gt; &gt;&gt;&gt;d51d8af75419781591ace190b&quot;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export DSPLIB_WORK_DI=
R=3D&quot;${S}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export CGTOOLS_INSTAL=
L_DIR&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_NATIVE}/usr/sha=
re/ti/cgt-c6x&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export C64PCODEGENTOO=
L=3D&quot;${CGTOOLS_INSTALL_DIR}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export C674CODEGENTOO=
L=3D&quot;${CGTOOLS_INSTALL_DIR}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export C66CODEGENTOOL=
 =3D&quot;${CGTOOLS_INSTALL_DIR}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export SWTOOLS_PATH =
=3D &quot;${SWTOOLS_INSTALL_DIR}/ti/mas/swtools&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export XDCBUILDCFG=3D=
&quot;${SWTOOLS_PATH}/config.bld&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export INCDIR=3D&quot=
;${MATHLIB_INSTALL_DIR}/&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;PATH_append =3D &quot=
;:${XDC_INSTALL_DIR}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&#43;XDCPATH.=3D&quot;${XDCCGROOT}/include;${XDC_INSTA=
LL_DIR}/packages;${SYSBI<br>
&gt; &gt;&gt;&gt;OS_INSTALL_DIR}/packages;&quot;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&#43;XDCPATH.=3D&quot;${SWTOOLS_INSTALL_DIR};${MATHLIB=
_INSTALL_DIR};${DSPLIB_<br>
&gt; &gt;&gt;&gt;WORK_DIR};&quot;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export XDCPATH<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;DSPLIB_PACKAGE_NAME =
=3D &quot;dsplib_${DSPLIB_BUILD_TARGET}_${PV}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;do_compile() {<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; cd ${DSPLIB_WORK_DIR}/ti/dsplib;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; xdc XDCARGS=3D&quot;${DSPLIB_BUILD_TARGET} bundle&quot; XDC=
OPTIONS=3D&quot;-<br>
&gt; &gt;&gt;&gt;v&quot;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;do_install() {<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; install -d ${D}${DSPLIB_INSTALL_DIR_RECIPE}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; find -name &quot;${DSPLIB_PACKAGE_NAME}.zip&quot; -exec unz=
ip -o {} -d<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ${D}${DSPLIB_INSTALL_DIR_RECIPE} \;=
<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/*<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ${D}${DSPLIB_INSTALL_DIR_RECIPE}<br=
>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ${D}${DSPLIB_INSTALL_DIR_RECIPE}<br=
>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;inherit deploy<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;addtask deploy before=
 do_build after do_install<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;do_deploy() {<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; install -d ${DEPLOYDIR}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; # zip up files in ${D}${DSPLIB_INSTALL_DIR_RECIPE}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; # and place the zip file in ${DEPLOYDIR}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; mkdir ./${DSPLIB_PACKAGE_NAME}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/*<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ./${DSPLIB_PACKAGE_NAME}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ./${DSPLIB_PACKAGE_NAME}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ./${DSPLIB_PACKAGE_NAME}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; rm -r ./${DSPLIB_PACKAGE_NAME}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;PACKAGE_ARCH =3D &quo=
t;${MACHINE_ARCH}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;ALLOW_EMPTY_${PN} =3D=
 &quot;1&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;FILES_${PN}-dev &#43;=
=3D &quot;${DSPLIB_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;INSANE_SKIP_${PN}-dev=
 =3D &quot;arch&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;diff --git a/recipes-ti/in=
cludes/ti-paths.inc<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recipes-ti/includes/ti-paths.inc<=
br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;index 4f99d5e..8740b6a 100=
644<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;--- a/recipes-ti/includes/=
ti-paths.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;&#43;&#43; b/recipes-=
ti/includes/ti-paths.inc<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -17,6 &#43;17,7 @@ expo=
rt DMAI_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-dmai-tree&qu=
ot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export DSP_BENCHMAR=
K_INSTALL_DIR_RECIPE =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-dsp-benchmar=
k-tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export DSPLIB_C64P_=
INSTALL_DIR_RECIPE =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-dsplib-c64p-=
tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export DSPLIB_C674_=
INSTALL_DIR_RECIPE =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-dsplib-c674x=
-tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export DSPLIB_C66_INS=
TALL_DIR_RECIPE&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-dsplib-c66x-=
tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export DSPLIB_INSTA=
LL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-dsplib-tre=
e&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export DVSDK_DEMOS_=
INSTALL_DIR_RECIPE=3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-dvsdk-demos-=
tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export DVTB_INSTALL=
_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-=
dvtb-tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -39,6 &#43;40,7 @@ expo=
rt OSAL_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-osal-tree&qu=
ot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export RTFS_INSTALL=
_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-=
rtfs-tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export SYSBIOS_INST=
ALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-sysbios-tree=
&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export SYSLINK_INST=
ALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-syslink-tree=
&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export SWTOOLS_INSTAL=
L_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-swtools-tree&quot=
;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export UIA_INSTALL_=
DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir=
}/ti-uia-tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export VICPLIB_INST=
ALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-vicplib-tree=
&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export XDAIS_INSTAL=
L_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-xdais=
-tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -48,8 &#43;50,8 @@ expo=
rt OSAL_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-osal-tree&qu=
ot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export M4_TOOLCHAIN=
_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-cgt-arm&quot=
;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export GCC_ARM_NONE=
_TOOLCHAIN_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/gcc-arm-none-ea=
bi&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export TI_CGT_PRU_I=
NSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/cgt=
-pru&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;-export DSPLIB_C66_INSTALL=
_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-dsplib-c66x-=
tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export MATHLIB_C66_=
INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-mathlib-c66x=
-tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export MATHLIB_C674_I=
NSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-mathlib-c674=
x-tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export IMGLIB_C66_I=
NSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-imglib-c66x-=
tree&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export VLIB_C66_INS=
TALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-vlib-c66x-tr=
ee&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export CG_XML_INSTA=
LL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;${installdir}/ti-cg-xml-tre=
e&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;@@ -95,7 &#43;97,11 @@ exp=
ort OSAL_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_TARGET}${OSAL_I=
NSTALL_DIR_RECIPE}<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export M4_TOOLCHAIN=
_INSTALL_DIR&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_NATIVE}${M4_TOO=
LCHAIN_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export GCC_ARM_NONE=
_TOOLCHAIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_NATIVE}${GCC_AR=
M_NONE_TOOLCHAIN_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export TI_CGT_PRU_I=
NSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_NATIVE}${TI_CGT=
_PRU_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export SWTOOLS_INSTAL=
L_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_TARGET}${SWTOOL=
S_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export DSPLIB_C64P_IN=
STALL_DIR&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_TARGET}${DSPLIB=
_C64P_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export DSPLIB_C674_IN=
STALL_DIR&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_TARGET}${DSPLIB=
_C674_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export DSPLIB_C66_I=
NSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_TARGET}${DSPLIB=
_C66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&#43;export MATHLIB_C674_I=
NSTALL_DIR&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_TARGET}${MATHLI=
B_C674_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export MATHLIB_C66_=
INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_TARGET}${MATHLI=
B_C66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export IMGLIB_C66_I=
NSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_TARGET}${IMGLIB=
_C66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&nbsp; export VLIB_C66_INS=
TALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;${STAGING_DIR_TARGET}${VLIB_C=
66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; --<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; ______________________________=
_________________<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; meta-ti mailing list<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; meta-ti@yoctoproject.org<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; <a href=3D"https://lists.yocto=
project.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-=
ti</a><br>
&gt; <o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_2fcb0ee9597541678597a5019c117160ticom_--
