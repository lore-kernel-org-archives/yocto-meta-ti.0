Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56D99E00B23; Wed,  3 Oct 2018 10:31:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 749DFE00A9B
	for <meta-ti@yoctoproject.org>; Wed,  3 Oct 2018 10:31:41 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w93HVe95127318
	for <meta-ti@yoctoproject.org>; Wed, 3 Oct 2018 12:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538587900;
	bh=U2aeOmYxe6RV0g9vn+ubjfVc6D7JST8Hr0WshDBxaV0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=S9HtGlEXK3ipuq8LkU+HUZYBsQSsNFD+hJRkE2XqYWPd5NH6KUWRTCQUaWJYhOZRn
	LqsH+vHYhfnuqVUQOgETti1+D129CjXiDv4Vj6pCOEwlCxbQYd7+qXMJkA0v8jVqnp
	yoPRQVpfc28sdJpcwwciMyL2Rmgar4mpsdLi4HIg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93HVebV002329
	for <meta-ti@yoctoproject.org>; Wed, 3 Oct 2018 12:31:40 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 3 Oct 2018 12:31:40 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 3 Oct 2018 12:31:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93HVeWs004174;
	Wed, 3 Oct 2018 12:31:40 -0500
Date: Wed, 3 Oct 2018 13:31:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20181003173140.GH31613@beryl>
References: <1538480167-12075-1-git-send-email-j-stiffler@ti.com>
	<d6478c27-3a89-1343-935d-32da5e16618d@ti.com>
	<9dab7c3b-95ab-4f32-272f-5207e6eea46f@ti.com>
	<20181002191703.GG22392@beryl>
	<372d4bca-aac2-9a94-034c-9407a42a014f@ti.com>
	<20181003171739.GG31613@beryl>
	<fdd3d29b-d83d-943f-2f1d-aacef25432c1@ti.com>
MIME-Version: 1.0
In-Reply-To: <fdd3d29b-d83d-943f-2f1d-aacef25432c1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [ti2018.03/rocko/master][PATCH] ti-cgt-arm: prevent build of existing library
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
X-List-Received-Date: Wed, 03 Oct 2018 17:31:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 03, 2018 at 01:29:45PM -0400, Jacob Stiffler wrote:
> 
> On 10/3/2018 1:17 PM, Denys Dmytriyenko wrote:
> >On Tue, Oct 02, 2018 at 03:19:00PM -0400, Jacob Stiffler wrote:
> >>On 10/2/2018 3:17 PM, Denys Dmytriyenko wrote:
> >>>I believe this mklib call was added recently due to a race condition and it
> >>>was not built before it was needed - any chance to fix the race properly
> >>>instead of all the workarounds?
> >>
> >>Not sure about fixing the race, but I just found out that there are plans to
> >>have that library available in the default package.
> >So, in the meantime, do we need to merge this workaround?
> 
> 
> Yes. This will fix the failure when do_compile is re-run on existing
> sources.
> 
> 
> Now I think it makes more sense to try to remove the library in
> do_configure, similar to how base.bbclass calls "make clean" if the state of
> the dependencies change.

Sounds good, let's "clean" the library before rebuild.


> >>>On Tue, Oct 02, 2018 at 02:38:00PM -0400, Jacob Stiffler wrote:
> >>>>On 10/2/2018 8:29 AM, Jacob Stiffler wrote:
> >>>>>I recently ran into this error, so I sent this out in a hurry to get it
> >>>>>fixed. But now I am thinking that it may be better to remove this library
> >>>>>in do_configure, similar to base class calls make clean
> >>>>>
> >>>>After thinking about it some more, I would prefer to remove the library in
> >>>>do_configure() to be safe in the unlikely scenario that there are
> >>>>dependencies involved.
> >>>>
> >>>>
> >>>>As it is now, this is hardcoded to a single library. While I am making
> >>>>changes, should I enhance this to take a list of libraries so that it can be
> >>>>easily extended in the future?
> >>>>
> >>>>
> >>>>>Any suggestions?
> >>>>>
> >>>>>
> >>>>>Thanks,
> >>>>>
> >>>>>Jake
> >>>>>
> >>>>>On 10/2/2018 7:36 AM, Jacob Stiffler wrote:
> >>>>>>* Prevent a potential error as mklib will return an error if the
> >>>>>>   library already exists.
> >>>>>>* The error encountered is the following:
> >>>>>>
> >>>>>>| >> ERROR: mklib: destination library .../work/x86_64-linux/ti-cgt-arm-native/16.9.2-r1/ti-cgt-arm-16.9.2/ti-cgt-arm_16.9.2.LTS/lib/rtsv7R4_A_le_v3D16_eabi.lib already exists
> >>>>>>| WARNING: .../work/x86_64-linux/ti-cgt-arm-native/16.9.2-r1/temp/run.do_compile.13758:1 exit 1 from 'lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib'
> >>>>>>
> >>>>>>Signed-off-by: Jacob Stiffler<j-stiffler@ti.com>
> >>>>>>---
> >>>>>>  recipes-ti/devtools/ti-cgt-arm.inc | 10 +++++++---
> >>>>>>  1 file changed, 7 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>>diff --git a/recipes-ti/devtools/ti-cgt-arm.inc b/recipes-ti/devtools/ti-cgt-arm.inc
> >>>>>>index b9f7566..e83973b 100644
> >>>>>>--- a/recipes-ti/devtools/ti-cgt-arm.inc
> >>>>>>+++ b/recipes-ti/devtools/ti-cgt-arm.inc
> >>>>>>@@ -9,7 +9,7 @@ require recipes-ti/includes/ti-paths.inc
> >>>>>>  S = "${WORKDIR}/ti-cgt-arm-${PV}"
> >>>>>>-PR = "r1"
> >>>>>>+PR = "r2"
> >>>>>>  SRC_URI ="http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
> >>>>>>@@ -19,8 +19,12 @@ TI_BIN_UNPK_CMDS = ""
> >>>>>>  do_compile_append() {
> >>>>>>      cd ${S}/ti-cgt-arm_${PV}.LTS
> >>>>>>-    export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
> >>>>>>-    lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib
> >>>>>>+
> >>>>>>+    if [ ! -f "./lib/rtsv7R4_A_le_v3D16_eabi.lib" ]
> >>>>>>+    then
> >>>>>>+        export PATH=${PATH}:${S}/ti-cgt-arm_${PV}.LTS/bin
> >>>>>>+        lib/mklib --pattern=rtsv7R4_A_le_v3D16_eabi.lib
> >>>>>>+    fi
> >>>>>>  }
> >>>>>>  do_install() {
> >>>>-- 
> >>>>_______________________________________________
> >>>>meta-ti mailing list
> >>>>meta-ti@yoctoproject.org
> >>>>https://lists.yoctoproject.org/listinfo/meta-ti

