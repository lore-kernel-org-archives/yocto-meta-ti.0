Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38028.1793174518809091288
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 01:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=K0ox6X3R;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Km3937E3;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69S4SPS21170858;
	Wed, 28 Oct 2026 03:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Z1Pjs+KfH1gI3
	Kiv6vbnQO1sBPXrfOI4B7vOGehZFac=; b=K0ox6X3R5SxMbu8a9s8Q6FYQbTYJc
	gEdXTjs4XFuE4KucGJH9+6XGsrp+ImytysNnn2lfm2vVxDsW3+F9OVAC2Admwb63
	01OGaK+xP49QMk+JB2TDS+gT9Yz3vQrmMyYfTSYzhqD3tY63ACsQRF0C1qTZKdV5
	e43OAKn5E+xaXQaZMw8ZHJtaQLw8xvolTo8TbJBsFpSzqhAgtnSbuxjYOGvmq04w
	by6LLpneRhXZfFTBqvL/CM2UO+/4qC810vR/Wu1vZc/ITqVqbFjNMPRiBzKj099I
	HzEEGRxtKvci6MoWTwG3rg+rcXFFv9FSRZDeNfc1UJQAZHZyNzvrFoG4w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hk9ng9a8a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 03:01:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9m+4/FJ2uWfLHzy+zRYrYmfQZByR2tqE7XH9Sn7OirdmAOnxTSKPHZpNbCVX+f7eil2z9C+GTeSZTXiayBjs17vpiSt+eMQyAmOz41gL/U/fv7EpL4WuQ8BhqofLH8+2vQE8aIgo71X7Zv3MBNvLefCKAY6lCLz0Rg8OzfNfycK+y7oagcNqanlZxoilnGIjo/Mt6sEt7SCjkVOPwFC/+gTNLbTCNTtDVn2op6vO1AOCQmdCIuZ0TJnVw2HlAeDUJ778cvPNbLHZ/xoPe9UByVIdp04HdMJihmDGR8X9+F+cafwr00wYjII7UNFtoG9n8kWsb1mb2A+FFU2e+y0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1Pjs+KfH1gI3Kiv6vbnQO1sBPXrfOI4B7vOGehZFac=;
 b=w6zdaYomldMvn/4hlSuvXdeJ5MYmE7dHl0te0w8JtQFC89oT1yHkkCz5S/x14CAaCuagqf2wBONRNUOqOZ6zwpNCm4vwpvh+f7IHluA4IyOk3EhElXAT06vNpWrQtOCv8Xa+ganvx4xDY12p+D3DEV/eGakZ2ef/mBmRBmjEWAQk/mUv1yHH2/XfY0Hl4y2BywrZ4P1bDvuVBseJhLBQQ4vTQlqTIcVJr+Mc2Wv+1Pmz3nbMnrShvEKiNwPp8YMOengBGz6NQYTM1znjDCPR/bdHiIs2rXXwG2rX7ijoTHxfqmPYkZYgCIqHmtZ7jSAiIH/ePEnHRIrzPG4oBhLzGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1Pjs+KfH1gI3Kiv6vbnQO1sBPXrfOI4B7vOGehZFac=;
 b=Km3937E3PDWr2Nwv02SYS01p5kbFXaLUa50V1pUVfBlD4HRFs0C6k6FAIX/KnIePvxFyBOTKxGHjwZoOHbc+J/GmB0oDBiIpUcmahme5Y/r7vJr3sQUawg2hnEcZrHPqPLoPBC6xsHgaNib1TnP1ffDXl8tdwjEI2EoC9tntECYbkLV5QfyH6j24w3/l9N0kcHT1ZESgOkjgXEqYH2m8TIAlEMUN5LOPy3/MNU1Oo0GTFku1O3MQDicT77ZqEDba8o8q7FBep/gGT3INFG+0GW83zQooDXHSY876qZ03vS0qGs3OLk1ra8BbD3bSOftaVeKMBEpVfM5msW9My7fQVQ==
Received: from CH2PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:59::36)
 by PH0PR10MB5596.namprd10.prod.outlook.com (2603:10b6:510:f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 08:01:49 +0000
Received: from CH2PEPF000166C2.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::56) by CH2PR03CA0026.outlook.office365.com
 (2603:10b6:610:59::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 08:01:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF000166C2.mail.protection.outlook.com (10.167.244.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 08:01:48 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 03:01:39 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 03:01:39 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 28 Oct 2026 03:01:39 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69S81dkV1824277;
	Wed, 28 Oct 2026 03:01:39 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id EBF9C2A61; Wed, 28 Oct 2026 03:01:38 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202610262200
Date: Wed, 28 Oct 2026 03:01:38 -0500
Message-ID: <20261028080138.1790936-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C2:EE_|PH0PR10MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a28a7b-a8d7-4f18-7e24-08df34c9b800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|261026140227099003|260925021311599003|260925022911599003|260925021911599003|261009223027099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|10067099003|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: sRT/Y0CgbP9GIKcf+VgS61W8kum3qWisyqkus7loqyovLaKQSi1HiGp/y0sGe509ecCsYYKwGFVH06xybe0TGJQjsR6XTTKD9VYI7SW1ki+o/iORIQy4SyNeKQf8uF1qUo5wN1ZrP/MDJXBe6adQIkssj9mXYuWKstP282Y0hF5yP+4k9H7xnzOpYIe1flOFSp7DtjflqvQzlPu0rnlHaVCob0ornJYEZIUv4BcpAAIqPvq0I/3Tg24m4rUbGNAmX1QdVXTkrC53Mz1Dg2OYxwCRQDhd5XsLv+MPWAQ4k/J/k6LBayOYsWYstjkoG7h7Tr14xLznUQZK9IsckrMPkG1xDnZ/rXsQIfjmSuhenUSAXoRbMTfmwPcI7FT1NF0BAyVvEOEvc8XIn1kEi9x5i7ISmnlHuT4FzPRIVn8oyhmAAUebIEWYc6w3mFMSJM4mZuUQBw1p4oJLuT9yCIlG8py/j4J5CX8gHnxQ6GBiJrXffOfjGPO5pyxDQZx2f+VejUR59Ars9f9JBm2omoMxtdbMpjdWnNum3j9KvoEtAn7Co2OsIpogtK26QJW+TBPqUxszmprHdK2uK9wgEfa/nUkvEXqONMXK0vzekgW0k1H+SztojLdmgPwln37Bk+0hZj8AxYxJBA3y/DOLNFc+8C4/Qp/D/gaDFr8vRIY84PsOC97f2+DQ6kkF2L5CReDIy+mTnd0WDIyR7QY+Fk3jiQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(261026140227099003)(260925021311599003)(260925022911599003)(260925021911599003)(261009223027099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ml4MlatrDY1uldYByBvsTi+mbhXHfVKKSZJyOcbZwdqCuvLm2mMv6fcfeNitPUmt4ad4q0W2/ZhkmCA3WQbbxIzLBUufvWrXSeh5aiVlh+TUtm3kibjd/kLamm6Rv06tvDFVYrux7eGXvWiDNSeNtRh+c+jTCfmiJYHLVRgKoOMedpGtMknoMOU5RvTVS8MRxYJDkl1BB9WiUEVZk76bTv3jIgTaJs0S6xcsO1BuVcWQk4zhdEiZ8nWzIgyXo8COnWOeH1IQYddTk65WbdKUkYvIWLAVpyP/JrhbbCoEZd0YgdJEdJdI4ou2V4oBXxUx44kfQAexsqAUmQ4ngJEj4MWvHaYetbHjHJ7kiOMAM8tBo678x6YDUgPCLFbAfmSkcm89iVoT9+8ba5WrGo460rZKCNui0Lv83sG8si616P6/TmK1lIQsW8Fkq0wKeTNb
X-Exchange-RoutingPolicyChecked: I/9TCf/qCvgMjhntT5KXbn5A4s+zuT6glYmY1jODV2gpAk4WWr3D3VZusp4e0m4hHyx0bIKBvff+j2I7knjxG3Wkw7gSwFtYIFD1tC+MpNZE5YgbdjQ2m3UAyIAHIu6VB/ZJWLiSZ+1F9f4BAkkrmzUGvSDOSV0xPzInc3xLH5AFN9yCCfbAJM6t1KOFlCMqa3WpCgo1vDWEbb/GXKQCkRgBO+OwNXM+eYT9lpEZtUdPDK3i1qzxc5YlBh4k2r6tgVni2tYZ1TiKAnFWfTVqehXsC/NvdpL6L1CxpJZaPVQ8EYabMhXbGgxNVm8X3bLqllBAhKVTwY7dhbEIKOGNNw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:01:48.9090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a28a7b-a8d7-4f18-7e24-08df34c9b800
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166C2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5596
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfX/QXt7GcIUJYE
 /+HjZWjjmlJfwEYA8CURalCk7gFbzlffza+5q1Wume8mpUe1P3cDutGxDSo9y39+0AJjTSnUPFQ
 V9hYGLJsrUV3tGnOMI1ciIE+1SAYekM=
X-Authority-Analysis: v=2.4 cv=CJ+/zhrD c=1 sm=1 tr=0 ts=6ae1abf2 cx=c_pps
 a=cN7CqoUBHbDFA2NMQtMNyA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=sJtTgFDe_iOUHS5_ydkA:9
X-Proofpoint-ORIG-GUID: g0NexmpDo8rXsnD77UAns8nTCQZt8tZx
X-Proofpoint-GUID: g0NexmpDo8rXsnD77UAns8nTCQZt8tZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfXwHuVSn9MGMDw
 S5Ppb3dTEDm1llIgTDIPBcWbFUQAxRGDW+gs/pTUjbB52IMzG3W/dWU0pD4Uxm+hvrUcD7w0afI
 M3EHRlSwrcQVxWokWtsLFMFJNbm4FXEXmfIyT2py2UXkFtyDOrb1/ZIP2NNJxzCn1RPu5iEeoA+
 hNKDme9FLAJmIcCY2YUJYuSKjgR97+mfeT+HLWdGhE/QxGmL8cR65CmSUUZVj/s3QWr6zEDPMEK
 SJOoIPMr76Ja60ehOt7+euOVpuNL1ffcGbqS6MBYSTfMuaSJ68oB2j60DkiggxNyGpCgu3XxTfZ
 I0UFhuOb+iUNC1udJcKR9Pr2N5lUHmeDfpTLYewJhFXT1jd7mvhS/rINWdRU10bCUdvdKxVjHHj
 CYkZ8EkHgBBnWSqabJL5BAhsDHfF5rL0cwO/QKlfkytVr43VL1JqBvtqgKv48mIYZ46uEvA7FVW
 XtYWTXJ5sGxPeUTSNkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280031
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 28 Oct 2026 08:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20496
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.18: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: PV,SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=e853cc767f4b5431ea10f8f986b455e14a60b282..1028826ea156cc6c1e9d231ec9ed871d53b91f6d
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=792d3f648d38cbdba769fab5a77cb2143026c035..a0c21f799732ae350ebc31da24297d12f3e945f4
  linux-ti-staging-rt_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=d1be33790a0c6d9241b08a8bcf0b702729ac2b79..76a19a503a6ccd2e9f9b2ebab0b3b359351c23e6
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1b14f5313a97da1edd4e4d92036b727ea267ef5f..5c0e395a2f28422a330b6db6341460879fc78454
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=bdbdb414e41afd2a0ddf34143fd6404f14ba64bd..97becb13b81c314c1d17fcf2226aac9a32086f3d

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb    | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 372c61ca..b09ec7e2 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,14 +15,14 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.02.07"
-TI_SYSFW_VERSION = "12.01.03"
+TI_SYSFW_VERSION = "12.02.00"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 IPUMM_FW_VERSION = "3.00.15.00"
 
-TI_LINUX_FW_SRCREV ?= "e853cc767f4b5431ea10f8f986b455e14a60b282"
+TI_LINUX_FW_SRCREV ?= "1028826ea156cc6c1e9d231ec9ed871d53b91f6d"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 30eb2b0e..58c1ffc5 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,7 +4,7 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "792d3f648d38cbdba769fab5a77cb2143026c035"
+SRCREV_uboot = "a0c21f799732ae350ebc31da24297d12f3e945f4"
 
 # u-boot/lib/rsa/rsa-sign.c uses the OpenSSL engine API, but this has been
 # removed from OpenSSL 4.  Upstream u-boot has been fixed but we can enable
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index 53873476..cbd0f834 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.18.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
-SRCREV_ARM32 = "d1be33790a0c6d9241b08a8bcf0b702729ac2b79"
-PV_ARM32 = "6.18.51+git"
+SRCREV_ARM32 = "76a19a503a6ccd2e9f9b2ebab0b3b359351c23e6"
+PV_ARM32 = "6.18.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 29dad030..9eb82385 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "1b14f5313a97da1edd4e4d92036b727ea267ef5f"
+SRCREV ?= "5c0e395a2f28422a330b6db6341460879fc78454"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index caa57ad2..10c8e76f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -25,8 +25,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "bdbdb414e41afd2a0ddf34143fd6404f14ba64bd"
-PV = "6.18.51+git"
+SRCREV ?= "97becb13b81c314c1d17fcf2226aac9a32086f3d"
+PV = "6.18.57+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
-- 
2.43.5

