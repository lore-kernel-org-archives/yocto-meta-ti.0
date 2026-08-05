Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD54C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 23:28:02 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8556.1785972478405365831
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 16:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hzq9mp/g;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ErgR94YN;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HVfUI1787246;
	Wed, 5 Aug 2026 18:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4cVNy94Ozx8jhrJFtxfMTDxOqEmnKA1t3ZOzQ8p/R
	SQ=; b=hzq9mp/gPdyteS/prf7aS7w5E1mRtWiheO2DjlVuK1sWtv15Pcw25jgWB
	r00jMfYIV3If58Ql7JEiiqJpSqgvkSPnAMCvA/Uw0to5VueE9dpe+BnqNPvCOc9Q
	aYunLYTyML/gcizFgabILORAu8mKrom/t2nmq/NUtW8dPeajq9Cw6c6Wq4wgjZXt
	zBWeePlAiyGjsBX8DNENR+iq0ezjPm5yPWMrQwdGxsxC+wUjCj7ub0MUzRlU0Vq0
	u8bMISDVbzG2njLbdtfMnWcVKYa4A5FcRxpTKDv1O5CQoYEQKXanx3POfAXy44Ar
	cuaZtBULnF+rEKSk5FcTqIUJQ/NdQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fuuyqyyhv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 18:27:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aa9OxGy7xh+ivilbpBVjEjm+nq0U1H9CzjPUZxB5n+2FNPhHN3jrshpBkn8xLnZjjeSxkl/GRCh6K+EiobSWoYo7e3v2ztKQQeAq5FbhaTvHcn/8P+RMzRjxp4yfMZpnqmVeVCqxOL3D9KPYO/6mbZz8cSHPg9WlyQ8NVGJzdy09yeDCbk2cOQ/l1qyZaq2U1Jcn5pB9nlAx/+8wVpqlhg/W5kD+sMekBR2IADJtJLNaD6Omj8GUJNBdcefHcHsDWz75W/FSaYVxFhXP5q41JSDMjaxWfnVm8JiiXRf3myMz/BBRRxKramotKMEh95w7cdXQVrJF7QDfrNDAGc4BHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cVNy94Ozx8jhrJFtxfMTDxOqEmnKA1t3ZOzQ8p/RSQ=;
 b=EZMONgWkcohF2X8K8uG0WfYq/R8pyPmVxuVAf+4OxHneSvF/dZEHPKgG7Hh2G28gBpV8/YLr61JfT/LvhS5k2KkIUxb0fAeiSPVsq/rQ+Bwn1puPRnXB0V/qRGJ6zSQmcEZOhjznh9M0SKvc5MluoEROqJl3Q1h4nj4NVEvH5Szu9XhBdE6G6Zp1i3TTeapcCf98tQKRjErzczSvjm2bTps3p+S/SSrMtMVCLkz9zc0rQAEefBBdoWJPfJmwQQHpTuLF7bGmzBk/BXjKIgXezj3z00/Wuw7eiXVC+MQf7/dor4t/dzO34WnsuvZKhBYFkpsadt/EwtWmgSDHUtrwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cVNy94Ozx8jhrJFtxfMTDxOqEmnKA1t3ZOzQ8p/RSQ=;
 b=ErgR94YNk+4WGq0fduqHBzYQrED4exBbmxY0hiQEcHaLBB1SiObN3FIUkwRD5Otl23DL5aPsHlyB2gLjEaGva5kol2tOgRC8K+OPj7bAJId4/mvDy3u/DX3X+RlcO/ELmvd6KBlcIt3PumcTbue5ybcy/gqSDtgrRqCtxDbX3dAVoLwnyOND1DugtldZGuYRby3+iNd2p7hAylUWNPwntX7ix+4dgNFfaFYNc6ignM1mpXWocZnQw95Wlyjc7+yKa5kDMav2YSW1MMrAx0wyp3gur97B9ROH0A3nMW2JRh4uPcHepMFdCruuqXIsAPnBOzA/4e96W7O/+kaeroFi7A==
Received: from BN0PR04CA0071.namprd04.prod.outlook.com (2603:10b6:408:ea::16)
 by PH7PR10MB7055.namprd10.prod.outlook.com (2603:10b6:510:278::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 23:27:49 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:408:ea:cafe::48) by BN0PR04CA0071.outlook.office365.com
 (2603:10b6:408:ea::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.18 via Frontend Transport; Wed, 5
 Aug 2026 23:27:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Wed, 5 Aug 2026 23:27:46 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 18:26:44 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 18:26:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 18:26:44 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675NQiNR3004526;
	Wed, 5 Aug 2026 18:26:44 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 7D436D6F36; Wed,  5 Aug 2026 18:26:44 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202608051433
Date: Wed, 5 Aug 2026 18:26:44 -0500
Message-ID: <20260805232644.1361700-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260805231859.1814953-1-lcpdbld@list.ti.com>
References: <20260805231859.1814953-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|PH7PR10MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: fcce7def-4d70-4e28-c75b-08def3492871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3zgjPH0Xc+olzgjBxhg1XEq1YsaiHifxzcyuCsIa8d5oYmxCcuv3gOVoD7TSz5xKxcgZCdmkySHps0qZrOZSZ54rpZJJVWOoWfoMmFUcN9rzb7vs0QZC5UQAYX8GinuBiX2vNFACvEgdBFJD9yNun3jgmV9CqqdOb8/OQeuVWImsU3AkZyuXJOLKcmNyvHoHFpOjV6vudW2omCo57JTm/JHXWhCqk3ibkIMa54QG3LlvvGaDn7FaHgvude9hu6B3KJb4whRsUtgKwfyIYJe6ADlllXy6tu+KvmQHGWBUsEKY11ylXOl4DW7eo3us1VwHVmuRH9wNESHM4eaaYpc+o8g2XFCV4AF/CeYww2tpJ4ansfEs3/NlNZDKltUkO2Pza8OLuYIBQKJ+dW32EK3xv43Buc555JcLA/QDTauIrjOthchkp3JzBfWOGaNVlJaWDgf+mSq75twZKQL6HGuMOT3vP4xE39aTEGejlZeHSpIXh3ieeS/JUyfi28M3RCbrqfkJKMYa0wJcKmDkdYRKfDLUfbV5wJwAMaAQPduMh+Qo765HisdoaOFDfDD+EyHZd5OIh7TOmzVuFBjxTjk3c94HXfntbW7SGfRgUvpSDOP+XqE3pjoysdQkQSZZwegrYuBxg34mGVY3tK48XI2gOHp8GGVSn6Ttrue59gbmi1RCvHx6Am5e4Xfr/ZlYgpfwWYo6pYXMLt0ONl0ypF1VMA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W79jUUizVIRh/Q8wiWzt6lp5tP4pfyqdh1Zw0G4gFm4q7GhA8R66gE+Xz25oARwrSfvr+SK6q+ioReR5J/Dllv3oSaEA8CCoUVdIaj3r8SAXq2IuyhQ77Pjvl79C+L66QaljIhOh1/ZoQxMhVNJ7zBSq70FugtwFYd31LKoNvPmsbLvIe4l98qmX3Alg3g4I+SHNStEoWtAqeen5isyHgw4bOkxiqoSrMgIGqmQGEjJrBWXD/xvXmdCYYiwWkkMdDEG8rJG/0wNAMlZJbm1Oy7s29Jt5i0vkwemEpmJLviO2Pn3NQdPqwOCRUDNB9YJB83iMtkAWL0m/3OGQ8/eUsDlOuW0jg2tFpH2Nlbb5AA6Tb9BdC1nMrsVoZY07FJ2E4qcjfkOojim9JGNVozcSGseN7+kTwZPzGfZIFqAT+jXPwCx3ZeTFQ3DsLYEmuVc+
X-Exchange-RoutingPolicyChecked: 
	YTm5dX6oXm3J5zSp+69Wwxs601LgdpnHY0O3b3f2jprAdi3sFSNutEGF/3RPvrAZKgwc+qXvyIxQ4rNYRSkvUtn75pRUkKG28vOaDwfKTQcTA9C3WBax4BP6eUUJBh933bP6mWo9WYKPtIzZfjo2Btfzwcf+rk0h75HPdRrRYhD8pQwfXz4aKag+wHbNBisZe2DmP43BJ419sc9dUVgnF4SIdpsIUmFZ3DXTc/k1k7j1VvF/AGYrkh4/ta9e2Ib/U1fEAzyfiQ4DDG/RQQnNIhXIIT/0vog0xKPZ+OELPQRyH9Xm3U0osqFta9nW8qRPv9YVKL9AuGXexw4JwuE0jQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 23:27:46.8722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcce7def-4d70-4e28-c75b-08def3492871
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7055
X-Authority-Analysis: v=2.4 cv=B/yJFutM c=1 sm=1 tr=0 ts=6a73c6fc cx=c_pps
 a=fq9WP/vNXoxpaIAZvvUcmQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=LkG5JGbVoxP9AaRUDOIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE5MSBTYWx0ZWRfX/53MNC0nKK0q
 /9ML6KSZ1p1cwAroqzO+NFOdXPJ3YysjaWRtR3fgAQA/i4WwzbHX2Kkp05AnK26QXfDQ/nqW3jO
 C9eUQNuX+gzRzPE4/EtCCFog4HNSEao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE5MSBTYWx0ZWRfX8qQJD8MUMuww
 Y8u5vgxOxqErrxytwgvn2OVuUrkY5iEuWwBQ9HPfRkSqRKk97CrpXaWTHTwxFJC2w64EFHN1IZc
 MRWxQYOPhZ4y4YYaALorBHLoIaDzhqCiPGemmNSVsc/67bJDtqLAcVWhRMwEqQ8QQLaOrL+kKFg
 aAOsempLNZojImTSeqaY+jLLc5oaL3GGebW1gDohK5zLRliMSGVoznFTroHJV3aKpZZ2vrj0ic9
 QZ1e2BhZRkTm64YOCVsX4g2pS0WWf0xJ4pHsdg0A+7QfeGV01tcgK/usMj/wa/Qas1oPeFbkKBs
 +jbpaVOXmyYXjk1gACJWzQG/DJM7lzfWA4AI6k2+0kTbKr0DG7Z4Dx+uClTBmTEopigMefrDWiD
 hVPCnm2KWq6hqnvOHKVZIj0SDcA/gHU9iX2+QQnoFX7ZNw8u/2CofgSBodTKrJpyk9B5TynIbxi
 61ynPQDJlYU1AVcMb4Q==
X-Proofpoint-GUID: 9UnZlJZA-BwD8vaPn4c6O_ABf73G1uQF
X-Proofpoint-ORIG-GUID: 9UnZlJZA-BwD8vaPn4c6O_ABf73G1uQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050191
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Aug 2026 23:28:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20218

meta-ti / na / 20260805231859.1814953-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202608051433
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 5 Aug 2026 18:18:59 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f1bc3486acbbc3c4b1838a9540fadeb65b0d92a4

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202608051433
- Commit SHA: 69c9051fbc2ab0d40100802f542189990d48aa78

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed




