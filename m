Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B113BE007BA; Mon,  6 Feb 2017 10:17:01 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6CE2E0082E
	for <meta-ti@yoctoproject.org>; Mon,  6 Feb 2017 10:16:58 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C36FF52AEA; Mon,  6 Feb 2017 18:16:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170206181657.C36FF52AEA@arago-project.org>
Date: Mon,  6 Feb 2017 18:16:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am335x-hs-evm: update UBOOT_MACHINE var for latest u-boot version
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
X-List-Received-Date: Mon, 06 Feb 2017 18:17:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 75038fcb58c1182a397af7935a6873c08bcf4254
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=75038fcb58c1182a397af7935a6873c08bcf4254

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Feb  6 21:41:55 2017 +0000

am335x-hs-evm: update UBOOT_MACHINE var for latest u-boot version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-hs-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-hs-evm.conf b/conf/machine/am335x-hs-evm.conf
index 674a764..bb025b4 100644
--- a/conf/machine/am335x-hs-evm.conf
+++ b/conf/machine/am335x-hs-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/am335x-evm.conf
 
-UBOOT_MACHINE = "am335x_hs_evm_mmc_config"
+UBOOT_MACHINE = "am335x_hs_evm_config"
 
 UBOOT_ENTRYPOINT = "0x82000000"
 UBOOT_LOADADDRESS = "0x82000000"


