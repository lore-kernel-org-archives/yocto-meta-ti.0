Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE43CE00DA1; Mon,  8 Feb 2016 09:31:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DF35E00DA4
	for <meta-ti@yoctoproject.org>; Mon,  8 Feb 2016 09:30:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EFE9E52AC4; Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160208173055.EFE9E52AC4@arago-project.org>
Date: Mon,  8 Feb 2016 17:30:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ipc-rtos: also install IPU M4 images
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
X-List-Received-Date: Mon, 08 Feb 2016 17:31:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fff240c234cd7f8cb73289dc59bf504478586ad4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fff240c234cd7f8cb73289dc59bf504478586ad4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Feb  8 00:52:40 2016 +0000

ti-ipc-rtos: also install IPU M4 images

TODO: do we need to preserve naming/hierarchy for multiple DSP/IPU instances?

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 5fb83d0..eff1001 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,7 +2,7 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 require ti-ipc.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 DEPENDS = "ti-xdctools ti-sysbios"
 DEPENDS_append_keystone = " ti-cgt6x-native \
@@ -57,4 +57,5 @@ do_install() {
 
     install -d ${D}${base_libdir}/firmware
     find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {} ${D}${base_libdir}/firmware/
+    find . -name "*.xem4" -type f | xargs -I {} install -m 0644 {} ${D}${base_libdir}/firmware/
 }


