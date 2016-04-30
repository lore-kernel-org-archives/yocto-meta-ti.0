Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2C35E00D34; Fri, 29 Apr 2016 18:33:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67A5DE00D2F
	for <meta-ti@yoctoproject.org>; Fri, 29 Apr 2016 18:33:18 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id AC95652A04; Sat, 30 Apr 2016 01:33:17 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160430013317.AC95652A04@arago-project.org>
Date: Sat, 30 Apr 2016 01:33:17 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : gcc-arm-none-eabi-native: suppress already stripped warning
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
X-List-Received-Date: Sat, 30 Apr 2016 01:33:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b64a94a41f06e0652364a4eee45e572ca8de807b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b64a94a41f06e0652364a4eee45e572ca8de807b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Apr 30 05:53:42 2016 +0000

gcc-arm-none-eabi-native: suppress already stripped warning

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../gcc-arm-none-eabi-native_4.8.2014q3.bb         |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
index 971ae48..d3dba41 100644
--- a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
@@ -19,3 +19,5 @@ do_install() {
 }
 
 FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
+
+INSANE_SKIP_${PN} = "already-stripped"


