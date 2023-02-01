Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE8AC636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:31:42 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.24883.1675261899280431620
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Feb 2023 06:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4 header.b=s3VBhlVa;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: w.egorov@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1675261896; x=1677853896;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RmEXm14UQ+fHqzs3H0HB+0m3NyjwQsD+YBUkZkRJhTA=;
	b=s3VBhlVaHmJte3YBwCsE+fa56etz0JZlL1rczyFv3/POTGMFsTWXhWkGBEqJhWl0
	f+D+KoFx/aa24bdifbvsWCMQaoGagvkZ8DfTM2o6r5klwoKPt1X89Xc6EV4l5yTv
	1RvrNhfCuRSa9ED7Tth8adyEtDtQKv0kRUxEgdgD8sg=;
X-AuditID: ac14000a-923ff70000007ecb-70-63da77c81c40
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id C3.09.32459.8C77AD36; Wed,  1 Feb 2023 15:31:36 +0100 (CET)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 1 Feb
 2023 15:31:48 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <upstream@lists.phytec.de>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell] ti-rtos-firmware: Check if TI_SECURE_DEV is set before signing
Date: Wed, 1 Feb 2023 15:31:26 +0100
Message-ID: <20230201143126.3003913-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOLMWRmVeSWpSXmKPExsWyRpKBR/dE+a1kg1O7FSzmfrnFZtH9Tt2B
	yaO/u4XVY+apR8wBTFFcNimpOZllqUX6dglcGXOWtLEUfBCquPh4OWsD4yq+LkZODgkBE4mH
	TX/Yuhi5OIQEFjNJTFx5ignCecwoMX3fRiaQKjYBdYk7G76xgtgiAg4SPdu/soDYwgKBEusf
	rGcEsVkEVCRmrj/BDmLzClhKrLm8gg1ig7zEzEvfoeKCEidnPgHrZQaKN2+dzQxhS0gcfPEC
	zBYCir+4tJwFpnfaudfMEHaoxJFNq5kmMPLPQjJqFpJRs5CMWsDIvIpRKDczOTu1KDNbryCj
	siQ1WS8ldRMjKPBEGLh2MPbN8TjEyMTBeIhRgoNZSYRXketmshBvSmJlVWpRfnxRaU5q8SFG
	aQ4WJXHe+z1MiUIC6YklqdmpqQWpRTBZJg5OqQbGTa788tP4tjD2qu+5fKfXlIEntk/p9pV3
	PMv0DtrtcX11cbkBh5c5d7BFUVwfc9IWofuh70+YGazcErt+Jm9r8cPnrEIprGsrbWInqUY9
	nVwb3nU2Vu5Pwy87LZv3BndDQ8yUMko/m5w6bnqt5scM/ZuV7dsqZ0j/Lu1mjA52dhXVPe2n
	elmJpTgj0VCLuag4EQCHb2zUKgIAAA==
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Feb 2023 14:31:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15718

Check if ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh is set
before signing firmware for am62xx based machines. Otherwise do not
sign, instead copy the binary and warn about it.

Fixes
  run.do_install: 111: /scripts/secure-binary-image.sh: not found

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 72d85a6b..66c6a4e4 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -179,12 +179,23 @@ do_install_prepend_am62xx() {
         export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+                if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
+                    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+                else \
+                    echo "Warning: TI_SECURE_DEV_PKG not set, ${DM_FIRMWARE} not signed."; \
+                    cp ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+                fi; \
         )
         ( cd ${RTOS_IPC_FW_DIR}; \
                 mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
-                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f \
-                    ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed; \
+
+                if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
+                    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f \
+                        ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed; \
+                else \
+                    echo "Warning: TI_SECURE_DEV_PKG not set, ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f not signed"; \
+                    cp ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed; \
+                fi; \
         )
 }
 
-- 
2.25.1


