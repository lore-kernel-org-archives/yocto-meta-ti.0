Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3031C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:27:28 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24325.1787671643807940732
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 08:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PGSUEtpo;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ZFW7GZ60;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67PEVaHj1165296;
	Tue, 25 Aug 2026 10:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xKQJgXJI651ukkg7D5uJjW5EnBWSEwIWfHq76D7B8
	Kw=; b=PGSUEtpoxoerszLHd5hZIuwvLZHxkQSh3pfYobhkyNrqAQYjHqK+YQqv6
	I6JZCPPMAYwkq4utiw5T6tHpunH+QOWTr2dOtoJy/NEg4fAp3TrtVPx1nMGet+q9
	dII/guj4Yg/39LN6ASRv/DkM7Zve+y4NuePMrGQzdavCrKORdKlVFojHXEVGc7lY
	Aw0JLMLunQHDdbOWW1E6CdcTHpzJ/MZi2QKr9HiMHutA2diWQmBC3CYr1IKd9Ndu
	BrLHzOtAp7lhI/PBby7/SKGHWRbcGefS8yeQRlh/MNEBhX8FWYowJnPeIETMGsmq
	5jnk+eFfFj68Op7wWYb0drbOY354Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012063.outbound.protection.outlook.com [40.93.195.63])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g91sxkxxy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 10:27:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZLVvpXlR6kT3W+lQ+ltfAKpG97NjPdgqhtXWkxqWLsqJBlYhprTcnVtdIM9BjTUmd3V+GYOodx+FzHEMVD1dYe/1OhPeUzwmnIUuSQo6nBCDHUruyNCSBq3nJZQmi1v4EzO3rVeM0tqEj0ZfWrdKNf3u1ePJbfFFdNNri25VUg79n6e3nKEnaC37nYPpsTT1tDJqVmLhmxWejqtsBmATaZJD0hxedkxC30BkdfwkNUhxc21g3NpgkWhkOW0LD2QpN/it8fyGnd4o1TPcU3Hfon3FmVatc8950239gu902T/I5hgrVa+8UeNY00NhoKQMliFi6vbAGPbVE8+aePh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKQJgXJI651ukkg7D5uJjW5EnBWSEwIWfHq76D7B8Kw=;
 b=qAiNIMU0T5ujxkoXTTJ/0+z+gC4lXn0thIUcIRDzIcVI+Di1PiFVXgPME4ISWAPeH28dcg63+KrO5VjClD62ssGdcUiCcKeRvEdc4e2gCpJ+PyzAgrqpkMv8NAtq8/Nn3A6hsnqsfanR2DHkNDcGoUF4aOXlOwlO1VGT6ZV+ofMluARQoIBMTpVBIQ+U3Z2tvR86ubsWExxY9dFfnVzPy5bgsYYNm6+TL7MfryR0E8LNKS/JQG7K2KSS6F/C7BPpDWI0P63EOtE47XyvpIE5NwKZU517PRqJ/gAJcMTQWN3tc9jmGD9XXYKNLZiL6dVidpG5a1rzAgRCKoudczzZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKQJgXJI651ukkg7D5uJjW5EnBWSEwIWfHq76D7B8Kw=;
 b=ZFW7GZ606M7WOpgtLdt9LjB9VM4hChhF5hX41jcWVZ/J/a+/OyKABnYDmqob7asbJPJp7hAZIBai3KGQafVjtqXdHZgyF9aZtVLEKJodrx8GNq0EmimvAsd+hcADg8DV2usyMJXqooh65D5Fkk5o9ThXWMd5TN8qKys/RpChod9otu8apkcZjT8oQjQLlfrqGeXugBYntkuD7fLAKehXhtbVtTU45c8qRIii3Vfa/MUJLYDtHP2MwWZHT8tjfLyJj7v51yyoZ+kxpx3ot6opYm3yW1nsOQ2WKhYUNGh6M44su6OHketqcuXnzUgGbrZ+wjUbcbwZTJlvExnfmdD2DA==
Received: from BN9PR03CA0689.namprd03.prod.outlook.com (2603:10b6:408:10e::34)
 by DS3PR10MB997701.namprd10.prod.outlook.com (2603:10b6:8:344::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 15:27:17 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::53) by BN9PR03CA0689.outlook.office365.com
 (2603:10b6:408:10e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 15:27:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 15:27:15 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 10:26:37 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 10:26:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 10:26:37 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67PFQbuj2299690;
	Tue, 25 Aug 2026 10:26:37 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9B2679ACF4; Tue, 25 Aug 2026 10:26:37 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] xdp-tools-ti: Remove recipe
Date: Tue, 25 Aug 2026 10:26:37 -0500
Message-ID: <20260825152637.348507-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260825152346.1791356-1-reatmon@ti.com>
References: <20260825152346.1791356-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|DS3PR10MB997701:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f6960f-588d-4ceb-81ee-08df02bd57f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|13003099007|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	h54IXVlO03Nqjyn8RQck8b/ggOJ06DDSiYcHrKRptJPY1BBu350AF5l7z1ypidoKj/niXOtHUt/Uhng2TE/z9psOOkXl9kFNmzWxS7mDPBsFgomOPQArvII1shkWkK2qR25Lw0hZVdIsy8b+1qyM/mBhchVj2GZTGUNOqcwcvfWu1m6kG3ABQaea283800n9STCSbQ+QPADVgyS6UMktXIY5R9AWsHWh+qX8IFoKnXpYgU8FxwVNpBwQQ8tMwV0AvJbWJqxF57ngnbZgohBMnJFG4tstdSiUnZxaLEusYp7JN8jT0mr/f/VrL7BoViCi/2SZwmBDln15Kz623+1TqeWxWOLla/v0iNM+zCg8uegVGscJqQB7WXpgul4FzBWlbqP5TEHTnHl3mFd8aGP0++3tVFBhHA3YCZ+WMhCdWOWQX8D3BAWsF8riTq+GFAAfjQEH95J068BBLvwfpBzHiXux8upjyMbfTZ7KGXg1ofmAH8EVZmocZHoFl6TREJcKzp0lJaCOcKFlZef7r2eu24yd8R+y7a1nPNEzAY8aY31u37OFypMRkNdBPeYJP08S++oVo1HEfb47T5v2mGuJ0hOwK3rnBmd2kU6qp2Z5bbkEVyegPwyk2ILet08sXgTzROsOkN/gfRa9sPwh9ydL0w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(13003099007)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZXsWK5NDIkvD5gfkPXWWc6Hm1wSfjPFtsDzGVZnlwsznWeHamA7lVjGYnF4+Q9J0Fvjp9ZleRFTS5Z4YLyh0taJRw3tEp52llj+8cLtOC06/zPJvISAZkLlvsLqIs0yMmPHe/X4xLb71XorOdvPWLV9MX2ct9K0rAbq3JxDKS8q2Sxul6V2aFGRxF2JVrRx1lkhFOM0gb/uIsemzStQtwsKHgsx5ECwjiYLaaP1uwVh1J1gBJwiP8SXw9eRb+7lPZpm9qp9hKSbcjHRWFcHu5TtdPqonVsWajOI/gdOJUF03Wn+4rUe15onxTbRDURogti436+wKaw8T9o76KaoRXeAT6qzmx7ZholtAYksuU5CzXX06hAKF7pc2QWNbkFTc4E624VGRtuv1BCfWn6WWNRBGqD+IbmfU8OhIt3S/LcEj9NSL5pcN5zGgpBf2AwGL
X-Exchange-RoutingPolicyChecked: 
	c8c586ksGQsojQ2gBMHSx+YY2Eb34cG1wnkGKkA3G+pvEfIlkw7d9ks3sQAsG4Hq+WXIg6VV9VTcdI9e8wDDS6NRxqPtrjWQUeha5tbztUZye32DdEd2RtPR/qXjdMWeRSYKJv3NfUkzGdroK1DFIUz/Ta3hsMYoSlNDns1mCtfSy6R2jVSnEPwEfgq/rXRyJDiZtRXC5bGDc2wU9LaNGwEM4MPgxR5zNjeXr1/3QiwxRWZJLIFrRCbfZ4sHuKhP/M8f79mjzw54mbq2seiLstwwVeo27aulHURsLQ9GBvzWhHUupGwbtMv1xP1/OBXRfqtCszAsjArsGOhEa+wcGg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:27:15.6315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f6960f-588d-4ceb-81ee-08df02bd57f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997701
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzMSBTYWx0ZWRfX5NY+3HpxCGin
 heVZlBiKEoLpfNQR0TySLuCQ30MTY9RGWJQq4/qW1Sq5jCfC7Ku9oEF4fF9B19gW99BwN/u+zyb
 YXiGInOaePUINCBaY+9jSyObdzt2Q+M=
X-Authority-Analysis: v=2.4 cv=HackiCE8 c=1 sm=1 tr=0 ts=6a8db459 cx=c_pps
 a=LrO9QPEl2oM1zDNvT4V0vg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: fAy3nwJGZtHG7JAEbdluVolZAT3IkFc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzMSBTYWx0ZWRfXwE8mzVZlHgQM
 z3wE2Mfuis/Fg3WqDFZ8PgsR432x7KSrc6u2NfYf9OVbYjD4upJoWCnLf02J+6X9zfF/jRZnx+s
 GKn1kO+1t/B3ZED4LW4XDlKnzNSCC+OMYxdQZ9YK0jcvYkKGBeU32kvTaPQrtu2Yi7afbJ3uiRU
 CK8/mG1/TTgcDE3MrZzUoMkeDbFy7mcCWvGYLccL1r3cQfzuBoaO19Nij/ifK7STAhH2FXq9QqA
 u+Oc6PBP+8v0CQA9PaQ6LRhTtTBM4Vio33U0zChGd+h5niJthH5CfAbhwUZr56QUVSKLBk8TISM
 M8h3rBiJ/MnB/9bcJtItdTfBeiGPcM8aSgwwPk2jBuaQdSwvtdDYwE+yws0X1RjfoTtQVhXEjet
 9i88ZhdIJf64yFtZsiv44op5lTVbxEhdtG6EeIuYfUw6A7V6d9tk4/4MkIkSOdplhiyQAYZKRh1
 WfZRvTkp+LvXKgX/Dwg==
X-Proofpoint-ORIG-GUID: fAy3nwJGZtHG7JAEbdluVolZAT3IkFc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250131
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 15:27:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20289

meta-ti / na / 20260825152346.1791356-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] xdp-tools-ti: Remove recipe
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-From: Naveen Saini <naveen.kumar.saini@intel.com>
- Date: Date: Tue, 25 Aug 2026 10:23:46 -0500
-Date: Mon, 17 Oct 2022 15:44:16 +0800
-Date: Mon, 5 May 2025 14:30:10 -0500
-Date: Tue, 17 Feb 2026 15:11:18 -0600
-Date: Mon, 17 Oct 2022 15:50:34 +0800
-Date: Mon, 17 Oct 2022 16:02:46 +0800
-Date: Mon, 17 Oct 2022 16:05:15 +0800
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 95f07ff5100b1dab3b95bfd4fb5cfc7c176c2374

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 2c7ab98a1c62600909a376074a4fb12dfbf683de

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: Are you missing a PV = "...". (PV-1)
        meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb
    
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




