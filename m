Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A263FE009AA; Wed, 22 Apr 2015 09:04:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF8CCE009A6
	for <meta-ti@yoctoproject.org>; Wed, 22 Apr 2015 09:04:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CA7EA52A6C; Wed, 22 Apr 2015 16:04:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150422160452.CA7EA52A6C@arago-project.org>
Date: Wed, 22 Apr 2015 16:04:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ipc: Update to new version 3.35.1.7
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
X-List-Received-Date: Wed, 22 Apr 2015 16:04:59 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2c19121bb5166743d82cd4c46746b596a4a4340c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2c19121bb5166743d82cd4c46746b596a4a4340c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Apr 22 09:45:14 2015 +0000

ipc: Update to new version 3.35.1.7

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
index 6f46295..bb2c3c9 100644
--- a/recipes-ti/ipc/ti-ipc_git.bb
+++ b/recipes-ti/ipc/ti-ipc_git.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 DEPENDS += "virtual/kernel"
 
-PV = "3.35.00.05"
+PV = "3.35.01.07"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
            file://tiipclad-daemon.sh \
            "
-# Commit corresponds to 3.35.00.05
-SRCREV = "ce35c999f5c3368e387740a38aef3358290579b3"
+# Commit corresponds to 3.35.01.07
+SRCREV = "358d966c9f5973faf9ab71fb1d7dfe5d3e08a8dc"
 
 S = "${WORKDIR}/git"
 


