Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A2EAE0053A; Mon, 19 Oct 2015 12:47:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DED60E0049B
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 12:46:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JJkwlL030882
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:46:58 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JJkvut002748
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:46:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 14:46:58 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9JJkvCP017204;	Mon, 19 Oct 2015 14:46:57 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Oct 2015 15:46:56 -0400
Message-ID: <1445284016-10315-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ipc/ipc-transport: Update to new version 2.0.0.0
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
X-List-Received-Date: Mon, 19 Oct 2015 19:47:01 -0000
Content-Type: text/plain

- Updates srio and qmss transports

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ipc-transport-qmss.inc |    6 +++---
 recipes-ti/ipc/ipc-transport-srio.inc |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ipc/ipc-transport-qmss.inc b/recipes-ti/ipc/ipc-transport-qmss.inc
index 35c2111..64692f2 100644
--- a/recipes-ti/ipc/ipc-transport-qmss.inc
+++ b/recipes-ti/ipc/ipc-transport-qmss.inc
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-linux/ipc-transport.git;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.IPC-TRANSPORT.01.00.00.00
-SRCREV = "b3077467126c84b5d583dc29e13ab221064b687b"
-PV = "01.00.00.00"
+# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.00
+SRCREV = "e0f99ae7bf3efc8f6a7c415af513b7c4323c5271"
+PV = "02.00.00.00"
 
 COMPATIBLE_MACHINE = "keystone"
 
diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-transport-srio.inc
index e286421..08b9768 100644
--- a/recipes-ti/ipc/ipc-transport-srio.inc
+++ b/recipes-ti/ipc/ipc-transport-srio.inc
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-linux/ipc-transport.git;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.IPC-TRANSPORT.01.00.00.00
-SRCREV = "b3077467126c84b5d583dc29e13ab221064b687b"
-PV = "01.00.00.00"
+# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.00
+SRCREV = "e0f99ae7bf3efc8f6a7c415af513b7c4323c5271"
+PV = "02.00.00.00"
 
 COMPATIBLE_MACHINE = "keystone"
 
-- 
1.7.9.5


