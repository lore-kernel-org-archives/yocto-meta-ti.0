Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BA45E00E05; Tue, 30 Jan 2018 12:08:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F07BE0056D
	for <meta-ti@yoctoproject.org>; Tue, 30 Jan 2018 12:08:44 -0800 (PST)
Received: by mail-qk0-f196.google.com with SMTP id n129so1036665qke.6
	for <meta-ti@yoctoproject.org>; Tue, 30 Jan 2018 12:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:organization;
	bh=wFsWeiJ6SCwe9beKzedBGFU3JpnDUGHVisXVtohTNg0=;
	b=woF7mFSKHd4rTxtNhkwMuy1Vr32/yNJjvCpJLepCSf7HpeNB+tq+ye16OItXH1Ka/f
	FfD6jefWjakErxf9lyH3PL67S9PRtR0XlYExMVxBLLn0wrIPAPV5OG6Y4dtmF4/uMvOM
	1TxUuHEsoQsBlqsT2Rr2xFxv0KhJYVsuoGijDdHJdGf74qY0tbhZc/4QRRn0IyZVN+2o
	eKrg5Ayf31G4vSUgREKB7v9sxwHscF3IYiyOY4ieS8GBO+22BkPxXbCz8lvw05s5k9UO
	KiYZDutEZzsOj677scpIt+rPVjPCs0Mqq92tknriKGPjVolJpdjjhxBsFB5E4mCbYaQX
	bGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:organization;
	bh=wFsWeiJ6SCwe9beKzedBGFU3JpnDUGHVisXVtohTNg0=;
	b=HlvjKkwYf4VYbO8KEMTZMl5wE6Js3232TOeD1xZo+5yHElGCgG+GzmU7jRXDH0WpZK
	awKhgPY4yA+oEIq9X5mxTTceIeDZ4JuAnthmoiKEZhk1aZfxQ8SFALemyZomKMNKSTw5
	JzlCQbzIFF5Pfa/eRdM4u51JqQm4F6QN93mQvjGw6F34G+mJpX4z3DiuuQZDmbSoRqU7
	fV/Gy6Rd2+oSQr9MJLbcdoylllZslPqQsO9vkZP56sGdG0zyS/cDLNx0RLCrUORe+qdL
	uBY4/a90XVS6fx4YStsBuEFgjxLTVgahpaOiym07z0RtyBD0daSLBC+HdM1d7oprWlYJ
	bBXA==
X-Gm-Message-State: AKwxyteOqUKKOst7Q56RnN9m94HyMd3RzFAP6y9+jpLSKJ6W+9WkqteH
	49ORM5z9RJWTj5nQ4vCsLmKo8Brl
X-Google-Smtp-Source: AH8x226wIOnUS4oq4WFwwtOjVvjMbFOWaBIixx7OLSoExenfVaPaRNWdGujaXDdg1hkkU56T4s3NhQ==
X-Received: by 10.55.198.79 with SMTP id b76mr44508733qkj.136.1517342923823;
	Tue, 30 Jan 2018 12:08:43 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	l189sm9727424qkc.54.2018.01.30.12.08.42
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jan 2018 12:08:43 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Tue, 30 Jan 2018 18:08:28 -0200
Message-Id: <20180130200828.13817-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] recipes-ti: Don't use deprecated functions from utils.bbclass
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
X-List-Received-Date: Tue, 30 Jan 2018 20:08:45 -0000

From OE-Core commit c97acbd034532895ce57c6717ed1b3ccc7900b0d:

These functions were moved to meta/lib/oe in 2010 and the base_* functions in
utils.bbclass were intended to be a short-term compatibility layer.  They're
still used in a few places, so update the callers to use the new functions.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 recipes-ti/dsplink/ti-dsplink.inc                         | 2 +-
 recipes-ti/local-power-manager/ti-local-power-manager.inc | 2 +-
 recipes-ti/syslink/ti-syslink.inc                         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index e0096155..606b9e5c 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -150,7 +150,7 @@ do_compile() {
       all
 }
 
-KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
+KERNEL_VERSION = "${@oe.utils.read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
 
 do_install () {
 	
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager.inc b/recipes-ti/local-power-manager/ti-local-power-manager.inc
index 0e5d4f29..5321251a 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
+++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
@@ -92,7 +92,7 @@ do_compile () {
     XDCPATH=${S} ${XDC_INSTALL_DIR}/xdc -PR .
 }
 
-KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
+KERNEL_VERSION = "${@oe.utils.read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
 
 do_install () {
 
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index 5ff6af7c..0968a986 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -181,7 +181,7 @@ do_compile() {
 	 `${XDC_INSTALL_DIR}/bin/xdcpkg ${SYSLINK_ROOT}/ti/syslink | grep samples`
 }
 
-KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
+KERNEL_VERSION = "${@oe.utils.read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
 
 do_install () {
 
-- 
2.14.2


