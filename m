Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F0FEE003E4
	for <meta-ti@lists.yoctoproject.org>;
	Sat,  3 Mar 2012 02:53:15 -0800 (PST)
Received: by werm13 with SMTP id m13so1772420wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Sat, 03 Mar 2012 02:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.102.100 as permitted sender)
	client-ip=10.180.102.100; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.102.100 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.102.100])
	by 10.180.102.100 with SMTP id fn4mr385484wib.1.1330771995137 (num_hops
	= 1); Sat, 03 Mar 2012 02:53:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.102.100 with SMTP id fn4mr303905wib.1.1330771995045;
	Sat, 03 Mar 2012 02:53:15 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id s8sm8798451wiz.8.2012.03.03.02.53.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 02:53:14 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Sat,  3 Mar 2012 11:53:06 +0100
Message-Id: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmFpbx7wEl78LthNhfvrigvAC3mCyVUoYJwoWFFhBSgBjpREMjI1gPcJ7YT52dEm9VIsWt+
Subject: [PATCH 1/3] SOC_FAMILY: add to MACHINE_OVERRIDES locally
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
X-List-Received-Date: Sat, 03 Mar 2012 10:53:16 -0000

This breaks the hard dependency on Angstrom for getting a sane set of recipes.

The variable name is kept the same and the actual code moved from angstrom.inc to soc-family.inc to make it clear what it is doing and how.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/omap3.inc      |    1 +
 conf/machine/include/omap4.inc      |    1 +
 conf/machine/include/omapl138.inc   |    1 +
 conf/machine/include/soc-family.inc |    3 +++
 conf/machine/include/ti33x.inc      |    1 +
 conf/machine/include/ti814x.inc     |    1 +
 conf/machine/include/ti816x.inc     |    1 +
 7 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/include/soc-family.inc

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
index 84b7742..a295352 100644
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
index fb8bad3..f4954f5 100644
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
 
-- 
1.7.2.5


