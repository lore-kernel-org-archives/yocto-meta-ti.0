Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29A74E0056D; Tue, 30 Jan 2018 12:11:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98358E0056D
	for <meta-ti@yoctoproject.org>; Tue, 30 Jan 2018 12:11:32 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id t134so11797693qke.5
	for <meta-ti@yoctoproject.org>; Tue, 30 Jan 2018 12:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:organization;
	bh=wFsWeiJ6SCwe9beKzedBGFU3JpnDUGHVisXVtohTNg0=;
	b=Gk4/cob7VgxGgiGP1/fJzDOetyLAQ0mHoSlTvH2Wa+g6Xtjgnc/x5nO9ttdEKp3Sw6
	6LTakZUmhmNqCqmDsVzjydeN1MDnXK1UHA6Ssn/IrB32qrwv11c4R/7IsWF+ANC+O/TY
	2Jtgzb5NdmIhZuLKmp4yMwYe5utd9M3Bb3wsIsjPvvokPKc7gzLnnpyYwiJ0EwGPo5Rg
	jw1G/CDa+ADE1lW7WXy6h5gOgLIxxe+dMCCY30jh9IMzIukbEnvqVl42JfTIYaFpCGdp
	+xm7ROhJDlaDUDhZJ5c4qB3NwxLnJ9DPPk7C4qYiANma42rAWY5ZjwVPSin+xYUydjO1
	8zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:organization;
	bh=wFsWeiJ6SCwe9beKzedBGFU3JpnDUGHVisXVtohTNg0=;
	b=qxA9Tn/VpcDMOUZFfPO2qtuBOTE/i5ggtGNiDD/q6O8fQmRLw2rmYm8Ku5pM3EV+1v
	LZqO0eeZvZL/vSAU2XLKMyYKi1cVuDHvuWxhoMxG6c50xBiwNZKE1ahB2WO/r0GSEmn/
	go/SGXTSrKPn9LwyqcGTy9xv3tfUI4AdIQP/3QDGoLuBFrsbtgQj7s8fQf4jO1LJklkW
	32ZYCsp6I29DduPaVaD0LPpE1CcddCg5jTaYpuYX2j06/sgtxrSdDcwpurqXcfAkW1Li
	HO4I+acvj97XXmJIcAaUu6vnxR8OlNs10VfRANvLz2BAvBLCo9+62xl79AwL00tHPuWu
	JqmQ==
X-Gm-Message-State: AKwxytegQW1leW3idYQqyc91dpI3m015NaSpULau3b0KxfoXI/7NjMYZ
	a5qyJfgwABalbwLa80kk8qKGxXqD
X-Google-Smtp-Source: AH8x2248AE3e08jeh0vZalHSfJrrOp+3x2Z9lV+3i7hrctEkcQFFoRav01grIkNW7S+GEnLH9hXfDQ==
X-Received: by 10.55.168.83 with SMTP id r80mr44402859qke.89.1517343091188;
	Tue, 30 Jan 2018 12:11:31 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	e16sm12563860qtk.32.2018.01.30.12.11.29
	for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jan 2018 12:11:30 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Tue, 30 Jan 2018 18:11:15 -0200
Message-Id: <20180130201115.13973-1-fabio.berton@ossystems.com.br>
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
X-List-Received-Date: Tue, 30 Jan 2018 20:11:33 -0000

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


