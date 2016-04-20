Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FC99E00D0D; Wed, 20 Apr 2016 11:46:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4C73E007D2
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 11:46:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3KIkUDw001038
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 13:46:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KIkUJG023514
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 13:46:30 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Apr 2016 13:46:29 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u3KIkTeW009546;	Wed, 20 Apr 2016 13:46:29 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 Apr 2016 14:46:26 -0400
Message-ID: <1461177987-495-1-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [master/fido][PATCH 1/2] ipc-transport: Clean up recipe
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
X-List-Received-Date: Wed, 20 Apr 2016 18:46:34 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-ti/ipc/ipc-transport-qmss.inc |    4 +++-
 recipes-ti/ipc/ipc-transport-srio.inc |    4 +++-
 recipes-ti/ipc/ipc-transport.inc      |   14 ++++++++------
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-transport-qmss.inc
index a5c8dc4..7539ef5 100644
--- a/recipes-ti/ipc/ipc-transport-qmss.inc
+++ b/recipes-ti/ipc/ipc-transport-qmss.inc
@@ -3,7 +3,9 @@ LICENSE = "BSD-3-Clause"
 
 require ipc-transport.inc
 
-INC_PR_append = ".0"
+PR = "${INC_PR}.1"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
 
 COMPATIBLE_MACHINE = "keystone"
 
diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-transport-srio.inc
index 4b5c305..18b94d1 100644
--- a/recipes-ti/ipc/ipc-transport-srio.inc
+++ b/recipes-ti/ipc/ipc-transport-srio.inc
@@ -3,7 +3,9 @@ LICENSE = "BSD-3-Clause"
 
 require ipc-transport.inc
 
-INC_PR_append = ".0"
+PR = "${INC_PR}.1"
+
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
 
 COMPATIBLE_MACHINE = "k2hk-evm"
 
diff --git a/recipes-ti/ipc/ipc-transport.inc b/recipes-ti/ipc/ipc-transport.inc
index 4ba3670..705dfb4 100644
--- a/recipes-ti/ipc/ipc-transport.inc
+++ b/recipes-ti/ipc/ipc-transport.inc
@@ -1,15 +1,17 @@
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
+LICENSE = "BSD-3-Clause"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
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
-- 
1.7.10.4


