Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4603E003DB; Fri, 20 Jan 2017 14:42:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0205FE003DB
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2017 14:42:07 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CFAEA529CD; Fri, 20 Jan 2017 22:42:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170120224205.CFAEA529CD@arago-project.org>
Date: Fri, 20 Jan 2017 22:42:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : beaglebone: add check for potential conflicts with meta-yocto-bsp
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
X-List-Received-Date: Fri, 20 Jan 2017 22:42:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 71130d99dbaed72cc05f5587f779ccbf7572a18a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=71130d99dbaed72cc05f5587f779ccbf7572a18a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jan 19 06:24:20 2017 +0000

beaglebone: add check for potential conflicts with meta-yocto-bsp

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/beaglebone.conf        |    1 +
 conf/machine/include/beaglebone.inc |   12 ++++++++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index bf3d91e..e168560 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
 
 require conf/machine/include/ti33x.inc
+require conf/machine/include/beaglebone.inc
 
 # Only has DVI connector for external screen
 MACHINE_GUI_CLASS = "bigscreen"
diff --git a/conf/machine/include/beaglebone.inc b/conf/machine/include/beaglebone.inc
new file mode 100644
index 0000000..f76ad3d
--- /dev/null
+++ b/conf/machine/include/beaglebone.inc
@@ -0,0 +1,12 @@
+python () {
+    layers = bb.data.getVar("BBFILE_COLLECTIONS", d, 1)
+    if not layers:
+        return
+    if "yoctobsp" in layers:
+        bb.fatal("\nmeta-yocto-bsp has been detected in bblayers.conf, which provides basic reference BSP for beaglebone platform. " \
+                "\nSince meta-ti provides official comprehensive BSP for TI SoCs, including beaglebone, there could be potential conflicts " \
+                "\nbetween beaglebone machine definitions available in meta-yocto-bsp and meta-ti layers. It is recommended to remove " \
+                "\nor disable meta-yocto-bsp in bblayers.conf, when using meta-ti and building for beaglebone platform. Alternatively, " \
+                "\nit is possible to build for am335x-evm with meta-ti, which is a more generic platform for Sitara AM335x SoC and " \
+                "\nalso covers beaglebone variants.")
+}


