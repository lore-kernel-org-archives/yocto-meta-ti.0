Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB884E008BF; Thu, 19 Feb 2015 13:46:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6FA7E0088A
	for <meta-ti@yoctoproject.org>; Thu, 19 Feb 2015 13:46:16 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C181352A65; Thu, 19 Feb 2015 21:46:10 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150219214610.C181352A65@arago-project.org>
Date: Thu, 19 Feb 2015 21:46:10 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : ti-ipc: Upgrade to IPC 3.30.03.14
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
X-List-Received-Date: Thu, 19 Feb 2015 21:46:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7f762b9fe5324b01864685a870b6eab7c34e5eb9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7f762b9fe5324b01864685a870b6eab7c34e5eb9

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Feb 16 14:57:55 2015 +0000

ti-ipc: Upgrade to IPC 3.30.03.14

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 07f8195..10ae431 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=abd112f
 
 DEPENDS += "virtual/kernel"
 
-PV = "3.30.01.12"
+PV = "3.30.03.14"
 
-BRANCH = "master"
+BRANCH = "3.30"
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
            file://tiipclad-daemon.sh \
            "
-SRCREV = "8deec9b295a5700b26449986927c77d60c5c0e5f"
+SRCREV = "ff0ca0e3943ab67be47673bfc77f40c53daac078"
 
 S = "${WORKDIR}/git"
 


