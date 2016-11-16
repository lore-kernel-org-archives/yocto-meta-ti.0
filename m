Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2465E00CA6; Wed, 16 Nov 2016 11:34:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4216E00712
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2016 11:34:07 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CA59F52AB6; Wed, 16 Nov 2016 19:34:05 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161116193405.CA59F52AB6@arago-project.org>
Date: Wed, 16 Nov 2016 19:34:05 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am335x-evm, am437x-evm: increase leb count for ubi
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
X-List-Received-Date: Wed, 16 Nov 2016 19:34:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: ad1986873706deda264b6ecfe01448f24478c8e7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ad1986873706deda264b6ecfe01448f24478c8e7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov 17 00:56:24 2016 +0000

am335x-evm, am437x-evm: increase leb count for ubi

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 conf/machine/am437x-evm.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index ab227b0..9a476c4 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 5100"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 5250"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 1561602..7883616 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2400"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2450"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:


