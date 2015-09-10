Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD511E00CE1; Wed,  9 Sep 2015 22:22:18 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BD93E00B6D
	for <meta-ti@yoctoproject.org>; Wed,  9 Sep 2015 22:22:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C100C52979; Thu, 10 Sep 2015 05:22:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150910052212.C100C52979@arago-project.org>
Date: Thu, 10 Sep 2015 05:22:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : kselftests: ipc tests are machine-specific, don' t blindly put in main RDEPENDS
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
X-List-Received-Date: Thu, 10 Sep 2015 05:22:18 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: a6e2f499dc87d15a73cbe57372292f8837a7b2eb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a6e2f499dc87d15a73cbe57372292f8837a7b2eb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Sep 10 11:19:49 2015 +0000

kselftests: ipc tests are machine-specific, don't blindly put in main RDEPENDS

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/kselftests/kselftests_4.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.1.bb b/recipes-kernel/kselftests/kselftests_4.1.bb
index d917fb5..38cb76b 100644
--- a/recipes-kernel/kselftests/kselftests_4.1.bb
+++ b/recipes-kernel/kselftests/kselftests_4.1.bb
@@ -74,7 +74,7 @@ RDEPENDS_${PN}-efivarfs += "bash"
 RDEPENDS_${PN}-memory-hotplug += "bash"
 RDEPENDS_${PN}-net += "bash"
 RDEPENDS_${PN}-vm += "bash"
-RDEPENDS_${PN} += "bash ${PN}-cpu-hotplug ${PN}-efivarfs ${PN}-exec ${PN}-firmware ${PN}-ftrace ${PN}-ipc \
+RDEPENDS_${PN} += "bash ${PN}-cpu-hotplug ${PN}-efivarfs ${PN}-exec ${PN}-firmware ${PN}-ftrace \
 	${PN}-kcmp ${PN}-memfd ${PN}-memory-hotplug ${PN}-mount ${PN}-mqueue ${PN}-net ${PN}-ptrace \
 	${PN}-size ${PN}-sysctl ${PN}-timers ${PN}-user ${PN}-vm"
 


