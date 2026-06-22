Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E04CDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:54:50 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5554.1782158086625746659
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=dXN2eAsY;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=GAnFfG8R;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MJf4wA3910518;
	Mon, 22 Jun 2026 14:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=xpqBfPDzpLSvA
	hWqxFEx3IN7VyBXLd1LSiB6ajgArs0=; b=dXN2eAsYcdUE2/j8VeTRCHYOcOUN4
	P4vylYS6JQYXucNuAiR+BHJwABt+liFuX1zAPFHWUG1tkieIoQTt/xU3Hl9BzS7F
	e6q/L1iT67LIl/b2iu3VWAeX48lB9baABQwnFrX8cJbCGz9HEkM4P3Blltpf3Xvq
	I97wCN2VdznS1alm0xbRSmFNj2bEVL1WFDzTYIuGEw1l8GAuykZoryCNhzMNRMlD
	k82/f9Q8jiwWBAiimCnNX4YdTHEKjfRAIT5EoqdPcbZMRyn2VeBUwlbV/8TfucvX
	zSWegt8oD7MqGGT7XD80oJ0jR4N7k4oJ+4ZUB0lwJgM9v8LpkFT+qczqA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010037.outbound.protection.outlook.com [40.93.198.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ey43bjtn7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 14:54:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1Us3nlsj9cBpHD8NmORTZxzkwzKDeWquyJfqXughapelsx8dOygRR+YIIi7Gswmxdzu21QV4jnh94W89Ni6YUzNN5UHGkeCYzQ4Oqxyi4k78J3P7ajXkVUH+thh4ihzCkiCpkKMGg4SScVYND8AkbfNJ2goJwzd7R8t5EO0cUUglwL7p155w05Wc0iny36wXp9SJttrx0L/v2Z3sihbdJ7crDSyxh07PGcHLMT4CygZC38TW14RqioMiHwoCdAzArvlKHhHm7/J8ZOOAOyK9fF6yfea0wL09M5reiUoT5L1rI8k229Br+JqEbmvZJl0HEfJdc+pmyxdkGrR/qCLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpqBfPDzpLSvAhWqxFEx3IN7VyBXLd1LSiB6ajgArs0=;
 b=hjLPAYGgBHOHcyOrMWMmn/4ZTY0bzQFX83sPUxY1mhNdMY4JS7/vTz0EbZuBtHBE1ksk8hg5HdlfRH7jqxJPh3YHxAq1MX9PdvhQZonG4Gmxcf0loimbhedrPq3bdHIYFEbwhIH4oSCON/4wm0vlkKRoMyAk4oOGYoyF1xLDuMIV/FUQsc+cOoEh33H/54SHjOzCjoLsMOrw98Uqh+sQST9v/+MPLRuaubQliUp/XwluPrk+Jx4qOCsBq6cB9WWHID0orL9j8EbGFtq1g84SQo4P0k+AHX0K+Pqrq5dTNgAiycrcqFlGZ5FFbSgjn7QumPlBGEvxtXHDDNkBw5sO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpqBfPDzpLSvAhWqxFEx3IN7VyBXLd1LSiB6ajgArs0=;
 b=GAnFfG8Rh3FydepRHtHiK1dNQ8BvkBomZTmljZ6rdW0DT8hl6ywdmG7UKPN5Qu5sUkWnAIEh8j8DgS9ytEcpKh9dXwiFQLgHT2TMozzayfZkjITGCD9dImkgKpTplCOeRNPFQdW+2tHWG+/hYcwqUaH19cc1t0YVzCaCFBUDZ68=
Received: from BYAPR21CA0009.namprd21.prod.outlook.com (2603:10b6:a03:114::19)
 by MN7PR10MB969465.namprd10.prod.outlook.com (2603:10b6:208:5f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 19:54:42 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::39) by BYAPR21CA0009.outlook.office365.com
 (2603:10b6:a03:114::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.3 via Frontend Transport; Mon, 22
 Jun 2026 19:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:54:41 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:54:41 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:54:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 14:54:41 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MJsere632404;
	Mon, 22 Jun 2026 14:54:40 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wbkjA-0000000Ec0j-3mEU;
	Mon, 22 Jun 2026 14:54:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] linux-ti-staging: Include CVE exclusions
Date: Mon, 22 Jun 2026 14:54:40 -0500
Message-ID: <20260622195440.3482698-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|MN7PR10MB969465:EE_
X-MS-Office365-Filtering-Correlation-Id: f7326c09-ae52-4da5-2d05-08ded09819be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	zdQZEm6zFGK1EdJfedVX5WJ+05+hrAwmeGtp5DHtbhvcqNEmWawx/dpvrmRhOzKV8Sj/5PMj1PYeGyxtjbxWBaTMdF7y63h72syHv4s6JUj2EYCglAJzBwj/OOsBBeq163epevQAqHLraj+d+xKEqN2N6cwOg1UEordJVp9c2noAzG+D6mkCeZruS5F6np0DzUnXpsglSI9WZezWK0lS7wNS69AyQCkJYewJaz5K2PRuQGCXDNak26zZ77yDK/p6G/1vuMQwG7tcjVF+BajqxkC9nHMIz3yK0lmrIcTTWo1KwVmSY7lm10pRyqqpVPP4aH56pAJvCHxHEOaIJ8KsBrtVPW2E0L4mqhcZw8EVI/7kUSkvCvIO+h0ZH/WS+45vkCkRb8QpF9CxY6Pj9h0Oafn4jFr0pSbpU0s4IA8afSFu2T8svwKQu3sYKXrzwWjdXK92d71wHfk01ekXjwOeqAb4REfu6zivII4EDoNPvGEzjfm3sfUisE/cPozR7gEUq5O7go0gAl0kIIYwwPprsSStexC3u6mT+2r0VLyEuiu1C1NAtr/ec2mSMI/UswSOoZ74Uaq090paC2t2ExkBZGJws9SH8DxFiMSGAvltx+X5a+wSyOybqaNrl1aO+GMVnSlp+4XqLE8Lw8PI0zuMqWXpGPdCooZUnd9rPhu3AuVLssbLbCya6SVBpzHOOw0g5IT/aYGuLr6dFrYsydIpzw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	McNw4ekMwDOsAV39i4Xxi2bO8ItIkgdQOtxKK2ncNSyNQoFpsCcCXnVGDhpbOeEGPX0V0Ss8hku79pc4yXy6ZJC+vAOl3APNIIXFa9KUg3wuTu2ftPdOqQ7XWFWYWii/PJqLwSxTfp2ouj9Gx6Puj8tdXVXNhF0bECVANvjHKbbC4snIhqsHU/kPU4cwFa9PpngGShi/VmDEtwGPW0c/45u3bKkEuBtk6TaBj2v7XERlARJoK4o+om+UkrbrrRNsHq1FNWUiNVi/ywCa08yH4i4wFjspIE7vKMNwVzdOE8J4sJem0OkV6wyQmYhtpFZN6tjLm8XA0OuxEthUNiaMcynzmRHLJv0PeeQZVehhYIu/Esi+YCsjPVs00YtGuuwI5fWhLWYKKd6ZM7m8zn3+nw6tvCPIdZPkfl2TumeYcTT+Zh/N6RRnDBWsR45m3nVV
X-Exchange-RoutingPolicyChecked: 
	RsUtT5oOlFLkuv2Oomi/b9V0Jlnm8R0DZjAiNY1/mVL/I08RS7o4CM4ifO7Uj0aqu4E/golfYYietbloZabb2YhqtsYVn5RYROHgAxKz92QkMWAfySk9GafWOanThf4zuVKOawmMw2aChnup3pzvuhG2UnpNLaF9dEuSEBrA+SmEKX08bl85opBTOiwSo97vaYBAZc15K5H+2cca4lwCj2Ketec6WqRs6Bg7EOiMHNM8zKg58LuGn85XcLl8mgdZy9uYyJbzDocYwtLoOxvxUm24V97JcY/EoFnRUBGhUYegRu3E13Fa4P6jt8x/3uKmZNqATTTBKXGfwUZczv03iw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:54:41.7392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7326c09-ae52-4da5-2d05-08ded09819be
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR10MB969465
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE5MyBTYWx0ZWRfX6EnERl9WOwQB
 w/0Q5IHVm3bXAXo+xQO/Jb6bUrK35VIOKaHmJpcEwvgE01HvwKjf6X8WAyJro0lumZ3q6UEg0hX
 ud3/bEX3ujMoGA2Zq0/lKdD5zOdqewo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE5MyBTYWx0ZWRfX9WR7k0HrqEJ1
 WWpkpBwHzebej4q3Djd6bEzgJhfhRDLTTekFOBqpDb8H8He5XqeoZvUMR4Fk5/cRWtn8K1+UyKE
 TV49HphWJRShcWXvlygTe5rmuxZ4usjTA2LmWiZ1CXy6i6p5aGHyiIGg8peKyHeyufQOYwyVrTj
 RDKfq3L2xbwK2KXleoOWR6OiHMCd/CkL5ahRLGlXjlomBMipta9FZr72MnN3WR9KEmSPwlcgzIe
 87YVh4Vpkpgv0HA2dbdx5k+FPvSRJ/AffMj6N5WeB6bmgA9TKuS1q007M5oAxlQAN4YjZn3ZSmN
 NX08grjDirzycQLrG8eYVMX8lMMeVCRUDG9IrE+9UM5iEaOkvfYMHHp6BA+NsehK8INNr5xS2nU
 WC2B6vua0So39MCryHbt3MTqxqifoQVK337vUF3SHiA1znlFeODZDrJJtfFTwgajB4/qaV3NxK5
 EZUkEMjkJG/XELAiZog==
X-Authority-Analysis: v=2.4 cv=TPl1jVla c=1 sm=1 tr=0 ts=6a399305 cx=c_pps
 a=HozCXiP24e1PxqS5ATOdRg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=sTV0dJKt8-v1X4iQO-YA:9
X-Proofpoint-ORIG-GUID: -CaYUxgQjqnhelBi7AYuci2e8rcHoLUU
X-Proofpoint-GUID: -CaYUxgQjqnhelBi7AYuci2e8rcHoLUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220193
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:54:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20052

Now that we are looking at using the CVE checker tool in Yocto we should
include the same CVE exclusions from oe-core that match the kernel
version we are on.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 90e7b237..a1d2fcaf 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 require recipes-kernel/linux/ti-kernel.inc
 
+# CVE exclusions
+include recipes-kernel/linux/cve-exclusion.inc
+
 inherit ${KERNEL_BASE_CLASS}
 
 require recipes-kernel/linux/setup-defconfig.inc
-- 
2.43.0


