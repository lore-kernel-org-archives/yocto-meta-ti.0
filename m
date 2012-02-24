Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C08C3E0059A
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 24 Feb 2012 04:38:12 -0800 (PST)
Received: by werp13 with SMTP id p13so1627638wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 24 Feb 2012 04:38:11 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.99.100 as permitted sender)
	client-ip=10.180.99.100; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.99.100 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.99.100])
	by 10.180.99.100 with SMTP id ep4mr4705067wib.7.1330087091354 (num_hops
	= 1); Fri, 24 Feb 2012 04:38:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.99.100 with SMTP id ep4mr3791982wib.7.1330087091296;
	Fri, 24 Feb 2012 04:38:11 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id hs6sm8033351wib.2.2012.02.24.04.38.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 04:38:09 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Fri, 24 Feb 2012 13:38:03 +0100
Message-Id: <1330087083-7390-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmmOEsbKzybCkWLqVV5rbAfaJqSRM+RcIH7lj64dYGpE8LAuiY4efjpVIHZLUxP72W4TnHe
Subject: [PATCH] libgles-omap3: fix S for IJ unpack changes
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
X-List-Received-Date: Fri, 24 Feb 2012 12:38:13 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libgles/libgles-omap3_4.03.00.02.bb            |    2 +-
 .../libgles/libgles-omap3_4.05.00.03.bb            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
index f605ec0..97a22fe 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
@@ -26,5 +26,5 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
 SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
 SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
 
-S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}"
 
diff --git a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
index 0092221..53585cf 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
@@ -22,5 +22,5 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
 SRC_URI[md5sum] = "0e651eaa92bb91760f0b40a17697a7dc"
 SRC_URI[sha256sum] = "bfe764a8959556195545d6fff76f63a489642f345c105bbbc309a3f243c2dd0e"
 
-S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}"
 
-- 
1.7.2.5


