Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C8F7E00945; Thu,  8 Jan 2015 09:23:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9718E00757
	for <meta-ti@yoctoproject.org>; Thu,  8 Jan 2015 09:22:49 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 35181529E0; Thu,  8 Jan 2015 17:22:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150108172247.35181529E0@arago-project.org>
Date: Thu,  8 Jan 2015 17:22:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-ipc: Upgrade to IPC 3.30.01.12 GA.
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
X-List-Received-Date: Thu, 08 Jan 2015 17:23:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4e5954d65e2b6306e96ca95e65eb93f80296017d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4e5954d65e2b6306e96ca95e65eb93f80296017d

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Jan  6 21:09:24 2015 +0000

ti-ipc: Upgrade to IPC 3.30.01.12 GA.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc_git.bb |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 185e58b..07f8195 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -6,16 +6,13 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=abd112f
 
 DEPENDS += "virtual/kernel"
 
-PV = "3.30.00.09"
-
-# This is the first version of the 3.30.00.09 
-# PR = "r0"
+PV = "3.30.01.12"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
            file://tiipclad-daemon.sh \
            "
-SRCREV = "595bc3e3bbb2e7ec12a8287145d8e3929291e59d"
+SRCREV = "8deec9b295a5700b26449986927c77d60c5c0e5f"
 
 S = "${WORKDIR}/git"
 


