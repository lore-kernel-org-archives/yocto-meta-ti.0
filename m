Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21FA5E00BBC; Mon, 24 Aug 2015 11:36:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6620CE00BD5
	for <meta-ti@yoctoproject.org>; Mon, 24 Aug 2015 11:36:38 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D65E652AB9; Mon, 24 Aug 2015 18:36:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150824183637.D65E652AB9@arago-project.org>
Date: Mon, 24 Aug 2015 18:36:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : omap5-sgx-ddk-um-linux: update SGX user mode binaries to latest version
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
X-List-Received-Date: Mon, 24 Aug 2015 18:36:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: ae7e18edf1fc04258c862353ff1b894da19deb2b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ae7e18edf1fc04258c862353ff1b894da19deb2b

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Fri Aug  7 00:47:58 2015 +0000

omap5-sgx-ddk-um-linux: update SGX user mode binaries to latest version

* Fix for SGX HW recovery issue when Weston EGL clients are killed

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index 83dfb1d..6babb57 100644
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


