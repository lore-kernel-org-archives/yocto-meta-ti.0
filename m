Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639CACDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 20:09:56 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20816.1782418188904498730
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 13:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=i3Z7u93W;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PmMbKXlE;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PHiP0A3933246;
	Thu, 25 Jun 2026 15:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=96txJP34ZuOaE
	0rn7/iayN9Kf4BXpm6ZFB4ir8aWKc0=; b=i3Z7u93W//ZIXUrLzCP/A2qHgzFOE
	iyQrK27a5Z1o7Iy2Aq1A7io9g1Mb5bICulS6Whbt3lLAuQOniTJn7+VlCsWwpgNb
	ZMgt18kVLOe5aQ1rWwiDR7vxWkJFiYu5O0vJxl4StESWbF0HfypjZr3gP/ftRHqE
	qzBQPBT88ro+AgBoaBCBzwj7zJ+/I+AMRhjHE+rH1+MLUDmHf0qc5Fzmw6/mzrtg
	cafymHY88J3bWwKvwmH4nqi/vHETbuYaiYFd1aNx8+amfljXAOcnJoIFNkVzgDoa
	y4kHeZRAYkTZhjyRzaUqcRnXhmfpdBmH1t296dFr2azlUpLoD1/ToBwyQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f13a0u9js-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 15:09:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtCUjh7tDFLYHB1Bd9KLjgrH0+aQamcurmwH+PfLME82spGV26olxAa/rGflQvvigzCywv12uA+or+ZccIqQf2e2NLJJOIfEfkwaLy6wlFSBx+RbW+KYmgytB3k2CRf30C+sUDh8Mg9xgxSYsOaewt7FX+lCVkxnr/cyWf9eO8/t7ynIT4fDmAxIqAJcDNYJcoDJeZHV+xCJerSIacHQMYaC5G3NhYIoWJrgcX5rrO1tYlupidzQ3HdHZNXMaSfuD7wxWE3TRBD7+4LtLJcgRrJwFnL3QV5iEcCYB0JV25lZlvsIa7mmTn1Efw27LK1jwWE4Z4wBnLFkmjdtqdQW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96txJP34ZuOaE0rn7/iayN9Kf4BXpm6ZFB4ir8aWKc0=;
 b=h7LGMrbFiH2J3xp97uWgAtkRinW9dQN3/JQqKmAgU5d+c/kPd+DvoKafm+PMQ4DDvXFbfej2/LOaEmhxBKCUY9mBBM+kA8Int7A4f8ulUx24YZsUs/pJV9YXY5YFqU9FEgnh08gKNnzJIwlo8icMszJcyxtcI0HXXV8NwgspVhdLRMsxmW72QLRMBx9NEb1XX70q/pFl7b2JOV93kShLnubCFEbrWco0zduHObYaSmmycnoM41wD/ij/3bGrX2kXYsIfeuxU84KM8kQ9TP6/Is0BIaKc+QSH1mLvEL8a7m4VFQUkZb9ZVzhDNWxQE5h9HGxcSQg0FkEgYXHnjQiVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96txJP34ZuOaE0rn7/iayN9Kf4BXpm6ZFB4ir8aWKc0=;
 b=PmMbKXlEBqbZdGfcAHQVJWJblZJ8kQLCexZmf4fqsE9RUElsewE1Pq0wI0kL3lkui/EbLXYqnO9xQM7TqkH2hHL5QsCylOwekpTU5+uuFi7OUT9sng6rAR4tFylCjGj21pFqc8tM8ocN6mSWiZRX7gXrg0o1IgRqkGUZ02/GZoM=
Received: from DS7PR05CA0098.namprd05.prod.outlook.com (2603:10b6:8:56::8) by
 PH9PR10MB402116.namprd10.prod.outlook.com (2603:10b6:510:3e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Thu, 25 Jun
 2026 20:09:44 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::59) by DS7PR05CA0098.outlook.office365.com
 (2603:10b6:8:56::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.7 via Frontend Transport; Thu, 25
 Jun 2026 20:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 20:09:44 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 15:09:43 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 15:09:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 15:09:43 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PK9g4t4076552;
	Thu, 25 Jun 2026 15:09:42 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] libsdl2: Set runtime dependency for SDL2 tests
Date: Thu, 25 Jun 2026 15:09:42 -0500
Message-ID: <20260625200942.1370480-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|PH9PR10MB402116:EE_
X-MS-Office365-Filtering-Correlation-Id: be8128d0-21de-419e-4329-08ded2f5b2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	f7kQKqhZ04o11Q619CWzSGmfcRKybqb7dK87Pi6pGUTLhq055Xm/JCnKP4EmjUPi4orQiy2jA8AozGGb7sXdq2IsOyLegAgdboyJW//IVoWBvmGgMyXGuI70SwQczA9NXLVLuoXHiD+LjlmvgqsiTdWZpB1you2pbMfnagmEjFX/tfupw1d4U/wb1/zPzGDnsOhOUWzfNaFroeeh9hdDnvFfvVgpulVVd5xUHyPsfgjj383PwoizL6C3O5O+uYUxqbmkyd5kDKACUEykYs+8Ngxj/Sdqdz5Lt03USPtnaXbHqUUe8pJAMzv0RhuWGtdwC9Puev1TlX3zIbazTkgxA11jd1/MaBskTYqUavnU3z52OLuPIt2qBdjogSz7WssPIdEQ+P+utxMVJV0nKfaXRgLuBnKm48nginX4vGAECcnFgIT44KhRF4CgA8J3klaPP/Jeee4wOBW9JN2E2E7cjkkB7ojS8XehhjvgPtpGejt5aFnEDST2kbIY0ijjPaV/01MzMN3XAIM8iOKoGYmfwQ6IojJ9TIrEdrN7fKpJh42SggXED2LGXnevI/aCQ3mp29bmCWViHfQ9hsncHBF3kBlqAhaaaonJXtJuyvpp7M8FGZXMcCF9qjCeAhRqZeywcfPdUJM3zspoBoMI+fniALUAsZCuSReWlSxbFhzYolMhA/wGwrJeAtHXN7SG4IKHxzM2hJv0nAcsQaTyXpgV+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2TYs++yxYDX6Jm7IKY8K8FWAjfqbrcz3lC++JqyXyvIjfqJa4Tw98OWWvVrvvawCOCJtGA9hv0Fh4r/scrlSO4qTSI4BKG1aCZ7VXty60K/tyJvD8YSRtpL2p4Bctt5xjxZcLHYLSKeuq1qr2ZuUQ6zVZ8gOa3nde7fOJ+j2HdrylgiedUJ77kXoWqOHXVzElplkDrjUkfH6YSuJauWU4P4gM4BZ9LL3wTk0N6Y2FO4qyso0M6tOZHS+rGt80vaLibNpzyYD8y/1Q/7RStyGilHOZK1o7K8otQkCGj8v0gdVYNkv+ob7IKLNOzvgxO0jWMjQ6F/Ujv77AI4UgarUoO05OnY5g/EbLXQD24wj5GeNyPAaKeUP53hqV9bnOByO1neOBuGgS97lsI6W3gNxRq1JwqgGzQzQ2i89DhUgyDBZ2qjCqW0y4OZa/oQObcow
X-Exchange-RoutingPolicyChecked: 
	GQGEZ4ez8KdF69F7wsS9mgtrRs4xyRwjlVtwaI/XPh77FS2jZcOwhCLZHqDDOacsUtcw0XU+pTKIBfhMYJPvg0gElURoX100vb0qhtqmePJ8k5HKblKKxX0pCerlqROBOoHh+PhbquYBqqi8WAxXKIMXRdn/rObBE2tgEU57rYSpg6RGg+6XBiwcUuszW20iMdjcXaHTXGDQRuRrWEU3Azd/d7qjbvMqcVmLHjOIV+hiyCAHzQeXJ/AFauUdfiP7y7goyTT6OrrlEuYbdN1aTox6OBINwcxlY8uMn4dK2irUkIj6EQDhPggZQewp/cNJjb7N6xyeGWB5AMIiGE5uhA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 20:09:44.0771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be8128d0-21de-419e-4329-08ded2f5b2c9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR10MB402116
X-Authority-Analysis: v=2.4 cv=WrAb99fv c=1 sm=1 tr=0 ts=6a3d8b0b cx=c_pps
 a=WaebrhBVOVZn7IYqRlctMQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=J_T7eXuL-9ZA9mHVJMQA:9
X-Proofpoint-ORIG-GUID: z0fLD27dezvAW35zeD6-YW7YM6YlZ5hv
X-Proofpoint-GUID: z0fLD27dezvAW35zeD6-YW7YM6YlZ5hv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE3NCBTYWx0ZWRfX2/zeNG5qo6w3
 GydwZpfLDamHyUyVbrtXE02/tXgxjfdZ8TneCUWAW9Q3Pra6qb9inJsJKmVeYbQf35+QcpZpTN4
 VuC0Z/WUKXA8dfdBhv0+yL+O2WrblxU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE3NCBTYWx0ZWRfX0DbOIKFjTkfo
 vDQH9pYwG/S0uNFuJ/6R+nTKA4H+TT5VQk50VvZ/NcS17zooBX0bq7nyxw7DoIUTgpJ5fGcYexN
 M9PQpV4Qjfy/ZLGqLKIe9JGst7Vpqy92zr4Fbl+bgkAL+KTIluJYEq1vxN8cKxQWZoRnFMMUV/l
 MQYEVyju0ex9qTbPw/bxhrL0cwqzpeg9GpOMZNvGVmB5+TC/bHTFbT+1i8wosdppHsuasHTz8n7
 4xYaOi6ppzTbJxhoI3zCTo6FhRCrOoBH72guXaS+F0uJNUQZEAqZCZUh0K6M6U3nPR5NwIApeTv
 JkqTO58I5dTlbv6XRPxN2ZDE3y/5vyL4mVrP7r0to7gSPkQWo18cR19v08lCnz/EmcWqvmIpByT
 43D7YOYKIayy5bBjoTRS2F4V4wsacTpX4AjCUJi96KA0Heoztpu9y2IZl9B6zdXZKO2QO7cSIWA
 wDCvkJwLbP/6PQc4ORw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250174
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jun 2026 20:09:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20098

From: Antonios Christidis <a-christidis@ti.com>

Set a runtime dependency on libsdl2 for the libsdl2-tests package.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
index 33ff0632..750a5603 100644
--- a/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
+++ b/meta-ti-test/recipes-graphics/libsdl2/libsdl2-ti.inc
@@ -3,3 +3,4 @@ EXTRA_OECMAKE += "-DSDL_TESTS=ON \
                  "
 PACKAGE_BEFORE_PN = "${PN}-tests"
 FILES:${PN}-tests += "${libexecdir} ${datadir}/installed-tests/SDL2"
+RDEPENDS:${PN}-tests += "${PN}"
-- 
2.34.1


