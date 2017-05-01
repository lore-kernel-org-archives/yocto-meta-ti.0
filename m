Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0CD5E00AF0; Mon,  1 May 2017 11:34:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0BBDE00AA2
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 11:34:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41IY4tI029653
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 13:34:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493663644;
	bh=HKE0+R2atiaUxmSj1HtWEWMuWgInZdfvht/GZQ0SUEs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tdQe9mt1449s/MdFMuBiCB+mUOR2OeLnupfrdgej50n3K1Ck3I5NwG2eG1B4YQZ3I
	q3e26z48RkOhLzpguzgCclE5DboLYF0lVN/WhRdtaPxgPluJhd1kiTojgSJJCpn6MJ
	puVgTsHYxrJJITya0aye9MW9pdeWkoqTxaIXx9k0=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41IY3Vj022388
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 13:34:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 13:34:03 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v41IY3aO007659;	Mon, 1 May 2017 13:34:03 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.109.252])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v41IY3328283; Mon, 1 May 2017 13:34:03 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 May 2017 13:33:59 -0500
Message-ID: <20170501183359.1645-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170501183359.1645-1-dmurphy@ti.com>
References: <20170501183359.1645-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] boot-monitor: update to ti2017.01-rc2 tag
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 01 May 2017 18:34:09 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index e4ea67f6..1b6f3206 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,7 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "u-boot-mkimage-native"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
-SRC_URI += "file://0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch"
 
 PV = "4.0+git${SRCPV}"
 
@@ -16,7 +15,7 @@ BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "d7b2bbd419400228da621f445526e519b56aef93"
+SRCREV = "e1f885ab6dc544884728e333cc6e396f7eb08286"
 
 BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 
-- 
2.12.2


