Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4854AE00D87; Wed, 20 Dec 2017 13:32:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCEC0E008FB
	for <meta-ti@yoctoproject.org>; Wed, 20 Dec 2017 13:32:03 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBKLW3P8029298
	for <meta-ti@yoctoproject.org>; Wed, 20 Dec 2017 15:32:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513805523;
	bh=2u1Ra9m+PRPhh+8e5DVkz6tyK72u/RvBFIWvz37QtXw=;
	h=From:To:Subject:Date;
	b=uMUNsSw/T+8kZ+zJT7HO7sSY5ZFRkv6RzYjOYP8La0rDN0VC1PwmnQHHu1Cou5dsq
	S9OwTErbsMwWIhLhH7G/OkMAmJKfehM8eRjOXayukChMzXGZAu+9EL6XonBh2L5nJM
	Dmep0qYjLkAJ3w1FC6bPsk5faL5hV8TjxdV7aABc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBKLW3gA013595
	for <meta-ti@yoctoproject.org>; Wed, 20 Dec 2017 15:32:03 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 20 Dec 2017 15:32:02 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 20 Dec 2017 15:32:02 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBKLW2xp028996
	for <meta-ti@yoctoproject.org>; Wed, 20 Dec 2017 15:32:02 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 Dec 2017 16:32:01 -0500
Message-ID: <1513805521-7825-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] am57xx-evm.conf: Adding support for AM574x
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
X-List-Received-Date: Wed, 20 Dec 2017 21:32:04 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 conf/machine/am57xx-evm.conf      | 2 +-
 conf/machine/include/omap-a15.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index e4a4051..6e2eedf 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -42,4 +42,4 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
 # Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_BOARDS = "evmAM571x evmAM572x idkAM571x idkAM572x"
+TI_PDK_LIMIT_BOARDS = "evmAM571x evmAM572x idkAM571x idkAM572x idkAM574x"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 11620a9..cda9e0c 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -36,4 +36,4 @@ UBI_VOLNAME = "rootfs"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx mmip dsp"
 
 # Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "am571x am572x"
+TI_PDK_LIMIT_SOCS = "am571x am572x am574x"
-- 
1.9.1


