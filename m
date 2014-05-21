Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4E1DE00BC3; Wed, 21 May 2014 12:57:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from arago-project.org (unknown [184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF378E0077C
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 12:57:21 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7C73052A89; Wed, 21 May 2014 19:57:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140521195718.7C73052A89@arago-project.org>
Date: Wed, 21 May 2014 19:57:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : dra7xx-evm: Add sgx to MACHINE_FEATURES
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
X-List-Received-Date: Wed, 21 May 2014 19:57:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c78c19187036569914b4b0ea7990bab2cb6458bb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c78c19187036569914b4b0ea7990bab2cb6458bb

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Tue May 20 01:19:47 2014 +0000

dra7xx-evm: Add sgx to MACHINE_FEATURES

* Add sgx to the MACHINE_FEATURES so that the dra7xx-evm can
  start including sgx libraries.  NOTE: currently there are
  no driver modules that work with v3.12 of the Linux kernel
  but this does work with version 3.8.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/dra7xx-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 14253cf..8ba2757 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -33,4 +33,4 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
 # Currently removing the sgx machine feature because there is no SGX package
 # available for omap5
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"


