Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1F2EE00F17; Wed, 11 May 2016 17:45:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D009E00C65
	for <meta-ti@yoctoproject.org>; Wed, 11 May 2016 17:45:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3B38152A80; Thu, 12 May 2016 00:45:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160512004504.3B38152A80@arago-project.org>
Date: Thu, 12 May 2016 00:45:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : omap5-sgx-ddk-um-linux: Add DEPENDS based on REDEPENDS
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
X-List-Received-Date: Thu, 12 May 2016 00:45:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 85810547e3411fb2516600ccfa0c3419b6368742
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=85810547e3411fb2516600ccfa0c3419b6368742

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon May  9 22:33:50 2016 +0000

omap5-sgx-ddk-um-linux: Add DEPENDS based on REDEPENDS

* The omap5-sgx-ddk-um-linux recipe installs pre-built libraries
* Because of this, the dependencies are given as RDEPENDS as they are
  not needed for building the recipe
* However, this may break recipes which depend on
  omap5-sgx-ddk-um-linux, as the omap5-sgx-ddk-um-linux dependencies
  may not yet be populated in the sysroot.
* This resolves the break in the dependency chain by translating the
  RDEPENDS into a list of DEPENDS

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
index a79c61f..a4a00b9 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
@@ -19,9 +19,10 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r8"
+PR = "r9"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
+DEPENDS += "libdrm udev libgbm wayland libffi"
 RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
 
 RREPLACES_${PN} = "libegl libgles1 libgles2"


