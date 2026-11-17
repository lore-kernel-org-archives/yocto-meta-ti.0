Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12790.1794900905708417134
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Nov 2026 23:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=FmroQ9b0;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=s05QIkTi;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aBGT2899438;
	Tue, 17 Nov 2026 01:35:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dgYQHMXTzGrnckSYOuoWP/eQckfG79NeacDzOxbYt
	0s=; b=FmroQ9b0E0nARlCi2DNX/bcLHRp59d3sKFf4AYwTpmJLWAnXt8lcGAzGz
	LSADq+89PE6WHTIOFveAFOrhQl5rzwAVIB6krkfXqBg4TyWSLw5P7MG3JR/r2Pwo
	K0+UQdcsO2KZH0mSIT/hZ09y/qf0hROVHJwxH01GInBMcPyAK26qxN+4xeGs6+oH
	PDhAyJfyVO3X+pLvPU9NUKFZbqCUbRHT1O8D53FVTlrxR9NGcfZeJWhFYjx1jqx5
	faKmYgHGJ9QdhHeMkOXpvSA7OWyqHOe4VGBix5QGxb/CZiTvKcwOsHUzko65FR1U
	Kwspn07pzlmlfRAnAeBGsakRFxypA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j09f6tqs5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 01:35:03 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTxhDnHQQvOM4JVbMWqJnNkb1/HOFZLdsEnaiBXYdI5Cw9sMCe9ZfyeT/Ixvxln8FJTlteOaxhMk/B1LCniHiHeeNSgY0/sVHdIRjUjIoKi+mexTCUPsde6ZD6P3BK6fP8Vx7rPYh1tpBDTmkA5efmmYpcfOXgnTSsNJ3SlWDQloQDWDAjkamgreHyiXTb3E5K/gKIrLNLsUJHsiNEdB14Shn1uqE+hCb15jbZ5EV9UPzjnrgSgB1DqWgxRTzQC4w8mcBDkCIqzb+hnU/w4pltpyS0+A0IJQTcuiTI8erdqU57B7CMZjbcnPsBUYgBX0Qklr8whqa+XY5Q4GYL4AtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgYQHMXTzGrnckSYOuoWP/eQckfG79NeacDzOxbYt0s=;
 b=ezLUy0it/tGEq5sb6qGapygI2n8JicYtnsqk5l3a/t9sKOhxoSHB5PIUoNE4YzZCxt0VGjkzOPAHLiSnNf8VPzfQbT7dC8UWnUWLnIitzbPpTiMoGUsoFFSmA+NWnuLhQNSijvgmU1cJK1li4oI6w/loXHrVoXVyKIUWFoVoKTyFY8SCpO4apsBPORZMQV3jQMzwlh71faq82Hb9ymCd+lQR7pXR8Qkro6++RPJxbn3LZaThsrGWB148ExFMe4ubfgi2lr4Ep32XeYk/0dlE+PrswRMnwWFrYjcv/GtBy097lG4l89DVcHkJrE8J7ArW0xDMlhRpcKRdJfWWuASrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgYQHMXTzGrnckSYOuoWP/eQckfG79NeacDzOxbYt0s=;
 b=s05QIkTitDB4vSa3kAs3czoEHAdwP1D3XPVbfkgWQBjkfht/Vje22CqODDneurtJvp/uBtYwFbpLFYEL2CBp5MQrxDdLsfptD+hzTLzaYLhS2QGtBCDelJqxH1i/1K4CuCMJ9GiDt3vOER2hrYGm/gmlzwciJVnd1IBaIyN5U5ktIET8ZlxzvW0WfnZqLVl5tSz8WjTDYl47l+Ilpr5OSKw5/md3ukmu1sBRHZXRTsZxiZUTsyytJYCwC/V8M4QSpdTTkXBqq3ujobVBljmLb9u2METNQpN5MVvACbW6vHow//FrYz//Q8krBws1kUv889eAyNXLcpKUpZPpkhSA8g==
Received: from BN1PR10CA0028.namprd10.prod.outlook.com (2603:10b6:408:e0::33)
 by CH4PR10MB8049.namprd10.prod.outlook.com (2603:10b6:610:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:35:01 +0000
Received: from BN2PEPF0000A800.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::54) by BN1PR10CA0028.outlook.office365.com
 (2603:10b6:408:e0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:35:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF0000A800.mail.protection.outlook.com (10.167.245.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:35:00 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 01:34:51 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 01:34:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 17 Nov 2026 01:34:51 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AH7YaS63444759;
	Tue, 17 Nov 2026 01:34:36 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 668AC9A9C3; Tue, 17 Nov 2026 01:34:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202611162200
Date: Tue, 17 Nov 2026 01:34:35 -0600
Message-ID: <20261117073435.3770328-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261117071636.1042902-1-lcpdbld@list.ti.com>
References: <20261117071636.1042902-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A800:EE_|CH4PR10MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c60791-db80-4801-ed88-08df447d49db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|261022105027099003|56012099006|261021121427099003|10067099003|261102123227099003|261026140227099003|261009223027099003|261026121527099003|261022075727099003|261022115727099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: eCa4c1CbtSOw8DcvzmzY8WZsWQBmxk38V3ufF7MaCtPQl4nERVx4OxrRhAiRoOs+N+gJLQLbIvKnGa1NeLQwwqanrDomqFdUeYtjgt9dkX5LTk7HC3HN3mLrhwTOZ1rsqvkJM4NVQwl1o2OQfNnIbG3p9o11kIUD8H3ZbGzjwCqY8cJA7mbpMfswF3WFmH0cFfMqEULOp0qgruL1w9jCzhmNYBKqPiVeuQiZD1oJ/qMYvlJUicVuKThOlO9gcqwi7XJ6oCs0PkN6t0Ba/2ch3gJ3P62eCuQ3iP+LPMjzbc7OSvjJBRPFZxCR2VUm0B703E6xa27sZFZpoGNV2j2z9Mtatdyzkp4zYaLLphdBIg2xTdXBKXHyZrAEXmoNmC6n+aTgmVUqwYq09xNnyYuJG2WOVrMBcmuryPrYHk3/6tUejgQxhYVCvRu23kbI5cNnMTrrnkHy29w/AhZC0XCYChkYMjqehq9AUIx4Bx4PiUxv7t2y5TmdjcoN9qn9HdsIHZYsqtnUwy+TDjqDBUVq9rHle+5I8S5LePfd+Y/HjPJPib/Z9B8oD3fGVhQbISBHl+6wGnpRUSPZjpiCVaxT8wSo5ydGAwAZdIYckFqeSS3UmrC13HqHEv4qAGe1u0TMebC54MYQHr+KWI1bSXaGogcmyxNiSR+TmtQzfGS1wrAZpkUntWEyX5jHF/C4fkaTVbQuZAqGN973iDBT1LvoAA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(261022105027099003)(56012099006)(261021121427099003)(10067099003)(261102123227099003)(261026140227099003)(261009223027099003)(261026121527099003)(261022075727099003)(261022115727099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7uTrAjQha0d3A4i5IGA6JRZHdtzmRhBd5lfrEiqI9CQwlHjjxYJ42Ci8dnEbYWxkZyj/o/+/xzQITuvVOzUpZAmOzbGvharskm5sdJ4DJPXMHVuI5X7/EknZ891AIJjjv+i6q/VBHwPRYCDeJW+TS+7jrSu+9Cv8rWaiaMky4wzPcgkJXaqSTnoVEj98GYJYi+jVVkarGw0cpnFVVd7BeyK/W0VLD9h/puuCaQ3l7eErEyHq85+rVFkAiIZcr2YRUI7L0O6Nvz+Trqfo4QNlwooC+VsCVguVDN/kxm7tt6h7dPbnHhcDkoAoIZGb27IR4sHFHCZ2v3YblaEKbx+7lhJnxalEUDeCWXVivw/CTeCWIsz1Ohrueh7oIocl7dfDtheXOxCcGtnK8HZ3XcYHM2pHS76u0t6VZ0Jghp9yOwn6L0wG2ICO0T7cVihZmo7W
X-Exchange-RoutingPolicyChecked: 0/lSSdUl0owg0FTilDz90D+vX8JxgndwWJPtRXU183DBfpJpulk7rxiCBCvFbiUdib8POqS/fzdT69yqOt6y50u6e/LGB7fWEwxZhLhULgecNYWPRtG0yCGh9K96D4BciK8FTAj776XU0WZo1bp7ixjq5q56R8bT5r1qVillv9N+zIIimdAjm28A2c3KyyT3G59+LYrw5qhuoaeuX+SUe8R332r51NMCeK8z2wM7swJOpFA4cZhM7XgsB97UYYI41UyX/TCCKU29z+viI7D4GhBnCXAeF4xy4yErFFmGA7YuJMtda+7IQAghziF8IyDj2ZpO0Kb4y9h8E+8aJLs/aw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:35:00.9496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c60791-db80-4801-ed88-08df447d49db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A800.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8049
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMCBTYWx0ZWRfXxOoYi1gh8eK0
 iiU5hMmhv0M4SP/Yh6E6B6lSQqgrcqfCws+jzVwMOcqYPLze+4KzVDsR0A0PO71rZva1Ivyh5fy
 EGwQuEV66QnfgHwAtvTF3cpmFFy3RS8=
X-Authority-Analysis: v=2.4 cv=WLjqzXsR c=1 sm=1 tr=0 ts=6afc03a8 cx=c_pps
 a=aOchWjQmdX1ADhYh+yUFEQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=SzT1B1LAFfJv5yI_ovsA:9
X-Proofpoint-ORIG-GUID: DHr7znUCQex6m4uZ3rIxX3la1gHK1EpC
X-Proofpoint-GUID: DHr7znUCQex6m4uZ3rIxX3la1gHK1EpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMCBTYWx0ZWRfXxopNnP7OAQIS
 X6Wj8MfOfSm8k8dOwxmqIvSSl+9ckUkG0jmd1IZSTDZ0j7Xfk4e8+d8BzQKYOp2WTDki5Ga7SnM
 t4Mkl/ITUXHA5rTHakST3JJTVoOjro4r7qj2lYNfrZKGQE1gj2zaPUcEuriEJqii8cL1Imj6eXO
 gSSHzRnJj9MqlDzsLEIMFvrnT/qSglecDZvp6QgfhdsJ0cmPXWqYDbZdBDwai/pB4urgckMU+A9
 TBArZ7bSjjDVPvrUEeDi0xKF4371V6Rm7TI9sY+dPYvc3MF8RMMcrnlH74c4DXjwPcZuDUC1S/z
 JhnrMkYN1/wvQIs1/9rm8CHiufoMM/Wz5rSuPopZOzwM2/Xmwivry/D2FnqaBBLysjzu4Gp/K8W
 r8Khvm7WJ4jr3qrgM9hzkOpIMX0XwlPL27RyzFdPJ2EwQNekn+emx4M4KabxpLdCs/1Q9gowBFZ
 lFcUicL6S2/tKbSkOGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170030
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Tue, 17 Nov 2026 07:35:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20553
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261117071636.1042902-1-lcpdbld

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202611162200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 17 Nov 2026 01:16:36 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d1633a001fe15dfefd142bff5a5dfb8ed7c59b16

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202611162200
- Commit SHA: a3518c7b3854cc2e6095f19842b0560c43a8dd65

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================

ERROR: Signature change for grub-efi
   grub-efi:do_create_deploy_sbom: 0bcdd89a8d6a2bfa8bc2bb84cd323bff9da0b3c1dbdcb3daaaad642fc1c09cc8 -> ca2d95336b7e5d4b08a3b35d1b236d7df45b1a9b61c58073b1e18eaf7bce5801
      bitbake-diffsigs --task grub-efi do_create_deploy_sbom --signature 0bcdd89a8d6a2bfa8bc2bb84cd323bff9da0b3c1dbdcb3daaaad642fc1c09cc8 ca2d95336b7e5d4b08a3b35d1b236d7df45b1a9b61c58073b1e18eaf7bce5801
      NOTE: Reconnecting to bitbake server...
      basehash changed from 0e84486eb7ac14c2614b55fcbc2b091c717ac1e7006c72c7af76117a9d0aaace to 3fd7c7748f48d21afb7b677dc006f3deebd4bb01e474876e765dcd8e52afac62
      Variable SPDX_DEPLOY_SBOM_NAME value changed from '${PN}-deploy-sbom' to 'sbom/${PN}-deploy-sbom'

ERROR: Signature change for meta-ide-support
   meta-ide-support:do_create_deploy_sbom: cb3d3649ec86bbac8ac7992485f82f6283b4a6fa117a0643fee104fe63b591ad -> d7a26f0a62b5bc7432e12bb5a3610719e90784930c42d259d867b7b0f5bdf019
      bitbake-diffsigs --task meta-ide-support do_create_deploy_sbom --signature cb3d3649ec86bbac8ac7992485f82f6283b4a6fa117a0643fee104fe63b591ad d7a26f0a62b5bc7432e12bb5a3610719e90784930c42d259d867b7b0f5bdf019
      NOTE: Reconnecting to bitbake server...
      basehash changed from 0e84486eb7ac14c2614b55fcbc2b091c717ac1e7006c72c7af76117a9d0aaace to 3fd7c7748f48d21afb7b677dc006f3deebd4bb01e474876e765dcd8e52afac62
      Variable SPDX_DEPLOY_SBOM_NAME value changed from '${PN}-deploy-sbom' to 'sbom/${PN}-deploy-sbom'

ERROR: Multiple recipes found for ovmf
    oe-core/meta/recipes-core/ovmf/ovmf-shell-image.bb
    oe-core/meta/recipes-core/ovmf/ovmf_git.bb

ERROR: Signature change for systemd-boot
   systemd-boot:do_create_deploy_sbom: 6e1d98d0b27e8aa831e9d59ad4318e32bb4de06f66981866fb9705d7a9abf7c0 -> 3676d5df39e2c76e664f4b1b3673f7f0c14c9e946110763383234fcd41d400c7
      bitbake-diffsigs --task systemd-boot do_create_deploy_sbom --signature 6e1d98d0b27e8aa831e9d59ad4318e32bb4de06f66981866fb9705d7a9abf7c0 3676d5df39e2c76e664f4b1b3673f7f0c14c9e946110763383234fcd41d400c7
      NOTE: Reconnecting to bitbake server...
      basehash changed from 0e84486eb7ac14c2614b55fcbc2b091c717ac1e7006c72c7af76117a9d0aaace to 3fd7c7748f48d21afb7b677dc006f3deebd4bb01e474876e765dcd8e52afac62
      Variable SPDX_DEPLOY_SBOM_NAME value changed from '${PN}-deploy-sbom' to 'sbom/${PN}-deploy-sbom'



