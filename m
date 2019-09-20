Return-Path: <santa@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DB06E00D8F; Fri, 20 Sep 2019 01:42:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66A74E00D54
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2019 01:41:59 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8K8fwac022275
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2019 03:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568968918;
	bh=B8WnVu4R7fHfyq8oCHCs3FTKdRu4hyDyG9NPiVYZMVw=;
	h=From:To:CC:Subject:Date;
	b=wR+/52d7CRSbmqu17Va/VEwRuPch6gRkIpNQsi/XODriTyjmm6+j49t8GItHrzlKt
	RazfH0AQO0FOP862apLR68OEiDiytf/klQmWa7wApi04RTSVUy6ZLKP+/UoxvrrL87
	wVO2PaahiC0vfdf+jjZ5BLvcI4eJ9hAIuJIIDLSw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8K8fw7p123890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2019 03:41:58 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 03:41:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 03:41:58 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8K8ftXQ084478; 
	Fri, 20 Sep 2019 03:41:56 -0500
From: Santhana Bharathi <santa@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>
Date: Fri, 20 Sep 2019 14:11:52 +0530
Message-ID: <1568968912-122733-1-git-send-email-santa@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: grygorii.strashko@ti.com, badri@ti.com, nsekhar@ti.com,
	prasad.jondhale@ti.com, santa@ti.com
Subject: [thud][PATCH V1] cpsw9g-eth-fw: update ethernet firmware
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
X-List-Received-Date: Fri, 20 Sep 2019 08:42:01 -0000
Content-Type: text/plain

* Updated the ethernet Fw to use PDK memory map
  so that it can run along with IPC apps in
  CoreSDK.
* Added stripped version of the firmware

Signed-off-by: Santhana Bharathi <santa@ti.com>
---
 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
index 29a5f1d..a521edf 100644
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -11,14 +11,14 @@ inherit update-alternatives
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "df7f399319ee401dfbda9317878128a0f718507f"
+SRCREV = "7f3af9b0b4c04edcb68c49cb64fcf0d65a860457"
 
 SRC_URI = "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
 CPSW9G_FW_DIR = "${S}/ethfw"
-CPSW9G_FW_FILENAME = "app_remoteswitchcfg_server.xer5f"
+CPSW9G_FW_FILENAME = "app_remoteswitchcfg_server_pdk_mem_map_strip.xer5f"
 
 # make sure that lib/firmware, and all its contents are part of the package
 FILES_${PN} += "${base_libdir}/firmware"
-- 
1.9.1


