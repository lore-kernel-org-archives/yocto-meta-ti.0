Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2934BE00B5F; Wed, 22 May 2019 09:39:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1CCAE0043B
	for <meta-ti@yoctoproject.org>; Wed, 22 May 2019 09:39:07 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4MGd6qm042039
	for <meta-ti@yoctoproject.org>; Wed, 22 May 2019 11:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1558543146;
	bh=aNVPlM62L9zHgLWy0C0GhuFaJSzz1jEs928AQEVF/FI=;
	h=From:To:CC:Subject:Date;
	b=T0NjupGkMaYaKV6VItaVVHp5eNdKJgqW8B+QDB+qpShZwx5moI6N/MQUGM4acZOZp
	VIc/QCOMgUgwoVkG+qEu75WoiqvFsZQSp1mJQXkx6iSwSi974kf44iLHHrANI3LoT2
	PKtWA1TxUt8Zqx5hoMwwdQMt0dcRS5L2J/JhWYqc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4MGd6Lr118544
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 22 May 2019 11:39:06 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 22 May 2019 11:39:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 22 May 2019 11:39:06 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4MGd6fF017390;
	Wed, 22 May 2019 11:39:06 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 22 May 2019 12:23:01 -0400
Message-ID: <1558542181-18218-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] vps-lld-rtos: fix DEPENDS
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
X-List-Received-Date: Wed, 22 May 2019 16:39:08 -0000
Content-Type: text/plain

* Add to the dependencies set in ti-pdk.bbclass so that we get tools
  such as XDC.
* Set the edma3-lld path so the makefile can push it onto XDCPATH.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
index a06aae4..e2834a6 100644
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -25,7 +25,9 @@ PR = "r0"
 
 S = "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
 
-DEPENDS = " ti-sysbios \
+# Add to DEPENDS set in ti-pdk.bbclass
+DEPENDS_append = " \
+            ti-sysbios \
             osal-rtos \
             edma3-lld-rtos \
             board-rtos \
@@ -39,6 +41,9 @@ export DEST_ROOT="${S}"
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
+# The makefile will push these on the XDCPATH
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+
 do_compile_append() {
     # Delete archive created by XDC release command since it does not contain all content
     find -name "*.tar" -exec rm -f {} \;
-- 
2.7.4


