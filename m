Return-Path: <luca@lucaceresoli.net>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A536DE00C81; Tue, 23 Jul 2019 03:25:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1217 seconds by postgrey-1.32 at yocto-www;
	Tue, 23 Jul 2019 03:25:45 PDT
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
	[89.40.174.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15E1AE00BD5
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2019 03:25:45 -0700 (PDT)
Received: from [109.168.11.45] (port=46938 helo=zynqmp.dev.aim)
	by hostingweb31.netsons.net with esmtpa (Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1hprfj-002jBF-AH; Tue, 23 Jul 2019 12:05:27 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
To: meta-ti@yoctoproject.org
Date: Tue, 23 Jul 2019 12:05:13 +0200
Message-Id: <1563876313-24488-1-git-send-email-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.7.4
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
	luca+lucaceresoli.net/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH] ti-unpack.inc: abort if 32 bit libs are not installed
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
X-List-Received-Date: Tue, 23 Jul 2019 10:25:46 -0000

ti_bin_do_unpack() detects the absence of the required 32 bit libraries,
but only emits a warning. Later on the build will fail with a mysterious
error.

Fail immediately so the user can clearly read the error message and the
(always appreciated) instructions on how to fix the problem.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 recipes-ti/includes/ti-unpack.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
index dbc4949..81fcf6a 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -24,7 +24,7 @@ python ti_bin_do_unpack() {
     if os.path.exists('/lib64') and (os.path.islink('/lib64') or os.path.islink('/lib') or os.path.exists('/lib32')):
         lib32path = '/lib32'
     if not os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('%s/i386-linux-gnu/libc.so.6' % lib32path):
-        bb.warn("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
+        bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
 
     localdata = bb.data.createCopy(d)
     bb.data.update_data(localdata)
-- 
2.7.4


