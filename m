Return-Path: <pabigot@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87AC0E01299
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:15 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by ghbg15 with SMTP id g15so4331512ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=2NOm/Ak5NHy6gU7ibWRcn7KDR4FEjgw3x0Sqha/vG7c=;
	b=G6QlC4mhfCYDVlAnMuYO3CQHX+aD6IAmOrD1RZX6rlain7MenpSqpIzfOk32j8OeJU
	C0g7ggaAJt/CRSCG3YzrhRlW1lsF0Rtc0gYA/PZo/yFYBGU0pSxt6gcEoVvqLTYKpyX4
	QE6TpfLEdn5KwQ8EACT/3GF4DT5vvg/xwQG08=
Received: by 10.236.138.131 with SMTP id a3mr40914402yhj.101.1325033535052;
	Tue, 27 Dec 2011 16:52:15 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id k10sm18006608anb.22.2011.12.27.16.52.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Dec 2011 16:52:14 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 27 Dec 2011 18:51:57 -0600
Message-Id: <1325033520-6907-3-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1325033520-6907-1-git-send-email-bigotp@acm.org>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 2/5] various: fix installation directories for corrected ti-eula-unpack
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
X-List-Received-Date: Wed, 28 Dec 2011 00:52:15 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 recipes-ti/bios/ti-dspbios.inc      |    3 ++-
 recipes-ti/devtools/ti-xdctools.inc |    3 ++-
 recipes-ti/edma3lld/ti-edma3lld.inc |    3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/bios/ti-dspbios.inc b/recipes-ti/bios/ti-dspbios.inc
index 8519039..0e3fa62 100644
--- a/recipes-ti/bios/ti-dspbios.inc
+++ b/recipes-ti/bios/ti-dspbios.inc
@@ -10,7 +10,8 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
 
-S = "${WORKDIR}/bios_${PV}"
+TI_BIN_UNPK_WDEXT="/bios_${PV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=biosbin"
 
diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-ti/devtools/ti-xdctools.inc
index c76ad80..547a555 100644
--- a/recipes-ti/devtools/ti-xdctools.inc
+++ b/recipes-ti/devtools/ti-xdctools.inc
@@ -12,7 +12,8 @@ S = "${WORKDIR}/xdctools_${PV}"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdctools_setuplinux_${PV}.bin;name=xdcbin"
 
 BINFILE="xdctools_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+TI_BIN_UNPK_CMDS="Y:workdir:Y"
+TI_BIN_UNPK_WDEXT="/ti"
 
 do_install() {
     install -d ${D}${XDC_INSTALL_DIR_RECIPE}
diff --git a/recipes-ti/edma3lld/ti-edma3lld.inc b/recipes-ti/edma3lld/ti-edma3lld.inc
index d4e8557..fb131b6 100644
--- a/recipes-ti/edma3lld/ti-edma3lld.inc
+++ b/recipes-ti/edma3lld/ti-edma3lld.inc
@@ -8,7 +8,8 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
 
-S = "${WORKDIR}/edma3_lld_${PV}"
+TI_BIN_UNPK_WDEXT="/edma3_lld_${PV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/${SRC_URI_edma3lldsite}/edma3_lld/edma3-lld-bios5/${PV}/exports/EDMA3_LLD_setuplinux_${PV}.bin;name=edma3lldbin"
 
-- 
1.7.6.4


