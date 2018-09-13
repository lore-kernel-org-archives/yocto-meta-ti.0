Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B19E5E00A39; Thu, 13 Sep 2018 14:20:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED,
	T_FILL_THIS_FORM_SHORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
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
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23100E006AF
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 14:20:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DLK5ur007633
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 16:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536873605;
	bh=K5B0+8SYCb2X/eiM7oL+ug7ucF7zSHS8SkaXVwyYtCc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=TwuA3j59D40pkB/MHgccGcKWoOxvNju9Aq5nuekTGZoLDG68eHILx/gUUEYs0qE4/
	S4wgqPMvAUz2KC7bNw3IjuI5t4hngZNvg0SzBQxZQ0U4PjP+zUz1YIizb3BvyBVHZ6
	jgrlbGmdtNzDjPBTIXtBJLGtG/JN4J4OMetsW4yU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DLK5n7002248
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2018 16:20:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 16:20:03 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Thu, 13 Sep 2018 16:20:04 -0500
From: "Xu, Jianzhong" <xuj@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to build
	DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB
	and DSPLIB.
Thread-Index: AQHUSszaPzA8kiYI0UeuilkCSFgFTaTtClyggABf/wCAAATMAIAAJcEAgADSdgCAAEM1gP//sMRMgABY9ACAAAlCAIAAIbcA///Z1zU=
Date: Thu, 13 Sep 2018 21:20:04 +0000
Message-ID: <3f52cb253fa74cc8a9d370d21b579996@ti.com>
References: <20180912191313.GB12296@beryl>
	<0edace8daec141e48401dfaf972f69af@ti.com>	<20180912202038.GF12296@beryl>
	<f1fe357da2074bee88e9c56c6b5663f1@ti.com>	<20180912225256.GJ12296@beryl>
	<cf942c47-0bea-3824-969f-c0d748dd422b@ti.com>	<20180913152644.GO12296@beryl>
	<54721d798ca04e03b26319cb76db9300@ti.com>
	<2fcb0ee9597541678597a5019c117160@ti.com>
	<20180913163440.GV12296@beryl>,<20180913183520.GI12296@beryl>
In-Reply-To: <20180913183520.GI12296@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.92]
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
X-List-Received-Date: Thu, 13 Sep 2018 21:20:09 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3f52cb253fa74cc8a9d370d21b579996ticom_"

--_000_3f52cb253fa74cc8a9d370d21b579996ticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Denys,


Thanks for the cleaned up patches. I applied those patches and removed COMP=
ATIBLE_MACHINE and resubmitted.


Regards,

Jianzhong


________________________________
From: meta-ti-bounces@yoctoproject.org <meta-ti-bounces@yoctoproject.org> o=
n behalf of Dmytriyenko, Denys
Sent: Thursday, September 13, 2018 2:35 PM
To: Stiffler, Jacob
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe to bui=
ld DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and DSPLIB=
.

Jake, Jianzhong,

I have re-posted the cleaned up patches I had in rocko-next. Please use tho=
se
for fixing the COMPATIBLE_MACHINE issue. For now I'll drop them, as I need
rocko-next freed up.

Denys


On Thu, Sep 13, 2018 at 12:34:40PM -0400, Denys Dmytriyenko wrote:
> On Thu, Sep 13, 2018 at 12:01:32PM -0400, Stiffler, Jacob wrote:
> >    That will work as c66x is a subset of the keystone SOC family.
> >
> >
> >
> >    I just don=92t think that specifying COMPATIBLE_MACHINE is necessary=
 as
> >    these packages are independent of the architecture that is running L=
inux.
>
> Agree.
>
>
> >    And due to this, we should also remove the =91PACKAGE_ARCH =3D
> >    ${MACHINE_ARCH}=94=92 as there is no difference between the resultin=
g packages
> >    for any machine.
>
> Also agree.
>
>
> >    IMHO, COMPATIBLE_MACHINE has been overused and it creates more probl=
ems
> >    that it solves.
>
> I've been saying this for years! Still, the response from developers was =
that
> they only tested it on one platform, hence it's only compatible with this=
 one
> platform...
>
>
> Jake,
>
> Please work with your team to explain this and stop abusing COMPATIBLE_MA=
CHINE
> variable. We'll also need to work with RTOS team for the same...
>
> --
> Denys
>
>
> >
> >
> >
> >    - Jake
> >
> >
> >
> >    From: Xu, Jianzhong
> >    Sent: Thursday, September 13, 2018 11:45 AM
> >    To: Dmytriyenko, Denys; Stiffler, Jacob
> >    Cc: meta-ti@yoctoproject.org
> >    Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe=
 to
> >    build DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB =
and
> >    DSPLIB.
> >
> >
> >
> >    Denys,
> >
> >
> >
> >    Would the following fix the problems you've seen:
> >
> >
> >
> >    COMPATIBLE_MACHINE =3D "omap-a15|keystone"
> >
> >
> >
> >    This was in DSPLIB recipes before.
> >
> >
> >
> >    Thanks,
> >
> >    Jianzhong
> >
> >     -------------------------------------------------------------------=
-----
> >
> >    From: Dmytriyenko, Denys
> >    Sent: Thursday, September 13, 2018 11:26:45 AM
> >    To: Stiffler, Jacob
> >    Cc: Xu, Jianzhong; meta-ti@yoctoproject.org
> >    Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe=
 to
> >    build DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB =
and
> >    DSPLIB.
> >
> >
> >
> >    On Thu, Sep 13, 2018 at 07:26:12AM -0400, Jacob Stiffler wrote:
> >    >
> >    >
> >    > On 9/12/2018 6:52 PM, Denys Dmytriyenko wrote:
> >    > >Same for dra7xx-evm...
> >    > >
> >    > >
> >    > >On Wed, Sep 12, 2018 at 04:37:48PM -0400, Dmytriyenko, Denys wrot=
e:
> >    > >>And it crashed and burned right away:
> >    > >>
> >    > >>ERROR: Nothing PROVIDES 'dsplib-c66x' (but
> >    /OE/arago-rocko-next-build/sources/meta-arago/meta-arago-extras/reci=
pes-apps/video-analytics-demo/qt-opencv-opencl-opengl-multithreaded_git.bb
> >    DEPENDS on or otherwise requires it)
> >    > >>dsplib-c66x was skipped: incompatible with machine am57xx-hs-evm=
 (not
> >    in COMPATIBLE_MACHINE)
> >    > >>NOTE: Runtime target 'qt-opencv-opencl-opengl-multithreaded-src'=
 is
> >    unbuildable, removing...
> >    > >>
> >    > >>Jake,
> >    > >>
> >    > >>Did you tested it on am57xx-hs-evm?
> >    >
> >    > I had only built for am57xx-evm as there are no machine overrides =
in
> >    these
> >    > recipes because they are DSP architecture-specific.
> >    >
> >    > Looks like we should change "COMPATIBLE_MACHINE" to, at the very l=
east,
> >    > include what was there before (omap-a15|keystone). But as these ar=
e
> >    specific
> >    > to the DSP architecture, should COMPATIBLE_MACHINE even be necessa=
ry?
> >
> >    Either way should be fine. Currently those patches break too many
> >    platforms -
> >    dra7 GP and both am5/dra7 HS.
> >
> >    > >>Denys
> >    > >>
> >    > >>
> >    > >>>-----Original Message-----
> >    > >>>From: Denys Dmytriyenko [mailto:denys@ti.com]
> >    > >>>Sent: Wednesday, September 12, 2018 4:21 PM
> >    > >>>To: Xu, Jianzhong
> >    > >>>Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> >    > >>>Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB r=
ecipe
> >    to build
> >    > >>>DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB a=
nd
> >    DSPLIB.
> >    > >>>
> >    > >>>Thanks, merged into rocko-next for testing.
> >    > >>>
> >    > >>>There were lots of small non-critical things I had to fix, like
> >    whitespaces,
> >    > >>>indentation, etc. But the biggest one is that you have to follo=
w
> >    OpenEmbedded
> >    > >>>Commit Message Guidelines:
> >    > >>>
> >    > >>>https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelin=
es
> >    > >>>
> >    > >>>
> >    > >>>On Wed, Sep 12, 2018 at 03:40:42PM -0400, Xu, Jianzhong wrote:
> >    > >>>>    Denys,
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>    You're right. The versioning was inconsistent. Please use
> >    > >>>>    [EXTERNAL,3/3,v2] and newer versions of [EXTERNAL,2/3],
> >    [EXTERNAL,1/3].
> >    > >>>>    The latter two should have had v2 in it. Please see highli=
ghts
> >    below.
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    +-------------------------------------------------------------------=
-----+
> >    > >>>>    |[EXTERNAL,3/3,v2] Added DSPLIB recipe to   |
> >    |            ||   |
> >    > >>>>    |build DSPLIB from source. Updated
> >    |2018-09-06|Jianzhong Xu||New|
> >    > >>>>    |includes/ti-paths.inc for MATHLIB and      |
> >    |            ||   |
> >    > >>>>    |DSPLIB.                                    |
> >    |            ||   |
> >    > >>>>
> >    |-------------------------------------------+----------+------------=
++---|
> >    > >>>>    |[EXTERNAL] Added DSPLIB recipe to build    |
> >    |            ||   |
> >    > >>>>    |DSPLIB from source. Updated
> >    |2018-09-06|Jianzhong Xu||New|
> >    > >>>>    |includes/ti-paths.inc for MATHLIB and      |
> >    |            ||   |
> >    > >>>>    |DSPLIB.                                    |
> >    |            ||   |
> >    > >>>>
> >    |-------------------------------------------+----------+------------=
++---|
> >    > >>>>    |[EXTERNAL,3/3] Added DSPLIB recipe to
> >    build|2018-09-04|Jianzhong
> >    > >>>Xu||New|
> >    > >>>>    |DSPLIB from source.                        |
> >    |            ||   |
> >    > >>>>
> >    |-------------------------------------------+----------+------------=
++---|
> >    > >>>>    |[EXTERNAL,2/3] Added MATHLIB recipe to
> >    |2018-09-04|Jianzhong
> >    > >>>Xu||New|
> >    > >>>>    |build MATHLIB from source.                 |
> >    |            ||   |
> >    > >>>>
> >    |-------------------------------------------+----------+------------=
++---|
> >    > >>>>    |[EXTERNAL,1/3] Added SWTOOLS which is      |
> >    |            ||   |
> >    > >>>>    |needed to build processor libs (DSPLIB,
> >    |2018-09-04|Jianzhong Xu||New|
> >    > >>>>    |MATHLIB, etc) from source.                 |
> >    |            ||   |
> >    > >>>>
> >    +-------------------------------------------------------------------=
-----+
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>    Thanks,
> >    > >>>>
> >    > >>>>    Jianzhong
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>    -----Original Message-----
> >    > >>>>    From: Dmytriyenko, Denys
> >    > >>>>    Sent: Wednesday, September 12, 2018 3:13 PM
> >    > >>>>    To: Stiffler, Jacob
> >    > >>>>    Cc: Xu, Jianzhong; meta-ti@yoctoproject.org
> >    > >>>>    Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSP=
LIB
> >    recipe to
> >    > >>>>    build DSPLIB from source. Updated includes/ti-paths.inc fo=
r
> >    MATHLIB and
> >    > >>>>    DSPLIB.
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>    Jake,
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>    I'll give it a look - I assume you want the 3 most recent
> >    patches, I don't
> >    > >>>>
> >    > >>>>    think versioning was consistent...
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>    Denys
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>
> >    > >>>>    On Tue, Sep 11, 2018 at 09:17:49AM -0400, Jacob Stiffler w=
rote:
> >    > >>>>
> >    > >>>>    > ACK
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>    > Denys,
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>    > Can you apply these patches to the ti2018.03 branch?
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>    > Thank you,
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>    > Jake
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>    > On 9/6/2018 1:46 PM, Jianzhong Xu wrote:
> >    > >>>>
> >    > >>>>    > >Signed-off-by: Jianzhong Xu <xuj@ti.com>
> >    > >>>>
> >    > >>>>    > >---
> >    > >>>>
> >    > >>>>    > >Change from previous version of patch
> >    > >>>>
> >    > >>>>    > >Corrected typo: MATHLIB_C674INSTALL_XXX should have bee=
n
> >    > >>>>    MATHLIB_C674_INSTALL_XXX
> >    > >>>>
> >    > >>>>    > >---
> >    > >>>>
> >    > >>>>    > >---
> >    > >>>>
> >    > >>>>    > >  recipes-ti/dsplib/dsplib-c64xp_git.bb    |  9 ++++
> >    > >>>>
> >    > >>>>    > >  recipes-ti/dsplib/dsplib-c66x.inc        | 30 -------=
-----
> >    > >>>>
> >    > >>>>    > >  recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb |  9 ----
> >    > >>>>
> >    > >>>>    > >  recipes-ti/dsplib/dsplib-c66x_git.bb     | 10 ++++
> >    > >>>>
> >    > >>>>    > >  recipes-ti/dsplib/dsplib-c674x_git.bb    |  9 ++++
> >    > >>>>
> >    > >>>>    > >  recipes-ti/dsplib/dsplib.inc             | 79
> >    > >>>>    ++++++++++++++++++++++++++++++++
> >    > >>>>
> >    > >>>>    > >  recipes-ti/includes/ti-paths.inc         |  8 +++-
> >    > >>>>
> >    > >>>>    > >  7 files changed, 114 insertions(+), 40 deletions(-)
> >    > >>>>
> >    > >>>>    > >  create mode 100644 recipes-ti/dsplib/dsplib-c64xp_git=
.bb
> >    > >>>>
> >    > >>>>    > >  delete mode 100644 recipes-ti/dsplib/dsplib-c66x.inc
> >    > >>>>
> >    > >>>>    > >  delete mode 100644 recipes-ti/dsplib/dsplib-c66x_3.4.=
0.0.bb
> >    > >>>>
> >    > >>>>    > >  create mode 100644 recipes-ti/dsplib/dsplib-c66x_git.=
bb
> >    > >>>>
> >    > >>>>    > >  create mode 100644 recipes-ti/dsplib/dsplib-c674x_git=
.bb
> >    > >>>>
> >    > >>>>    > >  create mode 100644 recipes-ti/dsplib/dsplib.inc
> >    > >>>>
> >    > >>>>    > >
> >    > >>>>
> >    > >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c64xp_git.bb
> >    > >>>>    b/recipes-ti/dsplib/dsplib-c64xp_git.bb
> >    > >>>>
> >    > >>>>    > >new file mode 100644
> >    > >>>>
> >    > >>>>    > >index 0000000..1038d44
> >    > >>>>
> >    > >>>>    > >--- /dev/null
> >    > >>>>
> >    > >>>>    > >+++ b/recipes-ti/dsplib/dsplib-c64xp_git.bb
> >    > >>>>
> >    > >>>>    > >@@ -0,0 +1,9 @@
> >    > >>>>
> >    > >>>>    > >+MATHLIB_INSTALL_DIR =3D "${MATHLIB_C64P_INSTALL_DIR}/p=
ackages"
> >    > >>>>
> >    > >>>>    > >+DSPLIB_INSTALL_DIR_RECIPE =3D
> >    "${DSPLIB_C64P_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >+DSPLIB_INSTALL_DIR =3D "${DSPLIB_C64P_INSTALL_DIR}"
> >    > >>>>
> >    > >>>>    > >+DSPLIB_BUILD_TARGET =3D "c64Px"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+DEPENDS =3D ""
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+include dsplib.inc
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c66x.inc
> >    > >>>>    b/recipes-ti/dsplib/dsplib-c66x.inc
> >    > >>>>
> >    > >>>>    > >deleted file mode 100644
> >    > >>>>
> >    > >>>>    > >index 7ff99c2..0000000
> >    > >>>>
> >    > >>>>    > >--- a/recipes-ti/dsplib/dsplib-c66x.inc
> >    > >>>>
> >    > >>>>    > >+++ /dev/null
> >    > >>>>
> >    > >>>>    > >@@ -1,30 +0,0 @@
> >    > >>>>
> >    > >>>>    > >-DESCRIPTION =3D "DSPLIB contains optimized general-pur=
pose
> >    > >>>>    signal-processing routines for TI DSPs"
> >    > >>>>
> >    > >>>>    > >-HOMEPAGE =3D "http://www.ti.com/tool/sprc265"
> >    > >>>>
> >    > >>>>    > >-SECTION =3D "devel"
> >    > >>>>
> >    > >>>>    > >-LICENSE =3D "BSD-3-Clause"
> >    > >>>>
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-require ../includes/ti-paths.inc
> >    > >>>>
> >    > >>>>    > >-require ../includes/ti-staging.inc
> >    > >>>>
> >    > >>>>    > >-require ../includes/ti-unpack.inc
> >    > >>>>
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-COMPATIBLE_MACHINE =3D "omap-a15|keystone"
> >    > >>>>
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-SRC_URI =3D
> >    > >>>>    "http://software-
> >    >
> >    >>>dl.ti.com/sdoemb/sdoemb_public_sw/dsplib/${PV}/exports/${BINFILE}=
;name=3Dd
> >    > >>>splib"
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-BINFILE =3D "dsplib_c66x_${PV}_Linux.bin"
> >    > >>>>
> >    > >>>>    > >-TI_BIN_UNPK_ARGS =3D "--mode silent --prefix ${S}"
> >    > >>>>
> >    > >>>>    > >-TI_BIN_UNPK_CMDS =3D ""
> >    > >>>>
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-do_install() {
> >    > >>>>
> >    > >>>>    > >-    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-
> >    > >>>preserve=3Downership"
> >    > >>>>    > >-    install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> >    > >>>>
> >    > >>>>    > >-    cp ${CP_ARGS} ${S}/*
> >    ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}
> >    > >>>>
> >    > >>>>    > >-}
> >    > >>>>
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-ALLOW_EMPTY_${PN} =3D "1"
> >    > >>>>
> >    > >>>>    > >-FILES_${PN}-dev +=3D "${DSPLIB_C66_INSTALL_DIR_RECIPE}=
"
> >    > >>>>
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-INHIBIT_PACKAGE_STRIP =3D "1"
> >    > >>>>
> >    > >>>>    > >-INHIBIT_SYSROOT_STRIP =3D "1"
> >    > >>>>
> >    > >>>>    > >-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> >    > >>>>
> >    > >>>>    > >-INSANE_SKIP_${PN}-dev =3D "arch"
> >    > >>>>
> >    > >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> >    > >>>>    b/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> >    > >>>>
> >    > >>>>    > >deleted file mode 100644
> >    > >>>>
> >    > >>>>    > >index f1273f3..0000000
> >    > >>>>
> >    > >>>>    > >--- a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb
> >    > >>>>
> >    > >>>>    > >+++ /dev/null
> >    > >>>>
> >    > >>>>    > >@@ -1,9 +0,0 @@
> >    > >>>>
> >    > >>>>    > >-require dsplib-c66x.inc
> >    > >>>>
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-PV =3D "3_4_0_0"
> >    > >>>>
> >    > >>>>    > >-PR =3D "r1"
> >    > >>>>
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-LIC_FILES_CHKSUM =3D
> >    > >>>>
> >    >
> >    >>>"file://packages/ti/dsplib/dsplib.h;beginline=3D9;endline=3D35;md=
5=3D17733f9e1100f8
> >    > >>>a628512f47c4bf676a"
> >    > >>>>    > >-
> >    > >>>>
> >    > >>>>    > >-SRC_URI[dsplib.md5sum] =3D "66785604729c153dcad5282097=
dee8bf"
> >    > >>>>
> >    > >>>>    > >-SRC_URI[dsplib.sha256sum] =3D
> >    > >>>>
> >    > >>>"e88909b6271ce6c4c62e2ab90181b7adb36c7f28f5c52836668eb35888785c=
e8"
> >    > >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c66x_git.bb
> >    > >>>>    b/recipes-ti/dsplib/dsplib-c66x_git.bb
> >    > >>>>
> >    > >>>>    > >new file mode 100644
> >    > >>>>
> >    > >>>>    > >index 0000000..cbc25d0
> >    > >>>>
> >    > >>>>    > >--- /dev/null
> >    > >>>>
> >    > >>>>    > >+++ b/recipes-ti/dsplib/dsplib-c66x_git.bb
> >    > >>>>
> >    > >>>>    > >@@ -0,0 +1,10 @@
> >    > >>>>
> >    > >>>>    > >+MATHLIB_INSTALL_DIR =3D "${MATHLIB_C66_INSTALL_DIR}/pa=
ckages"
> >    > >>>>
> >    > >>>>    > >+DSPLIB_INSTALL_DIR_RECIPE =3D
> >    "${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >+DSPLIB_INSTALL_DIR =3D "${DSPLIB_C66_INSTALL_DIR}"
> >    > >>>>
> >    > >>>>    > >+DSPLIB_BUILD_TARGET =3D "c66x"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+DEPENDS =3D "mathlib-c66x"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+include dsplib.inc
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >diff --git a/recipes-ti/dsplib/dsplib-c674x_git.bb
> >    > >>>>    b/recipes-ti/dsplib/dsplib-c674x_git.bb
> >    > >>>>
> >    > >>>>    > >new file mode 100644
> >    > >>>>
> >    > >>>>    > >index 0000000..07c6892
> >    > >>>>
> >    > >>>>    > >--- /dev/null
> >    > >>>>
> >    > >>>>    > >+++ b/recipes-ti/dsplib/dsplib-c674x_git.bb
> >    > >>>>
> >    > >>>>    > >@@ -0,0 +1,9 @@
> >    > >>>>
> >    > >>>>    > >+MATHLIB_INSTALL_DIR =3D "${MATHLIB_C674_INSTALL_DIR}/p=
ackages"
> >    > >>>>
> >    > >>>>    > >+DSPLIB_INSTALL_DIR_RECIPE =3D
> >    "${DSPLIB_C674_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >+DSPLIB_INSTALL_DIR =3D "${DSPLIB_C674_INSTALL_DIR}"
> >    > >>>>
> >    > >>>>    > >+DSPLIB_BUILD_TARGET =3D "c674x"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+DEPENDS =3D "mathlib-c674x"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+include dsplib.inc
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >diff --git a/recipes-ti/dsplib/dsplib.inc
> >    > >>>>    b/recipes-ti/dsplib/dsplib.inc
> >    > >>>>
> >    > >>>>    > >new file mode 100644
> >    > >>>>
> >    > >>>>    > >index 0000000..66fe0fb
> >    > >>>>
> >    > >>>>    > >--- /dev/null
> >    > >>>>
> >    > >>>>    > >+++ b/recipes-ti/dsplib/dsplib.inc
> >    > >>>>
> >    > >>>>    > >@@ -0,0 +1,79 @@
> >    > >>>>
> >    > >>>>    > >+SUMMARY =3D "DSPLIB contains optimized signal processi=
ng
> >    functions for
> >    > >>>>    TI DSPs"
> >    > >>>>
> >    > >>>>    > >+HOMEPAGE =3D "http://git.ti.com/ep-processor-libraries=
/dsplib"
> >    > >>>>
> >    > >>>>    > >+LICENSE =3D "BSD-3-Clause"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+require ../includes/ti-paths.inc
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+PV =3D "3_4_0_1"
> >    > >>>>
> >    > >>>>    > >+PR =3D "r0"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+COMPATIBLE_MACHINE =3D "am57xx-evm|keystone|c66x|omapl=
1"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+DEPENDS +=3D "ti-cgt6x-native \
> >    > >>>>
> >    > >>>>    > >+           ti-xdctools-native \
> >    > >>>>
> >    > >>>>    > >+           ti-sysbios \
> >    > >>>>
> >    > >>>>    > >+           doxygen-native \
> >    > >>>>
> >    > >>>>    > >+           zip-native \
> >    > >>>>
> >    > >>>>    > >+           swtools "
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+S =3D "${WORKDIR}/git"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+SRC_URI =3D
> >    > >>>>    "git://git.ti.com/ep-processor-
> >    > >>>libraries/dsplib.git;protocol=3Dgit;branch=3Dmaster"
> >    > >>>>    > >+SRCREV =3D "bf5a51cba462c5cb03ed20a6a1bb1bd16c0683e1"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+LIC_FILES_CHKSUM =3D
> >    > >>>>
> >    >
> >    >>>"file://ti/dsplib/src/common/c66/lnk.cmd;beginline=3D1;endline=3D=
37;md5=3D0f0c9c4
> >    > >>>d51d8af75419781591ace190b"
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+export DSPLIB_WORK_DIR=3D"${S}"
> >    > >>>>
> >    > >>>>    > >+export CGTOOLS_INSTALL_DIR  =3D
> >    > >>>>    "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> >    > >>>>
> >    > >>>>    > >+export C64PCODEGENTOOL=3D"${CGTOOLS_INSTALL_DIR}"
> >    > >>>>
> >    > >>>>    > >+export C674CODEGENTOOL=3D"${CGTOOLS_INSTALL_DIR}"
> >    > >>>>
> >    > >>>>    > >+export C66CODEGENTOOL =3D"${CGTOOLS_INSTALL_DIR}"
> >    > >>>>
> >    > >>>>    > >+export SWTOOLS_PATH =3D
> >    "${SWTOOLS_INSTALL_DIR}/ti/mas/swtools"
> >    > >>>>
> >    > >>>>    > >+export XDCBUILDCFG=3D"${SWTOOLS_PATH}/config.bld"
> >    > >>>>
> >    > >>>>    > >+export INCDIR=3D"${MATHLIB_INSTALL_DIR}/"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+PATH_append =3D ":${XDC_INSTALL_DIR}"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>+XDCPATH.=3D"${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;=
${SYSBI
> >    > >>>OS_INSTALL_DIR}/packages;"
> >    > >>>>    >
> >    > >>>>
> >    > >>>>+XDCPATH.=3D"${SWTOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${D=
SPLIB_
> >    > >>>WORK_DIR};"
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+export XDCPATH
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+DSPLIB_PACKAGE_NAME =3D "dsplib_${DSPLIB_BUILD_TARGET}=
_${PV}"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+do_compile() {
> >    > >>>>
> >    > >>>>    > >+       cd ${DSPLIB_WORK_DIR}/ti/dsplib;
> >    > >>>>
> >    > >>>>    > >+       xdc XDCARGS=3D"${DSPLIB_BUILD_TARGET} bundle"
> >    XDCOPTIONS=3D"-
> >    > >>>v"
> >    > >>>>    > >+}
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+do_install() {
> >    > >>>>
> >    > >>>>    > >+       install -d ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+       find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec u=
nzip
> >    -o {} -d
> >    > >>>>    ${D}${DSPLIB_INSTALL_DIR_RECIPE} \;
> >    > >>>>
> >    > >>>>    > >+       mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/*
> >    > >>>>    ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> >    > >>>>
> >    > >>>>    > >+       mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.met=
adata
> >    > >>>>    ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> >    > >>>>
> >    > >>>>    > >+       rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
> >    > >>>>
> >    > >>>>    > >+}
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+inherit deploy
> >    > >>>>
> >    > >>>>    > >+addtask deploy before do_build after do_install
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+do_deploy() {
> >    > >>>>
> >    > >>>>    > >+       install -d ${DEPLOYDIR}
> >    > >>>>
> >    > >>>>    > >+       # zip up files in ${D}${DSPLIB_INSTALL_DIR_RECI=
PE}
> >    > >>>>
> >    > >>>>    > >+       # and place the zip file in ${DEPLOYDIR}
> >    > >>>>
> >    > >>>>    > >+       mkdir ./${DSPLIB_PACKAGE_NAME}
> >    > >>>>
> >    > >>>>    > >+       cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/*
> >    > >>>>    ./${DSPLIB_PACKAGE_NAME}
> >    > >>>>
> >    > >>>>    > >+       cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadat=
a
> >    > >>>>    ./${DSPLIB_PACKAGE_NAME}
> >    > >>>>
> >    > >>>>    > >+       zip -9 -y -r -q
> >    ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip
> >    > >>>>    ./${DSPLIB_PACKAGE_NAME}
> >    > >>>>
> >    > >>>>    > >+       rm -r ./${DSPLIB_PACKAGE_NAME}
> >    > >>>>
> >    > >>>>    > >+}
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+ALLOW_EMPTY_${PN} =3D "1"
> >    > >>>>
> >    > >>>>    > >+FILES_${PN}-dev +=3D "${DSPLIB_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >+INSANE_SKIP_${PN}-dev =3D "arch"
> >    > >>>>
> >    > >>>>    > >+
> >    > >>>>
> >    > >>>>    > >diff --git a/recipes-ti/includes/ti-paths.inc
> >    > >>>>    b/recipes-ti/includes/ti-paths.inc
> >    > >>>>
> >    > >>>>    > >index 4f99d5e..8740b6a 100644
> >    > >>>>
> >    > >>>>    > >--- a/recipes-ti/includes/ti-paths.inc
> >    > >>>>
> >    > >>>>    > >+++ b/recipes-ti/includes/ti-paths.inc
> >    > >>>>
> >    > >>>>    > >@@ -17,6 +17,7 @@ export DMAI_INSTALL_DIR_RECIPE       =
=3D
> >    > >>>>    "${installdir}/ti-dmai-tree"
> >    > >>>>
> >    > >>>>    > >  export DSP_BENCHMARK_INSTALL_DIR_RECIPE =3D
> >    > >>>>    "${installdir}/ti-dsp-benchmark-tree"
> >    > >>>>
> >    > >>>>    > >  export DSPLIB_C64P_INSTALL_DIR_RECIPE =3D
> >    > >>>>    "${installdir}/ti-dsplib-c64p-tree"
> >    > >>>>
> >    > >>>>    > >  export DSPLIB_C674_INSTALL_DIR_RECIPE =3D
> >    > >>>>    "${installdir}/ti-dsplib-c674x-tree"
> >    > >>>>
> >    > >>>>    > >+export DSPLIB_C66_INSTALL_DIR_RECIPE  =3D
> >    > >>>>    "${installdir}/ti-dsplib-c66x-tree"
> >    > >>>>
> >    > >>>>    > >  export DSPLIB_INSTALL_DIR_RECIPE     =3D
> >    "${installdir}/ti-dsplib-tree"
> >    > >>>>
> >    > >>>>    > >  export DVSDK_DEMOS_INSTALL_DIR_RECIPE=3D
> >    > >>>>    "${installdir}/ti-dvsdk-demos-tree"
> >    > >>>>
> >    > >>>>    > >  export DVTB_INSTALL_DIR_RECIPE       =3D
> >    "${installdir}/ti-dvtb-tree"
> >    > >>>>
> >    > >>>>    > >@@ -39,6 +40,7 @@ export OSAL_INSTALL_DIR_RECIPE       =
=3D
> >    > >>>>    "${installdir}/ti-osal-tree"
> >    > >>>>
> >    > >>>>    > >  export RTFS_INSTALL_DIR_RECIPE       =3D
> >    "${installdir}/ti-rtfs-tree"
> >    > >>>>
> >    > >>>>    > >  export SYSBIOS_INSTALL_DIR_RECIPE    =3D
> >    > >>>>    "${installdir}/ti-sysbios-tree"
> >    > >>>>
> >    > >>>>    > >  export SYSLINK_INSTALL_DIR_RECIPE    =3D
> >    > >>>>    "${installdir}/ti-syslink-tree"
> >    > >>>>
> >    > >>>>    > >+export SWTOOLS_INSTALL_DIR_RECIPE    =3D
> >    "${installdir}/ti-swtools-tree"
> >    > >>>>
> >    > >>>>    > >  export UIA_INSTALL_DIR_RECIPE        =3D
> >    "${installdir}/ti-uia-tree"
> >    > >>>>
> >    > >>>>    > >  export VICPLIB_INSTALL_DIR_RECIPE    =3D
> >    > >>>>    "${installdir}/ti-vicplib-tree"
> >    > >>>>
> >    > >>>>    > >  export XDAIS_INSTALL_DIR_RECIPE      =3D
> >    "${installdir}/ti-xdais-tree"
> >    > >>>>
> >    > >>>>    > >@@ -48,8 +50,8 @@ export OSAL_INSTALL_DIR_RECIPE       =
=3D
> >    > >>>>    "${installdir}/ti-osal-tree"
> >    > >>>>
> >    > >>>>    > >  export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    =3D
> >    > >>>>    "${installdir}/ti-cgt-arm"
> >    > >>>>
> >    > >>>>    > >  export GCC_ARM_NONE_TOOLCHAIN_RECIPE      =3D
> >    > >>>>    "${installdir}/gcc-arm-none-eabi"
> >    > >>>>
> >    > >>>>    > >  export TI_CGT_PRU_INSTALL_DIR_RECIPE      =3D
> >    "${installdir}/cgt-pru"
> >    > >>>>
> >    > >>>>    > >-export DSPLIB_C66_INSTALL_DIR_RECIPE      =3D
> >    > >>>>    "${installdir}/ti-dsplib-c66x-tree"
> >    > >>>>
> >    > >>>>    > >  export MATHLIB_C66_INSTALL_DIR_RECIPE     =3D
> >    > >>>>    "${installdir}/ti-mathlib-c66x-tree"
> >    > >>>>
> >    > >>>>    > >+export MATHLIB_C674_INSTALL_DIR_RECIPE    =3D
> >    > >>>>    "${installdir}/ti-mathlib-c674x-tree"
> >    > >>>>
> >    > >>>>    > >  export IMGLIB_C66_INSTALL_DIR_RECIPE      =3D
> >    > >>>>    "${installdir}/ti-imglib-c66x-tree"
> >    > >>>>
> >    > >>>>    > >  export VLIB_C66_INSTALL_DIR_RECIPE        =3D
> >    > >>>>    "${installdir}/ti-vlib-c66x-tree"
> >    > >>>>
> >    > >>>>    > >  export CG_XML_INSTALL_DIR_RECIPE     =3D
> >    "${installdir}/ti-cg-xml-tree"
> >    > >>>>
> >    > >>>>    > >@@ -95,7 +97,11 @@ export OSAL_INSTALL_DIR       =3D
> >    > >>>>    "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}
> >    > >>>>
> >    > >>>>    > >  export M4_TOOLCHAIN_INSTALL_DIR    =3D
> >    > >>>>    "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >  export GCC_ARM_NONE_TOOLCHAIN      =3D
> >    > >>>>    "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
> >    > >>>>
> >    > >>>>    > >  export TI_CGT_PRU_INSTALL_DIR      =3D
> >    > >>>>    "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >+export SWTOOLS_INSTALL_DIR         =3D
> >    > >>>>    "${STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >+export DSPLIB_C64P_INSTALL_DIR     =3D
> >    > >>>>    "${STAGING_DIR_TARGET}${DSPLIB_C64P_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >+export DSPLIB_C674_INSTALL_DIR     =3D
> >    > >>>>    "${STAGING_DIR_TARGET}${DSPLIB_C674_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >  export DSPLIB_C66_INSTALL_DIR      =3D
> >    > >>>>    "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >+export MATHLIB_C674_INSTALL_DIR    =3D
> >    > >>>>    "${STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >  export MATHLIB_C66_INSTALL_DIR     =3D
> >    > >>>>    "${STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >  export IMGLIB_C66_INSTALL_DIR      =3D
> >    > >>>>    "${STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    > >  export VLIB_C66_INSTALL_DIR        =3D
> >    > >>>>    "${STAGING_DIR_TARGET}${VLIB_C66_INSTALL_DIR_RECIPE}"
> >    > >>>>
> >    > >>>>    >
> >    > >>>>
> >    > >>>>    > --
> >    > >>>>
> >    > >>>>    > _______________________________________________
> >    > >>>>
> >    > >>>>    > meta-ti mailing list
> >    > >>>>
> >    > >>>>    > meta-ti@yoctoproject.org
> >    > >>>>
> >    > >>>>    > https://lists.yoctoproject.org/listinfo/meta-ti
> >    >
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_3f52cb253fa74cc8a9d370d21b579996ticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p>Denys,</p>
<p><br>
</p>
<p>Thanks for the cleaned up patches. I applied those patches and removed C=
OMPATIBLE_MACHINE and resubmitted.&nbsp;</p>
<p><br>
</p>
<p>Regards,</p>
<p>Jianzhong</p>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> meta-ti-bounces@yoc=
toproject.org &lt;meta-ti-bounces@yoctoproject.org&gt; on behalf of Dmytriy=
enko, Denys<br>
<b>Sent:</b> Thursday, September 13, 2018 2:35 PM<br>
<b>To:</b> Stiffler, Jacob<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB recipe=
 to build DSPLIB from source. Updated includes/ti-paths.inc for MATHLIB and=
 DSPLIB.</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Jake, Jianzhong,<br>
<br>
I have re-posted the cleaned up patches I had in rocko-next. Please use tho=
se <br>
for fixing the COMPATIBLE_MACHINE issue. For now I'll drop them, as I need =
<br>
rocko-next freed up.<br>
<br>
Denys<br>
<br>
<br>
On Thu, Sep 13, 2018 at 12:34:40PM -0400, Denys Dmytriyenko wrote:<br>
&gt; On Thu, Sep 13, 2018 at 12:01:32PM -0400, Stiffler, Jacob wrote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; That will work as c66x is a subset of the keyst=
one SOC family.<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; I just don=92t think that specifying COMPATIBLE=
_MACHINE is necessary as<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; these packages are independent of the architect=
ure that is running Linux.<br>
&gt; <br>
&gt; Agree.<br>
&gt; <br>
&gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; And due to this, we should also remove the =91P=
ACKAGE_ARCH =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ${MACHINE_ARCH}=94=92 as there is no difference=
 between the resulting packages<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; for any machine.<br>
&gt; <br>
&gt; Also agree.<br>
&gt; <br>
&gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; IMHO, COMPATIBLE_MACHINE has been overused and =
it creates more problems<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; that it solves.<br>
&gt; <br>
&gt; I've been saying this for years! Still, the response from developers w=
as that <br>
&gt; they only tested it on one platform, hence it's only compatible with t=
his one <br>
&gt; platform...<br>
&gt; <br>
&gt; <br>
&gt; Jake,<br>
&gt; <br>
&gt; Please work with your team to explain this and stop abusing COMPATIBLE=
_MACHINE <br>
&gt; variable. We'll also need to work with RTOS team for the same...<br>
&gt; <br>
&gt; -- <br>
&gt; Denys<br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; - Jake<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; From: Xu, Jianzhong<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Sent: Thursday, September 13, 2018 11:45 AM<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; To: Dmytriyenko, Denys; Stiffler, Jacob<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Cc: meta-ti@yoctoproject.org<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2=
] Added DSPLIB recipe to<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; build DSPLIB from source. Updated includes/ti-p=
aths.inc for MATHLIB and<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; DSPLIB.<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Denys,<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Would the following fix the problems you've see=
n:<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; COMPATIBLE_MACHINE =3D &quot;omap-a15|keystone&=
quot;<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; This was in DSPLIB recipes before. <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Thanks,<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Jianzhong<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; -----------------------------------------=
-------------------------------<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; From: Dmytriyenko, Denys<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Sent: Thursday, September 13, 2018 11:26:45 AM<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp; To: Stiffler, Jacob<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Cc: Xu, Jianzhong; meta-ti@yoctoproject.org<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Subject: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2=
] Added DSPLIB recipe to<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; build DSPLIB from source. Updated includes/ti-p=
aths.inc for MATHLIB and<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; DSPLIB.<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; On Thu, Sep 13, 2018 at 07:26:12AM -0400, Jacob=
 Stiffler wrote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; On 9/12/2018 6:52 PM, Denys Dmytriyenko wr=
ote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;Same for dra7xx-evm...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;On Wed, Sep 12, 2018 at 04:37:48PM -04=
00, Dmytriyenko, Denys wrote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;And it crashed and burned right aw=
ay:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;ERROR: Nothing PROVIDES 'dsplib-c6=
6x' (but<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; /OE/arago-rocko-next-build/sources/meta-arago/m=
eta-arago-extras/recipes-apps/video-analytics-demo/qt-opencv-opencl-opengl-=
multithreaded_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; DEPENDS on or otherwise requires it)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;dsplib-c66x was skipped: incompati=
ble with machine am57xx-hs-evm (not<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; in COMPATIBLE_MACHINE)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;NOTE: Runtime target 'qt-opencv-op=
encl-opengl-multithreaded-src' is<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; unbuildable, removing...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;Jake,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;Did you tested it on am57xx-hs-evm=
?<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; I had only built for am57xx-evm as there a=
re no machine overrides in<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; these<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; recipes because they are DSP architecture-=
specific.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; Looks like we should change &quot;COMPATIB=
LE_MACHINE&quot; to, at the very least,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; include what was there before (omap-a15|ke=
ystone). But as these are<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; specific<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; to the DSP architecture, should COMPATIBLE=
_MACHINE even be necessary?<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Either way should be fine. Currently those patc=
hes break too many<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; platforms -<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; dra7 GP and both am5/dra7 HS.<br>
&gt; &gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;Denys<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;-----Original Message-----<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;From: Denys Dmytriyenko [<a hr=
ef=3D"mailto:denys@ti.com">mailto:denys@ti.com</a>]<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;Sent: Wednesday, September 12,=
 2018 4:21 PM<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;To: Xu, Jianzhong<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;Cc: Stiffler, Jacob; meta-ti@y=
octoproject.org<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;Subject: Re: [meta-ti] [EXTERN=
AL] [PATCH 3/3 v2] Added DSPLIB recipe<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; to build<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;DSPLIB from source. Updated in=
cludes/ti-paths.inc for MATHLIB and<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; DSPLIB.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;Thanks, merged into rocko-next=
 for testing.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;There were lots of small non-c=
ritical things I had to fix, like<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; whitespaces,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;indentation, etc. But the bigg=
est one is that you have to follow<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; OpenEmbedded<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;Commit Message Guidelines:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;<a href=3D"https://www.openemb=
edded.org/wiki/Commit_Patch_Message_Guidelines">https://www.openembedded.or=
g/wiki/Commit_Patch_Message_Guidelines</a><br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;On Wed, Sep 12, 2018 at 03:40:=
42PM -0400, Xu, Jianzhong wrote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Denys,<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; You're =
right. The versioning was inconsistent. Please use<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; [EXTERN=
AL,3/3,v2] and newer versions of [EXTERNAL,2/3],<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; [EXTERNAL,1/3].<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; The lat=
ter two should have had v2 in it. Please see highlights<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; below.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &#43;------------------------------------------=
------------------------------&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTER=
NAL,3/3,v2] Added DSPLIB recipe to&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |build =
DSPLIB from source. Updated&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |2018-09-06|Jianzhong Xu||New|<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |includ=
es/ti-paths.inc for MATHLIB and&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |DSPLIB=
.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |-------------------------------------------&#4=
3;----------&#43;------------&#43;&#43;---|<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTER=
NAL] Added DSPLIB recipe to build&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |DSPLIB=
 from source. Updated&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |2018-09-06|Jianzhong Xu||New|<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |includ=
es/ti-paths.inc for MATHLIB and&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |DSPLIB=
.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |-------------------------------------------&#4=
3;----------&#43;------------&#43;&#43;---|<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTER=
NAL,3/3] Added DSPLIB recipe to<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; build|2018-09-04|Jianzhong<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;Xu||New|<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |DSPLIB=
 from source.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |-------------------------------------------&#4=
3;----------&#43;------------&#43;&#43;---|<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTER=
NAL,2/3] Added MATHLIB recipe to&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |2018-09-04|Jianzhong<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;Xu||New|<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |build =
MATHLIB from source.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |-------------------------------------------&#4=
3;----------&#43;------------&#43;&#43;---|<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |[EXTER=
NAL,1/3] Added SWTOOLS which is&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |needed=
 to build processor libs (DSPLIB,&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |2018-09-04|Jianzhong Xu||New|<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; |MATHLI=
B, etc) from source.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp; |<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &#43;------------------------------------------=
------------------------------&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Thanks,=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Jianzho=
ng<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; -----Or=
iginal Message-----<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; From: D=
mytriyenko, Denys<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Sent: W=
ednesday, September 12, 2018 3:13 PM<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; To: Sti=
ffler, Jacob<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Cc: Xu,=
 Jianzhong; meta-ti@yoctoproject.org<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Subject=
: Re: [meta-ti] [EXTERNAL] [PATCH 3/3 v2] Added DSPLIB<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; recipe to<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; build D=
SPLIB from source. Updated includes/ti-paths.inc for<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; MATHLIB and<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; DSPLIB.=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Jake,<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; I'll gi=
ve it a look - I assume you want the 3 most recent<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; patches, I don't<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; think v=
ersioning was consistent...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; Denys<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; On Tue,=
 Sep 11, 2018 at 09:17:49AM -0400, Jacob Stiffler wrote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; AC=
K<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; De=
nys,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; Ca=
n you apply these patches to the ti2018.03 branch?<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; Th=
ank you,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; Ja=
ke<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; On=
 9/6/2018 1:46 PM, Jianzhong Xu wrote:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;Signed-off-by: Jianzhong Xu &lt;xuj@ti.com&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;---<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;Change from previous version of patch<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;Corrected typo: MATHLIB_C674INSTALL_XXX should have been<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; MATHLIB=
_C674_INSTALL_XXX<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;---<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;---<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; recipes-ti/dsplib/dsplib-c64xp_git.bb&nbsp;&nbsp;&nbsp; |&nbsp; 9 =
&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; recipes-ti/dsplib/dsplib-c66x.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; | 30 ------------<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb |&nbsp; 9 ----<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; recipes-ti/dsplib/dsplib-c66x_git.bb&nbsp;&nbsp;&nbsp;&nbsp; | 10 =
&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; recipes-ti/dsplib/dsplib-c674x_git.bb&nbsp;&nbsp;&nbsp; |&nbsp; 9 =
&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; recipes-ti/dsplib/dsplib.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 79<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; recipes-ti/includes/ti-paths.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp; 8 &#43;&#43;&#43;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; 7 files changed, 114 insertions(&#43;), 40 deletions(-)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; create mode 100644 recipes-ti/dsplib/dsplib-c64xp_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; delete mode 100644 recipes-ti/dsplib/dsplib-c66x.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; delete mode 100644 recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; create mode 100644 recipes-ti/dsplib/dsplib-c66x_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; create mode 100644 recipes-ti/dsplib/dsplib-c674x_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; create mode 100644 recipes-ti/dsplib/dsplib.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;diff --git a/recipes-ti/dsplib/dsplib-c64xp_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recip=
es-ti/dsplib/dsplib-c64xp_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;new file mode 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;index 0000000..1038d44<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;--- /dev/null<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&#43;&#43; b/recipes-ti/dsplib/dsplib-c64xp_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -0,0 &#43;1,9 @@<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;MATHLIB_INSTALL_DIR =3D &quot;${MATHLIB_C64P_INSTALL_DIR}/packages&q=
uot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_INSTALL_DIR_RECIPE =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${DSPLIB_C64P_INSTALL_DIR_RECIPE}&quot;<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_INSTALL_DIR =3D &quot;${DSPLIB_C64P_INSTALL_DIR}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_BUILD_TARGET =3D &quot;c64Px&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DEPENDS =3D &quot;&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;include dsplib.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;diff --git a/recipes-ti/dsplib/dsplib-c66x.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recip=
es-ti/dsplib/dsplib-c66x.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;deleted file mode 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;index 7ff99c2..0000000<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;--- a/recipes-ti/dsplib/dsplib-c66x.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&#43;&#43; /dev/null<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -1,30 &#43;0,0 @@<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-DESCRIPTION =3D &quot;DSPLIB contains optimized general-purpose<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; signal-=
processing routines for TI DSPs&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-HOMEPAGE =3D &quot;<a href=3D"http://www.ti.com/tool/sprc265">http://www=
.ti.com/tool/sprc265</a>&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-SECTION =3D &quot;devel&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-require ../includes/ti-paths.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-require ../includes/ti-staging.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-require ../includes/ti-unpack.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-COMPATIBLE_MACHINE =3D &quot;omap-a15|keystone&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-SRC_URI =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;<=
a href=3D""></a>http://software-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;dl.ti.com/sdoemb/sdoemb_public_sw/d=
splib/${PV}/exports/${BINFILE};name=3Dd<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;splib&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-BINFILE =3D &quot;dsplib_c66x_${PV}_Linux.bin&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-TI_BIN_UNPK_ARGS =3D &quot;--mode silent --prefix ${S}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-TI_BIN_UNPK_CMDS =3D &quot;&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-do_install() {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-&nbsp;&nbsp;&nbsp; CP_ARGS=3D&quot;-Prf --preserve=3Dmode,timestamps --n=
o-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;preserve=3Downership&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-&nbsp;&nbsp;&nbsp; install -d ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ${D}${DSPLIB_C66_INSTALL_DIR_RECIPE}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-FILES_${PN}-dev &#43;=3D &quot;${DSPLIB_C66_INSTALL_DIR_RECIPE}&quot;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;diff --git a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recip=
es-ti/dsplib/dsplib-c66x_3.4.0.0.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;deleted file mode 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;index f1273f3..0000000<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;--- a/recipes-ti/dsplib/dsplib-c66x_3.4.0.0.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&#43;&#43; /dev/null<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -1,9 &#43;0,0 @@<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-require dsplib-c66x.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-PV =3D &quot;3_4_0_0&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-PR =3D &quot;r1&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-LIC_FILES_CHKSUM =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;&quot;<a href=3D""></a>file://packa=
ges/ti/dsplib/dsplib.h;beginline=3D9;endline=3D35;md5=3D17733f9e1100f8<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;a628512f47c4bf676a&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-SRC_URI[dsplib.md5sum] =3D &quot;66785604729c153dcad5282097dee8bf&quot;<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-SRC_URI[dsplib.sha256sum] =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&quot;e88909b6271ce6c4c62e2ab9=
0181b7adb36c7f28f5c52836668eb35888785ce8&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;diff --git a/recipes-ti/dsplib/dsplib-c66x_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recip=
es-ti/dsplib/dsplib-c66x_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;new file mode 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;index 0000000..cbc25d0<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;--- /dev/null<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&#43;&#43; b/recipes-ti/dsplib/dsplib-c66x_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -0,0 &#43;1,10 @@<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;MATHLIB_INSTALL_DIR =3D &quot;${MATHLIB_C66_INSTALL_DIR}/packages&qu=
ot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_INSTALL_DIR_RECIPE =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${DSPLIB_C66_INSTALL_DIR_RECIPE}&quot;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_INSTALL_DIR =3D &quot;${DSPLIB_C66_INSTALL_DIR}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_BUILD_TARGET =3D &quot;c66x&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DEPENDS =3D &quot;mathlib-c66x&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;include dsplib.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;diff --git a/recipes-ti/dsplib/dsplib-c674x_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recip=
es-ti/dsplib/dsplib-c674x_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;new file mode 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;index 0000000..07c6892<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;--- /dev/null<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&#43;&#43; b/recipes-ti/dsplib/dsplib-c674x_git.bb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -0,0 &#43;1,9 @@<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;MATHLIB_INSTALL_DIR =3D &quot;${MATHLIB_C674_INSTALL_DIR}/packages&q=
uot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_INSTALL_DIR_RECIPE =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${DSPLIB_C674_INSTALL_DIR_RECIPE}&quot;<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_INSTALL_DIR =3D &quot;${DSPLIB_C674_INSTALL_DIR}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_BUILD_TARGET =3D &quot;c674x&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DEPENDS =3D &quot;mathlib-c674x&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;include dsplib.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;diff --git a/recipes-ti/dsplib/dsplib.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recip=
es-ti/dsplib/dsplib.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;new file mode 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;index 0000000..66fe0fb<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;--- /dev/null<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&#43;&#43; b/recipes-ti/dsplib/dsplib.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -0,0 &#43;1,79 @@<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;SUMMARY =3D &quot;DSPLIB contains optimized signal processing<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; functions for<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; TI DSPs=
&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;HOMEPAGE =3D &quot;<a href=3D"http://git.ti.com/ep-processor-librari=
es/dsplib">http://git.ti.com/ep-processor-libraries/dsplib</a>&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;require ../includes/ti-paths.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;PV =3D &quot;3_4_0_1&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;PR =3D &quot;r0&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;COMPATIBLE_MACHINE =3D &quot;am57xx-evm|keystone|c66x|omapl1&quot;<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DEPENDS &#43;=3D &quot;ti-cgt6x-native \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-xdct=
ools-native \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-sysb=
ios \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; doxygen=
-native \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zip-nat=
ive \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swtools=
 &quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;SRC_URI =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;g=
it://git.ti.com/ep-processor-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;libraries/dsplib.git;protocol=
=3Dgit;branch=3Dmaster&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;SRCREV =3D &quot;bf5a51cba462c5cb03ed20a6a1bb1bd16c0683e1&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;LIC_FILES_CHKSUM =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;&gt;&gt;&quot;<a href=3D""></a>file://ti/ds=
plib/src/common/c66/lnk.cmd;beginline=3D1;endline=3D37;md5=3D0f0c9c4<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;d51d8af75419781591ace190b&quot=
;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export DSPLIB_WORK_DIR=3D&quot;${S}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export CGTOOLS_INSTALL_DIR&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export C64PCODEGENTOOL=3D&quot;${CGTOOLS_INSTALL_DIR}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export C674CODEGENTOOL=3D&quot;${CGTOOLS_INSTALL_DIR}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export C66CODEGENTOOL =3D&quot;${CGTOOLS_INSTALL_DIR}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export SWTOOLS_PATH =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${SWTOOLS_INSTALL_DIR}/ti/mas/swtools&quo=
t;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export XDCBUILDCFG=3D&quot;${SWTOOLS_PATH}/config.bld&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export INCDIR=3D&quot;${MATHLIB_INSTALL_DIR}/&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;PATH_append =3D &quot;:${XDC_INSTALL_DIR}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&#43;XDCPATH.=3D&quot;${XD=
CCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBI<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;OS_INSTALL_DIR}/packages;&quot=
;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&#43;XDCPATH.=3D&quot;${SW=
TOOLS_INSTALL_DIR};${MATHLIB_INSTALL_DIR};${DSPLIB_<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;WORK_DIR};&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export XDCPATH<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;DSPLIB_PACKAGE_NAME =3D &quot;dsplib_${DSPLIB_BUILD_TARGET}_${PV}&qu=
ot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;do_compile() {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd ${DSPLIB_WORK_DIR}/ti/dsplib=
;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xdc XDCARGS=3D&quot;${DSPLIB_BU=
ILD_TARGET} bundle&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; XDCOPTIONS=3D&quot;-<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;v&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;do_install() {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${DSPLIB_INSTALL=
_DIR_RECIPE}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; find -name &quot;${DSPLIB_PACKA=
GE_NAME}.zip&quot; -exec unzip<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; -o {} -d<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ${D}${D=
SPLIB_INSTALL_DIR_RECIPE} \;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${D}${DSPLIB_INSTALL_DIR_REC=
IPE}/dsplib/*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ${D}${D=
SPLIB_INSTALL_DIR_RECIPE}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${D}${DSPLIB_INSTALL_DIR_REC=
IPE}/dsplib/.metadata<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ${D}${D=
SPLIB_INSTALL_DIR_RECIPE}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -r ${D}${DSPLIB_INSTALL_DIR_=
RECIPE}/dsplib<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;inherit deploy<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;addtask deploy before do_build after do_install<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;do_deploy() {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${DEPLOYDIR}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # zip up files in ${D}${DSPLIB_=
INSTALL_DIR_RECIPE}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # and place the zip file in ${D=
EPLOYDIR}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir ./${DSPLIB_PACKAGE_NAME}<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${D}${DSPLIB_INSTALL_DIR_=
RECIPE}/*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ./${DSP=
LIB_PACKAGE_NAME}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${D}${DSPLIB_INSTALL_DIR_=
RECIPE}/.metadata<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ./${DSP=
LIB_PACKAGE_NAME}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; zip -9 -y -r -q<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; ./${DSP=
LIB_PACKAGE_NAME}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm -r ./${DSPLIB_PACKAGE_NAME}<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;FILES_${PN}-dev &#43;=3D &quot;${DSPLIB_INSTALL_DIR_RECIPE}&quot;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;INSANE_SKIP_${PN}-dev =3D &quot;arch&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;diff --git a/recipes-ti/includes/ti-paths.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; b/recip=
es-ti/includes/ti-paths.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;index 4f99d5e..8740b6a 100644<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;--- a/recipes-ti/includes/ti-paths.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;&#43;&#43; b/recipes-ti/includes/ti-paths.inc<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -17,6 &#43;17,7 @@ export DMAI_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-dmai-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export DSP_BENCHMARK_INSTALL_DIR_RECIPE =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-dsp-benchmark-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export DSPLIB_C64P_INSTALL_DIR_RECIPE =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-dsplib-c64p-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export DSPLIB_C674_INSTALL_DIR_RECIPE =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-dsplib-c674x-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export DSPLIB_C66_INSTALL_DIR_RECIPE&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-dsplib-c66x-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export DSPLIB_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-dsplib-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export DVSDK_DEMOS_INSTALL_DIR_RECIPE=3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-dvsdk-demos-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export DVTB_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-dvtb-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -39,6 &#43;40,7 @@ export OSAL_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-osal-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export RTFS_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-rtfs-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export SYSBIOS_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-sysbios-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export SYSLINK_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-syslink-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export SWTOOLS_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-swtools-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export UIA_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-uia-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export VICPLIB_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-vicplib-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export XDAIS_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-xdais-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -48,8 &#43;50,8 @@ export OSAL_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-osal-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export M4_TOOLCHAIN_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-cgt-arm&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export GCC_ARM_NONE_TOOLCHAIN_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/gcc-arm-none-eabi&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export TI_CGT_PRU_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/cgt-pru&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;-export DSPLIB_C66_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-dsplib-c66x-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export MATHLIB_C66_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp; =3D<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-mathlib-c66x-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export MATHLIB_C674_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-mathlib-c674x-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export IMGLIB_C66_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-imglib-c66x-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export VLIB_C66_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{installdir}/ti-vlib-c66x-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export CG_XML_INSTALL_DIR_RECIPE&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &quot;${installdir}/ti-cg-xml-tree&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;@@ -95,7 &#43;97,11 @@ export OSAL_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export M4_TOOLCHAIN_INSTALL_DIR&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export GCC_ARM_NONE_TOOLCHAIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export TI_CGT_PRU_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export SWTOOLS_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_TARGET}${SWTOOLS_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export DSPLIB_C64P_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_TARGET}${DSPLIB_C64P_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export DSPLIB_C674_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_TARGET}${DSPLIB_C674_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export DSPLIB_C66_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&#43;export MATHLIB_C674_INSTALL_DIR&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_TARGET}${MATHLIB_C674_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export MATHLIB_C66_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_TARGET}${MATHLIB_C66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export IMGLIB_C66_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_TARGET}${IMGLIB_C66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; &g=
t;&nbsp; export VLIB_C66_INSTALL_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =3D<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &quot;$=
{STAGING_DIR_TARGET}${VLIB_C66_INSTALL_DIR_RECIPE}&quot;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt;<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; --=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; __=
_____________________________________________<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; me=
ta-ti mailing list<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; me=
ta-ti@yoctoproject.org<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt; &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; &gt; <a=
 href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoc=
toproject.org/listinfo/meta-ti</a><br>
&gt; &gt;&nbsp;&nbsp;&nbsp; &gt;<br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; meta-ti@yoctoproject.org<br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_3f52cb253fa74cc8a9d370d21b579996ticom_--
