Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E6EC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 05:48:09 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5442.1786859286736974664
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 15 Aug 2026 22:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=IZfkHQcF;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=KUhQ9ucF;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67G3Toff1686663;
	Sun, 16 Aug 2026 00:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HyRycDXuZQxqDFXYqOvM1RMyXYcLz3IGh5v6A0SUE
	H0=; b=IZfkHQcFhb90qcv4NpjOtV41gOnyfoziD49r6kDcdxsvySZBVgYaHtdGV
	+90OKbhNomxr4yCajIWSNA/veRISc7q7+5IlPzklo0UH2AiXXzDbnJibB+2a9eNj
	fN4D/trJb6kCzNPaNoTC96eJQl2jykrcwg5yjh8Jq/es9kztvsUBV6Sxe62DmC9+
	Y1/uLmDrXxPZL8yy4tOqYWHWSMr+VLcJxLlQUFciR9iF+2HseeWeoA9w7/BG1y9P
	kgzBrBppzFAdBDZ1uCsjJMwxGFtD6Du9bKdFnmTi04q2Usv2ylyuI0WZ/JLeDO5h
	z6j9n4yi4JwtYsD/Ix7a890dByPVg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g2gg142ry-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 00:48:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuPjAycYMaNiyq/Q/Roubjg/iUmO3/1bUbOvZ2gQSjnTin4c0aEqJ18PCtq/dNejh4uED6Vves8S/ECM9lIxvs8+/fTl9zfWR/jvbSrGYvyKeMVh6dMOvI0CK63N6b8G2/CfrY90cTbfCop0Y8+KjRGEj6UlVBKm9aY1VVrQAvfOvjHNyR0SXfcR3GfoXsFd/1iBZGAtYxHIWu1zmDFUH2yzHymx+FYYwOa2GIzaytE783dsJVwyUMJGQw0HX7oBK+jc4l7Piyw7jNEnkyZ8EJgZaisPj3eG5i4RtcsVJBoy4clZyG2aI7DvPGlGjYs4r9EGhCXolxOg3K/yQqh6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyRycDXuZQxqDFXYqOvM1RMyXYcLz3IGh5v6A0SUEH0=;
 b=uHlKLrZgAzjIOXLpRUzgNqqFx+hRlCAc09RtgJBr8TzHQEG/XKaiDJMJZ1JwQjwM1+8PdmNpF533oh5XMpNr6LUgUi2qa64XJueibfnwnwIx8bcqxwVaky5fPewnXC8QHICEaPnB/mTwxPugZAYntllHdoG4Fe6+ZBAXEYEJh8kLvb/Ee0jF4aimRBOQZPtmJIURf93HMkKPNxS3xS1EZnickm1bxU6d4tU8OYHvJMKj1JM6yEDk1fHCjIjREKgFCJL05a071XoU0FSCrBbGsvkNwx2SOtSAfWCG6zn/Ui2y9ollGB4+CAemYjhn8SxXSFP0EiWuRD6ra4sSqGnomg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyRycDXuZQxqDFXYqOvM1RMyXYcLz3IGh5v6A0SUEH0=;
 b=KUhQ9ucFLgNBnJY+GLAv/b+FofCJhVKO//5GiOSQUZspHlboTzKJHV/AkMuKM8O1xM6hvsqJVURgxFOGAvEUAYZDDX0vNB80HPHCjFxO3NrqwqOJdlv7ujAoYzeKjpMeUe/izvBTkU7OYy1rKVA7I4ixHP/ySEQsq+UcEVaaEj/m1ILA3Bsc3H0SXVkrmkVDFpaRJqof//5NMWPIxYMrD5vfdScOXsfkB2MIBCUlHLFm+LJifa5vNQv2gWI5XWIYxjSBdub8Ymdd3mksGoEWV9rEorujEU8AAi0C6Tj6SlsR1dntOyZWtl1aJ2A3pvWmIrylCEqXBvoaEp2pRhReuA==
Received: from PH7P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::9)
 by IA3PR10MB8251.namprd10.prod.outlook.com (2603:10b6:208:570::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 05:47:59 +0000
Received: from MW1PEPF0001615D.namprd21.prod.outlook.com
 (2603:10b6:510:32a:cafe::af) by PH7P221CA0013.outlook.office365.com
 (2603:10b6:510:32a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Sun,
 16 Aug 2026 05:47:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF0001615D.mail.protection.outlook.com (10.167.249.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Sun, 16 Aug 2026 05:47:57 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 16 Aug
 2026 00:47:41 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 16 Aug
 2026 00:47:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 16 Aug 2026 00:47:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67G5leZw1412531;
	Sun, 16 Aug 2026 00:47:40 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D0EEB9ACF4; Sun, 16 Aug 2026 00:47:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>, <afd@ti.com>, <v-singh1@ti.com>, <p-deshmukh@ti.com>,
        <j-sahu@ti.com>, <c-shilwant@ti.com>, <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
Date: Sun, 16 Aug 2026 00:47:40 -0500
Message-ID: <20260816054740.157203-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260816052824.62080-1-p-bhagat@ti.com>
References: <20260816052824.62080-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615D:EE_|IA3PR10MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ee7479-1da0-40ff-86fb-08defb59ecd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	a6pRpHn6nLSvLzlV/QQVBCll7GICSD8XcivjI1u/fi7jw7o1N3lSNRghVPJQOla4aDufaqz73OPhpAZoRENyMu+xYQsnIg2I9DyelIIAbcducTAsJQYb7YZhvCfTrmTbD3d21gl6k631EVASc+DtJ9H+NHv/9B77/dDpeaz18Av0EsX5kHRHOQ1roJ9fzj+QvVwqhBE9G+1TfBUGsbP/WynywFDEnYy3X/6kI+8ietxy1lOk7oXiRrZMBmS9751YKJ9lQqnoI5N2lPTN3jRtHAPoRTO+cRR+bM7JmDJg8jY9aRNc20ibzYVmVyg00zhbuZZ1gtdrcVzY3ISFNfOys+mXRWKtcc86MAZZ35PcMFDufNgy1bzSIuYTJDRrtc0YM2uOe+0LqUMWZGWf38HGsszYEapUNnK5SUS5aUhtVNLFjaeLLua6hifqwhS/EiOuTQT77fXhguqU1yyZijpxQf0ByYFLFKUFKKzto/b9BJNgsUbSTxBSzCVKlqxmG2DTf9wwUfujfjVxA8HF9f9h/5to9aTz/X9PbNcBQWB+Ayf8dTC9vkWANBilRXNNXEalabTxVouLfCC3gEM5yJhwMUOBLUxdnZcz9izaK2jkesJF4YIn+9F+7TSXLTzQDp8dQPeAlADbVW3g4V+1PYBwfb1Rjg0MCkLwgekuEehyyI/MW9xCXWevPb5wxm4XmCPbYdIK1lm9lQeTiptl73Ysrg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jxKnjMTp6rVOsV/F7IfKXRfeQDgDkgmrhX1SdQTkVb5j19KWeqsFm+WxxCnebEWA/t2NiPVRXJkhnUvM941s3dRsXmKN9rHRdinK5jo98iQmx8ux7oY0XhjwE3zWb7N5b8F5V7IKMvb5d3vVqXJv0JVJ0UXHg7rVj/LoH7x7nWPZiusBtyWvwY5MPODKWjvzrfiT3AkJguFriCysZaIWJAvPZyD1uPczMCCRt0bSBsK77fOEb1rLvhMu3QxW24QQ7uKABFU3FGqtRk9ofzl/ngzIDoc7oK19fQq89QgsDmusKnDx6OJgED38rbL8w06q6YYqlLH/lHaMeG1pbQcyHRyqx5YF1wY48TdjCM1dyzDx8lXIKdVJw6Zjjgp1OqAzk4/oOaXoYHfmxT8T2u+MpnqDVZg1RcXQ98rYe9SJwWjtcxePHynmCf8cBtNrX4L9
X-Exchange-RoutingPolicyChecked: 
	BBOOneG1S7r6LTbSBcB3B9IFzCkHGitbKWPUWR2teGn2g9faRz6OZcJ6le/QagxI3Qs12UURsp/rmvu/Dv2l/H6LsgHVYICtLKYuf924hlXihGda20rPvNOgxhj0XcDKlBpdihVztEfjNBn4kvfKH2c/A1HiLWoYpYHB5RtLVJNopSjxhqc/2g7NbT1cjm49LCGVViaIRdK3yy6A+0wXyF0Qe3/WeAd6i4eITPbhghy4PXvT3mt2Odl4/tY55KOg80B7USqrzXbdr+xzilmEpBhgN5BbK0A4/xUzZKN4TmtP8ZCXRcJI2VX+w0nXB5wXzAxepQhqTgSBkSogqWueCw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 05:47:57.5644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ee7479-1da0-40ff-86fb-08defb59ecd1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8251
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDA0MCBTYWx0ZWRfX2GtDguy1DOCl
 OczKJs+66OoXC1LceNAEX7TfJARyWJLbvLgi/81Vp/d/3va4fbYDiuWi5XiLMuwTrTQDmVKBW6b
 Fefe32EZ02bBSv5hu2QZ3bP1TpcdwX4+9xl0WGHnNZci6ri9l8eNMzdJ1oCOXYZjbDqPuiQw4CH
 O6jpb5DYzNCqyrhlvQl33/l/iyhwC2ckIZy1IUG6zG5pY0RhdO3sgqqYz+vlRXKMZeepDQx4tvo
 OFSSYrOm6eQ+iYN+cw/7xnMLtjY2B06O5MmBe9zSNIGI9Dtq8zhcsnsxaZwGaW/HES97Y/HERE1
 GDbPfmDeeKqCEKm6hkHvVSpEOJ3qunuwKfFQeBIQY5soTArIgrKapjtVQ7PqzGDVddz3fzfqBok
 sVKFSYYW0HHt81vBEmUYJtiVmkMGqZZoonpQD6HuXXuQ7OeT5bczYOnlok1m3qO5YEErCHp6hzD
 kzklrqD08xnN+/otk2Q==
X-Authority-Analysis: v=2.4 cv=eLEjSnp1 c=1 sm=1 tr=0 ts=6a814f13 cx=c_pps
 a=v5NpUkBk8u87wj8Ets5Xkg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=urG6jNTBgjJyS8NQLEsA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: VgoMhP63UINfI8QfMSoJHwIhGeQZaSHD
X-Proofpoint-ORIG-GUID: VgoMhP63UINfI8QfMSoJHwIhGeQZaSHD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDA0MCBTYWx0ZWRfXw2n9BJ6bVaFn
 cvwJfAITURgHBSsG5JbI3IcB0aJQ/l/CWyLgcsw8YozQHiLD0BfKePb+oPxEAp153lPZbpJfXMH
 dfYggMhozKQVJr5bR2AYJWUSjUGiLf4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160040
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 16 Aug 2026 05:48:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20269

meta-ti / na / 20260816052824.62080-1-p-bhagat

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Sun, 16 Aug 2026 10:58:24 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 77707b096fdee57c9b2679d7a0cf4b8cb0d93ceb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 61fee7c8e69614a6897836c7708c47f627417327

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Sun, 16 Aug 2026 10:58:24 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 77707b096fdee57c9b2679d7a0cf4b8cb0d93ceb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-ti-mainline: Bump to v7.1
- Commit SHA: ce0347d626c909d7fb37193b6325573dcfe43339

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




