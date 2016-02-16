Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D8D5E00AE4; Tue, 16 Feb 2016 12:59:31 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0031E00AAF
	for <meta-ti@yoctoproject.org>; Tue, 16 Feb 2016 12:59:28 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 954FB52ACB; Tue, 16 Feb 2016 20:59:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160216205928.954FB52ACB@arago-project.org>
Date: Tue, 16 Feb 2016 20:59:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-ipc: Extract SRC info into unique variables
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
X-List-Received-Date: Tue, 16 Feb 2016 20:59:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 12f50712ee609f495693fb017f6c7c70d4484ea0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=12f50712ee609f495693fb017f6c7c70d4484ea0

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Feb 17 01:05:55 2016 +0000

ti-ipc: Extract SRC info into unique variables

* This makes it easier to override the source revision for all ti-ipc
  recipes

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc.inc |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index f3b1bff..a7e1ed9 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -4,16 +4,20 @@ HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
 
-BRANCH = "ipc-next"
-
-SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
+TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
+TI_IPC_GIT_PROTOCOL = "git"
+TI_IPC_GIT_BRANCH = "ipc-next"
 
 #Corresponds to 3.42.00.00_eng
-SRCREV = "2b47e35ed72170e4e56906fb9ab93dd9ef385a38"
+TI_IPC_SRCREV = "2b47e35ed72170e4e56906fb9ab93dd9ef385a38"
+
+BRANCH = "${TI_IPC_GIT_BRANCH}"
+SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
 PV = "3.42.00.00"
-INC_PR = "r0"
+INC_PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 


