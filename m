Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A625EE003E1; Fri,  1 Nov 2019 10:53:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SUBJ_OBFU_PUNCT_FEW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
	low *      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	* 0.7 SUBJ_OBFU_PUNCT_FEW Possible punctuation-obfuscated Subject:
	header
X-Greylist: delayed 504 seconds by postgrey-1.32 at yocto-www;
	Fri, 01 Nov 2019 10:53:04 PDT
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4960BE00E83
	for <meta-ti@yoctoproject.org>; Fri,  1 Nov 2019 10:53:03 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 58AE440C07;
	Fri,  1 Nov 2019 17:44:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id C5Tpa1lHWrCF; Fri,  1 Nov 2019 17:44:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D2AE40BE8;
	Fri,  1 Nov 2019 17:44:37 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5BC341742A1;
	Fri,  1 Nov 2019 13:44:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri,  1 Nov 2019 13:44:36 -0400
Message-Id: <1572630276-20299-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] am335x-evm: bump max_leb_cnt
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
X-List-Received-Date: Fri, 01 Nov 2019 17:53:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index d1e1603..be3ed67 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -24,7 +24,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 9200"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 9300"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
-- 
2.7.4


