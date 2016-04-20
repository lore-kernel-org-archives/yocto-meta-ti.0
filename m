Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B205CE00F2B; Wed, 20 Apr 2016 10:16:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26C59E00EF4
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 10:16:46 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 51DC952A5B; Wed, 20 Apr 2016 17:16:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160420171645.51DC952A5B@arago-project.org>
Date: Wed, 20 Apr 2016 17:16:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : gdbc6x: Bump SRCREV for AM57xx EVM PG2.0
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
X-List-Received-Date: Wed, 20 Apr 2016 17:16:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 132c29de6e15963772b69e82ee3c37e0d62bac35
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=132c29de6e15963772b69e82ee3c37e0d62bac35

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Apr 20 18:40:33 2016 +0000

gdbc6x: Bump SRCREV for AM57xx EVM PG2.0

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-devtools/gdbc6x/gdbc6x.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
index 4d77117..df08ee5 100644
--- a/recipes-devtools/gdbc6x/gdbc6x.inc
+++ b/recipes-devtools/gdbc6x/gdbc6x.inc
@@ -1,8 +1,8 @@
 # This corresponds to version 1.1.0
-SRCREV = "653f7d0a345bede0542326090b622b885545c712"
+SRCREV = "df0b8f6f4e9ba5b9c94ea8c17c6dfeae37c1c9d1"
 
 PV = "1.1.0"
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
 


