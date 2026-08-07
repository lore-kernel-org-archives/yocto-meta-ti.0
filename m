Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE23C5AC82
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:02:12 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36922.1786082530536046448
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=B4lShuuu;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=FWlg05Kw;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770G9vk1309782;
	Fri, 7 Aug 2026 01:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8JW3j2LljRORM9NipOxk+ZydgrBg/fWRBuQYioFhO
	gg=; b=B4lShuuuvTUl00W5M356KnIccE8DQjHOvAT/WO2q7YPs+jtZSBZTBgLy4
	UtWmQC0wxK4oS45QYp+skP+LdpB010lcJF/EbjpvpauGWKxgxgdS26Ik233Xr5II
	vCPx4KesL3G457ZZgMhIYUDu8iPphalL/RV/G8a2rYvE3u0hFs9X2wgI+2bX4Gs6
	s8UoS7v8c1qcwDMEv0jhE1BOhMb2A47UslpSxYHaPFzo/qQcKhpbVn1EwgDXstdx
	jOiMN8bfa/zBarWedSL7st7SofN2ih0jd6xvZc/6wszDjA7NVrrz6MmoHylZJZZu
	5743atpKchjvXVJ14R435pSXT/qhQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvs73fasm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:02:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTjn6kb0PZ3jBVCTmfoayj05G37nERvlN5jRYLS3w9IJAESeavJv6oNIc6ZykB8AqtW2iUFIcpmjxtLAZvM5FOlXz6bYv7DHF8Pntjybv0eBRfwP31X8cIP04DLjXvtthb7PJR/Ank4YyJjI3KpMaUH5pvBT14rysi/t1TcT7BBWnf6r2xuKyA32XnU/SNqKXt8bqFuaZ0Pmm2B43aVqUT9I84moUpyoU5T9R/KXotEDfHJGJ6IXVXQU8wy1pmF37TlcrYbGC4y9i/97jVbrvPa5FXbxM1b7UzJwD7PWz52vwnnoDmJzfiMv7joI6DAGY675YsmURQ5UXkoXB0RRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JW3j2LljRORM9NipOxk+ZydgrBg/fWRBuQYioFhOgg=;
 b=a1YzBH6gWXLt1L7ZI5eQMx/H16JhoWqHx6lF7k0a6LJmQxOj7gp2z2Et2SEyllihx1+DOptG9U+42jBxm398cmfQQfIM8lFjecN8cYTUl3S+p/GuZLJ0atXkAI+sTg7AWxHXuwCUTsjhTyBODqNCyN+dOzH3CtUNw5MxgwnDDKsw3dKayAlyz/vv27lEfQfiTWQYDbkL/90awlAzVZgRmo6MN1Abryph5q2g8h6cVYfL6Dg+EWbZaXKlF+Y5ZWWmUdvlXeVsE7zkGYsva/Pybsb+sShoyLfELPU6BLSlKssbaX9eW7eLqoW2LAHi6iOlt5/RO7ChxSOBuhg38W6w9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JW3j2LljRORM9NipOxk+ZydgrBg/fWRBuQYioFhOgg=;
 b=FWlg05Kw/t1BXD7EDgVnzJAwjspgr45jWE5iUmcGJVHO8wiwdg7NFoogvD5R59DMJk15EeZ2NwOJmopcoL9iX5j9OXe41VBvkv876T4CRScd6oAmYINT8+lWbe0mPL1VDSsO+n4uQeS7TLaosQ7pLUwq3qxfakMRZ3Se58AUDLY=
Received: from CH0PR03CA0058.namprd03.prod.outlook.com (2603:10b6:610:b3::33)
 by DS0PR10MB8150.namprd10.prod.outlook.com (2603:10b6:8:203::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Fri, 7 Aug
 2026 06:02:06 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::59) by CH0PR03CA0058.outlook.office365.com
 (2603:10b6:610:b3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 06:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:02:06 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:02:06 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:02:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:02:05 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67761uDo508776;
	Fri, 7 Aug 2026 01:02:03 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH 2/4] conf: machine: k3: fix weak IMAGE_BOOT_FILES assignment
Date: Fri, 7 Aug 2026 11:31:53 +0530
Message-ID: <20260807060155.1381364-3-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807060155.1381364-1-m-shah@ti.com>
References: <20260807060155.1381364-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DS0PR10MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc81443-270f-4b74-fe6e-08def4496904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|82310400026|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	yoKCgclp3McGFq7/2eyPROOpLoKktjoik1NSOdKw+m+PKmqWgOD59JwncXD8/A8I9geUCZiVSnOqxJKOAIi6LCYJ3xeHw25V7BorqUJskVNc9+5Qd47d6+ekCRAu9yek61evBhX+teiqEpkMLXj6pyW3YZZFMPlY1I7Vp3Q8L6DHjcpB/b7brlS5JypoFdv7aycnvNU9KJlsF2fJ1rdWPrl40WcOg3XnkJSi6nTXh/PHu1HOov3Tm8/jXhxSO8eFI0+ScxaV2jNpCXEOkasfKrQJ4oMEuo+krpNe6I2A5qMcbALN+fd51UQ5X/0Nun3iRvlJlRpeSfoBHMsK+8wVleur4L5pzz7BNrbhFF8j+rHedExRHpkh7WkzAoiiDHS9GSI6IimHZmIQT6Vfxhxid7K3VxMEgnSk2AGcK0We0BbzizrgrwIKT6NBZuYaBN5TVSejzXiRrG5SeEeA0QqAtanXjaUm6pAtfQ+jhiyLvlxsVqbPzWJ9rCLfSWXo5gdMXPNrGxcaUiWtshcDoGb5oVB7WmsODgVr/hAZMdg7Apps9z8pElb+vMEK7fy3Dtnq6m588EQDEZwlIOTCrcG9EwUz7tCtEiMtOvX+a+LaZXgsVsISokYkjxu8V7EHyetWkQksWoXTlwrMapBw2AQD0WtxB0jw2r3LOq0M/puqIupQJ+YT4WrJ/dhx+/cm9f40De16feI645jXMtpur8MXRA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(82310400026)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TWgdfspu0Sc2ijzanocZNMgoyNAGvizVf7vIgKBjrLIRIIR4ynfIiESMtsNRpRUH31NUbgGhLAeLUOfDhsm1rAIJdZivCHhrGf+WSlpkAfhXsyPjUyr7USSQewzB6arnCwFsqSU98rPn50fPjGavxNJQ5vZMVlhZFXXHTXBTsilHt17d/f7FINV1SvavuO/VDBz6yYrwIE4yyPgo18Jty9tpYhDBzBBNNYNApzdCjcw8rZlZ+K5VI0AWY+oLtW9E3LdybWfTIUllEtI4ZKKEnqaEuVb4czhT0U9NoMfwixM5B5NGtFIOxImQto+Mgayw3rgZheyC/CYHnFY5zPRcGwGKFpzd8Qz1RpWEJifp2j49ngyfObPDJ030x560sT3r1PGq292YmBToSND5woKaxWmqVGeeJHT8PktJu7JDxcoePjfhZ/NsMvmWv84Kh2Is
X-Exchange-RoutingPolicyChecked: 
	KdwfyeN5QTTUqsR4lHoKD+Mz8IOzlB0gYudjMSbSLo+QMHG0qcvKxovex0ZJp6wVVpqCDKB9OX6grsCJ/BXN5FwNYX+szMAPwBe1ZXHBgrim/UHbtwMkxALO7/JdcR3Fj6X8R3eTMOkaBWCHFL8Mci7k7VGn5AAIGZftzzQV8SJ7CVsf7H6XGDKDIIG+zvrEBdlL9H3jBDNF5TACBVfEeE6vOafSFazaNP7R7wiKtIpo5gw6Pkn+SBRGW+bvCCNmMo1pX1u+0KTrdfM41hPz5l2HeU8mAUGqD+cT4k5pNti3i4VR/WZAC97cd4IIMncEWnfv7AIxLj6TQ41FojPHrw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:02:06.3934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc81443-270f-4b74-fe6e-08def4496904
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8150
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfXzibjPaZ5ixJW
 LZUFnYgMOcrkZR5TomkJc+uHlLQL92c/gVuQk3Ohp2QFb10vlBgU6Pb19GqcutQzYDvfuf+1efo
 wFHVV6cgngoCpZsUcH7w6HcUuZPJuEVbOn24efGdxbsyy+mYa/BqlvOxJJ3TVZ4OhLLfmywQLjg
 N8JWe3ILJZgCy7Q5aI4wbipyeP5JYSl1EctTuqj3IIMdSMasTGbyyo9MuCwXbTX0I0LtEr38MDM
 ygIy+esOP4cR0GZx6KaFPTYkFP8vAkAKlFbjkbPTsB3d94qMeSdeYYn7jZJVbGjNBM+0KrNe2UR
 DzKogBW7lPC/N2D9Z6LkWDAgJ6GX9Y6cBJ2OFr36gFfKDlo3fnHsSqeu7JxM2ZgW+1C5NqLxLjA
 cCdgvvTWP3vZJSTNbeCFiLQCDAZBqcABPdT6aEyYHot9ZUtMcEXv+3dWlw33JMq+qo0K9oQFLAE
 mrJbP65pb80i2zDDOmg==
X-Proofpoint-ORIG-GUID: nnrBNnF3y67frG65cRyPtC9G-1w_l1oH
X-Proofpoint-GUID: nnrBNnF3y67frG65cRyPtC9G-1w_l1oH
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a7574e0 cx=c_pps
 a=DYD6gEfmkstUuBQ4PvrWrw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=2TSoTu2kLeWY2qruTVAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfX5MC3iQfXXj69
 VOGAxaXioAdcnN0plRJyYaa0lgWHKZ2DwWfe9ujHUsz9/FH7K8LA2IORB5yhUyymJSoWYDfgLQV
 SexCi7Br3VjH2j9o9hEXsGyb73mvNdY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070042
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:02:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20224

From: Ryan Eatmon <reatmon@ti.com>

ti-core-initramfs.inc appends the initramfs image file to
IMAGE_BOOT_FILES. A weak default (?=) elsewhere in the same variable's
assignment chain can silently drop that append depending on include
order, so switch k3.inc's own default to a normal append (+=) to
guarantee the required boot files are never clobbered.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index d17ae71b..21738316 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -44,7 +44,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"

 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"

-IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
+IMAGE_BOOT_FILES += "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin tiboot3-*-evm.bin"
 IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"

 EFI_PROVIDER ?= "grub-efi"
--
2.34.1


