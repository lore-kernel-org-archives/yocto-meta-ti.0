Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7201AE00BEA; Fri, 13 Jun 2014 08:00:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CFA6E0073D
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 08:00:45 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 95B3052A5D; Fri, 13 Jun 2014 15:00:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140613150045.95B3052A5D@arago-project.org>
Date: Fri, 13 Jun 2014 15:00:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : Revert "dra7xx-evm: Add sgx to MACHINE_FEATURES"
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
X-List-Received-Date: Fri, 13 Jun 2014 15:00:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cab5d82697954ef06ccdf2d9ba9dd8924a1c0725
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cab5d82697954ef06ccdf2d9ba9dd8924a1c0725

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jun 12 01:18:46 2014 +0000

Revert "dra7xx-evm: Add sgx to MACHINE_FEATURES"

Since sgx support is broken for newer kernels and Qt4, disable it for now
until Qt5 becomes default and kernel drivers are updated.

This reverts commit f9253dc88fc9cfe36e39d4b8f1e233eb3f4eaa3f.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/dra7xx-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 8ba2757..14253cf 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -33,4 +33,4 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
 # Currently removing the sgx machine feature because there is no SGX package
 # available for omap5
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"


