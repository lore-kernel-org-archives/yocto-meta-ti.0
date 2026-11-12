Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10862.1794576495209895207
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 05:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=XqGhFjoI;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=c9PosuP4;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCWZZ22027860;
	Fri, 13 Nov 2026 07:28:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hU0D6q8lLG4KCwBF1VGkxRKDfNak3qGMhxWOx82kE
	nU=; b=XqGhFjoIjv5VyoY8keLuPcSXSfR7JxyWHG08AIxhiTqa+Xmfj3b3p3OYj
	/1QbsPm2K7fJz5H4zA6KaJc+O4dhrqd72jTCsJCMrNvaKuf3rQ9b7oyd3DQ+pAZY
	LH77/lYt1o57Ggnl+IyChDuVACtPz9+qEV2E6IBIhBYLxDoLrOer2B7XLkFlIbN6
	cyTdG138oqbq5CXJ96jCFR1LIyRCPjVoiJCY7/efppajWDhJ+hktG/91kt7v+CGI
	u2vKm5xhxcwHbioZgk2BF5aC7bzGoxaPYjRv7Iaot2n45HF5OwbEDK+ZZnNyPtML
	my7JD5a8fT3dax/6KUPlpDMZnU4Iw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010034.outbound.protection.outlook.com [52.101.201.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hwg9rwp21-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 07:28:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKonWDlhNHeRVLjIoGgADTDWYDP3RkWyokhgT0z72msjOJRmESafMmdbwMYuMRMJ/Dvvvt3OPNriThIsR9RUYj+XCKOvxnaSvFVzqXmPlbRzv/QGyKZFmeOEZFAwxpSy6ljVqyqoS+cwVKD6PMAuAsO5UarkjLoAw7ehe7GJsamMfOE7F7hwZzm4JpV6jUr4YIk1aonEvqGDs0BP2raEcnV5yZwYHhx7GNm4kL/kxutYKt9utRMBVBk4qC9LrVuv5R3wyoX4A9uT49/02OQhT18ms/S81KEAJIx0bUeBxnnFiMYb7P+oKZiOnaZgH2iq0oql0rWMM9Ga0S0ZyyTkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU0D6q8lLG4KCwBF1VGkxRKDfNak3qGMhxWOx82kEnU=;
 b=xFun/N/spjyfhB9K+wJvmV0pFEEAIXkUjvj0Bd/mVpIhjHKRVqs09jOyqvNg5tPi8itpGNBbuT0Z1OA7VGgEGCNEWvo2LQIC2AnsUF6oGgMXJ19kzaMmEy4od+PAUB7HBGPViXzWd53dDiW81Q4Mu+EvhBQKGBbBmC4MnsIsNcdek6tQqGtu+OPj3MTx1xmHLJ6PBbtkaWJHH5PH+9iDLmlSvn0y5ga/oo7oO5cxL/u/ZpVnpi8pxDbELrFRV/ihGXlow+feaF5Y+8z/GULYUS0A6mBS0QCZ6cLRT+fGGlpzmOBlNs/TwRBQ/OdX+9cj99QVItrYkQl4h8AJTcAcaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hU0D6q8lLG4KCwBF1VGkxRKDfNak3qGMhxWOx82kEnU=;
 b=c9PosuP4DGFA7FWCBPuVXqE48TR8mfrNvBsUn4gOcxjerKWXhDneqxzzvyyv7Hrm7oS0MF41ciwa3gIPf2Z6Eywuj3gOAWIW4onVOasfK7DyIV9XUVaDKVfnv3d46KMfIWHIkudzebALL7p/k6oAWJ1FyCW3xX1G1yIkdDOxHYeqQ6RA0m9d5yjKcAcqBzek/MG4HemcQzgZL9f9F9hM1rdgarBPfHGv5foHJeckHpA8mYKua9IQ5DsqbUu7UahAMjA0TGd36nYoJgQfXKQJl+eu1/H+xITjA0kHY3ukNc6CJXTH0FcIw9ceWACfB9OSsdjK3QiziENIsZEiwKoYpw==
Received: from PH8P221CA0060.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::9)
 by PH8PR10MB6411.namprd10.prod.outlook.com (2603:10b6:510:1c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Fri, 13 Nov
 2026 13:28:00 +0000
Received: from CY6PEPF0000004B.namprd03.prod.outlook.com
 (2603:10b6:510:349:cafe::37) by PH8P221CA0060.outlook.office365.com
 (2603:10b6:510:349::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 13:28:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY6PEPF0000004B.mail.protection.outlook.com (10.167.247.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 13:27:59 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 13:48:23 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 13:48:23 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 12 Nov 2026 13:48:23 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ACJmNbv810445;
	Thu, 12 Nov 2026 13:48:23 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B04299ACF4; Thu, 12 Nov 2026 13:48:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] ti-sci-fw: Allow empty SPDX deploy artifacts
Date: Thu, 12 Nov 2026 13:48:22 -0600
Message-ID: <20261112194822.3135483-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261112193230.3112236-1-denis@denix.org>
References: <20261112193230.3112236-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004B:EE_|PH8PR10MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 825f4a4a-0964-4663-2a89-08df4189ef5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|13003099007|10067099003|261009223027099003|261026135527099003|261028144727099003|261026140227099003|261022105027099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: T8V8gmLrtCkQZ0idPmiAe4Sev3Gu5+FaI8tqAKwcNFuhtrK2zjzVK/r3kevchDC9T+jGWVlvGsux1VxhvUlDaQWwe3YAUhYvnuyFQJyzJ0aGI97Qe+wjOb/NajYZF+Vzz/xNYQqCXiLfOSoG3V5yDpNjPgtZIXwfaBClqmW4bKL9nbeAydwIUhxWjEMcf2U1N6AnduEW6DOeARXiuhveOjLaM8PzrY/NDVHTqU8aWgNV6R6f3xfibHRNxPcibEeGl1PcXpj8oxsDDGzVTCoYYo2DNiMSMIsLjefLo5V4hhOdwFhzOblnA8UyNQxjriddC86ENye0otnw+DiHHFLrZOhGKwb0SPhoopfd/iNwmaHF3tb/CqOb0Jh3fVptZeSc4E2rKU9+unUuCXhNabONJoO1sp3CyrehcfqnlN4ESsVoMW35zOwN9fVwwtUWfO2VpACYo1AyJMWGtYGvuQg2vmEC9hD/dzebMnrB/og5IA9QDJOKOpEzpo1Zpcv82pkcGuGGRLTeF7CVUe0RpX/XSG+iEKhD7npcw41gsZBGLzdWRLC1L41kzrEFjdPjArxGmg91SzVRbvnOUe2t9V2Rr8zRfS829cLa+9qARf5JOhY/rCfQ7RhfFVP8UFKVASgsZ2X8kzel6v2p/mydLQA+eg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(13003099007)(10067099003)(261009223027099003)(261026135527099003)(261028144727099003)(261026140227099003)(261022105027099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yDdnpJ/Lnrw0nfOtbPcsqSF0WE5pUawdt0upCl+LR4/wvgSa2XHAfSItAXZyxjyMfGtm0e8HY5W71Bp0baVYNlaUeInmaxBm84TA/XU7luQZBzvD/7bgjYTGaQa9sluBu7QaCuVPrBYEceTBmgHoAKJR9wewq3+yN2iymw4U0uAODfsbe9VPRU07aOpNQbbmmCaUQqmpAm7ldTba9TQyVJ6+FZ/mPhm095k/J2QkFgTfW0GZItb1lqfdPVSAyzKqs0n/cBYdL5WdSc3pzMlcX23vsLelCbOe1fTObGwv3NaqqXtgUPgbMSS5MWTFpWhonaTGVOen5oLYL6GfF3tx2XL3JGAKnDFj6ueiy4KjmSKFdo5wXM2MbtkA/IXVAw1ThUr9GHh5hAGz6wFX1l9BQ5j15pTf3Gued3CP48+YpBKZCVyjvrNB3OyerulAYczR
X-Exchange-RoutingPolicyChecked: G1BismM/6F5DLy3zOCh2gSbI15FJ3dnz+mLDC+0GBOjwNUCXJyUuks0Bmzdg4zdvD1+CoEExCF+1YosDajOjgWD6popUmuVEQXbVM7eXmw00qPdiU/hc0MyWMEFhGalUZhOI3ll/nM4GvqEZRd1zhKoGfDEBXy6iqXtv4v+z9oh1lRypNRfr5UJAt2wBUKYvVkqc6Q9utcIyHwxTrR6QgHiVdvNhAO7RO5zppwZtewBloOUq1GD4UNMg6k0raL6FLWnBOQMizKz9RDIUDWepkKMsWTV6szUxOm39ApqPTkfe8hgqSUFofsRdm7sLkuIgX9Wgm0Yy19EADudfBHQtOA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 13:27:59.0972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 825f4a4a-0964-4663-2a89-08df4189ef5a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY6PEPF0000004B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6411
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfXwvuEh9HFaOTm
 biMW+8Hx4BFjWwBvpfTeWMu5bMGjEJpMG6AyBmVrS1p/sNC05qbdQTJ3mx3Kh+rQ6wVZShVl5sn
 4eg6DPOzZsqh2EseYjfmWPAjGUVXnFk0S9A3nEzbBeSlButL10FrS2JB6VnuVtxNE61677MhnbF
 WAjbxc1/cs98RXk5ngjS1gRZR3WqWTv4qYfbBUKFwCrmpAa/5IRKWVbRtGpumUb1xIXhnya1L3c
 i9B9uanJO9V6G5fQsUyFDWkELTyuoMNm4PlA6WBPQA9zLrnMy/83EKFS2LbEa56DsP8ZRDCjysi
 91SrawDzYF+dNkWExyegcT/H8sJRA4/zlt+VDmkTBKDeZ0ztK/j6Yd+V9TUC8bjmK8Q2Y96WYpw
 4OG+99L07oRk5CLYk96TrpbGQkxn6yaNhviWfLjCEPXgeRk79OIVBV+Y22CXtqFwZtl0oEDVO7x
 jF+d+cd/ywgZBSfLJjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX4/UlBxl+F9xe
 oA2p8IoNJZSkr0Ib3u3Piyivpp6NldLBl/j5HjnDjL8SPNS6bbm1YJkU6BOmZw/XkRNkpKhJGB6
 jvnDx3AQEW9dGFHZGuNb+tytkoESB7U=
X-Proofpoint-ORIG-GUID: vMGt41TIA23zGmpmsJoaY5hzCCwZPKuH
X-Authority-Analysis: v=2.4 cv=b7oncdGx c=1 sm=1 tr=0 ts=6af7106a cx=c_pps
 a=p9IRwfs10qZ2nHdxx/cwJw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8
 a=6GLATJAQOkncxUS-d0gA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: vMGt41TIA23zGmpmsJoaY5hzCCwZPKuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130053
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 13:28:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20537
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261112193230.3112236-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH] ti-sci-fw: Allow empty SPDX deploy artifacts
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH] ti-sci-fw: Allow empty SPDX deploy artifacts
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Thu, 12 Nov 2026 14:32:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0d0e1e71af1c6291c2e85eb41ec8e21f0940a08c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 24615f53b9e9af5e34c8398199e3ccbf8163137e

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
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed



