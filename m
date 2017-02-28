Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06699E00546; Mon, 27 Feb 2017 19:56:29 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1DCFE00519
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 19:56:27 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D0D7F52979; Tue, 28 Feb 2017 03:56:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170228035626.D0D7F52979@arago-project.org>
Date: Tue, 28 Feb 2017 03:56:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ipc-rtos: sync with morty, move type and suffix vars
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
X-List-Received-Date: Tue, 28 Feb 2017 03:56:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 2a474f9f2cc6972f337f09805f0af17b371033d5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2a474f9f2cc6972f337f09805f0af17b371033d5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb 28 07:44:32 2017 +0000

ti-ipc-rtos: sync with morty, move type and suffix vars

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos.inc    |    5 ++++-
 recipes-ti/ipc/ti-ipc-rtos_git.bb |    3 ---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 332f238..7f029a7 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -34,7 +34,10 @@ SRCREV_ipc-metadata = "30b83f09be1877f86b22c971d978cb478fc7dd6e"
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-PR = "${INC_PR}.1"
+RELEASE_TYPE = "GA"
+RELEASE_SUFFIX = ""
+
+PR = "${INC_PR}.2"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 693a4e9..f0ccb10 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -13,9 +13,6 @@ INSANE_SKIP_${PN}-dev += "arch"
 
 ALLOW_EMPTY_${PN} = "1"
 
-RELEASE_TYPE = "GA"
-RELEASE_SUFFIX = ""
-
 IPC_PACKAGE_DIR = "${S}/ipc-package"
 
 do_compile() {


