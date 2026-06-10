Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68808CD98C5
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:59:01 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33546.1781132331432540571
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 15:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JhiMjWLr;
 spf=pass (domain: ti.com, ip: 52.101.43.59, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOLTR3d86BoxzRc7EGAo2ysFNOWNtXrfgpuI8Zi9Dk7xeJCuJ20k3lLDxGC33PnoWQ6WxKTj5qByTOTP0d8H7ooyUdkpJzK9wylZkDGYmZptOVdXU+Lr+68xy/j2uKwsUjHXM5gfATwYV4IFZ0KnzjvlQtQXkRjKmSKI+BtiCy9yvY+5rmzZhkyHGNQGSV0SfonUNHR+mMu5ME9m2aurc1WPXWbC+8n8u67ilJ/ivJRGTjQ1BZ9cUA/bsja8hfOi9NlwBKOAnyFzqZ6L5QSUe7Ug1hG8SynXL9y7tcPtXMFjwaSxwCyzmMU0BjJxDNmnQUIlRAvigvDcL7n4QdKAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jj1q0beICacVp6ZEgZNHyZ8zfntNOkD6Hr2Qh8676M=;
 b=fvby6OtSvKEwSeh0mCLCkPGj6rqo+aFYNAkdjB0Gcapu2XSpke3NYJJ4e4iNkZlXdiIL9eqhmERV4E4pBAE41+2pe0NN980QkWdhnMWULgju52HuOzw5QoTHbf+fVvHduWp27thP4J2YiFi87Xv25i6sGN0Ev6LnE+Zg1Zp5qzDlGe/F84pFb08k3bk+LTtFC/0bZXtS8Re2Df7d6n//jT2v7VM5qugZu5ShbA+q8o0RTTvDMOR8VMUbX+tGHnwY4Ya2esJ3eIydGUPo18k4IWxF/vxWU/hhAMq/2Uom5mRg/ndg6BWkG7iaUUK7nO6QYnVWodb1xlpDMCEyFj8x8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jj1q0beICacVp6ZEgZNHyZ8zfntNOkD6Hr2Qh8676M=;
 b=JhiMjWLryZ8g1gf5vMKp09air8Q0kynR9LxokR5ewE0Pex2CJnBmGD1zd8mYBPs9yKOTuc7s1j3mrdkMud4G5PYOLmtCLwHlX44szMviNUWMNHgThjC35eT+r0F70cx1DGqYNxeKax8ApjFG/GbXeXq/2/aTzjxlaFy8v+2FmYE=
Received: from PH8P221CA0043.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::23)
 by PH7PR10MB7784.namprd10.prod.outlook.com (2603:10b6:510:30a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 22:58:48 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::2) by PH8P221CA0043.outlook.office365.com
 (2603:10b6:510:346::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 22:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 22:58:46 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 17:58:44 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 17:58:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 17:58:44 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65AMwirQ629948;
	Wed, 10 Jun 2026 17:58:44 -0500
Message-ID: <150e8bb6-2aba-4292-8053-51231e3e0928@ti.com>
Date: Wed, 10 Jun 2026 17:58:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <18B7DA0BBD971E15.267903@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|PH7PR10MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: f58bdc03-ea29-4ca4-2527-08dec743d42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	eFBorA1WK85GmH+hEfN260fk+PhU8rH96bk2PpTOljQvwUDUDFmic4xxdR4Fs+oL0585swHb6TK4+U0vPmxJkN+E87GPiAPJUjaRSkg2anpZayovm1ZL0pdqHfh+BqoSlHJTHjG4OwhxQGbQCZveJGwKqoOuA69RRx8LqbmIa0F0L3dLAYAXfvkMYukTIzXzVHQK/JN845STJNOmWcUptPtJj1wwqmuDCzwd6jcKyJc/Id8ejVt43wYq0iyzczjxvKSSTzEpy2C3Y5ChvRgZDVqPhv3JY+whaPhKQVMccoyN4erYIub1uvmA05pM42aBH0Qlz9LXxnwiQ1PfG3aT+l+jmLEZEAegr6jr/zfk/215mbwkZUufu+nMHmjX2R1M4vIeOgy0tdjx7HEBUP1zwsbZMYwWH3TlEVRtog+JsXqawOLFHm24pNX4DKLN8GxGfaxsqHlRKzAlpEY7jNc6Nw/PebTqOPF+Fk3Dx14SkiY7cZ9cZwPHbIJF02ruWZC1crxe6ayEaXYwOYtqsXzj7gbu1N+wOFy8kk9AAFI0ADOKPC+NHhcquzLpXaIEOs4MCKzyXijNc3DTVOiY806bd498hTf+pLmya5tCVTjtSyyCW6qX3oIyYUQE7rQPndCGDKl1ycW+G2VWoFzSAC63L8U0tFg+3a1AuAhNmEsGUIbGl7RzIgKbrjBBY1XG3MGz+PUdLXkPTbFd3CKBz7/MdLr5XGHz3up8A04IDewJsDI=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MS8WQ/cUHsKzElvXkEDhN+oplUvRnpZRX9dNtF9gwzIebeaKz/v42ScxPbfsPttfmOFdiePC6qqN2fGoZHI8RR1lItYOSaDrNd2rEmwFHHlpmuoPXiNGB0k+49F2FUFTt/S6i1+By3rfpNteQu37WyVXlrabhaesbbdniw5SIOOJDU6Fs2/2afvJG9Nmns6l2NtUlubvyxCl/VCxiSbQbKbBfEhtOcIuIH8b+CSL/9hJDoVy4epExnZCUAQ42ELClAqfE4cWRX+n+Vf/XJoB+DB79/4Ib+dHP+8rs+BoMiXnVln+GCZzUUJdC/8E17JXqeHOwLeVG1wiS0Rv4/MKkWv7pUWy1bA+URRqpCp5AF9vDXTWXzHKYUhwypZfMJwhm5ckov9hAVhk0rXBd7rkdUIMoxrcxWjjITiSqYU12q12YmTNZTynLfy970Y1KRgS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 22:58:46.8803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f58bdc03-ea29-4ca4-2527-08dec743d42d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7784
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 22:59:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20013

Dear Ryan Denys,


Let me know your thoughts on the overall patch. I am particularly=20
interested on your opinions on the following change:

On 6/10/26 5:51 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> BSP_MESA_PVR_VERSION:bsp-ti-6_18: =3D "2%"


I wish there was a way to use syntax like=20
"BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "24%|25%" or even=20
"24.0.1|25.2.8".=C2=A0Is there a better way of enabling this logic ?

Also already aware of the extra ":" post-pended to the variable, I can=20
send a v3 if that's all the feedback.


Kind Regards,

Antonios


