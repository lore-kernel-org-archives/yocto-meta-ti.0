Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0725AE00710; Wed,  2 Jul 2014 13:03:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B31C1E0070F
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 13:03:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6BB7052AAB; Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140702200326.6BB7052AAB@arago-project.org>
Date: Wed,  2 Jul 2014 20:03:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Maupin, Chase : dra7xx: create DRA7xx include file for new SOC Family
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
X-List-Received-Date: Wed, 02 Jul 2014 20:03:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 5c074704d4768cb770b6a5e11bd7a5348a3ef411
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5c074704d4768cb770b6a5e11bd7a5348a3ef411

Author: Maupin, Chase <chase.maupin@ti.com>
Date:   Tue Jul  1 19:36:06 2014 +0000

dra7xx: create DRA7xx include file for new SOC Family

* Create the dra7xx.inc file which inherits the omap-a15.inc file
  and then adds the dra7xx as another valid SOC_FAMILY setting.
* The addition of the dra7xx SOC_FAMILY is done while still keeping
  access to the omap-a15 family.  What this means is that omap-a15
  can apply to omap5-evm, dra7xx-evm, and am57xx-evm.  Then the
  dra7xx family can be used to differentiate between omap5 and
  dra7xx based devices.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/dra7xx.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
new file mode 100644
index 0000000..fd0ecfe
--- /dev/null
+++ b/conf/machine/include/dra7xx.inc
@@ -0,0 +1,2 @@
+require conf/machine/include/omap-a15.inc
+SOC_FAMILY_append = ":dra7xx"


