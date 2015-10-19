Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D337EE007B3; Mon, 19 Oct 2015 14:11:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C690FE007C8
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 61C7A52ACC; Mon, 19 Oct 2015 21:11:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211148.61C7A52ACC@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ipc/ipc-transport: Update to new version 2.0.0.0
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
X-List-Received-Date: Mon, 19 Oct 2015 21:11:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2892deae256f05e612f39491d7a9f9c67535c094
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2892deae256f05e612f39491d7a9f9c67535c094

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:46:56 2015 +0000

ipc/ipc-transport: Update to new version 2.0.0.0

- Updates srio and qmss transports

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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
 


