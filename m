Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6CB6E0214A; Wed, 13 Jun 2018 10:14:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92BE3E01FEC
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2018 10:14:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5DHEbF7009461
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2018 12:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528910077;
	bh=3G8VnRqfGZyIjoAzJrYBjcTGOFwpaxcnBXEgxKhKB4M=;
	h=From:To:CC:Subject:Date;
	b=vnuXJC3AwIddEHRBM43saun8WnU2dpq9NKC/I+UxSQrB88qT3WiANkabdoF9peoUo
	jyZcfm5zONZQkaG/kwZcAB3/PQqr/FwPG0jXe/cpkpO+lpXziUHfwHEAhyx5FOqYEe
	7BI8RHOmO8CuDPcu/7Juu+dHCIG8O1xYetAON+kc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DHEafV029409
	for <meta-ti@yoctoproject.org>; Wed, 13 Jun 2018 12:14:37 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 13 Jun 2018 12:14:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 13 Jun 2018 12:14:36 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5DHEaC9022420;
	Wed, 13 Jun 2018 12:14:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 13 Jun 2018 17:14:07 +0000
Message-ID: <20180613171407.26372-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH][rocko/master] conf/machine/*hs*.conf: drop OPTEEOUTPUTMACHINE variable
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
X-List-Received-Date: Wed, 13 Jun 2018 17:14:39 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am437x-hs-evm.conf | 1 -
 conf/machine/am57xx-hs-evm.conf | 1 -
 conf/machine/dra7xx-hs-evm.conf | 1 -
 3 files changed, 3 deletions(-)

diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
index 34c10166..7b151958 100644
--- a/conf/machine/am437x-hs-evm.conf
+++ b/conf/machine/am437x-hs-evm.conf
@@ -15,4 +15,3 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
 
 OPTEEMACHINE = "ti"
 OPTEEFLAVOR = "am43xx"
-OPTEEOUTPUTMACHINE = "ti"
diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index 4d3eb006..f6e2febb 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -15,5 +15,4 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
 
 OPTEEMACHINE = "ti"
 OPTEEFLAVOR = "am57xx"
-OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index 9b029856..7ca2521d 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -15,5 +15,4 @@ TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
 
 OPTEEMACHINE = "ti"
 OPTEEFLAVOR = "dra7xx"
-OPTEEOUTPUTMACHINE = "ti"
 OPTEEPAGER = "y"
-- 
2.17.1


