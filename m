Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 143A8E0070C
	for <meta-ti@yoctoproject.org>; Sat,  3 Mar 2012 21:48:41 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id EA0F4529B7; Sun,  4 Mar 2012 05:48:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120304054839.EA0F4529B7@arago-project.org>
Date: Sun,  4 Mar 2012 05:48:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : SOC_FAMILY: add to MACHINE_OVERRIDES locally
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
X-List-Received-Date: Sun, 04 Mar 2012 05:48:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0d4418518a05b8f47697aa69a18a832d90eb8d87
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0d4418518a05b8f47697aa69a18a832d90eb8d87

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Sat Mar  3 11:53:06 2012 +0100

SOC_FAMILY: add to MACHINE_OVERRIDES locally

This breaks the hard dependency on Angstrom for getting a sane set of recipes.

The variable name is kept the same and the actual code moved from angstrom.inc to soc-family.inc to make it clear what it is doing and how.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap3.inc      |    1 +
 conf/machine/include/omap4.inc      |    1 +
 conf/machine/include/omapl138.inc   |    1 +
 conf/machine/include/soc-family.inc |    3 +++
 conf/machine/include/ti33x.inc      |    1 +
 conf/machine/include/ti814x.inc     |    1 +
 conf/machine/include/ti816x.inc     |    1 +
 7 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 8fc0903..9cafe85 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -1,4 +1,5 @@
 SOC_FAMILY = "omap3"
+require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index 51e4a84..d8d7e08 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -1,4 +1,5 @@
 SOC_FAMILY = "omap4"
+require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa8.inc
 
diff --git a/conf/machine/include/omapl138.inc b/conf/machine/include/omapl138.inc
index 4c22275..1949642 100644
--- a/conf/machine/include/omapl138.inc
+++ b/conf/machine/include/omapl138.inc
@@ -1 +1,2 @@
 SOC_FAMILY = "omapl138"
+require conf/machine/include/soc-family.inc
diff --git a/conf/machine/include/soc-family.inc b/conf/machine/include/soc-family.inc
new file mode 100644
index 0000000..39ca338
--- /dev/null
+++ b/conf/machine/include/soc-family.inc
@@ -0,0 +1,3 @@
+# Add SOC_FAMILY to machine overrides so we get access to e.g. 'omap3' and 'ti335x'
+MACHINEOVERRIDES .= "${@['', ':${SOC_FAMILY}']['${SOC_FAMILY}' != '']}"
+
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index f9d8f7a..550363d 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -1,4 +1,5 @@
 SOC_FAMILY = "ti33x"
+require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
diff --git a/conf/machine/include/ti814x.inc b/conf/machine/include/ti814x.inc
index 23b6a1d..c53557f 100644
--- a/conf/machine/include/ti814x.inc
+++ b/conf/machine/include/ti814x.inc
@@ -1,4 +1,5 @@
 SOC_FAMILY = "ti814x"
+require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa8.inc
 
diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
index 06cb7c0..2fe4006 100644
--- a/conf/machine/include/ti816x.inc
+++ b/conf/machine/include/ti816x.inc
@@ -1,4 +1,5 @@
 SOC_FAMILY = "ti816x"
+require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa8.inc
 


