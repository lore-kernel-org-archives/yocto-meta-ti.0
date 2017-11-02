Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D61DE00C59; Thu,  2 Nov 2017 12:27:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4361BE00AAF
	for <meta-ti@yoctoproject.org>; Thu,  2 Nov 2017 12:27:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA2JR5n6007942
	for <meta-ti@yoctoproject.org>; Thu, 2 Nov 2017 14:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509650825;
	bh=80X4QYh++OSZCrxzJtewQ7l4pkJD/g9iReqyAVAaRTM=;
	h=From:To:CC:Subject:Date;
	b=yzcdGvLnJ3zwEps1da91UTrwqtuYCz+Q2Wqb+rjjeNjOjd0QWnt9lY9Q36S8lZO8X
	J8An7mrVWq0drGbLtNGZxpdULEuu/HNGv7nqZ0KNDfOwZ007gjEmaxnlzL61G++if+
	O7F23XgfAHc98MGcSDQjIC1YgJO3QM5TOt3lLYOA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA2JR5mP023990
	for <meta-ti@yoctoproject.org>; Thu, 2 Nov 2017 14:27:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 2 Nov 2017 14:27:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 2 Nov 2017 14:27:03 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA2JR2ew032141;
	Thu, 2 Nov 2017 14:27:03 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 2 Nov 2017 15:19:29 -0400
Message-ID: <1509650370-29526-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] icss-emac-lld-rtos: add for TI RTOS
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
X-List-Received-Date: Thu, 02 Nov 2017 19:27:07 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---

* icss-emac-lld-rtos is a dependency for the board-rtos recipe.

 .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
new file mode 100644
index 0000000..882ce99
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "TI RTOS low level driver for ICSS-EMAC"
+
+inherit ti-pdk
+require icss-emac-lld.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS_append = " osal-rtos \
+                   pruss-lld-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_ICSS_EMAC_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "ICSS-EMAC LLD"
+
+INSANE_SKIP_${PN} = "arch"
-- 
2.7.4


