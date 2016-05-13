Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FB3BE00CC7; Fri, 13 May 2016 06:25:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 258 seconds by postgrey-1.32 at yocto-www;
	Fri, 13 May 2016 06:25:02 PDT
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1DF8E00CAF
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 06:25:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4DDKhv5019589
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 08:20:43 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4DDKhUZ030134
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 08:20:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 13 May 2016 08:20:43 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u4DDKgVu029243;	Fri, 13 May 2016 08:20:43 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 May 2016 09:20:35 -0400
Message-ID: <1463145635-10086-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-softhsmv2: bump SRCREV to version to 2.0.0.0
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
X-List-Received-Date: Fri, 13 May 2016 13:25:06 -0000
Content-Type: text/plain

* License checksum has changed due to an updated date in the LICENSE
  file

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

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
 
-- 
2.7.4


