Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF2F8E00954; Wed,  8 Apr 2015 15:44:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22B29E0088A
	for <meta-ti@yoctoproject.org>; Wed,  8 Apr 2015 15:44:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DF82C529CB; Wed,  8 Apr 2015 22:44:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150408224403.DF82C529CB@arago-project.org>
Date: Wed,  8 Apr 2015 22:44:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : rwmem: add rwmem tool
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
X-List-Received-Date: Wed, 08 Apr 2015 22:44:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 3a95559c124d3ce8c076b3fae5859435977d1ac2
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3a95559c124d3ce8c076b3fae5859435977d1ac2

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Apr  7 22:41:25 2015 +0000

rwmem: add rwmem tool

https://github.com/tomba/rwmem

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/rwmem/rwmem_1.1.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
new file mode 100644
index 0000000..1825e18
--- /dev/null
+++ b/recipes-bsp/rwmem/rwmem_1.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A small tool to read/write memory"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
+SRC_URI = "git://github.com/tomba/rwmem.git"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 rwmem ${D}${bindir}
+}


