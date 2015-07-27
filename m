Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97E97E009B8; Mon, 27 Jul 2015 06:52:00 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79A11E00973
	for <meta-ti@yoctoproject.org>; Mon, 27 Jul 2015 06:51:56 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D1C7052A21; Mon, 27 Jul 2015 13:51:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150727135155.D1C7052A21@arago-project.org>
Date: Mon, 27 Jul 2015 13:51:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging 4.1: update to latest 4.1. 3 and more staging work
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
X-List-Received-Date: Mon, 27 Jul 2015 13:52:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 5e1b82bf8f41666e7a35ad58dc8601f3cf979e47
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5e1b82bf8f41666e7a35ad58dc8601f3cf979e47

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jul 23 00:36:14 2015 +0000

linux-ti-staging 4.1: update to latest 4.1.3 and more staging work

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index e35d9b4..f736fb5 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -47,11 +47,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.1.y"
 
-SRCREV = "cc5a77a85f37210fd33bad5a313914a070e893f1"
-PV = "4.1.1+git${SRCPV}"
+SRCREV = "c969194276d42fed25b70f89fe23e68978007107"
+PV = "4.1.3+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


