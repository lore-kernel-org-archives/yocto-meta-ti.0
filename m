Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FA44E013BA
	for <meta-ti@lists.yoctoproject.org>;
	Sun,  4 Mar 2012 23:32:54 -0800 (PST)
Received: by wico1 with SMTP id o1so1488599wic.26
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 04 Mar 2012 23:32:53 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.105.194 as permitted sender)
	client-ip=10.180.105.194; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.105.194 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.105.194])
	by 10.180.105.194 with SMTP id go2mr1743081wib.22.1330932773729
	(num_hops = 1); Sun, 04 Mar 2012 23:32:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.105.194 with SMTP id go2mr1350832wib.22.1330932773653;
	Sun, 04 Mar 2012 23:32:53 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id bg3sm19023928wib.10.2012.03.04.23.32.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 23:32:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon,  5 Mar 2012 08:32:46 +0100
Message-Id: <1330932767-3234-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmtiZZQp9ackLr86xf5BHfGzj6PbqyG+PaQaCgXOdI2UsHpmef1cvS280Sy3V3c81zNoHXQ
Subject: [PATCH 1/2] bonescript: update to latest git
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
X-List-Received-Date: Mon, 05 Mar 2012 07:32:55 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/bonescript.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-misc/payload/bonescript.bb b/recipes-misc/payload/bonescript.bb
index 3361cb4..b1e92df 100644
--- a/recipes-misc/payload/bonescript.bb
+++ b/recipes-misc/payload/bonescript.bb
@@ -1,18 +1,18 @@
 DESCRIPTION = "Scripting tools for the BeagleBoard and BeagleBone"
 
-PR = "r13"
+PR = "r14"
 
 inherit systemd
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=659ee0c98db2664403c769d6b9ab50eb"
 
-SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-8898f4ee4ae2548642679626a03e332a4cd43331.tar.bz2 \
+SRC_URI = "http://dominion.thruhere.net/koen/angstrom/beaglebone/bonescript-ca0f663083cea4e434864aa276d46ff79d471dff.tar.bz2 \
            file://bonescript-git \
            file://bone101.service \
           "
-SRC_URI[md5sum] = "306278a2afc10b75f4fc886918fb02b7"
-SRC_URI[sha256sum] = "01c87e59adcc663365c664b0731f0e5a23feeae1965a5cd5edd3e89255f8a30b"
+SRC_URI[md5sum] = "2b7edd83a752eaf0be0c7488d32c7e72"
+SRC_URI[sha256sum] = "839ee1147b83924f259dc5e373d73eb0eaa6ece76322dc156a6b04113fa89a91"
 
 S = "${WORKDIR}/bonescript"
 
-- 
1.7.2.5


