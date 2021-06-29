Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.13974.1624998994245483901
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 13:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=M+DwFHb3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15TKaWw9082972;
	Tue, 29 Jun 2021 15:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624998992;
	bh=VfmQvTHanoRNdzPv2jHRwgXNXZPk43tag5PkRAp9JDY=;
	h=From:To:CC:Subject:Date;
	b=M+DwFHb3lJQ0Y2zqak3LAzbmPjfPFhIUt1IjFPbpK4nY1w5sLP5p90kvTEUgM4GjI
	 9sLHl7W+x0+1EpBF1InoMGGLtT1u/plhwBO19WDUImSYfdeeQzMjCtLEt24ReV62g4
	 DS/ZibvDKSwDUqHKUU4H9ft2ECkLilfZvabjeRN8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15TKaWEb113596
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 15:36:32 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 15:36:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 29 Jun 2021 15:36:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15TKaWcF049069;
	Tue, 29 Jun 2021 15:36:32 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denys@konsulko.com>
CC: Tom Rini <trini@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Nishanth
 Menon <nm@ti.com>
Subject: [dunfell/master PATCH] ti-sci-fw: k3-image-gen: Revert SPL address change for mainline
Date: Tue, 29 Jun 2021 15:36:30 -0500
Message-ID: <20210629203630.28915-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit 02a2433c ("ti-sci-fw: Update image gen to latest") switched to a
newer commit in k3-image-gen that also picked up TISCI firmware release,
However, does include a change where the SPL address changed.

This switch in address has been queued for upstream in a future release
(v5.14 + u-boot 2021.10) and current mainline formal tags do not support
this address change. As a result, we have a broken AM64x mainline
support.

Revert this specific change from k3-image-gen for mainline alone for
now.

NOTE: This uses ARAGO_BRAND=mainline which is NOT accurate for meta-ti
which is distro independent, hence without appropriate changes while
using alternate distros, this change will not take effect.

Reported-by: Tom Rini <trini@konsulko.com>
Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

Example: u-boot 2021.07-rc5 + v5.13 kernel: https://pastebin.ubuntu.com/p/Xxvz5YkCvY/

 ...-Makefile-Move-the-SPL-Load-address-.patch | 36 +++++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc           |  8 +++++
 2 files changed, 44 insertions(+)
 create mode 100644 recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch

diff --git a/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch b/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
new file mode 100644
index 000000000000..63a5796d6b82
--- /dev/null
+++ b/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
@@ -0,0 +1,36 @@
+From 83d29d5e346083254e71fbe483cb14f6657b9965 Mon Sep 17 00:00:00 2001
+From: Nishanth Menon <nm@ti.com>
+Date: Tue, 29 Jun 2021 12:03:29 -0500
+Subject: [PATCH] Revert "soc: am64x: Makefile: Move the SPL Load address to
+ 0x70000000"
+
+This reverts commit e411dc16862b5bb2d8befb12496b03d7b01c87b2.
+
+Mainline is NOT ready for the change yet as of u-boot 2021.07 + v5.13,
+So, this patch reverts the SPL address change.
+
+This patch needs to be dropped once mainline u-boot and kernel have
+migrated over to newer releases.
+
+Upstream-Status: Not applicable
+Signed-off-by: Nishanth Menon <nm@ti.com>
+---
+ soc/am64x/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
+index 45425428f9c6..e8747376f153 100644
+--- a/soc/am64x/Makefile
++++ b/soc/am64x/Makefile
+@@ -30,7 +30,7 @@
+ #  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #
+ 
+-SBL_LOADADDDR ?= 0x70000000
++SBL_LOADADDDR ?= 0x70020000
+ COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x70000
+ LOADADDR  ?= 0x44000
+ SCIFS = sci
+-- 
+2.32.0
+
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 4004d93f47c9..503cd5ceadc6 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -15,4 +15,12 @@ SRC_URI = " \
 	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
 "
 
+# Mainline u_boot 2021.07 and upstream kernel v5.13 tag cannot use new SPL address
+# in K3-Imagegen
+SRC_URI += "\
+	${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '\
+	file://0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch;patchdir=../imggen \
+	', '', d)} \
+"
+
 S = "${WORKDIR}/git"
-- 
2.32.0

