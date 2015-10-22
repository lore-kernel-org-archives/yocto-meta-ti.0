Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2CD1EE00B54; Thu, 22 Oct 2015 10:01:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D587DE00AF6
	for <meta-ti@yoctoproject.org>; Thu, 22 Oct 2015 10:01:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 72D6C52A60; Thu, 22 Oct 2015 17:01:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151022170101.72D6C52A60@arago-project.org>
Date: Thu, 22 Oct 2015 17:01:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-softhsmv2: Update to new version 1.3.0.4
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
X-List-Received-Date: Thu, 22 Oct 2015 17:01:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 2aa7dfb41d4b1c6338d5c7a80428bbe459e9d5cf
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2aa7dfb41d4b1c6338d5c7a80428bbe459e9d5cf

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:41:38 2015 +0000

ti-softhsmv2: Update to new version 1.3.0.4

- Update License checksum
- Skip PR

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index 329fbaa..c1e1654 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI softhsmv2 package"
 LICENSE = "BSD-2-Clause | BSD-3-Clause | ISC | IBM-License | FSFULLR | Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=55144a048ba54f211a1aaa38c7fd2424"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=664f3daf042b19d634189e709d5d558e"
 SECTION = "libs"
 
 mntdir = "/mnt"
@@ -12,10 +12,9 @@ COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 
 BRANCH="master"
 SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
-#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.01
-SRCREV = "c79d93ac2a326567a7245dda1b903ef340b5650c"
-PV = "1.3.0.1"
-PR = "r1"
+#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.04
+SRCREV = "c2688afb9373309751e640088705cb739997665d"
+PV = "1.3.0.4"
 
 S = "${WORKDIR}/git"
 


