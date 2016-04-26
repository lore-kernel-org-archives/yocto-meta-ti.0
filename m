Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0E3DE00D19; Tue, 26 Apr 2016 11:55:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA370E00D19
	for <meta-ti@yoctoproject.org>; Tue, 26 Apr 2016 11:55:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 137D4529BF; Tue, 26 Apr 2016 18:55:16 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160426185516.137D4529BF@arago-project.org>
Date: Tue, 26 Apr 2016 18:55:16 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : netapi: clean up recipes
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
X-List-Received-Date: Tue, 26 Apr 2016 18:55:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7ae1abe462d8eafc378f10d2e6f23aeac61fed6c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7ae1abe462d8eafc378f10d2e6f23aeac61fed6c

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Mon Apr 25 19:08:16 2016 +0000

netapi: clean up recipes

* Define variables to abstract GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/netapi/netapi.inc |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/netapi/netapi.inc b/recipes-ti/netapi/netapi.inc
index d710a22..7ce8f19 100644
--- a/recipes-ti/netapi/netapi.inc
+++ b/recipes-ti/netapi/netapi.inc
@@ -9,13 +9,19 @@ DEBIAN_NOAUTONAME_${PN}-dev = "1"
 DEBIAN_NOAUTONAME_${PN}-dbg = "1"
 DEBIAN_NOAUTONAME_${PN}-staticdev = "1"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/netapi.git;protocol=git;branch=${BRANCH}"
+NETAPI_GIT_URI = "git://git.ti.com/keystone-rtos/netapi.git"
+NETAPI_GIT_PROTOCOL = "git"
+NETAPI_GIT_BRANCH = "master"
 
 # Below Commit ID corresponds to "DEV.NETAPI.01.01.00.06"
-SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
+NETAPI_SRCREV = "8180b61615965954eaaedc26053f9a8939d9a273"
+
+BRANCH = "${NETAPI_GIT_BRANCH}"
+SRC_URI = "${NETAPI_GIT_URI};protocol=${NETAPI_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${NETAPI_SRCREV}"
+
 PV = "01.01.00.06"
-INC_PR = "r4"
+INC_PR = "r5"
 
 DEVICELIST_k2hk-evm = "k2h k2k"
 DEVICELIST_k2l-evm  = "k2l"


