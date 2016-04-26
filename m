Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD69BE00D42; Tue, 26 Apr 2016 11:56:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDC75E00D29
	for <meta-ti@yoctoproject.org>; Tue, 26 Apr 2016 11:56:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EEDD3529A5; Tue, 26 Apr 2016 18:55:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160426185559.EEDD3529A5@arago-project.org>
Date: Tue, 26 Apr 2016 18:55:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ipc-transport: Clean up recipe
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
X-List-Received-Date: Tue, 26 Apr 2016 18:56:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: aa2659a8b7cfd1b203de1c4e4c55a7d148059a3e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aa2659a8b7cfd1b203de1c4e4c55a7d148059a3e

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Apr 21 02:19:42 2016 +0000

ipc-transport: Clean up recipe

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ipc-transport-qmss.inc |    4 +++-
 recipes-ti/ipc/ipc-transport-srio.inc |    4 +++-
 recipes-ti/ipc/ipc-transport.inc      |   12 ++++++------
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-transport-qmss.inc
index a5c8dc4..f029656 100644
--- a/recipes-ti/ipc/ipc-transport-qmss.inc
+++ b/recipes-ti/ipc/ipc-transport-qmss.inc
@@ -3,7 +3,9 @@ LICENSE = "BSD-3-Clause"
 
 require ipc-transport.inc
 
-INC_PR_append = ".0"
+INC_PR_append = ".1"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
 
 COMPATIBLE_MACHINE = "keystone"
 
diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-transport-srio.inc
index 4b5c305..f73f0f7 100644
--- a/recipes-ti/ipc/ipc-transport-srio.inc
+++ b/recipes-ti/ipc/ipc-transport-srio.inc
@@ -3,7 +3,9 @@ LICENSE = "BSD-3-Clause"
 
 require ipc-transport.inc
 
-INC_PR_append = ".0"
+INC_PR_append = ".1"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
 
 COMPATIBLE_MACHINE = "k2hk-evm"
 
diff --git a/recipes-ti/ipc/ipc-transport.inc b/recipes-ti/ipc/ipc-transport.inc
index 4ba3670..f399eed 100644
--- a/recipes-ti/ipc/ipc-transport.inc
+++ b/recipes-ti/ipc/ipc-transport.inc
@@ -1,15 +1,15 @@
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
+LICENSE = "BSD-3-Clause"
 
 IPC_TRANSPORT_GIT_URI = "git://git.ti.com/keystone-linux/ipc-transport.git"
-IPC_TRANSPORT_GIT_BRANCH = "master"
 IPC_TRANSPORT_GIT_PROTOCOL = "git"
+IPC_TRANSPORT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.01
+# Below commit ID corresponds to "DEV.IPC-TRANSPORT.02.00.00.01"
 IPC_TRANSPORT_SRCREV = "88ea336c584ccec4b2c281cd7f75df9dff6d4edf"
 
-BRANCH="${IPC_TRANSPORT_GIT_BRANCH}"
+BRANCH = "${IPC_TRANSPORT_GIT_BRANCH}"
 SRC_URI = "${IPC_TRANSPORT_GIT_URI};protocol=${IPC_TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
+
 SRCREV = "${IPC_TRANSPORT_SRCREV}"
 PV = "02.00.00.01"
-
-INC_PR = "r1"
+INC_PR = "r2"


