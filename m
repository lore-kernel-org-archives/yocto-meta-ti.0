Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFBCCEE339
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 16:29:50 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1179.1763483374004571154
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 08:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PsQhdhHA;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.48.45, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfjKOjmxGBL8aXXTWYDGoB9irTjRo7Maq7eGxUQqQXdzSzAtlFnqdymeMlf0JH7QE5tkEqRG7OUyDjypbwoHOBXw0b0S22VwZqgCiQ1wkUgKziCj6s+FERP4VH23d2M0Asd43tOe6LdT0XCFbKC8GF+UZqYxfavALZsk+wlRTrRixlgjoiLf0KxCU8xpjD47dCVcOPOebaDc0ktkXfQLd33qWFos6UBIwlNbjVQdOxxm5hPn4CxC3Y/5kWqgEIyM2QXmedzB23iXcP5TfTSB+wScvb06yQmDCWgaxZ2Lva7F+xBuoObhh9v9aMm/Y4XKgbOKurP2xLhsH+7QwlL4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VspwxT2M3m+v8EZcKK/73F2hNNKCTLxLDz3mK1CQoP8=;
 b=gZ9Gwz4JZV3LEBA6wvs4XbbiYJX8UTv57tdX0uN8xZgADpyctXVhDpes3OPKoOtG2eZ4JZ4zyqOA+nmWxtrcl23wb2QqOHN/z3KO+zUdL7bAoe6kU4b2nf27kMcVoktMcoTGVUM/kzflrtwiJ/Q35foQ99EdrhsCj0R5dqWKP1VPj5L7u6s1nOAYhf3g5zXEX45VL+2By2KbP2R/tIadCAccSXXbEITxCdYg4nS+oVpH8sKfI8NC5adHZ57Jt0k73YJbvB8cdY8ftP5oeIYCeQ75ytBhuyfHNLBGRYhBfaxOo3QPWszGxzYFqQRR1ZJHdAzhweYZTrtz71dIt/zPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VspwxT2M3m+v8EZcKK/73F2hNNKCTLxLDz3mK1CQoP8=;
 b=PsQhdhHAgnFpeSIDXVrNPCcrutvdY3Qp0laKB5a1zxjoZ68m869FLQgYEJ1DoyY/PUUY+hNKDN5UV/QaZjtRxs9Dg2sb4qT9vlOvrO3cGx86z0H21iJ0k/LANSU73KfYYwKlssAyxAoKMcEOFNEpKV4eTKc/cTnID3411/4kFQY=
Received: from SN7PR04CA0212.namprd04.prod.outlook.com (2603:10b6:806:127::7)
 by PH7PR10MB6129.namprd10.prod.outlook.com (2603:10b6:510:1f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:29:30 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:127:cafe::c6) by SN7PR04CA0212.outlook.office365.com
 (2603:10b6:806:127::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 16:29:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:29:30 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 10:29:26 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 10:29:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 10:29:26 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIGTPCo354713;
	Tue, 18 Nov 2025 10:29:25 -0600
Message-ID: <4358521a-5839-4213-b445-f6742d01c1e1@ti.com>
Date: Tue, 18 Nov 2025 10:29:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v4] meta-ti-bsp: optee: Ensure
 libckteec.so symlink is installed
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>
References: <20251117083407.3719468-1-s-joshi@ti.com>
 <9af153b1-6ce7-4677-bff9-6a06cfa5592e@ti.com>
 <20251118081423.rcmoe5ouduhfq4od@ula0507357>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251118081423.rcmoe5ouduhfq4od@ula0507357>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|PH7PR10MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e339968-7f13-4358-f143-08de26bfa645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|4022899009|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmMyandCdGZoMjhMVnJGTU5HR2kvY3d6YmZZSWdaUURsTHdkYW4yZ3Mwb25h?=
 =?utf-8?B?NzMxeXBQV0RlMWtXamNYa1JrSjlSM05PaWdLL2Vvd25ucVVpcFZkSXZjeERx?=
 =?utf-8?B?MHMzNGVOcUJEZDQ0VWtLMklablBOL2pGdVBreDBZRWpDekFZMzdHUkd4cHFy?=
 =?utf-8?B?MU1aenlQQWVnWEhhOXRmTGlVRWFCRUtRTlhBMHhoQ29Yd3VtaDhYTU5BZTFw?=
 =?utf-8?B?UzJ2TXRZMFFYMzJoQnluSmlkUG1hSGlEb0pYMFhFN0hYemdIS2xwdHIyQ010?=
 =?utf-8?B?SzRGR212Y3RJdk1oWG12NnRVdmoyRHliUDVGS0x3L3JPMUVZTW5zUnFZaGhv?=
 =?utf-8?B?bWE5Ym5yS3dqQlk5bW51Y0lDSVZsamVXNnh4bVpVYktLeFRqenVEUjhBWGNa?=
 =?utf-8?B?LzhVQVMydFlXVk9mdmdLVFd0UkpNQ2MreUJtVFNPMmN2K2ZPWTJRTGh0ZnNU?=
 =?utf-8?B?RTJObWZqODRjNElaK3ZjbmVxL2RpTXIwU2s5ZHdTY01UWW81UklKSUNIV0l5?=
 =?utf-8?B?V2NZVUVpd1hpajl5L2ZCaUFLOHc5SCtYR2FEOC9ITXlvYWd4MEozM25rcXFO?=
 =?utf-8?B?Y1Nvak5XMnZrUTBtblNSTUhGY2ZuazVwV0p4L0c3SE1mM0tkNklYQlN5UlQ5?=
 =?utf-8?B?T2tZQTBFelBTMUhrc1BNSkFCaC93QlZkQjdCSzRIdUh5OWRzNE9JY2JlR21U?=
 =?utf-8?B?UnBZenpjTGhtalFTZmVIa1F4azNVWjR6TEorUk9UQmlqWDNab1p2R3NndTQ0?=
 =?utf-8?B?dGhrcjcrMUFNaTBJTFhBMFBKUkNzTW9ER0RJTW4wWTdoSmljQVhxcVZiR1kv?=
 =?utf-8?B?L21HUURETWdkYm94ZkptMHY1d2FRVm1UVWJ5UjRkMENtcWJLSEdRWXp1b016?=
 =?utf-8?B?Szh0ZzFYazBsZkRoYmRlWTVFYXMyVlg5eG5aMnVUbWx5ODVMdGRxQnpOczZu?=
 =?utf-8?B?dTNEMWMwczdkcE1IV01oWFVPQjh5MXI1ZkdwVGhKeUtYU2xtWVVoQzY3K2xN?=
 =?utf-8?B?VytTMjl3dlFTZEhKc292clVTMUUvWTMzWXlia0NPMW5RZ1NpbFRncXcwRkR6?=
 =?utf-8?B?dVRmSXlOd2V3K1NIVE52QlZGRUN5M0VSZWtlZjZjTnMySWpISjVSMFA4bGU4?=
 =?utf-8?B?dzRHTmx4aFQwcDgxdjg3UHE3b3JXOUdqV0xHODBiUXh5dEU0SGhHWWNMck5K?=
 =?utf-8?B?eThUNS81WnprdmJoMllHbHIwYWpUTStkcnhjQW00S0xlTXU2VVpoSWxkODMw?=
 =?utf-8?B?eTFnZ3dNRTVhemxodThzeXFLZDdCeXI2bi9XcElnek52eTJ4UmY0VkdjVEkw?=
 =?utf-8?B?dXE3YnlIUTlxL1loQnhualppU09pVGpHMmVNU1FsNzV5VXFnaUFneDZXV1pv?=
 =?utf-8?B?ZGNxYmVPaEs1cFp5SURFQjlVbUEvZmc5UjBuS1lXSlZIcmFyS0ZJN3pYanB6?=
 =?utf-8?B?NHRxNFRKRjlvajdGWXRuZGZhR3MzV2p2Ly9qN3JPYXB5ZjdzeTFad1orcDZD?=
 =?utf-8?B?RGxYN0lNOGF2algxODNVS05xUXJ4NEMvWnJnQlZvL09xWWJaL09BM3RoUktj?=
 =?utf-8?B?Y1pGaWtEUzZwTU5Pcno4S1V3N1BsWGEzVWdWQVhLR24wUkRmTit6QnB0YnJk?=
 =?utf-8?B?dldMQTQzczdMUU8ranpWdW85cGVVdm02UkkwZU0zUzQ3enMrWDNrMkJoeGJo?=
 =?utf-8?B?UjhYalgrd2lSWmlJWmllcXdrekdTTFdDdGZzQW96NmNnR0VESHhwOENQY2pq?=
 =?utf-8?B?TlN1Tm5zWU5qNUc0MXFDeGp3NW5GalgxbE1MK3dJeWNiMXRqcjFKWU5obEhK?=
 =?utf-8?B?enNBMFZwOXY1Y01ZWjZRcVUvSnAxbDRQSkhRaXNnSnU0Z0VleGttVlBFaVFo?=
 =?utf-8?B?SVEyUWxxdm5FbEhxRmxkTkYvbUhXTFRmVnBNMVR1Z2ZoS0w0OVJvK2RVQi9l?=
 =?utf-8?B?T3l6VmhTWENOMDNiVGZoVTRBWE1yRWhKSWluL0NQQSs3ZTQwdko5dTBHY1VZ?=
 =?utf-8?B?UHRhT1h2L1BWU2hnYnhaa3QxMzM1RjVCT3VJUFlOZUxMWEtkUDRST3U4WGNK?=
 =?utf-8?B?L2FrNXZwOUNCOXFKbVNjSjZkdnVUMW52azhsem5QMVlkMUJUZEJZR0VjOG82?=
 =?utf-8?Q?vS40=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(4022899009)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:29:30.3002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e339968-7f13-4358-f143-08de26bfa645
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6129
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Nov 2025 16:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19288

On 11/18/25 2:14 AM, Suhaas Joshi wrote:
> On 13:06-20251117, Andrew Davis wrote:
>> On 11/17/25 2:34 AM, Suhaas Joshi via lists.yoctoproject.org wrote:
>>> Presently, /usr/lib/libckteec.so is not installed. Instead, the only
>>> symlink present is /usr/lib/libckteec.so.0 which points to
>>> libckteec.so.0.1.0. This makes OpenSSL commands fail since it looks for
>>> /usr/bin/libckteec.so.
>>>
>>
>> Seems like this would be an issue for others, have you sent this fix
>> upstream to meta-arm?
> 
> No, I have not. Will send it soon, once this patch is accepted.
> 

Why wait? "Upstream first", maybe the ARM/OP-TEE folks will have
a different/better solution you can simply back-port to meta-ti.

Andrew

> Thanks
> Suhaas
>>
>> Andrew
>>
>>> So ensure that this symlink is installed by explicitly adding a
>>> FILES:${PN} assignment.
>>>
>>> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
>>> ---
>>> v3 -> v4:
>>> * I realized that libckteec.so.0* and the PKCS#11 TA file were both already installed in the SDK.
>>>     Therefore, in v4, I have removed the logic for that since its redundant now. CFG_PKCS11_TA and
>>>     CFG_REE_FS are enabled by-default.
>>> * v4 only fixes one issue: the absence of libckteec.so. /usr/bin/libckteec.so should link to
>>>     /usr/bin/libckteec.so.0 which then links to /usr/bin/libckteec.so.0.1.0.
>>> * Link to v3:
>>> https://lore.kernel.org/yocto-meta-ti/20251113104522.2443817-1-prc@list.ti.com/T/#t
>>> ---
>>>    .../recipes-security/optee/optee-client-ti-overrides.inc     | 1 +
>>>    meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend   | 5 +++++
>>>    2 files changed, 6 insertions(+)
>>>    create mode 100644 meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
>>>
>>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
>>> new file mode 100644
>>> index 00000000..dd6a9d01
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-overrides.inc
>>> @@ -0,0 +1 @@
>>> +FILES:${PN} += "${libdir}/libckteec.so*"
>>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
>>> index f193e78b..0cee127f 100644
>>> --- a/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
>>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client_%.bbappend
>>> @@ -2,3 +2,8 @@ OPTEE_TI_VERSION = ""
>>>    OPTEE_TI_VERSION:ti-soc = "${BPN}-ti-version.inc"
>>>    require ${OPTEE_TI_VERSION}
>>> +
>>> +OPTEE_TI_OVERRIDES = ""
>>> +OPTEE_TI_OVERRIDES:ti-soc = "${BPN}-ti-overrides.inc"
>>> +
>>> +require ${OPTEE_TI_OVERRIDES}
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#19278): https://lists.yoctoproject.org/g/meta-ti/message/19278
>>> Mute This Topic: https://lists.yoctoproject.org/mt/116334516/3619733
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>


