Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85468C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 21:58:36 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1630.1787867912912511523
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 14:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hn8MBAkB;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Xvy1zzOz;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RJJrnI3901807;
	Thu, 27 Aug 2026 16:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+L+ngI16Y27lC9YlulRzhEFLLuNrP7ZfH99Ff42Ig
	zQ=; b=hn8MBAkB9HsHWpEpYSqDzdxzHF45o+lY41xISo1xhTs6rIYqdO32uOwwb
	Ca14nFXIgf4si/EtoUGcIelWsLIaNS0yub8rHxI2E4in9WWUvQVlyrbA833fuOmL
	CM2Y5J69dIFTNWD8CzRHSikrhSL5Q006WYn1E//oj+DqpzYha3GbwBrev0Ytf7pD
	7+O96BgTKsoLxN/jXedXIwG5gSmKlq7pyyjYOvwCtfFEi7b52195OhweBJvy9reW
	YLFh1FXGGpN4en4AWti5Oj8RXo9a5yTENMNz8eZsnoRDVr1WJO613IVqon6yBjn9
	ihrB4wxF4tI7JSw9vxGkGcj6+3+jg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010050.outbound.protection.outlook.com [40.93.198.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gajhhvms4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 16:58:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jc/CZKBuujMDEvtjAl6UDTBCEH7DQQ8sS8tuvya5LhIT2QHxXrEPHAYnxNbTIlOpmr2LSpZ6vUftzqO+RgRyyklZhlL0EsLsztpkakjDzqzwipHz3cyk0fPaUBuSnkI80JjdiWOfVhsJmqzdzs/RReNKYg3FB7z4OvTClPVIzsOVEEuOPsg9iZjVuOFROchx57p/crLl5+RRVTCN8ERqjyyOGUTWK05RhqcbqnCmckw97Rm+L5vtNtMqBiFRVli7rlN/2oetindF8CjBmNFt3LowdapsBFp5xnu0XgOyL+BUnydMrj9LI78e1jF69thTADIRPu+5EgkXdOVa23k5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L+ngI16Y27lC9YlulRzhEFLLuNrP7ZfH99Ff42IgzQ=;
 b=GEivwHVkXWKFJghf1mrpnu9FN62wi0C5qR9gkpeEWSR6CEyZ8jnKG+otH05PDDHSmkxUjrfStk1pMAMEajXEImPnQqi+49LJYXLtrTaUhmVeA/YVxsCfqINqP6gVeAS9FQQe2t0efOSYH9IH05YtaF04hAAlNK0EHp2tdRCFWkgRcx/KxlX4VhjjoykciyCTENDEvHO4OdBU4r7Z00OtpF8gbb4wsapRG/DoKE2SqGkbNUC9QcnGcwu7/pDAfo1eptr5KKpwRRNzAFTsFVf9KbHKpWTSCw+IX5/JWGSmhsDkTYlgh7rTvkgGAx4nrOY9qjg/iwcIvmrXd20ZM/YBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L+ngI16Y27lC9YlulRzhEFLLuNrP7ZfH99Ff42IgzQ=;
 b=Xvy1zzOzcOfD9qa3hynXDV2Ae7GA45G0tiFABNgNHesProp1iksyPcHlkDYrUe5WXJLZgV1YINU8AGv6hs4rkX5UF9xBqzFcosBwF77yicjnkwI8tdBZb455JORy6aNWcaD3RQvcIuUc82iBIpw9ieCQqwCFhWPqzRMmyWlj8oS9aT7JGQ180NU8FC8OJo94U6wzhGR77YGhu8Ejm5sE4I2I7nHSkenaG8oDwtuCsgTwJj+/7FK7QBujjJzudoeEh4oeYDwIw4b2BtO0h0pEzfZHYUunroJQbele030mmxjrYm4vewIeo0O63BpS3qj1eZ8GvI+D6XquWqDLONnv0Q==
Received: from DM6PR02CA0152.namprd02.prod.outlook.com (2603:10b6:5:332::19)
 by DM3PPFEACE3F2B7.namprd10.prod.outlook.com (2603:10b6:f:fc00::c54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Thu, 27 Aug
 2026 21:58:25 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::7e) by DM6PR02CA0152.outlook.office365.com
 (2603:10b6:5:332::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 21:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 27 Aug 2026 21:58:24 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 16:58:23 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 16:58:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 16:58:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67RLwNWM2622054;
	Thu, 27 Aug 2026 16:58:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9511D9ACF4; Thu, 27 Aug 2026 16:58:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] linux-ti-staging-rt_6.18: Add ARM32 RT branch
Date: Thu, 27 Aug 2026 16:58:23 -0500
Message-ID: <20260827215823.1723938-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260827213836.2029060-1-reatmon@ti.com>
References: <20260827213836.2029060-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|DM3PPFEACE3F2B7:EE_
X-MS-Office365-Filtering-Correlation-Id: e6dd630f-72af-45e6-6729-08df0486518b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	kBFB6QyxpxoBnbMdsKlmJXZOxH8mxqYoXM2/suYSn5ti2+5M2dvL8cTQGkTElSrkUkxN/pTObWX5kuS+ilwb/hGwIkJwKeqFapPttLgg2TtFadOzBUeno6ONUNzq7dPqtb2gnZSThC3bzrFEZ/kpJjGIv5SRygPdfaZBtILg9bMt8rT8Gu1pyb7NcSRrZHVVh/pSNf0WZ8CElsXWMKM0oq9/8HyPC7AKlYDNKhOPZbY9/yibfnAuFW2l250wD85vC9STWpLB1VnUNxtBkz5/vRaTKV7o8tQ3ems3nG3Ojh4dOI6GokIEBRzzVlNbSifqVlFwqaxyY1vK4YKmzNpIUDBItxpwF33rbA7yCVHrn06QgnfmKGmfYrpsQ8RShp0TGeDIW7XerEtwWbH9+qfYHvUu1nv1AzbaZTzYq5EelcY3gWCmvK1LACzIriu1J45PYNh0viTB+OQQoCRFB7Cp9YrzzkMWA33ZTtOHDUJlMioY8/RjN9Rt7QrzvfbklJFar24wMx5PNSyjQ/M7WCBzfYA8V2IY6jLbmhT8Xl3c8KHOH5g5BHEhQpg5DrxmyMUoZRAXavsepgcRP+Ec0hpZjbHlssxg51g/5eo+eNzBOIVqLyz7gPcWe/wad48B3WTgBxCndIRf/f/qlWRw+2SLLva73C21iD/aBl+VTsRUYMEOfFXoGLdxveE3ktnBp3v+9mBzfELeRdJEytp5XKvNaQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EitUdgL7Zf4liSzCq5VEoJmnYskv12t6xdAoo30t/OYsGHHbXxO0Bg9qk54gh/z3ypJE0Af481axo6R0UojciCaOudPyZfnXUfjoT46DnxoTNRPNOO7dCm6zykoO9+hmwPsGGmhc91Z3K8nhKR7dgLQav3DYy9ryFiZLXNlTGL+QVtKzLxzHFJlCMPCEomIJuryIO5HJi2f0UrEeL92lDfTxx/Qn0//mSehuYiSFhihGLJ/k2HjCihPwt1IaD2n2zLTRIirl335wv1nhWa1Vh26JXkplv2HCVGPGVJnzFUpbGNIHSqidXGdxMS0CcYOaGj0jGFEfHh9hSUu8Fj0kGCkxMAsGrB3MXv6zaJGIx6ope4Xn2dIsunohRf2lTohAidX83Ibm8ShBK8Ck+ICAQVi3LlolNF4b+6zioLBnHhMmqWbtTclYU6G6Gi7RtxqO
X-Exchange-RoutingPolicyChecked: 
	5iuw+ZYPwjZjp2RkOYm4B9qywDCars3naSkNhCP9mMtwqM4eaJ6qaeR1EAAXTgxPaXzapUtoCwkPFXz7KhxbQ7PKJh/EG4SO8H0dsDAmxk97EjGDumCY3F0WrAfWeqQkR5glw6/o5BJZz2dT6ZeKx+tN68C/ISPwv96ZGo4BUmRf1KUOCeLRYJdzyWZlmQsUpmATWQAzd5jI1s4z38d2hhpOxqvddP3ybLTN+u5hN+j2qD5+FdWuzrhqUcdkRyIjwIM8ZwgB1X6vFEs62Hlif+4QBA+7gabEQotYgsU+G4hzOPD0JRcBw0og3WWhmIh0WIQ8NR9bHVb/UoCOpL3BUQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 21:58:24.9248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6dd630f-72af-45e6-6729-08df0486518b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEACE3F2B7
X-Authority-Analysis: v=2.4 cv=Fu01OWrq c=1 sm=1 tr=0 ts=6a90b306 cx=c_pps
 a=xOrz19RqOvhMowGYDVTMqg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=HbnBHNWfqdMHgfpnQ_MA:9
X-Proofpoint-ORIG-GUID: b_s-vem0c1R32EsaBBL2_ExS0kbvgblA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE4NiBTYWx0ZWRfX8EP/GtRjxhX/
 OWbFvKJKAyPox8W/piHw+dQzplqstK46viTXm3X5/09AqxqQUJrncQmO3wunUTLzdoSIs7K415j
 CP4ZfKma6K8vF9cvkEk+JERA28AcOu88FBGIPG3mXoK7SXC/AyPqvTkDoQf9d36g33E6CrEekQY
 iCNvzQTUMzXDeYa68XhXT83NWXAvXiSfKDalkWeshL89ytuu0KIltlLy9PYBgZRAjEBimUZdKtt
 5sJyvRNpwceMwCtJPMZdXMoQn1PGdYoP3r6lMTiXFOFKhDaFgXygGozShHK/HiZ0o7BsYW/CTJN
 P1uvrP6fTe/L70y1+62M+rw2qAYpf6q/Q6aoW0HjUgnY5kFjAvixoWDCOy00OpUmrQpERhx2Z67
 yut7PoXm3QdbR03Aj9ptJmrkrSj/peRMn/wP1TecdVZo3DlEKtvP3emFHy5GtehZdc13v46IvdU
 KoXjAKzLTFiD1/F3gOQ==
X-Proofpoint-GUID: b_s-vem0c1R32EsaBBL2_ExS0kbvgblA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE4NiBTYWx0ZWRfX68v5V7xwxrg1
 nwH8IXOjU4xpPFyC/aSDKpR0O98+1fzEU2vDAtoYPSGvdM2Ds3bZmkQnIYs41Zhfd8gAEX1LHL0
 tJGpYv/kGTzYSZjMeJJdZSMMJur7j74=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_08,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270186
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Aug 2026 21:58:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20295

meta-ti / na / 20260827213836.2029060-1-reatmon

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
- Patch Series: [meta-ti][master/wrynose][PATCH] linux-ti-staging-rt_6.18: Add ARM32 RT branch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 27 Aug 2026 16:38:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f685e9428bec8b34c12d2900ccee7cadea104758

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-ti-staging-rt_6.18: Add ARM32 RT branch
- Commit SHA: b5d413f32d36d804e1b5f65f4c8d07aefb9d966d

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] linux-ti-staging-rt_6.18: Add ARM32 RT branch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 27 Aug 2026 16:38:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f685e9428bec8b34c12d2900ccee7cadea104758

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-ti-staging-rt_6.18: Add ARM32 RT branch
- Commit SHA: d6f9a95ac6ae5b95c96294bb04e722f0d19ac960

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed




