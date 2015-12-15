Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2B1FE007D3; Tue, 15 Dec 2015 08:59:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23FECE00AA8
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:59:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 73D8152A19; Tue, 15 Dec 2015 16:59:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151215165952.73D8152A19@arago-project.org>
Date: Tue, 15 Dec 2015 16:59:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : mpm-transport: Update to new version 2.0.0.1
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
Commit: c17405f25e974a5c6384a20d76bc92465767ad51
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c17405f25e974a5c6384a20d76bc92465767ad51

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Dec 15 20:11:25 2015 +0000

mpm-transport: Update to new version 2.0.0.1

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/mpm-transport/mpm-transport_git.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 812ae04..beb744c 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -14,12 +14,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "git://git.ti.com/keystone-linux/mpm-transport.git;protocol=git;branch=${BRANCH}"
 
-BRANCH = "linux41"
-# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.00.00_ENG
-SRCREV = "892e93238b7f9f480ddceb7ade042026a4d178bd"
+BRANCH = "master"
+# This commit corresponds to tag DEV.MPM-TRANSPORT-02.00.00.01
+SRCREV = "7220df9263a57629a564afb3f99f6f7fb33e40d6"
 
-PV = "2.0.0.0"
-PR = "r1"
+PV = "2.0.0.1"
+PR = "r0"
 
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 EXTRA_OEMAKE_append_k2hk-evm += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"


