Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08580E00799; Fri, 10 Oct 2014 12:16:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17859E0076C
	for <meta-ti@yoctoproject.org>; Fri, 10 Oct 2014 12:16:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D3AB0529C2; Fri, 10 Oct 2014 19:16:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141010191628.D3AB0529C2@arago-project.org>
Date: Fri, 10 Oct 2014 19:16:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : Revert "dra7xx: add "mmip" to MACHINE_FEATURES"
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
X-List-Received-Date: Fri, 10 Oct 2014 19:16:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 651f0b46734dbf13d4242282919253e150eb83ae
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=651f0b46734dbf13d4242282919253e150eb83ae

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Oct 10 14:56:14 2014 -0400

Revert "dra7xx: add "mmip" to MACHINE_FEATURES"

Results in gstreamer conflicts in SDK.

This reverts commit aedc4d91bc5088ec6e6fe9d4de506503e201c6ca.

---

 conf/machine/include/dra7xx.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
index a7c8782..857e1b3 100644
--- a/conf/machine/include/dra7xx.inc
+++ b/conf/machine/include/dra7xx.inc
@@ -1,4 +1,4 @@
 require conf/machine/include/omap-a15.inc
 SOC_FAMILY_append = ":dra7xx"
 
-MACHINE_FEATURES += "pci mmip"
+MACHINE_FEATURES += "pci"


