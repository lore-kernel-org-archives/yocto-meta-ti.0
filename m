Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BEACE00D18; Tue, 10 Oct 2017 09:34:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B94D4E00D0D
	for <meta-ti@yoctoproject.org>; Tue, 10 Oct 2017 09:34:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9AGYUPU024695
	for <meta-ti@yoctoproject.org>; Tue, 10 Oct 2017 11:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507653270;
	bh=H340QKmWXIr5QH5d4PmXIixWymvSX55ZCQ3ybnNjSrs=;
	h=From:To:CC:Subject:Date;
	b=eMh+bnsubPvxN9+BL+UWCqQ93pFun5Y2Y+RQBTT6Af+do2v5vq5OafNvceDVIv63s
	FD3QsQdaCqUSRU/fqMTvPaG9tQzYJvBEo4+MQz/pAn55NC23kE9mWdjxLy703fmwOy
	Bw/82PbcNideoq7iP3OgArkHZQmHoFMhNYl4hRDg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9AGYUCV020022
	for <meta-ti@yoctoproject.org>; Tue, 10 Oct 2017 11:34:30 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 10 Oct 2017 11:34:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 10 Oct 2017 11:34:30 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9AGYUVQ022493;
	Tue, 10 Oct 2017 11:34:30 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Oct 2017 12:34:24 -0400
Message-ID: <1507653264-7454-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [PATCH] pruss-lld-test: do compile and install for all devices in TI_PDK_LIMIT_SOCS
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
X-List-Received-Date: Tue, 10 Oct 2017 16:34:32 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
index 7fdbfb6..90764d1 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
@@ -4,18 +4,26 @@ DEPENDS="common-csl-ip pruss-lld osal"
 
 include pruss-lld.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
 
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PRUSS_SRC_DIR=${S}"
 
+DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
+
 do_compile () {
 #   Build the tests
-    oe_runmake tests
+    for device in ${DEVICE_LIST}
+    do
+        oe_runmake tests DEVICE="$device"
+    done
 }
 
 do_install () {
 #   Install the binary
-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir}
+    for device in ${DEVICE_LIST}
+    do
+        oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+    done
 }
-- 
1.9.1


