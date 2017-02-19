Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 784CDE009F8; Sat, 18 Feb 2017 16:22:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 525C5E009F5
	for <meta-ti@yoctoproject.org>; Sat, 18 Feb 2017 16:22:28 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 40B9B529D5; Sun, 19 Feb 2017 00:22:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170219002225.40B9B529D5@arago-project.org>
Date: Sun, 19 Feb 2017 00:22:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: bump max_leb_cnt for am3
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
X-List-Received-Date: Sun, 19 Feb 2017 00:22:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 3fe8ffe67c9ed7d5023078e29121db2e8d2f7c34
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3fe8ffe67c9ed7d5023078e29121db2e8d2f7c34

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Feb 18 19:21:04 2017 -0500

conf/machine: bump max_leb_cnt for am3

Previous commit meant to increase it more than just by 200...

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 841e4d2..86a828c 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 6200"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 7000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:


