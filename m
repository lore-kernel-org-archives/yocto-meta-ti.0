Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7118.1794394818890291223
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 03:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aGHL18Jr;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=YQdIXhmb;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AB7Hq4Q3913496;
	Wed, 11 Nov 2026 05:00:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=o3VgseEXgSpHW
	DsgZdB1vzNPBEms3JVhVWkkW/iHYMg=; b=aGHL18JrVSTWpgOUqPb4CAMucuqbr
	Fh9QS0EUYx8o3HFAhZ/c9Hiw9yOZD5IRWzT1JyqX7w67Hi375JVQj5LVxg8K7MSx
	syF4qDsJBZgJVdsTeessUBxCkbxQRkyOYW5A71Fad8LwrBWn3oEKOT+LmX2QhJFU
	z+SyCFahemMcU2y9CBNBxvhC5QkbATzRKHfJGu9Fs9kXkrTdkRbt+0H0uNlh2LCB
	OnXBNUGw6MxkKVyAzfQxwZgZk/wT9EWv0iI04qGcPDglENBRJr8/cqGrAoq9Ciwl
	x4nnFAOvCdO+j4krMF7ZuPzDehcnIMxtDmkI1yQUuxsxvq99vY6bEwdoQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveuptp2q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 05:00:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/KPJ2n7kcgiOP/M9RQJH+Q7n/uR8zYAegdf2zIEgxaFosD2wff2YkL+sJQESWKKyGjzW6EXcClkqjkf0V4uACr03erKT+U6A/6AV3wcoZutLCC6aE8q+z6CiZ1+S6dZ3VyCTaQAQaZdOyUwmDLoWtpS5XhFLxwiDNYbtxXQnyJZbHB5AZVSMKYl6VMdTsw2Uk202jUw+Rv0BAQFcNEEIJ8SD4KSejpawxqkO/kLgOA5qQwvUIPb5EneJGxZcLKO2uaqcyOYse0dWea+jnhvpk6xKRcyk20BAxAA4/j5Wc/AzA6Rcg+lC7x51+Ff1x40Ovkdlbb0/stolHDa935HHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3VgseEXgSpHWDsgZdB1vzNPBEms3JVhVWkkW/iHYMg=;
 b=o5pRz7FLub8gfi2LeViM2HmC4fOr71nCA9x7QGk8zf3qMAv/8epQQ/+cwOUiDDS8ms/CbUF7zxuLCMufF0+NhdBToum5RizA3mSo4a7RUge3cgn4tSB+zzJQSPLVb5gY1wZgW5cBVkfq7KnzqQjpaSQbsPM6poCK0zfJVEcLR61mr54kfKCosDhGiyjoYybiHi8NiKG1fTxzbKR69aqsmv6i8E8YyaEGWEsRXvu/JtW7UprQvKeIXdrVhBRFC7tZcbEUMTXjO5XK292/sr0hVIqsRaawyvAGjbSDfviu8CSlRHwKKYDLU5c87YYnqEFRUrPkwAEz1a34/3VF/VHh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3VgseEXgSpHWDsgZdB1vzNPBEms3JVhVWkkW/iHYMg=;
 b=YQdIXhmbYvC2EpUAydzKhQG7pkrDe9DrZqdicCZHUPW/r2smP36bEALKRvXZP5UpLUywmgO6rOViOC+wzO0IgX+utXsUla50vJhFh9UZmWIcSSTY37yUxnvPIUvvv9onV+dNms3OpnoB3e0/wzcEntIx4GIlTZwthRmck1GdZkw=
Received: from CH0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:610:b0::18)
 by EAYPR10MB997902.namprd10.prod.outlook.com (2603:10b6:303:2d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 11:00:15 +0000
Received: from CH2PEPF00016D4B.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::1b) by CH0PR03CA0013.outlook.office365.com
 (2603:10b6:610:b0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Wed,
 11 Nov 2026 11:00:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00016D4B.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 11:00:14 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:59:40 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 04:59:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 04:59:40 -0600
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABAxcf53764371;
	Wed, 11 Nov 2026 04:59:39 -0600
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>
Subject: [wrynose][PATCH] Revert "am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel"
Date: Wed, 11 Nov 2026 16:29:34 +0530
Message-ID: <20261111105934.3239366-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D4B:EE_|EAYPR10MB997902:EE_
X-MS-Office365-Filtering-Correlation-Id: f9302e83-83a4-46ed-9f3e-08df3fe2f69b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|18002099003|10067099003|6133799003|261022115727099003|261102123227099003|261022075727099003|261021123027099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: uGXlkrjYdOYDQ+GZM7V8m3hQDFh3xFr/e49mrRHhAwdzYjgnotBepKzagEtAu8SSKbnbqmmhxfAP10K8DOI1kmCiGTEWl6UU6AA2Ez1XFTCuj4NCsXxoM1AdIkM359+Lwnvc+StpFa2v7NeTcjcKTophuxrMBDrc5Sg+HWfo6vJxL5XZ5+C1WsNQaaogNx9aSBUJ5ReGSRTeUm3BNL8JU/ItIfmu6w+M4HB1A30R+GnGiNOIKiOs4NoH3qkpL4bhv80Wb9OWa6ubrACQSLCZKvEVOEco6D3kFw/fdNuyzlvmMTlkrJiGkD3/93ZUExZsukz4qb8dueFCoGMFX/Uyfi0hxuF5T1rBYj04TkrgV0qARcYdD9M3gS7DO3mIDQOQwOIoKbzOMwj7wPLGMuIHzNTmxEf5vWc/vkl+slIqAWXvl1QTNNBj+OPueUxNgkIqbjBAEFyuUB1LTT/mB3hR9YD6cf0Er85BRxDUFJ961Xxw6KBy5aga57AvqtflWtyuLOFO0fbGfYhysvdjK1tsFuweROXKAPq24zgU2EgacEN1s6fhYBWXAPVjlb27apaDjBmMDt7EQwadBcmhRRWTltX61qjIwUEmd4cDWtUSgjVi5dnalFaviojJHGzX82pjLvyz7Ll2knL/hycbv5bvQJTOz7f02YScQ+QEWRfiCUSCiUV3GN5jf+z2yCfwdjToWN/RyVCsegw4s8tvuXOZxg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(10067099003)(6133799003)(261022115727099003)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +SBF2DuYJwGGrEY12X18/T1JErXU8T1eU52AAnB6E77lC/IKz+y3np9c4OdVsSOE8rd3aFQZYToz6DtCWovcnP8RsMRDuM+89xIBVhhsNcT2t27k47Gm8uZ/S5djcqpdgqBZDDJ7dO3uLDS0R3qTDbJl28WBnoOOlQoQS72oWYss0Emlqx61z/Mj8qGQkjisZ9r5tR5v6dDGCN8yUgD4hGXuEFaxldH4rE0nPi1MMXJ0YEL+lpBlP8XApqIAqHzNNZBUGoRwojjZUMXxb7fsf+aD0DZZvsOUHvVolK8mWjAzJwBOA06nFNd629uTA7D9oftqZBPXwe70zbQCONXFJSMJM8eBNLaQc38EcoenniME5QiCss3qOi+Y2CViU1JHfd8xNXhe+mIbO01Uzx6Hiecc6gdCIhwi5IbKvPYyBT90HZ0pgyS6V2xbuCuo/3iy
X-Exchange-RoutingPolicyChecked: Yio0G/N6WMfxXKNTTzWZqPFOt3n8WF25KAuPOzmslLjIvaZ4qfsXuBYw3dlFBwtJC4j6DXR5PY5U2FLnu+bt3nSPteJO2LOwSHd6VjVP9o4Ln8yRTb5O36KNd0w78g1WpEFTXNeVcgz2QjxqK4VTbDkjZNdaPQg8RM4wnWB6DXHj1NtboB+Tj01jsbbIjOgEcACZpBzCn36FgSYmGPmUEJMoAtJqdPvjx4SF4R64kSVySkIgLvNY7yeJPvrj+v1uh80rEgrKW/5A4oxUKD9RX/zYIZpjDEoMKLA07WcthK/JswZ2hCGWIMoQ6ZGK90CBfdOlYQHfDzb2JNPVY7xCpQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:00:14.1427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9302e83-83a4-46ed-9f3e-08df3fe2f69b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00016D4B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997902
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af44ac1 cx=c_pps
 a=ZfP+Ya0swgQO+W9lSFUZ5g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=bP0pJ2iEsDT7gXVmwc4A:9
X-Proofpoint-ORIG-GUID: 3IfY0KGTbLjkIaT1aPAsvXX09UbJyNCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX7SASlH6v/16j
 QXVjIPPRA6CG1OSpkzFDFYsvmMtHhUCrloVZbBWmQ2GJd/5OFtbnc6amDizTYTUZNBKv3Vse2IV
 /OpNMpGr2Utro1CEKT6HZPhDvLXMrIvGxtibKQIUlBfSc8o4UmskqplqrUgfqUII5Op3bzPxO/a
 NQisBKX1tfW9Gmw6bMHdKYuSTbJcB4OSjHuIhnNQldMRTxkOncWaTLjkTSzHGYxqlO+ovZSBtp1
 xROsx7NNszbKTsdgz2s5gdy8jVyFNFCD3/5VqMZSoKZydI69bNg/KzCoMNtNMdWmWQqCtavHQha
 YhyZTmI2AxN2ec3P7ORQFhF5SiNRxZyGdqnOKT+QIzlceRFItmpTyGce/ziJ2E6gXqB3RoTuNNJ
 mhA+NXCJrs21CmicHt9jMGC5uK7MITTtjR/eFdhxnV43tUCVzphq4QBmgzZ+v1UIF1OVCdL2t3T
 AAVwMKnsGYYxKfKqaNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MyBTYWx0ZWRfX2Je1rQIBh+zn
 EmVzxrXcIqSf7jDQT5lizhM4bFj4XOl1R1CQexBP4rXz3ctUl6fiGUIN3Ky5tX3YeNvI/AaWr0z
 3Azu2PsQ+QQXFCEP5qLcUJt9uT3OIYk=
X-Proofpoint-GUID: 3IfY0KGTbLjkIaT1aPAsvXX09UbJyNCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110043
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 11:00:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20522
Content-Type: text/plain; charset="utf-8"

This reverts commit f6e834625efe9cc6b64c2d2d7f871338740924cb.

Remove the U-Boot OLDI configuration fragment for Microtips MF101HIE
panel as the display config fragments are now being handled natively
inside UBOOT source.

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 806f6a47..cbae21c4 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -48,6 +48,3 @@ IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
 # Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
 UBOOT_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
-
-# OLDI config fragment for Microtips MF101HIE panel display support
-UBOOT_FRAGMENTS:append:bsp-ti-6_18 = " am62p5_j722s_evm_oldi-microtips-mf101hie-panel.config"
-- 
2.34.1

