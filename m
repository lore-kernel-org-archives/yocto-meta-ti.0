Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E082E00A0C; Fri, 20 Apr 2018 12:38:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2D6BE00843
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2018 12:38:13 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 40C1A20AF8;
	Fri, 20 Apr 2018 19:38:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id O7_bwNZKvekQ; Fri, 20 Apr 2018 19:38:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1B8632079D;
	Fri, 20 Apr 2018 19:38:11 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 82EDB1633B1;
	Fri, 20 Apr 2018 15:38:11 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Apr 2018 15:38:11 -0400
Message-Id: <1524253091-2434-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] conf/machine: bump max_leb_cnt for am3
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
X-List-Received-Date: Fri, 20 Apr 2018 19:38:14 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 25d7b73..e54ee1d 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -25,7 +25,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 7000"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
-- 
2.7.4


