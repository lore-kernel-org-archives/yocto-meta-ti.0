Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2027.1575350478928448349
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 21:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: gallagher.com, ip: 140.211.169.56, mailfrom: ankur.tyagi@gallagher.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70A36E01101; Mon,  2 Dec 2019 21:21:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
	SUBJ_OBFU_PUNCT_FEW,SUBJ_OBFU_PUNCT_MANY autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [203.167.229.98 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.7 SUBJ_OBFU_PUNCT_FEW Possible punctuation-obfuscated Subject: header
	*  1.5 SUBJ_OBFU_PUNCT_MANY Punctuation-obfuscated Subject: header
Received: from mail.gallagher.co.nz (mail.gallagher.co.nz [203.167.229.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A7C3E0082A
	for <meta-ti@yoctoproject.org>; Mon,  2 Dec 2019 21:21:15 -0800 (PST)
Received: from gglnzdom1.gallagher.local (Not Verified[172.16.0.58]) by mail.gallagher.co.nz  (using TLS: TLSv1.2, AES256-GCM-SHA384)
	id <B5de5f0c60000>; Tue, 03 Dec 2019 18:21:13 +1300
Received: from ubuntu.localdomain ([10.60.3.76])
          by gglnzdom1.gallagher.local
          with ESMTP id 2019120318211069-186181 ;
          Tue, 3 Dec 2019 18:21:10 +1300 
From: ankur.tyagi@gallagher.com
To: meta-ti@yoctoproject.org
Subject: [PATCH][thud,master] am335x-evm.conf: Use soft assignment for MKUBIFS_ARGS, UBINIZE_ARGS
Date: Mon, 2 Dec 2019 21:21:06 -0800
Message-Id: <20191203052106.5254-1-ankur.tyagi@gallagher.com>
X-TNEFEvaluated: 1

This is allow user to override them in their configuration

Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
---
 conf/machine/am335x-evm.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 92e6cf05..8bfbee84 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -24,7 +24,7 @@ SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 9900"
+MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 9900"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
@@ -32,4 +32,4 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 9900"
 # UBI: physical eraseblock size:   131072 bytes (128 KiB)
 # UBI: sub-page size:              512
 # UBI: VID header offset:          2048 (aligned 2048)
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+UBINIZE_ARGS ?= "-m 2048 -p 128KiB -s 512 -O 2048"
-- 
2.17.1


###########################################################################
This email is confidential and may contain information subject to legal 
privilege.  If you are not the intended recipient please advise us of our
error by return e-mail then delete this email and any attached files.  
You may not copy, disclose or use the contents in any way.  

The views expressed in this email may not be those of Gallagher Group 
Ltd or subsidiary companies thereof.
###########################################################################
