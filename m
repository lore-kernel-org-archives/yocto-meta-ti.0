Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B71CC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:38:56 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37813.1786088327234293064
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 00:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EAK9OjDo;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WtJgnalN;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777bTpd2210571;
	Fri, 7 Aug 2026 02:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=VWW4qHBtuCKIs
	pK3HqfirNmp6XblVdTAmGutC6ooRiw=; b=EAK9OjDoVaYYsr5EY09/PlEmzp7ML
	8Z4yG+9DdYJf2oPbPEDQQLgla38L9++Yx6Rs9t3Gos+ssYMW5015BZSU6/OoFoY+
	RcrqSLDUMqWAx6hd5f22Iu+x/E3BZKAuURPXa1TlXpiIt7UUv6pATDl9/IUVRTg5
	XSwfsqD41yJE2gZtCjUERXj1pr+ZCLkwAQrm6DNBy9N+Wm6MIb9ysYlOyB/aKUUn
	85ZPCz9/t1rjiIqE1zHxD6sDcINRyatx6tH6dt7ieXUMziVid2fpLjQRzzm8sSqn
	eB2VI+hDPMuI6S1SUWIkRdLKE1lxEHGwVb7WnpB/fXLLJ49mm/cZLat8w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fwb4wr06w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 02:38:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jx+T/LCBBwv/n2rRSUF7fhAGMF6iZVfkWjkVavJp4HPNwwVgWfb11c4RON/mn5AS2vgqeiQ5ZcYXX7Ksj1ijyGyY+AEJNj8EOZiA4u7iIApUNX/28xW3in5PcbAFP1ss1cOtT59HbOSUOI1oJgwZI5l73RIq59jZXgmLm8+5D12ly9gUpYoohZyn20qOlmvJzuIqzKZGkJJsbXDY92AxEwXYf5bIUJED+heO5KAGYlPV7wFdQf4/XJv42zzjD2UXBGvcCBofdpoJaZJaRrVOZkfF8++wAm0LDuEbL6q+8+YI7MegMnwKsI/Y2hFBckCC8/jlguFqlpdHhrvxXYQdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWW4qHBtuCKIspK3HqfirNmp6XblVdTAmGutC6ooRiw=;
 b=N2AQM3jxa1ycwWRgWAL0rGz7RFviDkmlfHQvciJ8lcGONH5cLNaYo4hljhW03poc8W+O/Vyf2UzsGJNf02VIX6c8zBv7u+tbl2yOo06rD9gqXH5glhs57eZcVmdU2YJwwntcCMvbH/gOV7DaB0fuxEt8ch4QNmvPrmXtL+HNF/bbAxH4hr5W3AVzPWZW9k0S1qT+06nP9872QD99NqEF4I5/rlTq1mTznjf6TlUREFUhln5xsWPV+MIe0ff09aSTJolrBp12Aiv70+zz0VbBbM7d87Da80QsWVIowF8xtBIb5YBkym6Jc8Z9b6V33MgJI2MrpnNyMz0PvIFcj+x95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWW4qHBtuCKIspK3HqfirNmp6XblVdTAmGutC6ooRiw=;
 b=WtJgnalNVFCLNs7gM41vCBw0APYCEnUrkJXCxL4OxeJX/DmVyzJOcgnIjxx1Y1SxlBrI/LiIjYbO79dAPlJqG/tpqKzqa05KPhqsXpq4ItCUPd4N/TmMOI5xaiXono3vcGiyuYndVt/EF+2MZtXu4L0u4LO9KamhiqP9hrsRCLg=
Received: from BN9PR03CA0908.namprd03.prod.outlook.com (2603:10b6:408:107::13)
 by SAVPR10MB997818.namprd10.prod.outlook.com (2603:10b6:806:4e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 07:38:42 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::af) by BN9PR03CA0908.outlook.office365.com
 (2603:10b6:408:107::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 07:38:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 07:38:42 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:41 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 02:38:41 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6777ccMq647375;
	Fri, 7 Aug 2026 02:38:38 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v3 0/4] Backport ti-core-initramfs to scarthgap for j722s NFS boot
Date: Fri, 7 Aug 2026 13:08:33 +0530
Message-ID: <20260807073837.1394655-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|SAVPR10MB997818:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9f5938-4a05-41d8-0734-08def456e794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	3eAP27pqR/eLTMxmQlGiR67F74gJMoN3kelTMvFMX8PHl8FdmlLOiamxJUsGE3QzysWWs3iyJqcUZclVcBH9Eox/Cmavs0oVjQv0zKA0SywzDS643QMsWtVi/fE6coGP8IejVAOv6jmpiKiqRSm1Lx2R3NUsv9ru+JuZZLUawRsl0QsefBcOZvTFlkYRFUDHTnUjGUVfaSyMkJXTQm3zhRvoqDt1co9ne9oHeTNCLcHaT2GNZugjKWiqxE21rYKL00pkSwK0vbkfJhfIxizLSqoB983TCuZgNhLBhoa63E0l3weZKScdag3yd1rceycGxhdivLwA4zldNgaIlXkW3qBPNZ3k4DXJ1P3FGWLbx4j2paN0JXBTAVsADv4I3QpJogR3TzHhCY9B0ze5ir5knq14C2skb9s+aE4y2siKsdgetHI59rua/1CZ7zJis7/ypSlwaTdRwH5VKYbpjs8J0+4WuBD/GpF+Ll09ygImShHI0E45PVz7z6gi7eOuEftIiJpqdCKuQ1HvffCcmq7VJZDa9tCkmVNbE798aiQ7icjayVv6qH1Vq5Sv/g1R2fMbc/hsgilrXqIc5qn6gPntvQk4Gg7+LAkqOuDEBtUgA2Bt9oJPdN2mpmJoARcb+5STkFDLl12+0eB0PCDgQBLUHfJG6PMXiD7fW3pvSggEPQO6StUPO8IlJEowz4Qlnm7JjkyWkEsd6QQFf4yNt4K0ow==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Hwsp9aUn9yOYGoGc5XzhNjEMe5C+dkRGsRP3WWVnjhYCHNOT2DB1i/L/2hEb/rEvEDUkwBUPD+V5cUPZf18TkvBh+ORMBxe3xr2fmJa9rZcOGIg/4eDiUZVKdvd/EVjoIGarKKX2+6auO2KXMzo2ejulugsmHUMYrVgR+RP8Ju0AmPTZOYgdMLD/2pPF/iiFuCM6dOynEAH32Qrzj1bxOT4tamiLSGCLydW1pDbBJaxG4Yz1lXiXyOw+DBmGotfO5eXq1NAt1odmcOiKPvWs0Y1PWuZwuTCoF4w9lkXIkrb1mMpeYKDgGvRZINHJ9WYlYMXL/hbE22ZpLuSYNEY7Az9wMhu2goZngB30C/Dix/vqjUWfAXZlrcnwRaOZB+bxdUTKiloyEhfto6BJjC2bi9s3KIfgNc2vYEgyQ25CW12XLpQljZSTDpwhnXHvAEfz
X-Exchange-RoutingPolicyChecked: 
	hxGU8ejxMXJQI31pXQfw5Q062ecmrYFqgX50pHhGdo5IyK6MyzvdNT7fLl5dfuccV9Z/Bg9nMnTystwIn/jH29VNzrsbeSFmjoRc+5HBZK1aYNcChAffAZ03Q+wqzYvZq+RuU0HHSrSLP4r9pzPLQPAP29gTKEl9Zb+9COc/hMRqvgj8GiMB8dXME93gaT/JBIDPG0xBtE6kTCeJw6Uzayu157D/QcS7wcicl6WMfqgYbdqo36IXFo5B+6TnZGYjPsyAEJK64lMrQBuwSVNbs9ZZY2WSCwnIk4r2DuCAkiqAM4aDvwXyHppBMwdvRRFU6q0OpBkBTXQTj/vLdvBm2g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:38:42.1613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9f5938-4a05-41d8-0734-08def456e794
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997818
X-Authority-Analysis: v=2.4 cv=FaEHAp+6 c=1 sm=1 tr=0 ts=6a758b85 cx=c_pps
 a=7whtcbPCeBOLW6TxF+pv5A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Fbz_sESmP8aA6jJkymsA:9
X-Proofpoint-ORIG-GUID: 8rAPFs7hKmvboM9XnbDpjK8eBriaLseP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfX6h9yic9LmF5E
 g+g40+pLngB0ZU49NoZkBIbY03TVig+eTUuvA2FlxkptXqxC9kLC+xBC6/TISy5AGgOzuib2Vwh
 twG/6IMdOCdjzZuVrB5ds7Emi/lpIvM=
X-Proofpoint-GUID: 8rAPFs7hKmvboM9XnbDpjK8eBriaLseP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfX8T6yQGhmFdNv
 sPT1MaqJHj/y+wgL3OkXBdKmwOjoI1iAA15gckxVREe2fcUsl26JURrBHXb0Y+shKZlttZyBoea
 pAK2x3r1n4izbiTDVPCFpHtRvhLl70lvc6mnIqaEaLeqEZ3T7mP2Y1YpeXBIu9kQNAXVusmbrWm
 cofFB6xKPDnv/MP0xUXJuySvihNTAkCVnDxPK7w/XS6GW4Fslx/upcLtIdfIZV4LKKC2O94MNPJ
 C2Aywayq4qt154rDd/58EtRIwS4Wrs1xkeTZ0YsLZA8J1b74UZu1RjNawhfjml2QMfbVf9/mr88
 GxmObH50ExYP5W2DhpPo3TzGUiMCP9Kp6O6vuHjufY0YbWXNKDbptFiwTPcWFzwTKjXc8GK7siQ
 DIhB3vXPw1Pkjf45LZIi8cKtU+QbdScGDE1FByeI94OlG0iow1a1szx3rnVbQ0uQG0zgUfF7Msc
 rQr/vgW8jb+0WSPFgsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 07:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20235

Backport of the ti-core-initramfs + initramfs-module-netsetup
infrastructure (originally developed on wrynose/master-next) to
scarthgap, scoped to what j722s NFS boot actually needs.

Changes since v2:
  - Added missing PV = "1.0" to ti-core-initramfs.bb and
    packagegroup-ti-core-initramfs.bb (check-yocto-repo PV-1).
  - Added per-patch revision notes (check-yocto-patches REVISION-1).

Changes since v1:
  - Dropped directory-path prefixes from commit subjects (recipes-ti:,
    conf: machine:) per check-yocto-patches COMMIT-MESSAGE-3.
  - Shortened patch 3's subject to fit under 80 chars
    (COMMIT-MESSAGE-1).
  - Fix Signed-off-by in patch 2

Moteen Shah (3):
  initramfs: add ti-core-initramfs image and packagegroup
  initramfs-module-netsetup: add recipe for DHCP before NFS root mount
  initramfs-module-netsetup: add j722s CPSW proxy-client kernel modules

Ryan Eatmon (1):
  k3: fix weak IMAGE_BOOT_FILES assignment

 meta-ti-bsp/conf/machine/include/k3.inc       |  2 +-
 .../machine/include/ti-core-initramfs.inc     | 23 ++++++++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   |  1 +
 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 45 ++++++++++++++++
 .../packagegroup-ti-core-initramfs.bb         | 30 +++++++++++
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 39 ++++++++++++++
 7 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
 create mode 100755 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb

--
2.34.1


