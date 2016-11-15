Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A17D5E00C46; Tue, 15 Nov 2016 11:32:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25B37E00C20
	for <meta-ti@yoctoproject.org>; Tue, 15 Nov 2016 11:32:46 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id F12CD52AAD; Tue, 15 Nov 2016 19:32:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161115193245.F12CD52AAD@arago-project.org>
Date: Tue, 15 Nov 2016 19:32:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ipc: update to include -pthread fixes
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
X-List-Received-Date: Tue, 15 Nov 2016 19:32:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c5162b67b26bc46b3fc6e773f3afa70d7aee7a53
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c5162b67b26bc46b3fc6e773f3afa70d7aee7a53

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Nov 15 03:55:21 2016 +0000

ti-ipc: update to include -pthread fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 869dada..488e0fc 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -9,7 +9,7 @@ TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "ipc-next"
 
 #Corresponds to 3.44.00.00
-TI_IPC_SRCREV = "e6f64d4b04f1c929366c922a2e5a4728fbb4d919"
+TI_IPC_SRCREV = "a1852fc8b254ed207bd1c1c88f5b362c9b6cc454"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
@@ -17,7 +17,7 @@ SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
 PV = "3.44.00.00"
-INC_PR = "r0"
+INC_PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 


