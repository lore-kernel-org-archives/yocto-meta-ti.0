Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618EDCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 11:27:07 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152154.1781609226628674076
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 04:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=d/Kqfl39;
 spf=pass (domain: ti.com, ip: 40.93.196.28, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3OHYi5nkn/yCFOjBaCmBuhxgCPXK8qjcJBd/UKWmPRV7eOxCMXlwen7DH1Q1pTwqcGc1KmvqgV1cxCJSL50RpOHD3YaO2lTveJty3Jqso5yiEvFJXQ78zREVPuoWn9foymkcVw1XyGiCoP33cMp4jIsZ8n/ms0ztdkfOJUpVZ/WdBY4pEdHuqmngvkUKO0koA49wcKFMP9butZiwolo1Ix/AKLVIETZ+0uFGeK/LvPLd6+ensTcgiSITF8vBgwHV+sIs+5QS61Z7wCTvuUSTzXlFtZMf9GKcN9+00njAXkpuwYknPIpZxaMHiTkrI86F6OYySPlEKXSPLhIjdMltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+ftPPrlPFBiMKNn8A/xYm8covsnWR8OYmfE4dqZmI4=;
 b=IuCc+Cul+PJM5d5CmW0X9boZC+Zwjsx3umQq/I552SXlQsw+hSfwXuvaa4iiX1m4ChhwgUhKa1jiTgds5owx2T/Z0Io8Mr6czngHFHDijWO5ZBbfWRautE5teVYjJ0XyAMFFXPnbkqP3s/8bf0vGb0GaI4STiUjK3fnXH1wDLYyqKCEJ/6e9IyvwDPXaHz+FdjSvsQYmbqBEceauwxs0tgmlpzbqh99TTBpWvJw8Bio6BQjziuL2Q1b7qi+i9Z06IDHwdcMIf8CVTePk3rSRuGc7NyTnHVKCrWbKWrMdsGTLHFQXvwAzV58mnZ7b6Ax0hoOj7aQgIiE2DWiM8az9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+ftPPrlPFBiMKNn8A/xYm8covsnWR8OYmfE4dqZmI4=;
 b=d/Kqfl39Meo+1kPBo3Irn3Ev+tAZGZrK8FIRgxbr4wDEllN9DTRWpWkf6zR1iNkbjOXCwVvJ9aZLVC0oqGATcxqR2qDtLrYoWVNM06d22Io5CDelyFyqzMH2iHEAuqS/WMvziSQciXoJbo3GV6VXIQEqVTqiUmWoDuI1blGbk2M=
Received: from CH2PR20CA0002.namprd20.prod.outlook.com (2603:10b6:610:58::12)
 by DS0PR10MB6775.namprd10.prod.outlook.com (2603:10b6:8:13f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 11:27:04 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::a9) by CH2PR20CA0002.outlook.office365.com
 (2603:10b6:610:58::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 11:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 11:27:04 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 06:27:04 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 06:27:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 16 Jun 2026 06:27:03 -0500
Received: from [10.24.51.123] (yogi-work-pc.dhcp.ti.com [10.24.51.123])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65GBR1er4081509;
	Tue, 16 Jun 2026 06:27:02 -0500
Message-ID: <1b93e80e-3c26-49fb-bc64-9fa079f1bf5d@ti.com>
Date: Tue, 16 Jun 2026 16:57:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH] beaglebadge-ti: avoid building ubifs and
 ubi for beaglebadge by default
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <prudhvi@ti.com>
References: <20260609103052.2451227-1-y-hegde@ti.com>
 <c6c07667-08a3-4b22-88ad-9ae5542a4d14@ti.com>
 <7b465487-5987-4420-9550-2e016fb4fe9d@ti.com>
 <c8532bbe-2640-4333-aa88-0fe1a51f450e@ti.com>
Content-Language: en-US
From: Yogesh Hegde <y-hegde@ti.com>
In-Reply-To: <c8532bbe-2640-4333-aa88-0fe1a51f450e@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|DS0PR10MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: a300e2be-66b1-497b-23a9-08decb9a3142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|22082099003|18002099003|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	T5rLOpqnHv+NUnvYI7+NMWT05gxr3AuxWpZ3hA2HEwLClXpv89A9RmehdZBr98/nJdb9J4KNwp6XLA/Rhf3PQf1JrbiBWOscJljFOCNiY6vc7uZ7WB0nJm5Y3IpWF+a/O+mjzuhGwodLY3+GWsNUQXJ2aE7Epre34pSjbDId2QuQn34QcdtBZbjTO5g+bnH+lP9aqSJBpRPTboqRoibnSGXjNbDgr00p//g+h1oXp3hcNY8sjviNV+L4wyD5soC/HFz0oma+7K3OeAR6uFBvG/uZMEugZ/HWhjH/CkCEDc2TOZL9hIEtErVB9OXtzishMcb1mYAUhil7wHPDE7LzV6V7QzGIYS1QfX8YBGX42T7qw1UgdDB+9LYBTXKNSlYkA+Ufq1hbOSzu9RD+hc0qYpdzaYNcbmWV/Y8W69zJYPoHTtzcTjV9l0aLUrVmXMQcQUMaFyPqRyEFskp+YbDJWW9dLkm8OeIM5OGMloyCKOuydnkUNdGTnDzoqVxgWgkGp+SNymNQkXgltfNoDPBU+z17dLE/vtuQB3noNUq7Cyp+9XTVBycdSltia4/7lfrAe78P9ZNCrkZaIQOcfGFVKAMT+Cwjpz7yJpA4UBvoHoT+Asafj5oX0ZjweXl3nJkn42qS3IQeDYmrwKullg8Hd7CKV77Nqrty5ww4JfwNjbWIiZsfsh5QnkjxGpll6izSjJLLiuFPraKbJxYyPLhuNiUGCtINJJm2lmiGeQYzzTc=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7nZVGYn04MRNIae52VMBGa9E0YbasfLfwRjNFLkQIozYAxbDaYpQ+aRqrpXyPQ7V4mrvqAZsrbYJvoj0b/WnfJEl5Egi/z/YyXLSPKfNN7wLi00MKd4daCYQmcCE5Np72bb9QpnSVyA1xIjb6mIvIC3obaEpaH0RIO2un1EQEGNGeJLW400zUAemoT6DjSTAFbPPQe5lM28DQ03PW29MH6q+ow3sPtcTEPcvWqKg8au3pEZl/F7+Iz7MC38q081Y0htmjRc3siw7HdnjZNHWlBudNnYjDgUZ/+iEUSm7bT5r3SOUf51LHp6tJ8Zq1XoyfPoNo/C5d4HajBW6/IxUbm94IH+pQG477DT9N/BXp0bpXj0Gj0AKS8ZE2NuJyyP/7AiEI+vWmhwEv6v0EZZt31rt9/KkIKX/3YuHB9UTs86BvYSEim23mYmghYJcka6M
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 11:27:04.3995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a300e2be-66b1-497b-23a9-08decb9a3142
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6775
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Jun 2026 11:27:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20039


Hi Ryan,=20
On 6/10/26 18:07, Ryan Eatmon wrote:
>=20
>=20
> On 6/10/2026 5:26 AM, Yogesh Hegde wrote:
>>
>>
>> On 6/9/26 19:35, Ryan Eatmon wrote:
>>>
>>>
>>> On 6/9/2026 5:30 AM, Yogesh Hegde wrote:
>>>> Beaglebadge has only 256Mb OSPI flash and except for
>>>> arago-bootstrap-base-image and arago-tiny-image other arago images
>>>> doesn't fit into OSPI flash. Hence remove ubifs and ubi from
>>>> IMAGE_FSTYPES to prevent unnecessary image generation and build
>>>> failures when adding packages to the arago-default-image.
>>>>
>>>> Those who want to run arago-bootstrap-base-image and arago-tiny-image
>>>> on OSPI can enable UBIFS in local.conf .
>>>>
>>>> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
>>>> ---
>>>> =C2=A0=C2=A0 meta-beagle/conf/machine/beaglebadge-ti.conf | 2 --
>>>> =C2=A0=C2=A0 1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagl=
e/conf/machine/beaglebadge-ti.conf
>>>> index 78525030..5295296d 100644
>>>> --- a/meta-beagle/conf/machine/beaglebadge-ti.conf
>>>> +++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
>>>> @@ -4,8 +4,6 @@
>>>> =C2=A0=C2=A0 =C2=A0 require conf/machine/include/am62lxx.inc
>>>> =C2=A0=C2=A0 -IMAGE_FSTYPES +=3D "ubifs ubi"
>>>> -
>>>
>>> If you are going to remove that then shouldn't ALL of the UBI settings =
(below) also be removed as it does not make sense to configure something we=
 are not building?
>>
>> The intention behind keeping `MKUBIFS_ARGS` and `UBINIZE_ARGS` is to giv=
e a reference for those who want to enable UBIFS
>> via local.conf. They don't have to calculate these values.
>> =C2=A0 Machine config still defines the hardware max limits while users =
get to choose if they build UBIFS or not.
>>
>> If this is not valid reason, I will send a v2 with fixes.
>=20
> Please remove them.=C2=A0 If we are saying that we should not support UBI=
 on this machine, then we should not pretend to support it.=C2=A0 If someon=
e needs to recover those then they can look at the git logs and see what th=
e values were when we removed it.
>=20
> On the other hand, if we are saying that UBI is supported then we should =
not be turning it off and instead work to address the bigger issue of not b=
uilding UBI for the default image.
>=20
> What is the actual issue we are trying to address?=C2=A0 We have not seen=
 any build issues related to this platform that would spark the need for th=
is patch.=C2=A0 Please provide a little more context so that we can choose =
the best course to address it.

This error was observed during 12.0 and occurs when meta-tisdk layer is inc=
luded.=20

Here is the build log - https://gist.github.com/yogeshhegde/20e8342efd1a3ab=
1a20c9d4398287ae3=20
config.txt - https://gist.github.com/yogeshhegde/974d90cb384c7c47e2d3af7f28=
cdf3b1=20
Temporary fix in meta-tisdk - https://github.com/TexasInstruments/meta-tisd=
k/commit/7dbee113d4a1eaf46fb4c6a0981eb86300263d75=20

-- Yogesh

>=20
>=20
>=20
>>>
>>>
>>>> =C2=A0=C2=A0 MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8500"
>>>> =C2=A0=C2=A0 =C2=A0 UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 10=
24"
>>>
>>
>=20




