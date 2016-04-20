Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51DE6E00EFD; Wed, 20 Apr 2016 10:16:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4480E00EE6
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 10:15:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 40E1F52A65; Wed, 20 Apr 2016 17:15:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160420171554.40E1F52A65@arago-project.org>
Date: Wed, 20 Apr 2016 17:15:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : traceframework-rtos: Add RTOS package for Traceframework
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
X-List-Received-Date: Wed, 20 Apr 2016 17:16:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 9b20ad7573e4555466c8be58ec17c3faa3221d65
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9b20ad7573e4555466c8be58ec17c3faa3221d65

Author: Justin Sobota <jsobota@ti.com>
Date:   Wed Apr 20 02:49:45 2016 +0000

traceframework-rtos: Add RTOS package for Traceframework

Signed-off-by: Justin Sobota <jsobota@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../traceframework/traceframework-rtos_git.bb      |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/traceframework/traceframework-rtos_git.bb b/recipes-bsp/traceframework/traceframework-rtos_git.bb
new file mode 100644
index 0000000..32994d3
--- /dev/null
+++ b/recipes-bsp/traceframework/traceframework-rtos_git.bb
@@ -0,0 +1,10 @@
+inherit ti-pdk
+
+require traceframework.inc
+
+PR = "${INC_PR}.1"
+
+DEPENDS_append = " uia \
+"
+
+XDCPATH_append = ";${UIA_INSTALL_DIR}/packages"


