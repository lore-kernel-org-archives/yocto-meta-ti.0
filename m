Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17722E00C02; Wed,  4 Nov 2015 07:04:27 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B826DE00BEC
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:03:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6D04E52AB0; Wed,  4 Nov 2015 15:03:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150357.6D04E52AB0@arago-project.org>
Date: Wed,  4 Nov 2015 15:03:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : sa-lld-test: Only build binaries relevent to the machine
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
X-List-Received-Date: Wed, 04 Nov 2015 15:04:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 685dfa91d3dc09e5c907491650a15ad9b16e60ca
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=685dfa91d3dc09e5c907491650a15ad9b16e60ca

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:29 2015 +0000

sa-lld-test: Only build binaries relevent to the machine

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/sa-lld/sa-lld-test_git.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index 4f74ab6..eeab6ff 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -4,9 +4,13 @@ DEPENDS = "common-csl-ip cppi-lld qmss-lld pa-lld sa-lld"
 
 include sa-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-DEVICELIST = "k2h k2k k2l k2e"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2e-evm  = "k2e"
 
 CHOICELIST = "no yes"
 


