Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0AD7AE00BF9; Mon, 31 Oct 2016 14:22:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EEA3DE00B6C
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2016 14:22:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 16AFC529C2; Mon, 31 Oct 2016 21:22:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161031212225.16AFC529C2@arago-project.org>
Date: Mon, 31 Oct 2016 21:22:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : dra7xx-hs-evm: add DRA71x OPTEE flavor to the list
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
X-List-Received-Date: Mon, 31 Oct 2016 21:22:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d435c2a374384993810a314cc35d8b20de625987
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d435c2a374384993810a314cc35d8b20de625987

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Nov  1 01:03:40 2016 +0000

dra7xx-hs-evm: add DRA71x OPTEE flavor to the list

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/dra7xx-hs-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index 3a8ada2..db20aa2 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -14,5 +14,5 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}"
 
 OPTEEMACHINE = "ti"
-OPTEEFLAVOR = "dra7_evm dra72_evm_revc"
+OPTEEFLAVOR = "dra7_evm dra72_evm_revc dra71_evm"
 OPTEEOUTPUTMACHINE = "ti"


