Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C619E00CC0; Mon, 21 Mar 2016 08:44:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25474E00CC7
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 08:44:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BD66D52AE4; Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160321154434.BD66D52AE4@arago-project.org>
Date: Mon, 21 Mar 2016 15:44:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : sa-lld: Upgrade to version 3.0.0.13
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
X-List-Received-Date: Mon, 21 Mar 2016 15:44:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4780437ac766c62009723bef3a46b22cac555f1d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4780437ac766c62009723bef3a46b22cac555f1d

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon Mar 21 21:27:03 2016 +0000

sa-lld: Upgrade to version 3.0.0.13

* Update license with TI-TFL license

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/sa-lld/sa-lld.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/sa-lld/sa-lld.inc b/recipes-bsp/sa-lld/sa-lld.inc
index 3746a1e..3e3392b 100644
--- a/recipes-bsp/sa-lld/sa-lld.inc
+++ b/recipes-bsp/sa-lld/sa-lld.inc
@@ -1,21 +1,21 @@
-LICENSE = "BSD-3-Clause"
+LICENSE = "BSD-3-Clause & TI-TFL"
 COMPATIBLE_MACHINE = "keystone"
 
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=4709d353574a9569e129ebdf20e732dd"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/sa/COPYING.txt;md5=cd04fb087063a2a82c4ce61983836871"
 
 SA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/sa-lld.git"
 SA_LLD_GIT_PROTOCOL = "git"
 SA_LLD_GIT_BRANCH = "master"
 SA_LLD_GIT_DESTSUFFIX = "git/ti/drv/sa"
 
-# Following commit DEV.SA_LLD.03.00.00.12
-SA_LLD_SRCREV = "b3bd2741126230b397ca827def5fcf6e6f019574"
+# Following commit DEV.SA_LLD.03.00.00.13
+SA_LLD_SRCREV = "ddde4d990482c8f727411a014512bc7959ab2c05"
 
 BRANCH = "${SA_LLD_GIT_BRANCH}"
 SRC_URI = "${SA_LLD_GIT_URI};destsuffix=${SA_LLD_GIT_DESTSUFFIX};protocol=${SA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${SA_LLD_SRCREV}"
 
-PV = "03.00.00.12"
+PV = "03.00.00.13"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${SA_LLD_GIT_DESTSUFFIX}"


