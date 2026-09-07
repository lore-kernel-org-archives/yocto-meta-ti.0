Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AB4C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:10:51 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29999.1788768648368051191
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=dGT2DA2A;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=AqXYKQV3;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68775viL2615545
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Sep 2026 03:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=CbGWYRFABJwmg
	aDvFkQC3b6zCn3Wyk+KsI8LDxAz7cY=; b=dGT2DA2A6Wftk4E3+gtESIeeJlDs3
	ut9EuV16Qd+1UBEbjb9fhOvbIyKqgFf8FIr3Oki4JLD+JJBxj9R/NgI4wUBQOx7G
	zgdtCoNMayMOPjtnkHgDxtGrg90Fx8OLXml0Igh0eGuz9mrxtg1c5Z967Q1EEgTY
	XlsuBUNuCWG1DUyV/G2mf2eTws9xW+FEIK87L1qSE1F3Srbhtdbuuvc6DcOlTNaf
	ioSjpprGgukQjLRWZBAu5BF994Neaj6vUSVV+TPER4KtQpI0Jy4Sz+uRVJWHa+/h
	+LNJrBSxvUr/rZv+m/wdofsdyI2iimDsHrdEBmai496qMhMQZBbLrWvpw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gh43n4gqw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 03:10:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EE9E4d4EKJfw/UjpSR0rIhjmjexzxF6ajplPjtOF0QJvItrIVjMo3zxF4DW0wWzdi0foIF+hA/+Xe5mv6Xbna6j8TzNqhsuE174ysFnETyvu8Y+sKDGKFzbdmGycRGf8UKnHT8vhEjY/nAzz2lLKP0MXUPAnONweTZYgM7udXATzC/uxAec7sNpedH4ODj2RZcAvX4pPWoMKP6u2Bh42YthKorItJtZ/1nfxFzuKsDl67C80rNLemtsbrzcS5h3pE5xeiYKgBXxWvsJO1bAhMYCUV0K0lqJuJ7hmXV6Trpx/LPzxOJBA1QYENqWecpFB/A0MbkDujcYuf2u6TI1HzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbGWYRFABJwmgaDvFkQC3b6zCn3Wyk+KsI8LDxAz7cY=;
 b=Ca7LXC+WgOC0V0V3z+aNTrNnEjE+3mX41jTq3NsrrFUA8DI94X7n0CV6ZVjuYaTnyycBaJuwlNiiMfHjwyTQejFbYO+D/Q6qJLyS4SdIKrvOIEmCupWqybop4BXSrjRbD5HOQx0p/rh+SLnNKFVDpMFI8wT0yAEk86Un4g5CF9DJQjKwbfHwZIukdcKFlNpXqQlhFe6Octes1jHGNnrQ23G5VjIIyts9UDJ1rW0lrGH+KqYxT4fP8yMZauPs2kt7zo3FmxayYl8i5oMoPRWB8WRrHqbx393+lW7eTCaLkXiAICekUn15Gjw3Rbs+m0CRo4TEyvmnrUfZNciYoiylfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbGWYRFABJwmgaDvFkQC3b6zCn3Wyk+KsI8LDxAz7cY=;
 b=AqXYKQV3rAxmxVfuVZ+I7Vcc4zrWWbW5NBc/5QvCDQhwkVOF/hpzEgXZiC2hS6Lpousk6uQbzZH6HvXssVQ8Tqm85Hxi3GtEWi+LGp2p2x/r//lgGj8TRQgK73nmRGG1JrB7UewTypilF3A6nuGSuXGC6hHJe0it6ySyHkQoDqo=
Received: from MN0P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::33)
 by BLAPR10MB5123.namprd10.prod.outlook.com (2603:10b6:208:333::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 7 Sep 2026
 08:10:44 +0000
Received: from BN1PEPF0001854A.namprd05.prod.outlook.com
 (2603:10b6:208:52a:cafe::a5) by MN0P221CA0019.outlook.office365.com
 (2603:10b6:208:52a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 08:10:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0001854A.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:10:44 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:24 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:10:24 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878ALMM132583;
	Mon, 7 Sep 2026 03:10:22 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][RFC PATCH 1/9] u-boot: Add ECDSA Signing keys as a build time parameter for k3 devices
Date: Mon, 7 Sep 2026 13:40:13 +0530
Message-ID: <20260907081021.3876876-1-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854A:EE_|BLAPR10MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: 80088d01-f8b8-4ccf-b4ab-08df0cb78435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|13003099007|4133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pX0VYOn4WixDybtIq6H6pN+bbmIeAJmTIDrWPvtguAZYlHtCKZZfiRd0rX1jmhqlOKOhAaHjYHU3c/q5tUaV7m8eKjuOwRBHu8SYSWWuEQ0yrCoCkxOG9aXo18CTXlaDoewxnTeRaPj8/yAUb3hAUO8UAY5OKt70gmdJqN7p7oi4h0Sil2MEhcKx5MN6adQJ8+YD+9G60GV4MWgpXsW7hNQz46Y6WRJsR/EdPSZq3FJ/gvncBorjyzpOJHv5Vpf5cyo2NdXOhhBjNEpRNaqNjVEVQVFGb0IHILKtXfO0FC73Esnc/ojv3cPDz3obqaaIafZztf+29wtbay8HuvkhIpPEtjeKAOxJ+0iercmADKRQ9LqM9tJ5VWt+/M5nztqypR+VVPmeDw7TurZXNpsTqhvElTZvsCsvnBj6RFMVY9r/PmyRxcB+R2dNoBYsQ3mFvTLl1ILppfoKvYWGOIjB75/yu8T16acOeSIucF1ibTqCy+UKvE2nNdNpoaNuFoIdtQ4QNvv2f9soQZHFw7B3SEPNC/zKNt8WML6qaQUa+VGH+S5yvxgDRgDwRENJPGY1ZaiSS4Eq/ZWUXQ3fiC4UFsHEN81VO9k5hrPFvwh4nuJLFzMlZZZqIC1fnx3+itWDOGsUcZ2EJLCCq9bS/tw3Fg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(13003099007)(4133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+9BDh2QfwSD6hSL8XDTWDiMViYuFZ+YVAJdW5KmIiBhB7BCjl7IAHGrluJMmdH/uPpMjQQrOFyfRucuXExvInFIkH6Unvqy3nByHwyU3+WDHbVzToA07g6GBxXQUec1FV7lFa+yM106C5mi5sNqKbESksVk+pRzAV4XzNfZkPpukc2KD0/gxsAnkeiccJsqPa0dagdJ6qDXT945vUNp3ZBrI++Gg5utU8B+1hBjEuTQwKGYf3CC+9lgzPW33zFuCkburHrVAr+VNrTWvnomqhwVporsz8WCD2oC1A8NK6qs6cJdGavbYaJXM8EIsLrJaSw5HrRUZNzcbdgVfdPBV0XzL106/7A9CKWsd0gvYc8ILOOTmjpUqel3W/HVni4y5auNyB1CEY00IqkFxAowK5eQw3jRogne4oOQB9ne8rY61/BYQjIgBRRVjWpvmUYal
X-Exchange-RoutingPolicyChecked: 
	eMsQa1jf1qSCZ/ZMGXXUThmvDVRAWfiMIp+kiiWWQ5w/TFU7ftYxn5sz8maKugypcVJeGZSlXYaPoAGgkLcq90xN4lYkcaYk6TpvhQEW0b6oK1x/pS0xJhTUsXqhquJPNSORwlt3Z8Xi0eVKYkrM5PrLTiZGgSJXN6o/HhWNRH6GUKGwkYqMfL+0RBsQqSRwMzd7fcgmw13OEKWwzf+WEdpndQSaZFIe8/CVUgYWhkLt5VOyqWrXqKU/XcCVEZZUdAsh1//Y2WgkBawbKh4eAaEMAiOOOW51IIuDWACF9AOmMo2ax6sR42fS7J8R8ANglOwEYn+uUmcbckdzlM4Q7Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:10:44.5454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80088d01-f8b8-4ccf-b4ab-08df0cb78435
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0001854A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5123
X-Proofpoint-GUID: 8ltCmNwuhRsPsCLrdC3sPBrYE_sNgS7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXyCDcnn1GemPQ
 eFkZqp/T0uk3cY5he57rgAeSEQm3yIzKpBaCafx+T35QLpTFl0DeRZXSA5BA3tkLrJpLdkksVU0
 zr4WC3O1RUEX5xIW0ckGDdLy1SxCSauQQX6S6pEJ/kHkU+bnYZ2dpTHOoVZdULDBf39DnAuHpqO
 leocqUXAYp5+GDDj7Hi8gftsWZJ8NeM1fflH6HJBF1mtLWZ5gQWW9RpOENDPgYAPJLVzH0qk3Zt
 92u+CsfNQhSUblSOO6YAKEkT6W0VGw/p4muHgoSwvfq6OnQmm2Bp7+nUwWAx7CxgVPJC04tfp7T
 XsgocQ6OIViEUJT3WnFJOW1Bp2SPraINcNuPFsu3fGZdauDqwWULkKLEbIoziKW8c011C+TszAV
 JqUDns/Rbrg7zibGUgMHBc1f/wk+xmQR5qrmOPMcIVoPRVn3y/g5C3M6KALiF2e2Z4C5LpGTH7C
 xVy6LhByCSGPnqxWALw==
X-Proofpoint-ORIG-GUID: 8ltCmNwuhRsPsCLrdC3sPBrYE_sNgS7Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXyfYojj3orZdx
 TsRCKM1KAZTA+ta8QVAKyAy1UmMrGCkX3bToMA8mnKkyK6m9MWMqpQZNYM3bKQtyqtlqLBXLq5+
 E0nQvqABjVX5Q1iAfGPPkU3DG6PLmEA=
X-Authority-Analysis: v=2.4 cv=JdSMa0KV c=1 sm=1 tr=0 ts=6a9e7187 cx=c_pps
 a=vNEawcoOGvNHZjwsohOJ5g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=uz3XTJzBRQccPNcmWbwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:10:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20330

To make sure that the signing key is passed on as a
build time parameter we use the make SIGNING_KEY=
<path to key> in our current SDK, but this method is not
been accepted in upstream[1], hence we are using BINMAN_INDIRS
to pick the key path.

The other method suggested was to make a
BINMAN_EXTRA_ARGS variable in the Makefile, but this is also
rejected in upstream[2].

In this patch, we have used the multiconf option for multiple
images of the target device, so when we build the image we get
both RSA and ECDSA signed images. The RSA and ECDSA keys would
live in separate directories, each with a custMpk.pem, and
BINMAN_INDIRS just picks them respectively at build time.

[1]: https://lore.kernel.org/all/20260206110439.1236201-1-t-pratham@ti.com/
[2]: https://lore.kernel.org/all/CAPnjgZ0Oj=iT4K0Yj_ii=uL0rQnoPmQ6vs4E2xun5X1RLn9qOQ@mail.gmail.com/t/#ma8f80bad7481122d41f12b85b0ce80eae3d99f51

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 .../recipes-bsp/u-boot/files/custMpk_ecdsa.key    |  6 ------
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc      | 15 ++++++++++++---
 2 files changed, 12 insertions(+), 9 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/custMpk_ecdsa.key

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/custMpk_ecdsa.key b/meta-ti-bsp/recipes-bsp/u-boot/files/custMpk_ecdsa.key
deleted file mode 100644
index 83dffcda..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/files/custMpk_ecdsa.key
+++ /dev/null
@@ -1,6 +0,0 @@
------BEGIN EC PRIVATE KEY-----
-MIGkAgEBBDBDO9fzBU2LoKaYgji4m3ZCHKUBF9CTVnU6ClfNPJsTo0SKZpCsmyr0
-TKUNkk16vwGgBwYFK4EEACKhZANiAATCv6ftwnJW91fP5wpLpLAxt3u732oNnKr8
-pLbZUzi/s8/e7QiISJ8QKYGaWMnjORW82cM3UJKlCw8GOrb3ZrEXYWRKxkPWql0+
-BOhDQA5b21GtL9HQPvuCPz471ZaxGYA=
------END EC PRIVATE KEY-----
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index c1959d11..89f87d4a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -93,7 +93,17 @@ PACKAGECONFIG:append:am62pxx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
 
-BINMAN_INDIRS = "${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware"
+BINMAN_INDIRS_DIR = "${WORKDIR}/binman-indirs"
+
+do_configure:prepend() {
+	for key in rsa ecdsa; do
+		mkdir -p ${BINMAN_INDIRS_DIR}-${key}
+		ln -sf ${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/* ${BINMAN_INDIRS_DIR}-${key}/ 2>/dev/null || true
+		ln -sf ${S}/arch/arm/mach-k3/keys/${key}/* ${BINMAN_INDIRS_DIR}-${key}/ 2>/dev/null || true
+	done
+}
+
+BINMAN_INDIRS = "${BINMAN_INDIRS_DIR}-rsa"
 
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS} BINMAN_INDIRS=${BINMAN_INDIRS}"
 
@@ -417,5 +427,4 @@ PACKAGES:prepend:am62xx-lp-evm = "${FALCON_PKG} "
 
 TOOLCHAIN = "gcc"
 
-TI_SIGN_WITH_ECDSA_KEY ?= "SIGNING_KEY=${THISDIR}/files/custMpk_ecdsa.key"
-TI_SIGN_WITH_ECDSA_KEY:bsp-ti-6_12 = "KEY_PATH=${THISDIR}/files/custMpk_ecdsa.key"
+TI_SIGN_WITH_ECDSA_KEY ?= "BINMAN_INDIRS=${BINMAN_INDIRS_DIR}-ecdsa"
-- 
2.34.1


