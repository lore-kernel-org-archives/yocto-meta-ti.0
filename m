Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF503E00985; Mon, 30 Nov 2015 13:46:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1CD5E00855
	for <meta-ti@yoctoproject.org>; Mon, 30 Nov 2015 13:46:21 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8C39B52A44; Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151130214620.8C39B52A44@arago-project.org>
Date: Mon, 30 Nov 2015 21:46:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : mpm-transport: fix syntax for appending dependencies
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
X-List-Received-Date: Mon, 30 Nov 2015 21:46:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 122098f072d32be9aa8377c9b8c28722de75ce40
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=122098f072d32be9aa8377c9b8c28722de75ce40

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Dec  1 00:18:42 2015 +0000

mpm-transport: fix syntax for appending dependencies

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index cc211ce..7d86196 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=122b7757f366f3f6fe11988715258fc9"
 COMPATIBLE_MACHINE = "keystone"
 
 DEPENDS = "common-csl-ip edma3-lld mmap-lld cmem rm-lld qmss-lld cppi-lld uio-module-drv syslog-ng"
-DEPENDS_append_k2hk-evm += "hyplnk-lld srio-lld"
-DEPENDS_append_k2e-evm += "hyplnk-lld"
+DEPENDS_append_k2hk-evm = " hyplnk-lld srio-lld"
+DEPENDS_append_k2e-evm = " hyplnk-lld"
 
 RDEPENDS_${PN} = "syslog-ng"
 
@@ -19,7 +19,7 @@ BRANCH = "linux41"
 SRCREV = "892e93238b7f9f480ddceb7ade042026a4d178bd"
 
 PV = "2.0.0.0"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"


