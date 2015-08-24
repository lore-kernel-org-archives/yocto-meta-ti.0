Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97E9CE00BBC; Mon, 24 Aug 2015 10:56:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F21F0E00927
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 10:56:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7OHuW1T010148
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:56:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7OHuWZ4016939
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:56:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 24 Aug 2015 12:56:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7OHuWcY030133	for
	<meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 12:56:32 -0500
Resent-From: Denys Dmytriyenko <denys@ti.com>
Resent-Date: Mon, 24 Aug 2015 13:56:16 -0400
Resent-Message-ID: <20150824175616.GT6542@edge>
Resent-To: <meta-ti@yoctoproject.org>
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 6 Aug 2015 13:56:34 -0500
Received: from bangubntigfx (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76IuX50030404;
	Thu, 6 Aug 2015 13:56:33 -0500
Received: from anand by bangubntigfx with local (Exim 4.72)	(envelope-from
	<anand@bangubntigfx>)	id 1ZNQE8-0000Ki-T8;
	Fri, 07 Aug 2015 00:19:16 +0530
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <denys@ti.com>, <meta-ti@yoctoproject.org>
Message-ID: <1438886878-1165-3-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438886878-1165-1-git-send-email-anandb@ti.com>
References: <1438886878-1165-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] omap5-sgx-ddk-um-linux: update SGX user mode binaries to latest version
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
Date: Mon, 24 Aug 2015 17:56:36 -0000
X-Original-Date: Fri, 7 Aug 2015 00:17:58 +0530
X-List-Received-Date: Mon, 24 Aug 2015 17:56:36 -0000
Content-Type: text/plain

* Fix for SGX HW recovery issue when Weston EGL clients are killed

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index 2f3f6aa..3b17a0d 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=360d293df455e4f2d363bb4014a49603"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git"
-SRCREV = "b6e57ccf36fc8c36d988246bc7510f0dec42d991"
+BRANCH = "omap5/next"
 
-PR = "r7"
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
+SRCREV = "4ac0dba02717a7d7196f0b38b1fd6366f5b04ca7"
+
+PR = "r8"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"
-- 
1.7.9.5


