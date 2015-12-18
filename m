Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 256B2E00C09; Thu, 17 Dec 2015 17:07:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1AADE00349
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2015 17:07:21 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 57AA1529C0; Fri, 18 Dec 2015 01:07:20 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151218010720.57AA1529C0@arago-project.org>
Date: Fri, 18 Dec 2015 01:07:20 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : ipc-transport-srio: Update to new version 2.0.0.1
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
X-List-Received-Date: Fri, 18 Dec 2015 01:07:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cd866ab2fb485a991f60bc9f5815aedda71428d0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cd866ab2fb485a991f60bc9f5815aedda71428d0

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Dec 17 01:59:49 2015 +0000

ipc-transport-srio: Update to new version 2.0.0.1

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ipc-transport-srio.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ipc/ipc-transport-srio.inc b/recipes-ti/ipc/ipc-transport-srio.inc
index 08b9768..91e3be1 100644
--- a/recipes-ti/ipc/ipc-transport-srio.inc
+++ b/recipes-ti/ipc/ipc-transport-srio.inc
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=27bb0deb260c60120a8d7b91da7c3b02"
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-linux/ipc-transport.git;protocol=git;branch=${BRANCH}"
-# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.00
-SRCREV = "e0f99ae7bf3efc8f6a7c415af513b7c4323c5271"
-PV = "02.00.00.00"
+# Below commit ID corresponds to DEV.IPC-TRANSPORT.02.00.00.01
+SRCREV = "88ea336c584ccec4b2c281cd7f75df9dff6d4edf"
+PV = "02.00.00.01"
 
-COMPATIBLE_MACHINE = "keystone"
+COMPATIBLE_MACHINE = "k2hk-evm"
 
 S = "${WORKDIR}/git/linux/srio"
 


