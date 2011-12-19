Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BFC8EE0136D
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:49 -0800 (PST)
Received: by mail-we0-f181.google.com with SMTP id m12so1800889wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 08:15:49 -0800 (PST)
Received: by 10.216.139.91 with SMTP id b69mr4575618wej.51.1324311349084;
	Mon, 19 Dec 2011 08:15:49 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fn3sm2217396wbb.17.2011.12.19.08.15.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 08:15:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 19 Dec 2011 17:15:38 +0100
Message-Id: <1324311340-16981-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 3/5] ti-dspbios: update to 5.41.11.38
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
X-List-Received-Date: Mon, 19 Dec 2011 16:15:50 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/bios/ti-dspbios.inc           |    5 ++---
 recipes-ti/bios/ti-dspbios_5.41.07.24.bb |    8 --------
 recipes-ti/bios/ti-dspbios_5.41.11.38.bb |    7 +++++++
 3 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 recipes-ti/bios/ti-dspbios_5.41.07.24.bb
 create mode 100644 recipes-ti/bios/ti-dspbios_5.41.11.38.bb

diff --git a/recipes-ti/bios/ti-dspbios.inc b/recipes-ti/bios/ti-dspbios.inc
index 4bad834..8519039 100644
--- a/recipes-ti/bios/ti-dspbios.inc
+++ b/recipes-ti/bios/ti-dspbios.inc
@@ -3,14 +3,13 @@ HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/b
 SECTION = "devel"
 LICENSE = "TI"
 
-LIC_FILES_CHKSUM = "file://docs/license/TSPA_License_Agreement_DSP_BIOS_bios_5_41_07_24.html;md5=86096a08e4088ef291c98313d82b8742"
+# We can't depend on license files to be present, so just use the TI logo
+LIC_FILES_CHKSUM = "file://docs/tilogo.gif;md5=f049a774c576a5cef3fca4932d707b39"
 
 require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
 
-PR = "r1"
-
 S = "${WORKDIR}/bios_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=biosbin"
diff --git a/recipes-ti/bios/ti-dspbios_5.41.07.24.bb b/recipes-ti/bios/ti-dspbios_5.41.07.24.bb
deleted file mode 100644
index 536939e..0000000
--- a/recipes-ti/bios/ti-dspbios_5.41.07.24.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ti-dspbios.inc
-
-PV = "5_41_07_24"
-
-SRC_URI[biosbin.md5sum] = "18301d0e1d351bcece9ce97255b8ff1b"
-SRC_URI[biosbin.sha256sum] = "1531dca674154fbe179ad5017555e963bcf3d74a47a0fbf10e8a7009639d6c34"
-
-
diff --git a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb b/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
new file mode 100644
index 0000000..9e3b695
--- /dev/null
+++ b/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
@@ -0,0 +1,7 @@
+require ti-dspbios.inc
+
+PV = "5_41_11_38"
+
+SRC_URI[biosbin.md5sum] = "7fab13740c25f5b34b331bcdc759536e"
+SRC_URI[biosbin.sha256sum] = "96b8e090f79420a4c11d9c0c10d182d1d3b4afb48f11ec375c97b4c91970d0a0"
+
-- 
1.7.2.5


