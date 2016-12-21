Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBA12E00CB0; Wed, 21 Dec 2016 10:24:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17F29E00848
	for <meta-ti@yoctoproject.org>; Wed, 21 Dec 2016 10:24:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3B1DE52AD7; Wed, 21 Dec 2016 18:24:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161221182447.3B1DE52AD7@arago-project.org>
Date: Wed, 21 Dec 2016 18:24:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : cmem.inc: only mangle SRC_URI in do_unpack instead of anon function
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
X-List-Received-Date: Wed, 21 Dec 2016 18:24:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e022e00e66673af9fbfc3755bcdb9cd8dc9567e2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e022e00e66673af9fbfc3755bcdb9cd8dc9567e2

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Dec 21 07:13:45 2016 +0000

cmem.inc: only mangle SRC_URI in do_unpack instead of anon function

Avoid taskhash mismatch errors.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/cmem.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
index 4541185..a61b899 100644
--- a/recipes-kernel/linux/cmem.inc
+++ b/recipes-kernel/linux/cmem.inc
@@ -27,7 +27,7 @@ CMEM_DEVICETREE_dra74x = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb
 RESERVE_CMEM ?= "0"
 
 # Add correct cmem.dtsi to SRC_URI for each variant for a given machine
-python() {
+python do_unpack() {
     old_overrides = d.getVar('OVERRIDES', False)
 
     # Initialize with empty string to simplify logic to append to SRC_URI
@@ -42,6 +42,7 @@ python() {
         cmem_dtsi.add(localdata.getVar('CMEM_DTSI', True))
 
     d.appendVar('SRC_URI', ' file://'.join(cmem_dtsi))
+    bb.build.exec_func('base_do_unpack', d)
 }
 
 python do_setup_cmem() {


