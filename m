Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9661FE00C82; Mon, 16 Oct 2017 20:20:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A71BCE00CB0
	for <meta-ti@yoctoproject.org>; Mon, 16 Oct 2017 20:19:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9H3Jx0Q026662
	for <meta-ti@yoctoproject.org>; Mon, 16 Oct 2017 22:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508210399;
	bh=a/6zt50+uuHFqbjYWd6tm7b4Z2Fss/wMwlmnkrinMqc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IFa98o6lPRvsuIDOPRr8nWntG2DGXIF96JNgjqWx62PIwhbKxrKgvNzbE5Tb7TsKK
	bhVhSaaGbPAbQtBjGqxV0kewqFEHSuiGWkC/wppWnjoDCtVW4Hs3rc0JdjgLspg8uB
	mcuRXR79fkl8eLYeHxixLxGxCYMh4+gD9O0s/fR4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9H3JxDF024634
	for <meta-ti@yoctoproject.org>; Mon, 16 Oct 2017 22:19:59 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 16 Oct 2017 22:19:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 16 Oct 2017 22:19:58 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9H3Js4M023854;
	Mon, 16 Oct 2017 22:19:58 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 16 Oct 2017 23:19:51 -0400
Message-ID: <1508210393-54841-3-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1508210393-54841-1-git-send-email-sam.nelson@ti.com>
References: <1508210393-54841-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH v2 3/5] ti-xdctools: Update to new version 3.50.03.33
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
X-List-Received-Date: Tue, 17 Oct 2017 03:20:02 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/devtools/ti-xdctools_3.32.01.22.bb | 9 ---------
 recipes-ti/devtools/ti-xdctools_3.50.03.33.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
 create mode 100644 recipes-ti/devtools/ti-xdctools_3.50.03.33.bb

diff --git a/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb b/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
deleted file mode 100644
index 5f379c1..0000000
--- a/recipes-ti/devtools/ti-xdctools_3.32.01.22.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require recipes-ti/devtools/ti-xdctools-core.inc
-
-PV = "3_32_01_22"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
-
-SRC_URI[xdczip.md5sum] = "ddae5b765ca62783c1e804c75c463c38"
-SRC_URI[xdczip.sha256sum] = "b1c6620ef0b8eac45ef6a587f93b3238bdcf3b02dfd7e4b40d872a45c02c5cdc"
diff --git a/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
new file mode 100644
index 0000000..73ab3bd
--- /dev/null
+++ b/recipes-ti/devtools/ti-xdctools_3.50.03.33.bb
@@ -0,0 +1,9 @@
+require recipes-ti/devtools/ti-xdctools-core.inc
+
+PV = "3_50_03_33"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=1796f68c3d32d408415f5612f1f60652"
+
+SRC_URI[xdczip.md5sum] = "21310b647275a7c7dd5b37dcb96c0b1b"
+SRC_URI[xdczip.sha256sum] = "afe8616773e63b01e79e8cfacaf4d2c8d3b92c798c7f8cf5d1c7b5fe2060bbe4"
-- 
1.9.1


