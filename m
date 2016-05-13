Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52417E00AD2; Fri, 13 May 2016 11:57:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24BE1E00AD2
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 11:57:43 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 21CC0529B9; Fri, 13 May 2016 18:57:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160513185742.21CC0529B9@arago-project.org>
Date: Fri, 13 May 2016 18:57:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-softhsmv2: bump SRCREV to version to 2.0.0.0
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
X-List-Received-Date: Fri, 13 May 2016 18:57:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 6cc3e56407e281b29172540d4828699b2c391c2f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6cc3e56407e281b29172540d4828699b2c391c2f

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Fri May 13 19:20:35 2016 +0000

ti-softhsmv2: bump SRCREV to version to 2.0.0.0

* License checksum has changed due to an updated date in the LICENSE
  file

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index ea2eb3f..7367211 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI softhsmv2 package"
 LICENSE = "BSD-2-Clause | BSD-3-Clause | ISC | IBM-License | FSFULLR | Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=664f3daf042b19d634189e709d5d558e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=700a883962ccff663f888f3f7221ce8f"
 SECTION = "libs"
 
 mntdir = "/mnt"
@@ -10,12 +10,12 @@ inherit autotools pkgconfig
 DEPENDS = "openssl libdaemon zlib"
 COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
 
-BRANCH="master"
+BRANCH="ti-softhsm-rebase"
 SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
-#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.04
-SRCREV = "c2688afb9373309751e640088705cb739997665d"
-PV = "1.3.0.4"
-PR = "r1"
+#Following commit corresponds to tag DEV.SOFTHSM-02.00.00.00
+SRCREV = "b0eef602c03583e59c289ba113b64eaa4f5cac13"
+PV = "2.0.0.0"
+PR = "r0"
 
 S = "${WORKDIR}/git"
 


