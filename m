Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D9DDE00708; Wed,  2 Jul 2014 13:03:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4728E00717
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 13:03:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8E36852AB6; Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140702200326.8E36852AB6@arago-project.org>
Date: Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : dra7xx-evm: Use dra7xx include
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
X-List-Received-Date: Wed, 02 Jul 2014 20:03:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: ab34a9cb305ac1780fe52c1d5c60836e395556f3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ab34a9cb305ac1780fe52c1d5c60836e395556f3

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Tue Jul  1 19:36:08 2014 +0000

dra7xx-evm: Use dra7xx include

* Update the include file used to the dra7xx.inc file which
  brings access to the dra7xx SOC_FAMILY

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/dra7xx-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 14253cf..7069b44 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -2,7 +2,7 @@
 #@NAME: DRA7xx EVM
 #@DESCRIPTION: Machine configuration for the TI DRA7xx EVM
 
-require conf/machine/include/omap-a15.inc
+require conf/machine/include/dra7xx.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
 


