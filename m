Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCDDDE0044D
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 21:59:41 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 60D5252A82; Mon,  5 Mar 2012 05:59:41 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120305055941.60D5252A82@arago-project.org>
Date: Mon,  5 Mar 2012 05:59:41 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : soc-family.inc: it's now in OE-Core, remove locally
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2012 05:59:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f7965c3a335b97d5ae5795c95b86387d5c1590a5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f7965c3a335b97d5ae5795c95b86387d5c1590a5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar  5 00:57:36 2012 -0500

soc-family.inc: it's now in OE-Core, remove locally

The soc-family.inc file to set up SOC_FAMILY in MACHINEOVERRIDES has been
accepted upstream to OE-Core, can remove it from meta-ti now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/soc-family.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/soc-family.inc b/conf/machine/include/soc-family.inc
deleted file mode 100644
index 39ca338..0000000
--- a/conf/machine/include/soc-family.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-# Add SOC_FAMILY to machine overrides so we get access to e.g. 'omap3' and 'ti335x'
-MACHINEOVERRIDES .= "${@['', ':${SOC_FAMILY}']['${SOC_FAMILY}' != '']}"
-


