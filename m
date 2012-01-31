Return-Path: <pabigot@gmail.com>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BFBBAE0139E
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:18 -0800 (PST)
Received: by mail-yx0-f176.google.com with SMTP id l9so2623031yen.35
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=2LO7DjTlUuhrjKEbD7M1rkv4/3lkP0AkM2cnsJpkgFQ=;
	b=BB3CvDCuiRWyKffXd2PuBGdSCZITtrpJOKVh0fRacFsHOLp+QxKIMoBNvDe+hgos62
	L9bpdaYots05uV19NxbtJ+bb5UsRgD7NGMpWzSv8g3LoR7y4PaWUPieNmfEuqxhuZnT/
	7W4QMr78kt/uNRDDvvZipU4xWRTyqrhTKFa0o=
Received: by 10.236.187.5 with SMTP id x5mr33647228yhm.35.1328013678443;
	Tue, 31 Jan 2012 04:41:18 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id t13sm55432563anh.2.2012.01.31.04.41.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 04:41:17 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 31 Jan 2012 06:40:56 -0600
Message-Id: <1328013657-2069-4-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328013657-2069-1-git-send-email-bigotp@acm.org>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 3/4] ti-codecs-omap3530: fix for corrected ti-eula-unpack
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
X-List-Received-Date: Tue, 31 Jan 2012 12:41:19 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Remove directory prefix for tar files that use TI_BIN_UNPK_CMDS that
specifies unpacking into workdir; formerly that specification was ignored
and these were unpacked into a package-specific subdirectory of
${HOME}=${WORKDIR}.  Note c64xplus_deinterlacer overrides TI_BIN_UNPK_CMDS
and does not specify workdir, so its prefix is correct.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
index ae218b1..ea9f389 100644
--- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
+++ b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
@@ -77,43 +77,43 @@ python do_unpack () {
     bb.build.exec_func('base_do_unpack', d)
 
     bb.data.setVar("BINFILE", "omap3530_h264enc_2_01_013_production.bin", d)
-    bb.data.setVar("TARFILE", "h264enc_dm6467_1_20_00_08/omap3530_h264enc_2_01_013_production.tar", d)
+    bb.data.setVar("TARFILE", "omap3530_h264enc_2_01_013_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "omap3530_h264dec_2_01_007_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_h264dec_2_01_007_production/omap3530_h264dec_2_01_007_production.tar", d)
+    bb.data.setVar("TARFILE", "omap3530_h264dec_2_01_007_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "omap3530_jpegenc_02_01_01_00_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_jpegenc_02_01_01_00_production/omap3530_jpegenc_02_01_01_00_production.tar", d)
+    bb.data.setVar("TARFILE", "omap3530_jpegenc_02_01_01_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_jpegdec_02_00_01_01_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_jpegdec_02_00_01_01_production/c64xplus_jpegdec_02_00_01_01_production.tar", d)
+    bb.data.setVar("TARFILE", "c64xplus_jpegdec_02_00_01_01_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_mpeg2dec_02_00_02_00_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_mpeg2dec_02_00_02_00_production/c64xplus_mpeg2dec_02_00_02_00_production.tar", d)
+    bb.data.setVar("TARFILE", "c64xplus_mpeg2dec_02_00_02_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "omap3530_mpeg4enc_02_04_00_00_production.bin", d)
-    bb.data.setVar("TARFILE", "omap3530_mpeg4enc_02_04_00_00_production/omap3530_mpeg4enc_02_04_00_00_production.tar", d)
+    bb.data.setVar("TARFILE", "omap3530_mpeg4enc_02_04_00_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)   
 
     bb.data.setVar("BINFILE", "c64xplus_mpeg4dec_02_01_00_00_production.bin", d)
-    bb.data.setVar("TARFILE", "h264enc_dm6467_1_20_00_08/c64xplus_mpeg4dec_02_01_00_00_production.tar", d)
+    bb.data.setVar("TARFILE", "c64xplus_mpeg4dec_02_01_00_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_aachedec_01_30_03_00_production.bin", d)
-    bb.data.setVar("TARFILE", "c64xplus_aachedec_01_30_03_00_production/dm6446_aachedec_01_30_03_00_production.tar", d)
+    bb.data.setVar("TARFILE", "dm6446_aachedec_01_30_03_00_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
-    bb.data.setVar("TARFILE", "h264enc_dm6467_1_20_00_08/dm6446_g711enc_1_12_00_000_production.tar", d)
+    bb.data.setVar("TARFILE", "dm6446_g711enc_1_12_00_000_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_g711_1_12_00_000_production.bin", d)
-    bb.data.setVar("TARFILE", "h264enc_dm6467_1_20_00_08/dm6446_g711dec_1_12_00_000_production.tar", d)
+    bb.data.setVar("TARFILE", "dm6446_g711dec_1_12_00_000_production.tar", d)
     bb.build.exec_func('ti_bin_do_unpack', d)
 
     bb.data.setVar("BINFILE", "c64xplus_deinterlacer_01_00_00_07_production.bin", d)
-- 
1.7.6.4


