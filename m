Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13952.1794582996727921814
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 07:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Oe9aP+fn;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=FrCEHtMD;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ADEckIH1934754;
	Fri, 13 Nov 2026 09:16:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XR/5vCLG/0iNw4xORLrb9UNthYGwf5HIbLzdV4uu1
	OE=; b=Oe9aP+fnkdPaK68/DLzHr87nlkp9zMKfZBDep/lUcFsrXIsKWWlQq5Kqu
	m41cG2kKOTL3Bf9aIB1wPefHWcHoH/IfLwHy3qxMAeXABnQmkWY2aggM2+fqMZfG
	s4g4/dhQUgQF0arK7aoO6Yg0NJawq1gRTL4P4zje5kCArF4kvpuN6T5t7a7AHEhz
	xLtG3K5XsArwqC+pA+F2ZmnM2y67Cks/RI5M4qX/aPzkeZRlEbfJJD6hSbv5BTma
	V8/b2Nlljdg/PIx2Iwf78D9mQC5+QeuZMMZ44Ha6zjVz6qr8PFAVfuwq0+sdceeY
	l42oOxa84YFw2M9kA2ibcIhwZtdjA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hwytcj3xs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 09:16:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV6p6IgVH+645pc3eLpdYdMBqxGWXEhnVTUv/FlaMrcNRbnc1IxxXQQtqgL8GF3q9TflXXp8WxiEiXSaQ7wDjeknhtl1Rk0K4aZ5ars438EK7waw0lUQdznAcX31QAlWJSAaxYbvXAiNMarayd9bpnNzpe8JG6/7ktx/LXN7bfpFn9uZOqY9CoUMYix9FgHHW/JtCFv7ky/MoRaYidZHgwPHDbrd/FQpsnmWT4s4OGC1P8zEPGrsDIqVkCLKQxfTCQm6rG4O9/bROvbAzzQhi/Tb/r37B0xXow9GeAnY7o5nxvHNrdc2D/kXrcqFaMOlCROAjineDvZJCFq4qOtzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XR/5vCLG/0iNw4xORLrb9UNthYGwf5HIbLzdV4uu1OE=;
 b=REhOyF4EXBdjKek1RsZJk7ZCwyDxCpBNAnreoAWng25EuGRzl7c5kRkQ8aoJgIzSZ1aPWyRuYgOyg/42BO/0pJkJvOATJqfjCb7dM4UYUfoMGra121pMpcheW9HPnBm93cvzxf5nz0QCim2WOJCqAXDLXrWv3puoEkX+N04Neve/4RrS/S3P0XCroJ92NJgpyD5Km78anounQI6yWZwSizOS5Eb5RW+66QlH48XWZF3bl0Ijrdu8l5h5lwOCvMP4EdPm4zmcM/dMA++giPujYPrkj14UKWq5ZFQ89766Bn8Py6wuXVy+hJGeI0pb2EDSxkk24cga2Q7CVSYkjR3hbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XR/5vCLG/0iNw4xORLrb9UNthYGwf5HIbLzdV4uu1OE=;
 b=FrCEHtMDlXEkhso4s2tDYeivTkNp9RkIG/B0Kfiup6ZLxXNQzrBvxfAxLWVrK2D9wALNF6cbLOuO2KRmwfhnX2NL98dgk6QpupGU2RGyTajy8pPFOBlDgfJ4Ajz34sV3lwB3miLLTkRNa3Xm/Qjqsf65+9QZgeZiZtDTp/g75o2AmLZrWzmCYCoY9CQrfEtqM1PEpomw7VGRyhndqDfhi5VKCZY9hs2OPhyMHdMczy5suxYaecnIGlRnRSuqHzcwkI5A3HWNo0/2ArWQcPhz5qi/DPVR6DxCjmktdKi/A8afBEvHyI5cwcuEN5EtuXrU22HW3eBQfI0niGRjdB13vw==
Received: from MW4PR03CA0002.namprd03.prod.outlook.com (2603:10b6:303:8f::7)
 by IA3PR10MB8443.namprd10.prod.outlook.com (2603:10b6:208:572::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 15:16:31 +0000
Received: from MWH0EPF000D894C.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::4d) by MW4PR03CA0002.outlook.office365.com
 (2603:10b6:303:8f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 15:16:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000D894C.mail.protection.outlook.com (10.167.249.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 15:16:27 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 09:15:45 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 09:15:44 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 09:15:44 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADFFihJ1123567;
	Fri, 13 Nov 2026 09:15:44 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 39C699A9C4; Fri, 13 Nov 2026 09:15:44 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202611121800
Date: Fri, 13 Nov 2026 09:15:44 -0600
Message-ID: <20261113151544.3147179-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261113150854.495239-1-lcpdbld@list.ti.com>
References: <20261113150854.495239-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D894C:EE_|IA3PR10MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 6edc569a-63df-4c31-c43e-08df419916d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|56012099006|261028144727099003|261022105027099003|261026140227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HYJmdW0o1cf2NeH2OzeS7dpXvqKakSTZvlH9IxsY3TMkdng+5OvHozPm/fS6TQBkJNDIL9VoW25OtMkm02NnC1LqVREGr7ZisJ9kvx7574GiANLFK42oVXSNFcpxeW3hHXXSb17r7uH6Dw5lt2DUagEmOcmDb2Y09yM9Dfe+SpjokimnQCXj0gHYYtMdLLHY0gEf3bb3N9jo1gWnbbGTsHFVnISqUwbfnRuRrr8FRL9gEfnd3S3LzAM9jJvxbVJor5oAGZSqUkVvOo/dCmqS94evZR4OAIfEAuY4GQKOpACaHjlKJ4fd1GcoAwckJ+1Sb4PjzmCyCOfkviRWoeVuA4vVbgH6NzCoI6Dp8WFQWcpCc9wZ9esKAex58IVKTR3RZKAqoOpkFMKWFyPfBuBY4GZjBMIl7rYGEsUiboA/rvxLRnoZ5B2qEXTI6w9VmX6T9NkYgV5P2ocxeN66m9+D+kF2LMmbdSk9hIejXkzWjebvCwAbX/wkUMO+FfnmOvSiuguc0N3GtEkhdn19eukCIB3aFRY9Rm270ZLUfRmzwArvPYap1ZfGMW6hVjDjCpyO1dF5tu48j3tMDpZSMnZqJtxfOY7vWEVUCKgPK7rtIjE4SW8i2Fs+gNPFjFlnl6dHpFdAzKr1QIW8A7sago4l7yjbK2P5w7VOJKLe6DXlpL8pHaMaG+IoAmIwPR+aB3qRZlNb9qZuofDmd7tlSAu28Q==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u9kuNnkoIH5WxzC4lya9ZM+9NAKLW+D9YiHyBeqpCkK4Zv1x2Kh2yHGjqcTY/9/LBIKdm8C9D0nRnVGJEULIweY125YV8XTLSItRo78kZsbBdNAHLJcL/WLwCA2nyo7LmqvRK+dMMkGiWgXg4Q9ywdbFd18byY+4mpjolgfexu86zP4hT6WCUIaQRPLHf1O3WmVL39akzNDJb49LmmSa5/Ef/R06jMhF/Hdqx+p5PATDf4hwdk8+8i/+UI6Q69RS1EZZV/X/ItcDx+j3wnVCQ4idfn0s1uwabekW1KMacsf6nPr9hn5a+NBQ9qohbh2x/8NwRMZURUskbgoFaiKHmVBI2dZgnF7MpVsn9FcqXvmA7M3sUQ62KDiRGQf33H72Ca0lzFfSOlB0q/Ub4Aec8pwAyD2wLsS2KMMPN5wIV7aCM/984t/zj+r73FAPVTGJ
X-Exchange-RoutingPolicyChecked: pBIoYn2wrUsIhYLz6kDo+/SUYxb3UL8WzXMB28nOxOVqWLulydCZHFN+lEizryt9+pfPODAzqbeO6V2yQoGVHwaPX6Sv5tvYROaDdKB8RQuFq0AmjyvUKyjDElsLwu3lfnWFd+02XhgdvLF9CJMl8y6RwdhbMyIVzkWc7J4kWrS9toku1yhRfHeFFXFWRVZPi2jkuX/tfAihK2yT3V1GKQsLy3gEGk6iEb4BM0DDES9xz/MzRq4L0OW669oYhwNFJcVADt++Zbw52EhLBrM4d/ht8eUWcoRY8mMzMRyYRb3V2IGwkru4oxi3qa397AZMi3h1y/WZGQcZ7NY8fs7bPw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:16:27.7727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edc569a-63df-4c31-c43e-08df419916d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000D894C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8443
X-Proofpoint-ORIG-GUID: zCG_F1atT_EA-H0k8GNf8_CE_wHgeKtj
X-Authority-Analysis: v=2.4 cv=fYI4WEQF c=1 sm=1 tr=0 ts=6af729d3 cx=c_pps
 a=021mb8W6rIxzgUEI7A/+3A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=4ZY68HAGLeiKGXEF_NYA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfXzUmOUSg9Byp6
 S73c4I05lkIJGpUqgOqg5ShtZkRWA1C76d4l5Mshu7lw5mr0iFtj1pEmMD3ErkUjJLx38RunilB
 4S8tsQW/yZWTQiIAUcTOw2USPbx3SUw=
X-Proofpoint-GUID: zCG_F1atT_EA-H0k8GNf8_CE_wHgeKtj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MCBTYWx0ZWRfX8pb2I9Nzjx2j
 hFQ46wW39vlHCfcCf1m2+UdVO0UC8qfoXkDg9OoVsdePQssoUN7+XjaoHDTcqf3Ca9F+pVIbWYr
 xnvtyqTV/940FuUo2f0sEOwmBHDjOjPdQfH8AFSTGNI/a7QO8fU/w2TSiHI9uleBY0gvNDbtXTF
 oDP1qqM7KEw5XQbVC5fyRQyBN4WsAaUEt8bRmnumWyuiNUJLEcNgRpv6Mz65XxexSdDHJK4BCgv
 u4b+mCqFVE96LjGpTRIBMcFmWxvckvIjKGEDW78/T+YEuvMNHWd53Btl1poh+Gnq3JeeqBPX6bO
 SrDMp86r31I4iAF6mvMl0/0Sd8C718XNG+ZUnaT1tv6e31WWOhBLHazBCxG6SIyjFf0ObKHAWVC
 b7Bl6zQzkxfjRU3KjggaY6XyfO/w+OJKWuya2JQtUlVfUiXRl1hvkYowYinahEpiLjTnRWzMDcm
 1u7OtdrwkEMGde0kOxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130060
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 15:16:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20539
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261113150854.495239-1-lcpdbld

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
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202611121800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 13 Nov 2026 09:08:54 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: caed6d736d5a2cd0bfcf56b158f9209fe7dc032c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202611051452
- Commit SHA: 1e80335cb1f082e67f11f342e7dd8de5b4b84d98

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed



