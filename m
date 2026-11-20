Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3319.1795203868617640889
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 11:44:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ojrUNTAu;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=TFnxHSjb;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKJcfLI525866;
	Fri, 20 Nov 2026 13:44:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IW9guqwwU6/+0syPnmELYy/f+pYwnZ+qUuFPl9GZd
	sg=; b=ojrUNTAudj6Aw17UboynPmErUXTPdRun3M2QOwRgVNXaW1lq9KtvLdhsv
	v1R3s7qFywmTOqdTZboxlyceGt4+wNxiyCmlLqivmHxlw6pOZWkeF3ZOmIXRN1RN
	KJH7apYhlox0TdAHMhQHfvBzI6uBz3CPfY43SKq7SDw7Ic/BfBn7hP0tEjvxEOMK
	rqE1K09vnNvxtHYdhVzPitFHQ/flL0CC5ympxmkC/Vic22TcEQHhO1HBNKn6HuCm
	EFMw2GqFNihBwlulnrm0T/7alw6AeMFnCHi/zUd0F16USrFvA2fWl9813pS/k3wP
	cFCCPUtNzIfZeszUeo1kqXaeJ8lCA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j2d6m58es-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 13:44:26 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7x/yjpTZR538spJHjzbfN1Ah8qKdyRYdfUHrUg56xVXAOTZdnCXFZ01ZrDMUHVODT1VyVRLpE+lv+NFdQItA/mTRwWqkmMtY8XUFhwN54ERFiwlRZ9fXZHix8n9stTotyyZBIyiF7QwfJy3T+CHS0TBgdC8AVRRj6doS4MeZaQz7Wd0UxuuV1U03iNSIMZzAP6hqFgs/zfm8wTpJCmlrqMd3IsFdxNP2NZ34SzQ0AvS9uHFPfwzCn/XnULD0DUO/wXA1N39DijYBDnZAA9zsaRV+nBK7DnsQLnSOZYLY81WKMXx8EOrLp9EPMMh+obxvwAtpcsqN64IkSyTM2hARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW9guqwwU6/+0syPnmELYy/f+pYwnZ+qUuFPl9GZdsg=;
 b=lIZn2IYuSnFoACR3+yld/XxK5fsOJHzkUsgd3uSP2Z2l6cTSgV6NU3+zMB/pcSd7gYzhtF292eVLabT0uoXmBoavwRdyMwesZ7wMK5VdKuvR+79vRXOCyjI6Gxet7tcty/Dx3TZFRwoaTTefPpGXfBQka/LvFQZ6YsP2s4qSkxKmtTUchWmFvdjay3vKuroUhaRpoU2OYKdICX3WObxaX893YUqXxm8sOvyCGg/pnxUPcaUdWcXP2dGZ8qpqdrw5I9QcShinM6Azze3oe/uxkdU/Yh6GWgtq/GLa+JH0xFnTUMxRsXqVEI0SnSTzolAuvnEdJLkhU9IwdT+AJy/akQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW9guqwwU6/+0syPnmELYy/f+pYwnZ+qUuFPl9GZdsg=;
 b=TFnxHSjbFoi3Q7U80nFqk6HBrxaxTDnI00aB1BBl4gaQYn6ppM5t5oe2yTtxPZevgitifY4xr9v+iWHrPz6rgzeaVu4vG0rMEVwbvqQ81QXVTBMU9zrfba6wav1RPJ/HyX5WbMdzTbxURfGA/WDHgakG/GKgxt374ypetGnN1fVbD76e00/ktxE8E4yiq/wnn3n9frECcsgvXWSt0YF7D6qT2FRuEWsyA1RqexHyvWwZil5FSlnBG0uwDeKPKkgOPKnMPrElHAMRtUx8MVBemkX7R03re2VR9goNTajK9eiES5xpo7i1fZZ7pTBG4LYWvmTbl+AcwDnup2mBVHP3kA==
Received: from CH0PR03CA0374.namprd03.prod.outlook.com (2603:10b6:610:119::34)
 by DS7PR10MB5214.namprd10.prod.outlook.com (2603:10b6:5:3a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 19:44:23 +0000
Received: from CH2PEPF000166C5.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::20) by CH0PR03CA0374.outlook.office365.com
 (2603:10b6:610:119::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 19:44:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF000166C5.mail.protection.outlook.com (10.167.244.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 19:44:22 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 13:44:09 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 13:44:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 13:44:09 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKJi9Hh1734059;
	Fri, 20 Nov 2026 13:44:09 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AAB569A9C4; Fri, 20 Nov 2026 13:44:08 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202611200727
Date: Fri, 20 Nov 2026 13:44:08 -0600
Message-ID: <20261120194408.1712316-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261120192641.3262038-1-lcpdbld@list.ti.com>
References: <20261120192641.3262038-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C5:EE_|DS7PR10MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef8a195-c657-4c77-7ea9-08df473ead1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|56012099006|10067099003|261028144727099003|261022105027099003|261009223327099003|261009221727099003|261009220027099003|261009221227099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: jTNrOYh3JsTgVD4AspdQYxvd+k3b0I/pSoHFz+pJpgVW7pT7RXJv45QqnOcOVDBgn1rH2dz/+folwzvyTbRdIo+zFKhxeVoTcMWClZtFlhqbrRMlEMK8/2cxrwj67xqGV11mfBwFm5hXhdk+bt41P/elqX7oJ+8+44Jh5kRSB9ISKYjVxPtBtBlgvPUr24kusfzVef04KGSklOFxXgDNQ98OK5ke1OQh77DjJ/LavOrwyGwTY8zpY+DPJzHmNYJkZ7FcnQNYogt/3+/+v5RfdcVeg4HLB91+Y4CHF6ERkjXvLthEuDlRjraw+Ukl5FMkyd3wi6b/Rq7i4OtYa4k0c1G5fGg8pUtgD/JG84jDQNA/xgFWgN50v2B8NRKRS1ubj7F9qwJA2fNmv3xQ7kqSjIrXuA/pQyy2N82pmPHzIO5JFEnsARRkO1cD4k09A1G3nWFGBe4gWDHZ+Fv8wVCCoQe9ifl8ZGN+VPlWVY8sv29RiqGmVTsPbcvfnijfcHUrRAPxIOAE0vaSf1s6yIiVt9XiXH7xF6+xUnIovMXmw4JZTaOyKYzKv64dHy/KysRvj0IyB0ri8L9HaPJVqN6Su6GaM7rb2RKSAtAVU2Xpkwl19XhLDMqxx5KswGVE9Cl61goHBcsZdLEFYJBnzLI+MiHWWVK7BGui4JPqYVs1YjlbsfdKOcMGJ0sfkbzfB/Dexiw4r3wd4eVSwJXD2+C5LA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(10067099003)(261028144727099003)(261022105027099003)(261009223327099003)(261009221727099003)(261009220027099003)(261009221227099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WOWqoJhc7mhSRkRyQVzPkUksoXieSELRzNjPuwEBaV2+o0s7C+Uy+RL6Wb3TssEDhVfWeOapztBZsXowzEF4pPg41wrbN+43WiLWqRXQxu5Y0lH/v4rMjTzB/uUQ7+15njYcl7nytvCUM4d3jCnpmL8Dkw4euB0i03E8aOere3MEIu+YqkkvHJW+a3XbtLzRBYYUkVV4IdMdlEqYcaEwrgkU7X4BQrlxiPMw9Ac6gvgRJIfg/6AQSvjoAMxtPy0r9Wx8Li0RkkbZDD/s2naqCWOs71WRT65fepW9auRY58YzyRfacaCAvr6xu4YWn+ZB6RrhhQyWI625XmEAliMp8L8GX17PqbntZehJ71IX7+wQkyIEd5xF4ke+YrumOMEvCH778K9L8s63+9B68yRE1orAdV1KjVM+4ipa04qpvBmwew3+ynczsSrsewkxvHq/
X-Exchange-RoutingPolicyChecked: CU+oEl7hXdCvyV+c9TidkRbitZuOcPuWo120Whdk1p1gNBYFzP+T9QPKUWmLmVdJ17rHzMvEr79x5HY26UNVYEFhJcWRmxGHy0Yj8WM3djzbSX3kc1RMuX/zKqc7WHUI1VI+Aw8ZGC1g7sosom+FIKBVzb4GR9yhMONBVu0h48BkDEGIyXgQJS6H4yY+xtyxmXGqLZgjwFdulimdQabXFqNXbbIkiHWOIDw6y5+wFGwDAvhX5b3RWHlbaz3y3fetflPUIPSR8qPON/BanfI4PlW6MbVlGyqS4Uzyz6AWxg2G38AmoO8Z7u9lViNswIUreI2aitDDTm2izA5DvFJUDw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:44:22.6667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef8a195-c657-4c77-7ea9-08df473ead1a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5214
X-Proofpoint-GUID: aF6tzbW2kABMO60WuAID3HfP5NZZkst-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OCBTYWx0ZWRfX0Rd22t5/H8yO
 Jnsv2QfKL7udmbKq5wrMrv1yt07Ooa6cdRcslGieGw2AUC1lVTgVvzkk0l95lBgstYEDaVmyQQf
 wHAy/O3C6sEAlY8ahT0C2NqE2z1aUD1UlzOLsC9/a5dy7odiu7LQbMynzhE9n80AKgpfxUQS9tX
 JtciAZjhvcB7uWPlhwqpMbThcFa1i1wSXPrsC1KVI7sTr4plf4CqiakEdmxjYi8h6bFxyGR4qcd
 GN9RvjRSz8fDFOz7NS+0PTCIF3eaRg1xKgBXa+Y0NntA/0wfkcxU/oo6ZQvH5SgueFFRntBdTaG
 m0fwWH9+lDK3A6hHwFlNVFKAY06+57AojfEkA/+GVeYcLT/uyDy3HsGmyS8BwdgGGti99qZi2fl
 sA7Afcv2LyF0tlld4VSpoOOSCjGVdEntVcloUrt9xpa5v/QXEIuULN6wR2nhD3iALmvNG4WsPEp
 w9FPS8NNSVSVeyqPyaA==
X-Proofpoint-ORIG-GUID: aF6tzbW2kABMO60WuAID3HfP5NZZkst-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OCBTYWx0ZWRfXxsctXwRPB63/
 THdmAq8cAAlYApxmsmwgAdMHiYfNq4vZZSIXWcneH3j13ujsjbOT+cSmzqDbBQp9vJmLxsqnIvx
 C4lEo/RN8T5ezuFY/oVECi13k6uDDhs=
X-Authority-Analysis: v=2.4 cv=c6U+0h9l c=1 sm=1 tr=0 ts=6b00a31a cx=c_pps
 a=x8MjW6KKBoBq+i/1BMmcjA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=sDcKDnvLt3Gq9M-cWdQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200078
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 19:44:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20566
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261120192641.3262038-1-lcpdbld

PRC Results: PASS

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202611200727
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 20 Nov 2026 13:26:41 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 15435aa0a46088ab46d4796a49f042a3d6992e51

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 0965779c6ba73772a0781b081e02d4e6e02f97c9

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



