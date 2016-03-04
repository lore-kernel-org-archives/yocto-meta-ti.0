Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4BC12E00CD7; Fri,  4 Mar 2016 09:07:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A166E00CD9
	for <meta-ti@yoctoproject.org>; Fri,  4 Mar 2016 09:07:50 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1814752AC6; Fri,  4 Mar 2016 17:07:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160304170750.1814752AC6@arago-project.org>
Date: Fri,  4 Mar 2016 17:07:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: e-ruei1@ti.com : omap5-sgx-ddk-um-linux: Add INSANE_SKIP list for plugins
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
X-List-Received-Date: Fri, 04 Mar 2016 17:07:52 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: e3b63eeb7a8b3a5d5c0712c23ce57023e7c2ee12
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e3b63eeb7a8b3a5d5c0712c23ce57023e7c2ee12

Author: e-ruei1@ti.com <e-ruei1@ti.com>
Date:   Fri Mar  4 21:21:39 2016 +0000

omap5-sgx-ddk-um-linux: Add INSANE_SKIP list for plugins

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
index 3ee0ac7..3a239c0 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
@@ -19,7 +19,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r6"
+PR = "r7"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
 
 RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
@@ -50,5 +50,6 @@ ALLOW_EMPTY_${PN}-plugins = "1"
 INHIBIT_PACKAGE_STRIP = "1"
 
 INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
+INSANE_SKIP_${PN}-plugins = "dev-so"
 
 CLEANBROKEN = "1"


