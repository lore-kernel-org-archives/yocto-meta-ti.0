Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79549CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 21:14:13 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1230.1763414038876996200
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Nov 2025 13:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=r5sycX32;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.107.200.41, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvsGpzcfIHw/UKy+GuKnH8QYv8u1TO8BetvttAuuTtVWvr1nVcJ+P90dU0PTrYnG0x0gIuGIMg00BPeFXbuqRlVaV1zMNcIIkow7q+sJ0b2aP8PEcQCBnCzqrXeFvlYLFmWE67LMavdoU3Rm6GufFxO7XnFIOKUcqFw9WmNJVALG9mBK9wVFQRERokGvm51vMAQ/3Y0sVAcsQxMuHhOkI4MRfN/m0RjTKivVGqZL1ibk/gME4n+w/SSTMeEst2DwiopL0IRWcFfMUfzErfF9Cqk92syXsxcz8ah6rbSVj1LfSivj3FFzoSQgval54ohdiQxM6ZZ6a+qvp+T+OsGMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EKsxJepwKhXumQuOdaLWO7s8T6HggqSQ12lwbVY3e4=;
 b=whvgjPuEeFC3y4YDIv7ShC10DBVxRtOhla+Az+bBJW0mpSg+9CF1RTx2pe/vOlmhhcve7+o4TlnACLyNsizlHAnMaKi0LBfq/j683MT3u/q7EEL9JVedH9mKxeEdPDuTbzqZb62EvGQ2HxkNH6LRwmb+fikriHgddvVWNOGc8KQhyBETRhg/sKwtTb/WD2zqzXI8flDaKoFIjtGMP5jKtgBF4Vsjm9I1hNHVuQQTDBv84xBwx771fPNit0nJnvZmJti+EvDcSwig0Mf2rQqM/KdQI53LA5GgXrTJw9B0qRFkm3gVLWcE4NEs+YaKnqpw5lHKYqkwn/6nqNChhQhM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EKsxJepwKhXumQuOdaLWO7s8T6HggqSQ12lwbVY3e4=;
 b=r5sycX32D/TN84VW18YhYM+eRs6ZyLJbFGZjiEQFnvQ04tRKF3vmoTIAsYO4WAwuh57mTjo0hj3YyK77HNyWq+BgUjWIG4Swvt0+Or0E1zkz8v39DIOh8CCPZgNhElwC/YAUpuCVwFN1v6I+krFfLFw3XLfo/kraySX+FxQix1o=
Received: from SA9P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::29)
 by SN4PR10MB5576.namprd10.prod.outlook.com (2603:10b6:806:207::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 21:13:54 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:25:cafe::9f) by SA9P221CA0024.outlook.office365.com
 (2603:10b6:806:25::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 21:13:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 21:13:52 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 15:13:50 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 15:13:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 15:13:50 -0600
Received: from [128.247.81.40] (dtmz023nlvx.dhcp.ti.com [128.247.81.40])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AHLDomc3116670
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Nov 2025 15:13:50 -0600
Message-ID: <396ee76f-ff90-473e-b0cd-389588627399@ti.com>
Date: Mon, 17 Nov 2025 15:13:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
Subject: test
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|SN4PR10MB5576:EE_
X-MS-Office365-Filtering-Correlation-Id: 54225306-c7ad-4514-9c94-08de261e3589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b3N4N3VZU05mOFZIK2F4a29kMU43TXIrRjNzdXdaYkcxbkRlU1RHU0R3MW9L?=
 =?utf-8?B?eVhpUy9NVXAxQllkZVIvZlF2Qy9kVjBGL1QydG4ya3lrK3ZRVjZER3N3NVk0?=
 =?utf-8?B?cFJWZVBXT1FBOWk2aWEyVEo4YVR1K0JOZXgyM1Q2U2hoeWNNRU9JWTBwd2pE?=
 =?utf-8?B?SGtHaktuMHZ5b0YvOXZjeXl1OWQyN1hKOHVVaUNXTjNaeUZtMkw1S2ZaK0V5?=
 =?utf-8?B?T2xlTDl3cm52d2YyMEQxempYTnhuRFlpNDJpYVcrK09jMFJZN0J6b2FtNVhG?=
 =?utf-8?B?SE45by9rNTUyaVFXTlhZSHk1dFlIR2FiRG1PNUxPRk5TZ2pBOGRzaWZuOTJl?=
 =?utf-8?B?NTVQaW1DMCt0aUFVZnR2K0xFWWE4d0Zta3hLd2c2VnZnc29LWStRVDJRY08w?=
 =?utf-8?B?N0lWWEN5WVF6ZXNYUlJzbXYwRGV4QWFDNlhqWlMrbzZGTzg4eUpBRjlkS0pO?=
 =?utf-8?B?VWhkY2tXRjBObUswZE9Zd1FaVFQzQ1luekIxSk1vaGxyRTZubS9ZRDVYNWN6?=
 =?utf-8?B?SkZTRWY1WDZWZkh6OURiTk9qVmVWYVg3NXRldER3WThuMjRjdTkzMkJDWHhp?=
 =?utf-8?B?dmZ0OXV1MWgvNjBwRk9GUUsxQUlSbTlRNFJwZXRMbjZqVUhocGUrc05ZK3c3?=
 =?utf-8?B?bEYvZ3FacVMwUmRPSWdvbG9YbFkra2pHMHNhVmRXUU9taTJBR2c3d2pUL21z?=
 =?utf-8?B?OGtGdUVHZE1OWStoU1FCNnVIRzg5cTZQd21ZK0NYRDNVeWtNcGxyMUtDbE9N?=
 =?utf-8?B?YzBIeVd2R2FxbUIzaUhVWVZ6VXVCY0dLNStkNFpWeXhxK0lDdzlxTk1EakQ2?=
 =?utf-8?B?Y0N3UTVBVEhPVWd5eGF3dmhia2dqR0VXUlBDZXN5YVN4OUJSYXdxUDE4Sk5C?=
 =?utf-8?B?T0RWRDc5eFBOQkNMcTdqdDczdUJ2U3NmL0l1andFUzNzc2lGdjhDb2FlT09p?=
 =?utf-8?B?bUhTaVpzRXVBK0R1cTI4am9qTzY0RTNvcU1WSFEyMldIM0g0a0Y2ZHlqb0ZI?=
 =?utf-8?B?Ry85bGx2M0F1S0FEdEVaODFRc05zMlJ3VEJxRXN4am9rV1VpNTFpZGRpQ3I3?=
 =?utf-8?B?aGhXY2JrMGdPUzJFdFEvcnBxcEtVb3llQldIa2ZCTnYwNWJRQWRySjRIc3gv?=
 =?utf-8?B?aXMxNUsyb3ppdUp5UkhOWHFaRUpvcmc2WEFDTkNWL3FsdzMzN3FTbEZ1UEtN?=
 =?utf-8?B?VFpyb01HVFVCUXJkODl3c2hybXlWMFRkZWlOeXI0YzdIeXlGeUwrSnFBdkw0?=
 =?utf-8?B?d3VORHB6WjBDcFJERlJvdHdvWkcrNzkzTEVwSEdCMVZrMkRESzZnaVhqY1Jo?=
 =?utf-8?B?NEhNRm1nN3FpTkg0NklYSVBIdjlkeEJEZDdyQ0dEbFQ1YlJQdWxtSTNZd0lu?=
 =?utf-8?B?NFRrOUYvdkR1RTliN29hMlhEb3NGUmV6U2RyODh0RGY1S1dkNGxxdkpTL05Z?=
 =?utf-8?B?cjE5N3haRTBQVTJ1OTRkek1LTzgyTUVncmJoYWVxM2oxYXp1NVg1dmJMUHFW?=
 =?utf-8?B?L1lVTjc5S3pGRzRVaGhzV2h3MlJOc2tmb2JLREJKc254Z003Y0c2RndZS1Vl?=
 =?utf-8?B?aFplNTdhREdpbkREa2dpVE1UWmJISERwaEVRdjk2VE0vYlB4VjRjMXgzY3Q2?=
 =?utf-8?B?TGNtTDRHbm1JU1ZuSHVkZmlnZStDZERjWGxrempsK2JnTVVZaVJ5QTgvUk5r?=
 =?utf-8?B?cGNsWStzZmFGdGxjMGFqM3ByWG1MMlI5SHg1clpQYk1DUGZLeFVMeWZhaDNy?=
 =?utf-8?B?N3UyeWo2ZEFHN0NHamNtUkhwT0VDaGxUTDYxZHAwSGVRYjFPcjZiNHFObnJ0?=
 =?utf-8?B?TEMwemNTMEg2WktQSkJ2SVV4ZHJ1L2EvR01ualBwWExkdGRMM0hiVVFjQnU2?=
 =?utf-8?B?VzV5K3BvQmdMcURqc2t6bGhvTy9sMXlCd09IVC85a04yOHUvSlVOcnBVTHZh?=
 =?utf-8?B?MkN1SmdTOHBpbEFlR2FwZzVHODRySnhLNTAzWmI5UGsyYVRFa2ZJTnRQRU51?=
 =?utf-8?B?MTc1bVVuYnNrR0hMaUJqRkdTWGRrc1QrM1VQZ29UZEQrNjRwUFUyNGNkaEpp?=
 =?utf-8?B?amxCb3Z1TWZpbEF2eUZRL0J5ZmJwc2NUT3h5NFFTTTlMK2xUa2s0dDVvY0kw?=
 =?utf-8?Q?GgmM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 21:13:52.1911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54225306-c7ad-4514-9c94-08de261e3589
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5576
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Nov 2025 21:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19281


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


