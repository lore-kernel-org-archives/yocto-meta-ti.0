Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE19AE00596
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 28 Feb 2012 07:16:42 -0800 (PST)
Received: by werm13 with SMTP id m13so1336547wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 28 Feb 2012 07:16:41 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.24.68 as permitted sender)
	client-ip=10.180.24.68; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.24.68 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.24.68])
	by 10.180.24.68 with SMTP id s4mr3126125wif.22.1330442201692 (num_hops
	= 1); Tue, 28 Feb 2012 07:16:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.24.68 with SMTP id s4mr2484590wif.22.1330442201630;
	Tue, 28 Feb 2012 07:16:41 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gm1sm22010947wib.7.2012.02.28.07.16.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 07:16:40 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 28 Feb 2012 16:16:37 +0100
Message-Id: <1330442197-10408-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmt4aNKwVgcKHlHe1jrydZVWfRHsHBpdQE0nPJtzKUGAXuvVItKL3ly2PKVzsGZnbiG1FSF
Subject: [PATCH] linux-davinci: quoting fixes
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
X-List-Received-Date: Tue, 28 Feb 2012 15:16:43 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-davinci_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-davinci_git.bb b/recipes-kernel/linux/linux-davinci_git.bb
index 1fda1ee..e4b85d6 100644
--- a/recipes-kernel/linux/linux-davinci_git.bb
+++ b/recipes-kernel/linux/linux-davinci_git.bb
@@ -22,13 +22,13 @@ ARAGO_L1_BR  = "master"
 ARAGO_L1_PV  = "2.6.32+2.6.33-rc4-${PR}+gitr${SRCREV}"
 ARAGO_L1_URI = "git://arago-project.org/git/projects/linux-omapl1.git;protocol=git;branch=${BRANCH} "
 
-SRCREV_hawkboard                  = ${ARAGO_L1_REV}
+SRCREV_hawkboard                  = "${ARAGO_L1_REV}"
 
-PV_omapl138             = ${ARAGO_L1_PV}
+PV_omapl138             = "${ARAGO_L1_PV}"
 
-BRANCH_omapl138         = ${ARAGO_L1_BR}
+BRANCH_omapl138         = "${ARAGO_L1_BR}"
 
-SRC_URI_append_omapl138 = ${ARAGO_L1_URI}
+SRC_URI_append_omapl138 = "${ARAGO_L1_URI}"
 
 SRC_URI_append_omapl138 = " file://logo_linux_clut224.ppm \
                                      file://0001-ahci-ti-Fix-currently-harmless-typo-in-SATA-PHY.patch \
-- 
1.7.2.5


