Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB161E00BC6; Fri, 29 Jan 2016 09:06:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E9CCAE00ADD
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 09:06:53 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0TH6qDH000819
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 11:06:52 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0TH6qVw011901
	for <meta-ti@yoctoproject.org>; Fri, 29 Jan 2016 11:06:52 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 11:06:52 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0TH6qHW019914;	Fri, 29 Jan 2016 11:06:52 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 29 Jan 2016 12:06:50 -0500
Message-ID: <1454087210-29597-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] conf: machine: am57xx-evm, dra7xx-evm: Increase max_leb_cnt
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
X-List-Received-Date: Fri, 29 Jan 2016 17:06:54 -0000
Content-Type: text/plain

* With the addition of the video analytics demo, the filesystem has
  exceeded size limited by the previous max_leb_cnt.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/machine/am57xx-evm.conf | 2 +-
 conf/machine/dra7xx-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 8d5d5cc..e32b98f 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -23,7 +23,7 @@ UBOOT_MACHINE = "am57xx_evm_config"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 6400"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 9bfcb5c..986b8e2 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -23,7 +23,7 @@ UBOOT_MACHINE = "dra7xx_evm_config"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 6400"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
-- 
1.9.1


