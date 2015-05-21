Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2DB0E00A11; Thu, 21 May 2015 08:12:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00995E009EC
	for <meta-ti@yoctoproject.org>; Thu, 21 May 2015 08:12:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7EFAD529F8; Thu, 21 May 2015 15:12:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150521151202.7EFAD529F8@arago-project.org>
Date: Thu, 21 May 2015 15:12:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : layer.conf: add ti-ipc to safe ABI list
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
X-List-Received-Date: Thu, 21 May 2015 15:12:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 3df50212ee873c39cf1bd17dbdfe73e874c4a7b7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3df50212ee873c39cf1bd17dbdfe73e874c4a7b7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 21 07:56:23 2015 +0000

layer.conf: add ti-ipc to safe ABI list

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/layer.conf |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 056422d..7bb46e6 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -9,3 +9,7 @@ BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti = "6"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
+
+SIGGEN_EXCLUDERECIPES_ABISAFE += " \
+    ti-ipc \
+"


