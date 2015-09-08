Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65F94E00C9C; Tue,  8 Sep 2015 08:58:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0B62E00CCE
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2015 08:57:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 81FC952A7D; Tue,  8 Sep 2015 15:57:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150908155758.81FC952A7D@arago-project.org>
Date: Tue,  8 Sep 2015 15:57:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : amx3-cm3: update PM firmware, still version 191
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
X-List-Received-Date: Tue, 08 Sep 2015 15:58:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: c4257f27b1a12730b234743e7f49489e27262274
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c4257f27b1a12730b234743e7f49489e27262274

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep  8 20:43:03 2015 +0000

amx3-cm3: update PM firmware, still version 191

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index d322530..80ca045 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -4,10 +4,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
 
 PV = "1.9.1"
-PR = "r0"
+PR = "r1"
 
-SRCREV = "277eef8611e260a5d73a9e3773fff8f767fe2b01"
-BRANCH ?= "next-upstream"
+SRCREV = "730f0695ca2dda65abcff5763e8f108517bc0d43"
+BRANCH ?= "ti-v4.1.y"
 
 SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-cm3.git;protocol=git;branch=${BRANCH}"
 


