Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61F21E007A7; Fri, 20 Jan 2017 14:42:10 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0498DE00546
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2017 14:42:07 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0CC17529DD; Fri, 20 Jan 2017 22:42:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170120224206.0CC17529DD@arago-project.org>
Date: Fri, 20 Jan 2017 22:42:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machine: update max_leb_cnt across the board
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
X-List-Received-Date: Fri, 20 Jan 2017 22:42:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: dd1d21e48310c1656e46193cd74328434c3527ac
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dd1d21e48310c1656e46193cd74328434c3527ac

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jan 20 23:56:22 2017 +0000

machine: update max_leb_cnt across the board

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 conf/machine/am437x-evm.conf |    2 +-
 conf/machine/k2e-evm.conf    |    2 +-
 conf/machine/k2g-evm.conf    |    2 +-
 conf/machine/k2hk-evm.conf   |    2 +-
 conf/machine/k2l-evm.conf    |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 491b1c5..3b36cef 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 5600"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 6000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index 5e28ff4..142280e 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2650"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2800"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:
diff --git a/conf/machine/k2e-evm.conf b/conf/machine/k2e-evm.conf
index 7dd616e..43362dd 100644
--- a/conf/machine/k2e-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index fa1edfa..4d03f87 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1926 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1926"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
index eec52d6..220f7fc 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2hk-evm.conf
@@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 3856 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3900"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 4000"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index d8d3944..54931e2 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -24,7 +24,7 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1926 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1926"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:


