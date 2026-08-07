Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE13C2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:02:32 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36614.1786082551120073368
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Mugt7qPU;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gV9VXEXB;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6770GQTH2309346;
	Fri, 7 Aug 2026 01:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3kcQaiFHwe0eD
	x08wT4zk+qOUvKBvQ/T07Cdb6vu85w=; b=Mugt7qPUWh1cRvQPh1ti+xL3DRJFG
	i+p1xdNgrpx9WlOf5Tc+nEd0fAiHmpOH7eGpR5ceqYURSoezDs0pSfN3hFo1LzlW
	2XuDXHvJyvULToDg7FXyscLK2hhVbDw5mtJjcE4EKYG8nzFzUTb0ufecIWlvKdFF
	mKjlTB9XGrop11vE/V65vCPQYX5LGOvKg4dcH8LUU1UsTX+Rpku7lsuiyUzr1AZM
	syozagAtcIlcOQu6+okL6N64y/MkKcC1JhgbdO4r18632eEFXr1jCpDl4YXNYLyC
	oCDqza9qiNxTkemjSNQxN4zg3kqmt0fDiAqxMvwe+zgJnAlQPVgYuLT8w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fvqjgg08a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:02:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIf2wCaaO/iveKBfvrRkBPFMbBDv6Ygik8IBTLRh1dxAOgzvEXOnCMURLJW+4wzCXK2QYDDmwcQSsMwXy4KbLIOTq7hSUfeP1jwwhoswUoo0EE2q4uKRdICMDrgO1wbx5PLq1gn4NnqALzr4YWbRn/xzWgK9o9eYMj/50zAif99aHDJ/N6PUbOqaHYcQPxSa0jAM9TqFu2Rc3DG9QWKsKcYZzx4IEhTNej4wYvSDHvEAwEjATBlNDC7zevx7yJSgo1+mpKlO603ujOXRQst9OgnqZIDjsbVfp+kpviHxg5fGXUo9WLTdioFAu7OjnTBg9dO6RI4F4T6EQLhxvtrRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kcQaiFHwe0eDx08wT4zk+qOUvKBvQ/T07Cdb6vu85w=;
 b=vn+p2sv9UVGjb5Dq3KZlRjQl1byDEFzPhJ4yXjaVrVStlFVwiG7QQkv7DGwMSJwAyP+AXHZb/mGIjq3NfLEJf0RqdrQksiRrbLsaxq1gWDDN9lM2PcpH1RhGXzLVKup3rExbLVY3lmRls57QFdlmMP9pZBkVc+d1I4v0RVdwYBRTADjCV6BXSERsfN+9SvVVrpw2VpVjhBHereJb/ea8QuTlDgEM0Q4OYxolY6g7MAJe4jNm4x8yWlHHNi0UvFi3TDk2k+jmnthVOWAM75jDS44LUNXuLyNuOwme/dD8vI9nlhwNQxoudWzG98FR6DoZGNeBzkLqZZCVJUaNeCwnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kcQaiFHwe0eDx08wT4zk+qOUvKBvQ/T07Cdb6vu85w=;
 b=gV9VXEXBD14Zavv9Q/9DT5M0b4XPgnKSUPzeftiH0ZRYEAiTmWgazJ7EJRi+uV2Xmgd0rbriKtu01QTyhgjO+k8jDs5OaYLwy5d6jDW6D5hRNLA3K/KuRvYXs09lUCVTCtdJEKeXC0Tvj1ufwEZpemSxm/DV96fcxQjDJX5BiDU=
Received: from BLAPR03CA0088.namprd03.prod.outlook.com (2603:10b6:208:329::33)
 by CH3PR10MB7503.namprd10.prod.outlook.com (2603:10b6:610:15f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Fri, 7 Aug
 2026 06:02:26 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::29) by BLAPR03CA0088.outlook.office365.com
 (2603:10b6:208:329::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 06:02:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:02:24 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:01:59 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:01:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:01:59 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67761uDm508776;
	Fri, 7 Aug 2026 01:01:56 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH 0/4] Backport ti-core-initramfs to scarthgap for j722s NFS boot
Date: Fri, 7 Aug 2026 11:31:51 +0530
Message-ID: <20260807060155.1381364-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|CH3PR10MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f43ca6a-3d59-42f0-1b7d-08def44973c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	TX1/uR0RQpACNbGYyjZvOEcBsGlcAI4PUrYk17ZGMUG/pBTme2pM1/r/V56iO4Lf/ovgNfD8b0n98dVuL2LEkG7Iyhj3kRhQ9ZY+Qq7J4AhChhEMZcCPrB5doDI8ZRN3JpewuJoS+c3UvhBffuqGF7CrkkjA2hfoIA7IXSVCpqFesf0AzYMjCsoS7+H9dAVyLmMKD/sYR0iC6Oi5L9Zr3mGf3lquh1DSMcsnUO3ACZ584W6yK9pDERe7wzoOYeclFY4t2VLQFcpnqVGwe3gSOKmeTWIx2xYt2/yzUZiQAc0i4TasItC14/Vb/fw28lz/+chA7YqkXaOafE8E+Gmm7r7wNFao1uSNKSzmI4OcSwS7NExV8TyNYH1GP5dNJ1Q7gPUQMUl2w5C4YXcKm9Hj/IKA3zrP0O1im8s0RGOnT7an+FS1rmMXQkRD/M9RZEImbakU7Mrq01hNDeGPXWeSPw9izuwWE/Q9779wHTUAE6Ip5D1XnyKDEnermZnHmCK1dMKy31N/cMLQ57rDyN5L+OFeuOBGVWFkz4C+wFF0vzmC28vuiA/Isnt8WmyydN1yRyZFi/A5a1uRcJNFCsAWv0zS88pt9w0FRQi/G99mHI5yxAvUx4ahKfbyffY1IxHRouQRbnXUbua2rwISFSJOxC5+IkbwYnMVvVFGfCN5/yc0CcF3o17xZYgOTeEyHaxt
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UDE+fj4nEAfDauA/ealmPFKwBHvGYqx3MK8iBG0fzP1YNR2RlTWJKFexpayTCkYKxisYUJKOzKqco3yT/spzpETh/GniwPAZZFgff6Za8di841YpqIRNOJD7SVIlrWhTW/2ANoJB7Wc3VLtBTuHeVY9H7by/d0pZMWcQD1viopmPekwlBvpQbBZ1kr9qq9IAIUKiS7LVnArcXbEBBM5p2TIk8BDXoFBWngeYCp92s2RbkyuJfTfFW/lhLXIKKPZQO1wqbAxp+oJmxvIuq9FHiOUm+UpnYdbBa/9p4lj1NbpvVaXAcv82px0FB4Dgb/TfKpTSEtKNPncuzZ2wkLfl0Cr6UGrJ71iN8Ni92aW7FYbHEBfOACXPJ84yzrQDhsn7onV5zxriA4WHN4gPbpiSRV08afbPB7V4MrrdPxFH3LdYPnF0sGxl3aaIZ+zs1VOV
X-Exchange-RoutingPolicyChecked: 
	LrOjd+yMVBncA3ZYJGHkehG0Q/yJMQLLIy25cdXmQnOb45Im26kdeS+ZPu4nHkl1lgxkqe1KM3CGMIEIaOlpZ0Z4PXKEZpwdbusSAOtDoTIob9SDCWqAfu1APt9cGGebAk4jdfZ2d2K2lURfXibJJ00Npl6bkIQnrjcbSxVjz1o9aHYejPrJUp5Wy27Fu/UISm1OkNE6uvFKUSr1UQUtWMtnRtFlAiXTE21WGqjTcz3L/SQ3yjDOJRoOBlBt1P0aQcwDUtxHR3tAw603FtoC9O0HQdCHa+At/J3dRx0NDIQrG3dsZXve9hW8M0/Mnz1CBbxZwByKa3PDKRgbQgVQ0g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:02:24.3898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f43ca6a-3d59-42f0-1b7d-08def44973c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7503
X-Proofpoint-ORIG-GUID: -k3prgH33Ey6bsxBeloiTKM62iPX_veZ
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a7574f5 cx=c_pps
 a=gE6CMw9pMCRGQsgsFAL45Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=lYREvPIXgFM1O4-5EgwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfXxpU1HiD21To9
 ONzhYVKQTbgbSg0d/7vT0BpStLGCG6buGqa8Hj+MMPXifRAp8KiZi3JsOPVVxFeVbOUvvYZACGb
 Zpx00tugdpckAo/o/F03SFDvJ7ma2T0=
X-Proofpoint-GUID: -k3prgH33Ey6bsxBeloiTKM62iPX_veZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfX1u4Qx4qS0jv0
 OXp4f3kYrSSYgWd30nH1d7xyIQjj8/jgHX4eg0Mox0Fd3/zOhYeotxDbPxiqc2VPeG1dpxpA1VH
 Iu7UsLLzQMRWI2DcAmymY0fhqSip40mUUc77iCJ69xYEVH5fdspYvSrTv3b0WnXUdmYJl3xjTmL
 rS7VU2+WpJlDP05kRXMyp2lzNImxbicfflrv++WVCgYe+9XgdbI+3fNr7amieJxHKYs0RBWJ7+/
 gSrDt6uJrlrXJMeB8Z3648LdSquyr0NkXwqNDsWJoiRIcY79wH/kC6TaeDoPZFLoyyHE3kllh6A
 V74nd6b7l1tuUX3mZDGEnv3mHezE9mgViRZVl20ZDjq1gOY79ewgyHfsb3XqdDKIi+aI5zWoEPT
 aG47HFIE70eoAOC70lIRN4a2D2ydjj587Fk6/DNt6qtHI04ZvkGSrP+SBThX/FU7BX/wtSpCLzq
 wBS5kcSIm05Fi4jryhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070042
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:02:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20227

Backport of the ti-core-initramfs + initramfs-module-netsetup
infrastructure (originally developed on wrynose/master-next) to
scarthgap, scoped to what j722s NFS boot actually needs.

Moteen Shah (3):
  recipes-ti: initramfs: add ti-core-initramfs image and packagegroup
  recipes-ti: initramfs: add initramfs-module-netsetup for DHCP before
    NFS root mount
  recipes-ti: initramfs: add j722s CPSW proxy-client kernel modules to
    netsetup

Ryan Eatmon (1):
  conf: machine: k3: fix weak IMAGE_BOOT_FILES assignment

 meta-ti-bsp/conf/machine/include/k3.inc       |  2 +-
 .../machine/include/ti-core-initramfs.inc     | 23 ++++++++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   |  1 +
 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 45 ++++++++++++++++
 .../packagegroup-ti-core-initramfs.bb         | 28 ++++++++++
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 37 +++++++++++++
 7 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
 create mode 100755 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb

--
2.34.1


