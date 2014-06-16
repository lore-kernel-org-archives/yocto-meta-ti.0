Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A44D3E00C1B; Mon, 16 Jun 2014 15:38:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC6E6E00C15
	for <meta-ti@yoctoproject.org>; Mon, 16 Jun 2014 15:38:56 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 814EE52A80; Mon, 16 Jun 2014 22:38:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140616223853.814EE52A80@arago-project.org>
Date: Mon, 16 Jun 2014 22:38:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am180x-evm: don't request ubi FS w/ o setting MKUBIFS and UBINIZE vars
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
X-List-Received-Date: Mon, 16 Jun 2014 22:38:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 7eb568bda93160c3aec82c193c9b6bb6f0240f12
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7eb568bda93160c3aec82c193c9b6bb6f0240f12

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 13 22:55:12 2014 +0000

am180x-evm: don't request ubi FS w/o setting MKUBIFS and UBINIZE vars

It was ignored previously, but now it breaks the build.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am180x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index cff1565..44ca0c6 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -9,7 +9,7 @@ UBOOT_MACHINE = "da850evm_config"
 UBOOT_ENTRYPOINT = "0xc0008000"
 UBOOT_LOADADDRESS = "0xc0008000"
 
-IMAGE_FSTYPES += "tar.gz ubi"
+IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyS2"
 


