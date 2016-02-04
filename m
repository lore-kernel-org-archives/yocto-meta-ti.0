Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF2DCE00CBE; Thu,  4 Feb 2016 09:30:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3245FE00BEB
	for <meta-ti@yoctoproject.org>; Thu,  4 Feb 2016 09:30:24 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C270652AB9; Thu,  4 Feb 2016 17:30:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160204173023.C270652AB9@arago-project.org>
Date: Thu,  4 Feb 2016 17:30:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : netapi: disable debian naming for consistency
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
X-List-Received-Date: Thu, 04 Feb 2016 17:30:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 8b92fc167c7d5d254a11ec9c18f7284b4127fc87
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8b92fc167c7d5d254a11ec9c18f7284b4127fc87

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb  4 23:20:16 2016 +0000

netapi: disable debian naming for consistency

Libraries have SOC in the name, but some machines (k2hk) build multiple variants.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/netapi/netapi.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index 0e7b04b..d710a22 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -4,13 +4,18 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f230
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+DEBIAN_NOAUTONAME_${PN} = "1"
+DEBIAN_NOAUTONAME_${PN}-dev = "1"
+DEBIAN_NOAUTONAME_${PN}-dbg = "1"
+DEBIAN_NOAUTONAME_${PN}-staticdev = "1"
+
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
 
 # Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
 SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
 PV = "01.01.00.06"
-INC_PR = "r3"
+INC_PR = "r4"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"


