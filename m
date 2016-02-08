Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2CABE00C3E; Mon,  8 Feb 2016 12:30:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEA51E00C49
	for <meta-ti@yoctoproject.org>; Mon,  8 Feb 2016 12:30:45 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3A6DC52A5A; Mon,  8 Feb 2016 20:30:43 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160208203043.3A6DC52A5A@arago-project.org>
Date: Mon,  8 Feb 2016 20:30:43 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jason Reeder : pru-icss: update RPMsg folder names for am437x
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
X-List-Received-Date: Mon, 08 Feb 2016 20:30:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 8a83256f3d12724216453eee438e9a4a1b8acd7a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8a83256f3d12724216453eee438e9a4a1b8acd7a

Author: Jason Reeder <jreeder@ti.com>
Date:   Tue Feb  9 02:02:14 2016 +0000

pru-icss: update RPMsg folder names for am437x

Previously, only examples for PRUSS1 were provided for the
am437x device. A patch now exists to load firmwares into
PRUSS0 instead of PRUSS1. This caused a naming convention
change in the am437x RPMsg examples. This commit updates
the recipe to use the new folder naming convention.

Signed-off-by: Jason Reeder <jreeder@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/pru/pru-icss_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 30bb3c3..9061e8c 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-pa
 SRCREV = "c21ff82cf0a8864a66505be88be1d579a66a983a"
 
 PV = "4.0.1"
-PR = "r1"
+PR = "r2"
 
 require recipes-ti/includes/ti-paths.inc
 
@@ -64,7 +64,7 @@ do_install_append_ti33x() {
 do_install_append_ti43x() {
     for i in 0 1
     do
-        install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
+        install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt1_${i}/gen/PRU_RPMsg_Echo_Interrupt1_${i}.out \
                         ${D}/lib/firmware/pru
     done
 }
@@ -122,8 +122,8 @@ ALTERNATIVE_pru-icss-rpmsg-echo = "${PRU_ICSS_ALTERNATIVES}"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
 
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
-ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
 
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"


