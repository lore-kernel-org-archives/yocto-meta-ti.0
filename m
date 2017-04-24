Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E6B6E00A9B; Mon, 24 Apr 2017 10:36:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [198.47.27.77 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7217EE00867
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 10:36:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OHa1QK024669
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 12:36:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493055361;
	bh=B3k0981MhmzxumflYKj57J8Z8bBrTfxRWzwUqxeuBsA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fKjViYAOydZ1tz46565LJXzXgncdbjp/jCOFE99hF9u5KjrvFiXt7Oc3y+w7Ytf15
	sh2z8yCw5uc5YyfpmDNW8x41LrZXiDnvWMizzsjFVwF++tFpcJGNFFcAq3s6ypekX5
	UaUujq9RNv380BSbCkIhIa6QNi2qqEUelsBb5nvY=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OHa1Il003430
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 12:36:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 12:36:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OHa0kC023583;
	Mon, 24 Apr 2017 12:36:00 -0500
Date: Mon, 24 Apr 2017 13:36:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170424173559.GC24846@edge>
References: <1492784105-58653-1-git-send-email-a0393906@ti.com>
	<bc8f561f-870e-c493-1696-ab2910b091ce@ti.com>
	<58FDF89D.3000509@ti.com>
MIME-Version: 1.0
In-Reply-To: <58FDF89D.3000509@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty PATCH v2 1/3] ti-cgt-arm: add recipe for 16.9.2
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
X-List-Received-Date: Mon, 24 Apr 2017 17:36:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 24, 2017 at 06:37:41PM +0530, Karthik Ramanan wrote:
> Jake, Denys - some questions for you.
> 
> >> +PV = "16.9.2"
> > Would it be better to have this in the recipe filename? I'm not
> sure if there is a preference.
> Denys, what is the recommendation? I see both approaches, I can
> rework and submit if the PV should be included in the filename.

Depends on how often you plan to update the recipe and whether you will have 
between-releases snapshots. That's usually the case with git-based components. 
In case of tarball or binary-installer components, the convention is to use 
the version in the filename.


> >> +BBCLASSEXTEND = "native nativesdk"
> > It appears that there is not support for the "target" class as the
> installer is for the x86 architecture.
> Just to be clear, would it be fine to just remove the nativesdk?

Are there plans to have ARM installer? If not, then "target" recipe with 
BBCLASSEXTEND won't work - you just need to do a -native recipe directly.

-- 
Denys


> On 21-Apr-17 8:02 PM, Jacob Stiffler wrote:
> >Karthik,
> >
> >A couple concerns below.
> >
> >Thanks,
> >
> >Jake
> >
> >
> >On 4/21/2017 10:15 AM, Karthik Ramanan wrote:
> >>Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >>---
> >>  recipes-ti/devtools/ti-cgt-arm.bb  |  8 ++++++++
> >>  recipes-ti/devtools/ti-cgt-arm.inc | 36
> >>++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 44 insertions(+)
> >>  create mode 100644 recipes-ti/devtools/ti-cgt-arm.bb
> >>  create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc
> >>
> >>diff --git a/recipes-ti/devtools/ti-cgt-arm.bb
> >>b/recipes-ti/devtools/ti-cgt-arm.bb
> >>new file mode 100644
> >>index 0000000..82c1903
> >>--- /dev/null
> >>+++ b/recipes-ti/devtools/ti-cgt-arm.bb
> >>@@ -0,0 +1,8 @@
> >>+include ti-cgt-arm.inc
> >>+
> >>+LIC_FILES_CHKSUM = "file://${PN}_${PV}.LTS/README.txt;md5=c32eadd03472353c042a8a7c4568438b"
> >>+
> >>+PV = "16.9.2"
> >
> >Would it be better to have this in the recipe filename? I'm not
> >sure if there is a preference.
> >
> >>+
> >>+BINFILE_MD5 = "7b73e51e9548a4a0bf3923a336b1a974"
> >>+BINFILE_SHA256 =
> >>"d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
> >>diff --git a/recipes-ti/devtools/ti-cgt-arm.inc
> >>b/recipes-ti/devtools/ti-cgt-arm.inc
> >>new file mode 100644
> >>index 0000000..3897b2e
> >>--- /dev/null
> >>+++ b/recipes-ti/devtools/ti-cgt-arm.inc
> >>@@ -0,0 +1,36 @@
> >>+SUMMARY= "TI ARM Code Generation Tools"
> >>+HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> >>+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) &
> >>BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT &
> >>BSD-2-Clause & PD & BSD-4-Clause"
> >>+
> >>+require recipes-ti/includes/ti-unpack.inc
> >>+require recipes-ti/includes/ti-staging.inc
> >>+require recipes-ti/includes/ti-paths.inc
> >>+
> >>+S = "${WORKDIR}/ti-cgt-arm-${PV}"
> >>+
> >>+SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
> >>+
> >>+BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> >>+TI_BIN_UNPK_ARGS = "--prefix ${S}"
> >>+TI_BIN_UNPK_CMDS = ""
> >>+
> >>+do_install() {
> >>+    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> >>+    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
> >>+}
> >>+
> >>+SRC_URI[cgt_arm_installer.md5sum] = "${BINFILE_MD5}"
> >>+SRC_URI[cgt_arm_installer.sha256sum] = "${BINFILE_SHA256}"
> >>+
> >>+BINFILE_NAME = "cgt_arm_installer"
> >>+BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
> >>+
> >>+FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
> >>+
> >>+BBCLASSEXTEND = "native nativesdk"
> >
> >It appears that there is not support for the "target" class as the
> >installer is for the x86 architecture.
> >
> >>+
> >>+INHIBIT_PACKAGE_STRIP = "1"
> >>+INHIBIT_SYSROOT_STRIP = "1"
> >>+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >>+
> >>+INSANE_SKIP_${PN} += "arch staticdev"
> >
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

