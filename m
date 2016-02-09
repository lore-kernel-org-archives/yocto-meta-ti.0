Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0EB0FE00CBD; Tue,  9 Feb 2016 12:48:04 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEB5FE00CBB
	for <meta-ti@yoctoproject.org>; Tue,  9 Feb 2016 12:47:55 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9E31D52A4F; Tue,  9 Feb 2016 20:47:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160209204754.9E31D52A4F@arago-project.org>
Date: Tue,  9 Feb 2016 20:47:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : common-csl-ip: only rtos part is machine-specific, not main package
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
X-List-Received-Date: Tue, 09 Feb 2016 20:48:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 68cd1e1d95ad3ca723be7b7c7b20951c5566cdfc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=68cd1e1d95ad3ca723be7b7c7b20951c5566cdfc

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb  9 21:35:11 2016 +0000

common-csl-ip: only rtos part is machine-specific, not main package

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../common-csl-ip/common-csl-ip-rtos_git.bb        |    4 +++-
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |    3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 6f7d3cc..41a0d43 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -1,5 +1,7 @@
 require common-csl-ip.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit ti-pdk
 
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index c81b0f1..e51dd7b 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -3,10 +3,9 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PV = "3.3.0.1B"
-INC_PR = "r0"
+INC_PR = "r1"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
 CSL_GIT_PROTOCOL ="git"


