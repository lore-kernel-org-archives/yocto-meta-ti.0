Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E16C2E00BD0; Tue, 15 Dec 2015 08:59:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23D50E007D3
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:59:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5D3EC529FC; Tue, 15 Dec 2015 16:59:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151215165952.5D3EC529FC@arago-project.org>
Date: Tue, 15 Dec 2015 16:59:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Update branch and information for IPC GA release
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
X-List-Received-Date: Tue, 15 Dec 2015 16:59:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 89a92575f67a1f801e3138774f8d51a24ab79203
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=89a92575f67a1f801e3138774f8d51a24ab79203

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Dec 15 17:56:10 2015 +0000

ti-ipc: Update branch and information for IPC GA release

- Commit id is perserved from previous eng version

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 4cdb25c..94a1657 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -4,15 +4,15 @@ HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
 
-BRANCH = "ipc-next"
+BRANCH = "3.41"
 
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
 
-#Corresponds to 3.41.00.07_eng
+#Corresponds to 3.41.00.08
 SRCREV = "7370abce2e3f2a09fd4b057fbbf9e7d3d029c0df"
 
 S = "${WORKDIR}/git"
-PV = "3.41.00.07"
+PV = "3.41.00.08"
 INC_PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"


