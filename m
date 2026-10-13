Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED69ECC6B1A
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 18:47:28 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5147.1791917239829231926
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2026 11:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ahgCNMNi;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Mg8xjQRu;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHKXpK860933
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2026 13:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=r5Di5zMMlsodZ
	RBaZdeSekhRvt6NC132gZ81O+oNAhk=; b=ahgCNMNiP2GJw6kWIIrnCyw0+IRpf
	SzLjEPuj5j0oCWIi5U8saYIb2iE9bjc2RZgN+7kh8B0MUV/xScyZPmx5zhZa7hHR
	ZQy2pf/1zLgRBYOiHBiUyr0Wl6xiCd9tOBgKJg6nfKEGQ3CmKhpSmbiboKAVEcft
	KDsCpqJBrEqs1FhugXmtnG82ZBAwrrwYqPAYKkahoJ1ahZv4r2JJKjDugIWcebzl
	gJUBTk8w1LO75l2it2WmSHGd/6wj+8dYcILXADlD0KIpZDA3hxW12/OR1u9GvkLU
	eu4vfjokM1HqWjnUJKIIWaFv6+t0rqRP1VxAxXzVaDMCOBiDJz5lg+XWg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013058.outbound.protection.outlook.com [40.93.201.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h9g48v7d3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2026 13:47:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxG6mQl3rVP9Mk9Ve3aPj5yglhDZH3Pw44d219yOYoVSqonQgpUHn3R8c3a/Oj5OuByoOVQKDkmQ/gfqQn+soP0kIH5gX+hnL12oVuYhe+3mBe5LLtjqXWmi4FMe2+1N2uDju9A6OSiF7x/m1fGiydequrf5AXzgyLSpXbOXstZuMZvOnIk2I9Yh1FviSOfR7HlYWu+swUQU4lDzojJFslsFT0E54ZTHn8iL6LOvDDBdVvXSipEew4RsPMZBLo5x2gxMGxvvLELQxbbP/cmTRA+N8COYVguzpTBsYXFuHxdlYtjUQ6JA6g8G60L/a6y+lUBjzyD8VFhdk/ayMxc+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5Di5zMMlsodZRBaZdeSekhRvt6NC132gZ81O+oNAhk=;
 b=LxEn3KPboouEK4yWOlNpW0Js07D4d18TL3Qfq5tHVsvqu7VRrIl9cXNGoQzW4btrcgXOtZy5B0MzzD8IpLdzrJrLbbDKB7cu5re2sCMk9FqENuPYBsCPqSnagqqJTRF63vqTNz5fiZnBRSy4Ifin1Fxq0Jd22/TNZ+VkeiI1BbN4yHC0WGHZkiYWshdfbiBXYpG/pmsXhvyi0KipPRi2+IFsViSPBJYENEAPw0gVxrFaJ7JEg5gp0AnZuMY0fWyk+mcaOUUG4Wpe7Vy1ah1m4dN3/mAwghMtPLJ0lB7t4I77EUU8NEb+JAvHKT6jtBjZeGMhSf+Rm9UiKTj3VpTkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5Di5zMMlsodZRBaZdeSekhRvt6NC132gZ81O+oNAhk=;
 b=Mg8xjQRupR1fBbgdOSwBFIRzFwVt15hE+3u2NIMmNswSlRUBhW8eM/jwmx6QyKJygHA4utu+8FVZOnuyaTa6FyJS9qxRpDuqNjrCWk4pKvlGswhSU2XVuRRhCEFpAPGot7Oh0D+UlFTb04JNPhUaA3wSeYp15zlpyrI33BtAPUo=
Received: from CH0P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::19)
 by BY5PR10MB4386.namprd10.prod.outlook.com (2603:10b6:a03:20d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Tue, 13 Oct
 2026 18:47:12 +0000
Received: from MN1PEPF000793FE.namprd05.prod.outlook.com
 (2603:10b6:610:116:cafe::7c) by CH0P223CA0008.outlook.office365.com
 (2603:10b6:610:116::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 18:47:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF000793FE.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 18:47:12 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 13:46:59 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 13 Oct
 2026 13:46:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 13 Oct 2026 13:46:59 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.75.146])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69DIkxTa4054833;
	Tue, 13 Oct 2026 13:46:59 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <rs@ti.com>, <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-ti][master/wrynose][PATCH] flutter-wayland-client: remove unnecessary include cstdint header file
Date: Tue, 13 Oct 2026 13:39:08 -0500
Message-ID: <20261013183908.2244183-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FE:EE_|BY5PR10MB4386:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f9bac8-05d0-499f-6d8c-08df295a6496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|18002099003|10067099003|20052099010|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	5am7T6iiN2TPc6lW65Qm0txYaS98GKHBR1TNXFwz4WRUWuNlzTApUmj7GgkVUc/JeMQtEgi7gvgwz/b9ws6kq9ZzK6T2TTDwgxJUCWZ0aBzpWrK033rtrUvk0AmioVFbB2us7ISYcuWfGrpoDfVtzgX/npDmk6M1Il/5OqtN+Gnywhl5jqlQV935ZG7ADP4QAIU2HyUNV1n6L9Nt9GJwArBHPhT9LXNrDAqrljL0PgUhSj+MPN3Dhc4HohwuWiSPsvQiKbQBpUbZNcCOfqhG+61yUZCu8ZP3JYtj/JkcqrSmqlSU/qQTAohT9fqW/UMBAcdmoLTTA6CTsz0SeUw3wOvAlX4BihCcS7+l5ywtQcM5EOpX4iSADZC8hyTV2LSmQYxfrhIhgHCKqxysgOUMAIB+Ap1Z3CKnyd964e9px/GZwUDIN7PaN1/7u/OXj9n4eNuKAM9iyLflU1SDeLGHTgF20RCEmAqksd2/rEI3kz5QFgM6xPOZUY2zZ/NNHszigIzGclkcVjF88XoNjn7frHivJ6FSLeY+YGtcYnD6FD2GrNU+f6xXSckHFl0Vu3Rjqy4iMGc1loHIyUnO3TZsfH7M5SZObYuE9smlElyyWHC+TL4Tae22qIsOSB/1y4r7ZWoXS9SPKo/zOeVxPN98rjjF1CKau1MQyPMW0qXuwGrosD53dCl6kRMRfREWwJ62fWIWO1vKHgX4LTt4oz5kZQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(18002099003)(10067099003)(20052099010)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	x5EyZp0ijf5i6CYKks2pGSUqvZCz86lv5KotNqmB9p7029Mvuy+IRDpr0N5v1T5QiMxoay6APOBFHMpNoOBR9lsAn56GIf1/yqVFhUBozLcFbOmAGrVoOkU3JeCnye6tsKh0uwBEmHujTUuYVSFjMqOlaZjMLdcng6YXZeHwwMNtKeNn4FBHcXoIIuN7JwRYLiIPJxvW7y4OiJPBq59OGfnSRf3roUReQC1FQqT+itquL73RKqnKLNDLxTL79VBEx4ekm7VkTBOXcccsnjsLkwMEG99eCHBOAdA35HvsRReYptxdpkvedNK25yYcHubg6Cm7EP2n3Gpw2U0I+mN+cdb2AvA2Lpk7/Sk4DXgJGaqNCJDERbxBfh6OXht88oyIf0mhSla5jKeBuqFfDAj3OXmA0/GpTJJs+4a8waqWhUqOqz95B+mJCLvKcMzj5tzR
X-Exchange-RoutingPolicyChecked: 
	EwmZAy/Chzf3vIqjUpvd+UyM5935GcHIY27VNDRjovhqBwHs6gKElQTg3Ev5MFkwXhOLrdLg9sgdUUp9ZHZNfo+19QVaxpurIQY169QbrHc4nYmejPXBwdudVpwhSk5jggBAN97XSlV38xIedKZ8EpPSmVGelAkjh6+Vv5nFOvVjKg5LkCoBtbs0BYztoAUzBlr0Juu+KDdv5R5wtwvW+8+7J/JQ9XNdHeOMS5vOrePvd8eZU1l6S+0O1Iw4luezKaT3JYcdGk2WGICkGzIj+aereYIV/W8VCGzkZINdC+Z6zupZLp3GvG8I19Vx5V5AsjUSsB+7izczwp7pXpS9Ug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:47:12.0069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f9bac8-05d0-499f-6d8c-08df295a6496
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF000793FE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4386
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfX6PLXttq4JQO1
 lj14tTARSdadC4xYncLARs6cR3jRjBleu+QZZLOtDv6GNrYDs27DQhurA64u/MhialaVfw35nR4
 XS5zoEZC3kQhrCIKyNancIHejevdtgc34cs7L4/F1fiSBwt3r2bjq/F19j8wXYCO1JefLEVeqPB
 j85P+CfkCOgZ1ZUg1WvwHbJMPHK/gn5ZknhP4YJDzVbRaQDX9S6NC9uktFJ1NltqG6+DuZHr2Om
 zXJ5WDouNoiWCsQkC2yr+ewt3zh2UxZFvf0oxtBg0uZO4DvvQgw99i2fd+azahPROPx85ZSBgu+
 ZQhar3OkChVi6np+jw70+6UBErfvkyyNb1cf+YefNuZ5SgpJ9B1LAUmtVttcB0CQNXG+2qk63ij
 wGo3WJf18EG9TePn9N3hzBD2ac8HgD4vxxJufhNsi1b0qILl7nTUHDWCxxZxRCKlzO+lKRogUaf
 t0La2AgrzHZAwDTDywA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfX4l7fC+YgYOOp
 fy44DWzAXj4/CeN/JMDyvt/RnGNCS1R6GOGaBm4aSRA9KDh/nAI8wonWjYN/9AEQGAZ7jJ15eOS
 nySvcayfP5HURbpRMgydRChE4DrH+1E=
X-Proofpoint-GUID: HYfxu6IKK0uoYFowiOMWU2Z2dMCuXSGr
X-Proofpoint-ORIG-GUID: HYfxu6IKK0uoYFowiOMWU2Z2dMCuXSGr
X-Authority-Analysis: v=2.4 cv=YrWa1IYX c=1 sm=1 tr=0 ts=6ace7cb6 cx=c_pps
 a=+UayH2mdqs80qU9+PBkj6w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=SeXGo0AOvF_QgzCzd3oA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130074
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2026 18:47:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20453

Remove the redundant file includes to fix patch-fuzz QA failures.

binary_messenger.h + message_codec.h: https://github.com/flutter-elinux/flutter-embedded-linux/commit/95f56d9e
method_codec.h: https://github.com/flutter-elinux/flutter-embedded-linux/commit/0992ffc5

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 ...-message_codec.h-Include-cstdint-lib.patch | 41 +------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch b/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
index 7a9bff41..20f722e1 100644
--- a/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
+++ b/meta-ti-test/dynamic-layers/flutter-layer/recipes-graphics/flutter/flutter/0001-message_codec.h-Include-cstdint-lib.patch
@@ -10,12 +10,9 @@ Upstream-Status: Inactive-Upstream
 Signed-off-by: Antonios Christidis <a-christidis@ti.com>
 ---
  .../client_wrapper/include/flutter/basic_message_channel.h       | 1 +
- .../common/client_wrapper/include/flutter/binary_messenger.h     | 1 +
  .../common/client_wrapper/include/flutter/engine_method_result.h | 1 +
- .../common/client_wrapper/include/flutter/message_codec.h        | 1 +
  .../common/client_wrapper/include/flutter/method_channel.h       | 1 +
- .../common/client_wrapper/include/flutter/method_codec.h         | 1 +
- 6 files changed, 6 insertions(+)
+ 3 files changed, 3 insertions(+)
 
 diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/basic_message_channel.h
 index c081946..fcc6b23 100644
@@ -29,18 +26,6 @@ index c081946..fcc6b23 100644
 
  #include "binary_messenger.h"
  #include "message_codec.h"
-diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h
-index d552b49..82e47da 100644
---- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h
-+++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/binary_messenger.h
-@@ -7,6 +7,7 @@
-
- #include <functional>
- #include <string>
-+#include <cstdint>
-
- namespace flutter {
-
 diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h
 index 3cc8b6a..9634ead 100644
 --- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/engine_method_result.h
@@ -53,18 +38,6 @@ index 3cc8b6a..9634ead 100644
 
  #include "binary_messenger.h"
  #include "method_codec.h"
-diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h
-index c84d25f..c007b1e 100644
---- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h
-+++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/message_codec.h
-@@ -8,6 +8,7 @@
- #include <memory>
- #include <string>
- #include <vector>
-+#include <cstdint>
-
- namespace flutter {
-
 diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h
 index 6e39a64..34687a6 100644
 --- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_channel.h
@@ -77,17 +50,5 @@ index 6e39a64..34687a6 100644
 
  #include "binary_messenger.h"
  #include "engine_method_result.h"
-diff --git a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h
-index b40fa64..edd14d6 100644
---- a/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h
-+++ b/src/flutter/shell/platform/common/client_wrapper/include/flutter/method_codec.h
-@@ -8,6 +8,7 @@
- #include <memory>
- #include <string>
- #include <vector>
-+#include <cstdint>
-
- #include "method_call.h"
- #include "method_result.h"
 --
 2.34.1
-- 
2.34.1

