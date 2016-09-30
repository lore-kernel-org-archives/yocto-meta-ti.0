Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E465EE00D82; Fri, 30 Sep 2016 09:40:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAB55E00D8D
	for <meta-ti@yoctoproject.org>; Fri, 30 Sep 2016 09:40:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E5AE752AB2; Fri, 30 Sep 2016 16:40:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160930164036.E5AE752AB2@arago-project.org>
Date: Fri, 30 Sep 2016 16:40:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : gcc-arm-none-eabi-native: Update to version 4.9.2015q3
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
X-List-Received-Date: Fri, 30 Sep 2016 16:40:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 24ecff7a12df489770f9a56d821a7c1eb21dc160
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=24ecff7a12df489770f9a56d821a7c1eb21dc160

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Sep 28 21:44:03 2016 +0000

gcc-arm-none-eabi-native: Update to version 4.9.2015q3

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...3.bb => gcc-arm-none-eabi-native_4.9.2015q3.bb} |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
similarity index 59%
rename from recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
rename to recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
index d3dba41..1fe5c52 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.9.2015q3.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=cba77c7fd
 inherit native
 require recipes-ti/includes/ti-paths.inc
 
-SRC_URI = "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2;name=gcc-arm-none"
+SRC_URI = "https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2;name=gcc-arm-none"
 
-SRC_URI[gcc-arm-none.md5sum] = "acc8c8ff45f8801e2155934214309a87"
-SRC_URI[gcc-arm-none.sha256sum] = "e33d7546de1e02844239c72b3ef5563f472fcd6b4637419d513770ae13f551c0"
+SRC_URI[gcc-arm-none.md5sum] = "8a4a74872830f80c788c944877d3ad8c"
+SRC_URI[gcc-arm-none.sha256sum] = "c50078bfbd29e6c15615900e746f4d0acde917338e55860b0f145f57387c12ab"
 
-S = "${WORKDIR}/gcc-arm-none-eabi-4_8-2014q3"
+S = "${WORKDIR}/gcc-arm-none-eabi-4_9-2015q3"
 
 do_install() {
     install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}


