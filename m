Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC099C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:06:23 +0000 (UTC)
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (GBR01-CWL-obe.outbound.protection.outlook.com [40.107.11.101])
 by mx.groups.io with SMTP id smtpd.web12.7821.1666793180675366067
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 07:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com header.s=selector2-sancloud-onmicrosoft-com header.b=d3P4WEqX;
 spf=pass (domain: sancloud.com, ip: 40.107.11.101, mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htBZ9Ssfdh0AQWhg4/Sfh0Reuh6UxQxWkAF4C/9eE5/w5DfA5jIyqrdawh8cIrn1bzqRxlbDvbB4P6HLPyjvcDnRySt3TFgKxEzXziDvst09Sg/Q6QiNGyktAftDaD+RXhP/+F5vig1b2h8ysIR6usVH/cBqCdjOmUaAwLzO2YC7WL8UdQ1NwsVQd6ivTZfXiRRqBQ8v5S+v0WoqgCv9zLbbiMEcGGKwpPW7KJsgRUpiZJ5a8yGKRvqojdW0JA9gWNgNzsZr89f81N966jnthRPJv/irzeBjpZfy3j1T+etrdIaSZNnnNX02wiAnhd8dJUkk7NDHVT4Mah01H3SVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLDvR89joWI4xc4BMQpm2d0/UpaXcjH8EZIprFSUGao=;
 b=l2JReI5LvpZEFxAkYZ4+nUNEPo8j4drLPnPq6uKTPSeJspiVvYsuXLnWWd3aS/2RhEf3/nQHzUoYCKa7HGQttUsV4rj7Z1tQiMLyB8vyvXHKhbIDuoxvKq4Qqtdw4IFwT7ksSyWqSRcu/8uXJmnWDdxxpL/AdAh5VoCgFEaqyc0226Q56eSrIjEnHQybsqjMHoUrQyV19wt9986DX4E4JnL4evmRvfOT1sr1zQwFEvOiGorR3osG2vx2bd7/o2fE+FktKJw03FBgBOee+rQTGFLDQTgf6ruGGI18LiwWn4MO6Hf4LMfoxzBN3zCq2jOU+ayRVvfIMbizRx8JCY/TVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLDvR89joWI4xc4BMQpm2d0/UpaXcjH8EZIprFSUGao=;
 b=d3P4WEqXb70wVmTJYZGFqzmZI1qljI4ENUGiVMNZLoMuINnqieyFrc5GWFEwpTH5VkQnydnxbOpylTNNZUiw230LkUKU7dVtFnITiZjT9G0b0kLaSqDxDGXvk9P01Pd+DukCR7qzHQdCmSY8umUI9/lqTrcMQV+/NSJ1sQ83btc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB7027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 26 Oct
 2022 14:06:17 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::d15c:eb15:661f:491a]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::d15c:eb15:661f:491a%3]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 14:06:17 +0000
Message-ID: <1326f4e6-d6bd-3313-a0c9-746895864502@sancloud.com>
Date: Wed, 26 Oct 2022 15:06:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
From: Paul Barker <paul.barker@sancloud.com>
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
 <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
 <1721551A6FBDDE25.26638@lists.yoctoproject.org>
In-Reply-To: <1721551A6FBDDE25.26638@lists.yoctoproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------08Cku0pJoW2xeQGBciZKBmKc"
X-ClientProxiedBy: LNXP265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::18) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB2241:EE_|CWLP123MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b40f542-65a6-40d0-fbde-08dab75b3fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	83cHnHdGlMXMjMwGbZYdAuLtgFJf6pK0V3FkO75AoMmZfuuFIniYkNZmnCSreW/M2QQPtRUzQu/dxD8I0afnsIIfAF+THu/j+aPwsyR8m7NKOUXT4jAEKBsgsoewDYAWyXxqf1cIl3B9aTkzGE1cJDZ1Hop/TqUMNnP6qz6vrLQ2+zhWHG7HZi2jZWrcL8Kfg/tWnijrv18icKVviJC1vV8dBr7yXQ1r4F0rjNb1urpfWAiA1iV2rUbfdtmi8+DrHMIRmON6yElhaAWbvslpAtLaV45kaPQ6fzMDjc0Z8KRNC6MvWnGLl6o8gLGBi5AcIJm2DEUmsqGv7nhImrpQsD6dvGtz2ekAw//59cgETxpnG/Kle4DJaqcdFxz9M+CZuIJwvdt6mOvN9w53crQyd+OKpIOcacLx6reRNC+j+I2CuBG8kxsqVbApikXRupcbd+qBXHi6cP7oXuo4NcB2PUrBRdtNyyzsPD8VKYaCuLFRIK7nhCSn78MZf5fAOBIu4kCJp0I4ib4e8UQuGFY2h1mEOefJ6UAWE4C1V7OZhsnz8SF0a9V/p8FvA29jPG2YpP7dbFXUWnuTLXeInQKG1nhN+1reXl3xU6UUevh4vRNATo5eRMQvTWCTi5pi/eFvbrOnKqgCkKy7oNWO/cEjlz5NRKbJxssoIdXHXEhxSMkUYb0mjpdacWX3+vZxBYYhjVO9bpp67gnMdxWLDWDwlzfKiX4qXeeCW//nbSgtOX5T9LuJ0y6P6BZShDgIDJApyK9WgKisaQ6G9fnETHKzh+yGGcyRyNRsLN0W5df6sT2N3+ksL5RyQQUbL6o5pZSTVhKvO4izFWvaK7jpcUYdDOHXiI+jyaUsQVyOrUPwKxYS2Rn+LZ8+5TTilCYWX97/uHh8ck3rywou63DohoDXhJzl5fDHTGsOCyEHoNpj0mc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(39830400003)(346002)(376002)(451199015)(2616005)(52116002)(38350700002)(6512007)(38100700002)(86362001)(31686004)(966005)(6486002)(44832011)(186003)(478600001)(66476007)(83380400001)(110136005)(53546011)(66946007)(8676002)(5660300002)(36756003)(31696002)(33964004)(316002)(235185007)(66556008)(2906002)(21480400003)(6506007)(8936002)(66899015)(30864003)(26005)(41300700001)(290074003)(175373001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dE0yWk94Syt6ZkVFWTM1WDQzb2k1WWg4TWJtaXBLWTNpWkRRN2pkY2lHZTJo?=
 =?utf-8?B?WEt5WDUxd1ZSbnMrZjN5YnFVaEVidGpnc2tXSGZYOGZ1aERQcGVMZTBsbWJu?=
 =?utf-8?B?T3hwUUp5K2tEd2sxSW00RUtZL2t1RW1QQkdGemFWZ3JvaVY5Z1BWdkNrU3BP?=
 =?utf-8?B?akxWM0MvZUtMTDREV0ZmcXgxdkRzQkZxZExwekhxaDdqN3hLRmlyNm5ucEtJ?=
 =?utf-8?B?bkpTMnlNUWFJSFpBWFlLYzZuNG9DSi9ibFlYVmI2NmJXRFZZZlBHYXRLemI0?=
 =?utf-8?B?eC9VRjh3WmRldC9veWg4YUhGZW1TUCsrKzd2ckdGbC9TcVpvSFRKWjQvck9x?=
 =?utf-8?B?aElJbTRibGc5RXVaUEpLSDFzYU1ieWt5T1VLcVZuTFR2cVZ6ZU9kNnpYRjZP?=
 =?utf-8?B?UFN2Mk9GTTN5OVNYcDRLTllOQitPOGVsaExOVkc1Z2RCcjlrVmRFSUNOaENk?=
 =?utf-8?B?bTZSaTg0eWdGMVNVYjZkUTVTcm1mZDY0dzNMNFl2bGFsN2MwOGxNZGRKTGFK?=
 =?utf-8?B?U2MreTNWTE5lWEVTRXNxUnpxS1VzV3pVeFVVQ2x6Q0Z4UTh5S29KN3ExY05k?=
 =?utf-8?B?K0I4Rm9WTVMwVk9GbnZ4OTFXM09lR0FZVk1OSFplenJiMmRhSWVOcTNuYXNE?=
 =?utf-8?B?dCt2WVh2TjJ4NzZ2bUdpVzluZk1XRWpRQU9zbW9vRXFMNy9GUkNsYVhqVUVM?=
 =?utf-8?B?N0lRWlpFSkhtbE1ROFdzcmRKaTJJVGxZR3RIUTdmM0JBZVUrWndFZDgvVS92?=
 =?utf-8?B?QmxNWmdzeDFqUHZQaktxY1NvbkJwd3dLMFNJSkpGSW1xV0F1bmMwdzJuMS9t?=
 =?utf-8?B?ZWhQbGV2dUp1Z2hMcXFDVHg1cWd3bUNMcXhQNHc2MERpYmkvU1ZHcmxmcDF0?=
 =?utf-8?B?S0RXRzBrU0h4cnVRd2VYSVdDeUZac1UxVUJFVDNxZUllS1VQQ2dKdXB0OEh3?=
 =?utf-8?B?N0tPZFdlU1lGVmdLRmxaSkF6MElnVEovU3ZZUEtvUGUxRW8wSzk1SXZYc2VJ?=
 =?utf-8?B?c1hlQi9wdG1HY29yeWxKOEdYWmhUNkFTV3BFOS9pSHpuMEwxMmx5cjdjRzMy?=
 =?utf-8?B?MkF3b3N5UFI5MitpRGlTNU85NVdYNXNlSTdQRFFmVmF6cUdQS0FOaHJzNDV2?=
 =?utf-8?B?V3l5Qzg1Rk91MFN0OW5Vc3piMkdlZ1VYaWZ5ek56TEVkTHh2T1R3aE1TNTAr?=
 =?utf-8?B?WE5IM1h2cHM1L09Qa3hZSkV6aEV6aEJoYTh0bkp6SXVlQU5QQURMRjNic1hC?=
 =?utf-8?B?TEsxSjVGSTMwejhFMC9DcWN3dmV1K3Voc1lWQWg4bTdlSXY4SW0zZlNLb28y?=
 =?utf-8?B?ek0ySTFERGJyUk5hbHVDUmVvaExpNE56UGh2YUljZEJzSDYwWU9aVjFJblVs?=
 =?utf-8?B?aEJiSHk3NHRvcGY2Z2d3MWE5NU5ybWFkeFNDUlZhLy83MS8xTkIrbnJvNjVn?=
 =?utf-8?B?UmdxYXNtOENDNXo1d09VeGs0NEMrUGVMNXRZUTlpSGVJWnJ5T0w4TkdHTjdm?=
 =?utf-8?B?QldhS0V4aVFMamE1WThzb3VyUzUwRnB2UFRSREo3RUFqWG9ZY2EydzdDV0lz?=
 =?utf-8?B?TU9MN1ZIOG5pcmhoNCsvaWhMZFU2azVscTVWTHJWVjJNSzA0MlNVUjl0MXcv?=
 =?utf-8?B?N2dybDUzODI3N1NRaGh0REdYSVErZ3dTQ2FOakowTEs2cGQyeG1lTFVzVEJs?=
 =?utf-8?B?SzZ5a3hBV0xXdkZ1TkVXclJranN0MWtyVWFTY0NHcTNaYVZ5Q3VwVHRKczhm?=
 =?utf-8?B?V1BVU0xLNE5zYnd2VFJrUDF3aXJ2YjVXK1FRZkNGWDU2R2lEMHpIUGVvaHBa?=
 =?utf-8?B?c0pyWWFkckdUalp5YXA4ZG9PQ3E3OG1EbTBkWHVPSWEyVTZDZ0htZ0UrbXBM?=
 =?utf-8?B?K3BQMnpubUEzMHU5U3BOSlVNdWlTcE1FeVlVVXlDQ290RHp0Z0hWTm1yZ3py?=
 =?utf-8?B?ZWpaR3lSSVg2NzhPMFBIZ3YvRWxRdGZRamc5enEvMXZSUmIzUDZUYTNFeUFI?=
 =?utf-8?B?WEU2d1FxY0d2Y05wLzR2U2dJR05naExPZTVFT2RBbHJnYXdSVnFNZVB4VVNU?=
 =?utf-8?B?bHVURUU4allmSXlGbXVxR2JkaklyWC9veEJidWE1WHFNSWZuWEd3SDRHSDZQ?=
 =?utf-8?B?WTZ4MER6YytCZjlkT3Jub0hGZmlRSnVpTEt3NC96S3U2NXpodGNaSU9QL28z?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b40f542-65a6-40d0-fbde-08dab75b3fcf
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 14:06:17.0910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSsyheiw61BNVL8PaIzZFGj46cgqVmnv7OcGe916NRGBTRMJRxmRvcwOH+LrZGSmOvalcTBbKEwvu5UZBsD//uTKPpCe3/VtTrNwzcTXxL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB7027
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Oct 2022 14:06:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15204

--------------08Cku0pJoW2xeQGBciZKBmKc
Content-Type: multipart/mixed; boundary="------------7FRgvGtxQg7DmAGmLhqBxUkh";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Message-ID: <1326f4e6-d6bd-3313-a0c9-746895864502@sancloud.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
 <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
 <1721551A6FBDDE25.26638@lists.yoctoproject.org>
In-Reply-To: <1721551A6FBDDE25.26638@lists.yoctoproject.org>

--------------7FRgvGtxQg7DmAGmLhqBxUkh
Content-Type: multipart/mixed; boundary="------------EurgNwo0ulKaj2grrOBICSbo"

--------------EurgNwo0ulKaj2grrOBICSbo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25/10/2022 15:08, Paul Barker wrote:
> Hi Andrew,
>=20
> On 17/10/2022 15:30, Andrew Davis wrote:
>> I'm attaching a patch for meta-ti that should
>> get both core-image-x11 and core-image-weston building for Kirkstone.
>=20
> I'll give this a test this week. I've included some review comments
> below so we can hopefully get something merged to fix this issue...

Here's my build results with this patch applied:

  * DISTRO=3Dpoky:
      * core-image-minimal: Success
      * core-image-base: Success
      * core-image-x11: Success
      * core-image-weston: Failed

  * DISTRO=3Darago:
      * tisdk-base-image: Success
      * tisdk-default-image: Failed

For both of the failed builds, the failure looks the same:

| Dependency gbm found: NO found 19.1.6 but need: '>=3D 21.1.1' (cached)
| Message: dmabuf-feedback requires gbm which was not found. If you rathe=
r not build this, drop "dmabuf-feedback" from simple-clients option.
|=20
| ../weston-10.0.1/clients/meson.build:42:0: ERROR: Dependency 'gbm' is r=
equired but not found.
|=20
| A full log can be found at /workdir/build-kirkstone/tmp/work/armv7at2hf=
-neon-poky-linux-gnueabi/weston/10.0.1-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-linux-g=
nueabi/weston/10.0.1-r0/temp/run.do_configure.1057121:184 exit 1 from 'ex=
it 1'
| WARNING: Backtrace (BB generated script):
|       #1: bbfatal_log, /workdir/build-kirkstone/tmp/work/armv7at2hf-neo=
n-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121, line=
 184
|       #2: meson_do_configure, /workdir/build-kirkstone/tmp/work/armv7at=
2hf-neon-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.105712=
1, line 173
|       #3: do_configure, /workdir/build-kirkstone/tmp/work/armv7at2hf-ne=
on-poky-linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121, lin=
e 149
|       #4: main, /workdir/build-kirkstone/tmp/work/armv7at2hf-neon-poky-=
linux-gnueabi/weston/10.0.1-r0/temp/run.do_configure.1057121, line 197
ERROR: Task (/workdir/layers/poky/meta/recipes-graphics/wayland/weston_10=
=2E0.1.bb:do_configure) failed with exit code '1'

It looks like some further work is needed on this.

>=20
>> From c81fbae2cf7787ed01ee00b378e95be9d653d7df Mon Sep 17 00:00:00 2001=

>> From: Andrew Davis <afd@ti.com>
>> Date: Thu, 13 Oct 2022 09:59:46 -0500
>> Subject: [PATCH] Add core-image-weston and core-image-x11 support
>>
>> This is more changes than I would normally like in a single commit
>> but these all do seem so logically connected. The goal being to
>> enable the two oe-core graphical images.
>>
>> These changes are needed due to our MACHINES all only having GLES2
>> and not the desktop OpenGL versions. That would mean these belong
>> in the layer that adds the machines and not in a distro layer.
>>
>> At some point we should add a new MACHINE_FEATURE that lets a BSP
>> layer specify the API supported by the hardware. Until then
>> we append these key recipes to switch them over to GLES2.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>=20
> I expect the long-term solution will be to add a "gles2" entry to
> MACHINE_FEATURES on the Yocto master branch, but I doubt that will be
> accepted onto the existing kirkstone branch. In the meantime we do need=

> a solution which can be applied for kirkstone.
>=20
> Are the changes here expected to work for all TI targets or just the
> AM335x SoC? i.e. can this be applied to the kirkstone branch in meta-ti=

> once refactored into a couple of different commits (e.g. one per
> package)?
>=20
>> ---
>>  .../recipes-graphics/cairo/cairo_%.bbappend   |  3 ++
>>  ...abling-patch-to-not-exclude-libepoxy.patch | 46 ++++++++++++++++++=
+
>>  .../recipes-graphics/gtk+/gtk+3_%.bbappend    |  9 ++++
>>  .../libepoxy/libepoxy_%.bbappend              |  3 ++
>>  .../xorg-xserver/xserver-xorg_%.bbappend      |  2 +
>>  .../xwayland/xwayland_%.bbappend              |  3 ++
>>  6 files changed, 66 insertions(+)
>>  create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappen=
d
>>  create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-O=
penGL-disabling-patch-to-not-exclude-libepoxy.patch
>>  create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend=

>>  create mode 100644 meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.b=
bappend
>>  create mode 100644 meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-=
xorg_%.bbappend
>>  create mode 100644 meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.b=
bappend
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/met=
a-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>> new file mode 100644
>> index 00000000..726f3911
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
>> @@ -0,0 +1,3 @@
>> +PR:append:ti-soc =3D ".ti1"
>> +PACKAGECONFIG:append:ti-soc =3D " ${@bb.utils.contains('MACHINE_FEATU=
RES', 'gpu', 'egl glesv2', '', d)}"
>> +PACKAGECONFIG:remove:ti-soc =3D "opengl"
>> diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-d=
isabling-patch-to-not-exclude-libepoxy.patch b/meta-ti-bsp/recipes-graphi=
cs/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.pat=
ch
>> new file mode 100644
>> index 00000000..c873fb8d
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disablin=
g-patch-to-not-exclude-libepoxy.patch
>> @@ -0,0 +1,46 @@
>> +From eb16e80bf1f7c51024f3ed950ae85541e5ba2233 Mon Sep 17 00:00:00 200=
1
>> +From: Andrew Davis <afd@ti.com>
>> +Date: Wed, 12 Oct 2022 13:05:45 -0500
>> +Subject: [PATCH] Fix OpenGL disabling patch to not exclude libepoxy
>> +
>> +Upstream-Status: Inappropriate
>> +Signed-off-by: Andrew Davis <afd@ti.com>
>=20
> I think this is appropriate to fix upstream.
>=20
>> +---
>> + configure.ac | 9 ++++-----
>> + 1 file changed, 4 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 3cb24e9..aa365be 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -348,10 +348,9 @@ AC_ARG_ENABLE(cloudproviders,
>> +                               [cloudproviders_set=3Dyes])
>> + AC_ARG_ENABLE(opengl,
>> +               [AS_HELP_STRING([--enable-opengl],
>> +-                              [When enabled, Gtk+ will use libepoxy =
and exposes GtkGLArea widget ])])
>> ++                              [When enabled, Gtk+ exposes GtkGLArea =
widget ])])
>> + AS_IF([test "x$enable_opengl" !=3D "xno"], [
>> +-  AC_DEFINE([HAVE_OPENGL], [1], [libepoxy and opengl APIs are availa=
ble at buildtime])
>> +-  EPOXY_PACKAGES=3D"epoxy >=3D epoxy_required_version"
>> ++  AC_DEFINE([HAVE_OPENGL], [1], [OpenGL APIs are available at buildt=
ime])
>=20
> This section can be changed to always define EPOXY_PACKAGES, or to
> define it when `--enable-epoxy` is passed on the command line if we nee=
d
> a way to enable/disable this dependency to be able to submit the patch
> upstream.
>=20
>> + ])
>> + AM_CONDITIONAL([HAVE_OPENGL],[test "x$enable_opengl" !=3D "xno"])
>> +=20
>> +@@ -1365,7 +1364,7 @@ CFLAGS=3D"$saved_cflags"
>> + LDFLAGS=3D"$saved_ldflags"
>> +=20
>> + GDK_PACKAGES=3D"$PANGO_PACKAGES gdk-pixbuf-2.0 >=3D gdk_pixbuf_requi=
red_version cairo >=3D cairo_required_version cairo-gobject >=3D cairo_re=
quired_version"
>> +-GDK_PRIVATE_PACKAGES=3D"$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAG=
ES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES $PROFILER_PACK=
AGES fribidi >=3D fribidi_required_version"
>> ++GDK_PRIVATE_PACKAGES=3D"$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAG=
ES $cairo_backends epoxy >=3D epoxy_required_version $CLOUDPROVIDER_PACKA=
GES $PROFILER_PACKAGES fribidi >=3D fribidi_required_version"
>=20
> This line can remain unchanged if EPOXY_PACKAGES is unconditionally
> defined above.
>=20
>> +=20
>> + PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
>> + GDK_DEP_LIBS=3D"$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
>> +@@ -1399,7 +1398,7 @@ fi
>> + PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
>> +=20
>> + GTK_PACKAGES=3D"atk >=3D atk_required_version cairo >=3D cairo_requi=
red_version cairo-gobject >=3D cairo_required_version gdk-pixbuf-2.0 >=3D=
 gdk_pixbuf_required_version gio-2.0 >=3D glib_required_version"
>> +-GTK_PRIVATE_PACKAGES=3D"$ATK_PACKAGES $WAYLAND_PACKAGES $EPOXY_PACKA=
GES fribidi >=3D fribidi_required_version"
>> ++GTK_PRIVATE_PACKAGES=3D"$ATK_PACKAGES $WAYLAND_PACKAGES epoxy >=3D e=
poxy_required_version fribidi >=3D fribidi_required_version"
>=20
> As above.
>=20
>> + if test "x$enable_x11_backend" =3D xyes -o "x$enable_wayland_backend=
" =3D xyes; then
>> +   GTK_PRIVATE_PACKAGES=3D"$GTK_PRIVATE_PACKAGES pangoft2"
>> + fi
>> diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend b/meta=
-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
>> new file mode 100644
>> index 00000000..b6e82d14
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
>> @@ -0,0 +1,9 @@
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>> +
>> +SRC_URI:append:ti-soc =3D " \
>> +	file://0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch=
 \
>> +"
>> +
>> +PR:append:ti-soc =3D ".ti1"
>> +PACKAGECONFIG:remove:ti-soc =3D "opengl"
>> +DEPENDS:append:ti-soc =3D " libepoxy"
>> diff --git a/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend=
 b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
>> new file mode 100644
>> index 00000000..aadf5bab
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
>> @@ -0,0 +1,3 @@
>> +PR:append:ti-soc =3D ".ti1"
>> +PACKAGECONFIG:append:ti-soc =3D " ${@bb.utils.contains('MACHINE_FEATU=
RES', 'gpu', 'egl', '', d)}"
>> +PACKAGECONFIG:remove:ti-soc =3D "x11"
>> diff --git a/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.=
bbappend b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbapp=
end
>> new file mode 100644
>> index 00000000..86c1e714
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappen=
d
>> @@ -0,0 +1,2 @@
>> +PR:append:ti-soc =3D ".ti1"
>> +OPENGL_PKGCONFIGS:ti-soc =3D ""
>> diff --git a/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend=
 b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
>> new file mode 100644
>> index 00000000..e7163207
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
>> @@ -0,0 +1,3 @@
>> +PR:append:ti-soc =3D ".ti1"
>> +PACKAGECONFIG:remove:ti-soc =3D "glx"
>> +DEPENDS:append:ti-soc =3D " libxshmfence"
>=20
> Thanks,
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15197): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/15197
> Mute This Topic: https://lists.yoctoproject.org/mt/93954566/6609808
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [paul.barke=
r@sancloud.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.com/
--------------EurgNwo0ulKaj2grrOBICSbo
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGCyYogBEADoyTDRt8FP0wNMj4uFpD1PhFmg3Bk6fphfTBXte9YRwP3q+XMD
bAZuEHLxCIseSKPHFPmnt09mSm5QUV6YBnicqpCGtsYl/vvjoQc090aybJKB4G9g
dRxXuTXw2eRCItNDnr7+TPlC/fHC+tRmrlOEkAo2X2cWKPQgV8U4wjp2xjudGg8B
2mlq+0gUbQoPYXQ3wBeycGG+9BFF6DsRQF+mk82CBMDFU/7/bW0zkH1sM+dZRUo0
q8uhNSrszXWqrSho+ASWAmJPBd4OCBIsb4HdKnIQ70JWQJc9Alv6PbVmBgR/hy1P
zEnXTbZww+hjoFhZyjnqebvYRt2JRVVeH99Ah85K+hiDt4cVZe+JbAuKf3nOjpeM
BWNZTIpZ9fOQ0v+7AsU8tNKEOxhgqYg3Bjc0s1Uyz1/swBUCMX5QtDYwu8aCajFT
NyqXmPqMfyyiE9xi2U/YI1nU2ZAQnBHkki6JvsVf4BJpacLpcFdPSPYvKQRoPpUg
wM/PuMbXP74ynyZ0fmoi+1i3GGzgNhCh+3Xeh581KAPaAKrRDCv11UkyRK28412C
81C9aGxb5JFvlbAO0dkQH+l/HV+Y4mDUIDkz8U3NgiB2X03vKTkqUVBzzN2eBp2Q
Qs6KBNoaU/0j1+O8Ch05ZzwipNGHME/QetccgqIdwX59PtIJTu+Y55eZ5wARAQAB
zSZQYXVsIEJhcmtlciA8cGF1bC5iYXJrZXJAc2FuY2xvdWQuY29tPsLBlAQTAQgA
PhYhBNLd/a4wAXr0y2KqlqZyVd/M5i7NBQJgsmXIAhsBBQkDwmcABQsJCAcCBhUK
CQgLAgQWAgMBAh4BAheAAAoJEKZyVd/M5i7NUtIQAJuhVQHLOchPYGop2NmHTdV+
xpEb40+UagAohD03CUtSvWoJ6Wk+Q3awJxDOD4k4fpwphsEjmyJJxpHtS3WWHP9J
yXGERdIJM4N2l0Dz7C6MwMhaQSMmccwQnBmSBYUCdFgjfB9j9ftMTxYyIXtTnZ+p
3WUG1ulwdgughhZMK06AMM+d+throF37DoLK0EMd+TxuHy9L8T9Lg/zNY6Tn32EH
z0Tv1u7dXw4f0Jgy4uD/JCavJVc/dqKub8JpVuabyzf4m19doByE9Wnaa0I7iJUb
U6m9LVA6q/1V9GJt2AIKu/3YoBlqEEA6O+4MHGnrnMOq6QiWPygTWR0Xl204Scej
x5JSNoKeoF2UjgDUoi++g4QBxWiY5F6gPK1tKeCeNmgPjyDKgEbuN3Wqbk+FaZWh
kR6b6sfTGYMOAVeFACAwbhnaSBmnViVnvSvIYiLcC0akjL7N1vrhYzg21pqCPa0z
lgWJ+G+3QMAd0j4Gsc0TW3u33vs7q4thisQtCk6w8HF3NziVVsRHcSKvSWWx+fq9
QyyvDgt2fr4snHARYxTCigWAYs4x92zSaNxlr98Rqq6YOaOD+tQkv6DR4r6xYUfD
uSlEySFsPvLT4fmGtZZEMNGM+6jyxQM5RV3Ry/u1kMJxEFyKQ3SPpaPAlKzWtT8u
gKkg+n/8z/yrm3RuWGdmzR5QYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj7C
wZcEEwEIAEECGwEFCQPCZwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQTS3f2u
MAF69MtiqpamclXfzOYuzQUCYLJl6gIZAQAKCRCmclXfzOYuzRHkD/0aETfOQ0XK
LneuqCMIroLBL/CRWirnLIiPuGzNjRJFufN2tZsJB29uwCC0vlxCvlkWeJv5K3cE
YVsf+3AFK7yMn2KqgWTB8l7PpOUv4mUevmNcszlpQ1Q2RowopAZXdEzsKOn5jt18
pLJxb4B9lw58B55x94e5WLhICCfpUgOmwds0OrqpGlucIwd3pJ9HogdIj1lPLLjY
3olKPTa2NVex/1ee2EzTwECvDpMtre6AAlcCRpUuPpdnMbrbFlbsqLNnf5f9Hj3h
3Y+5L698VPIzHTHA+RukS+io+3OOkNKo6qngaEkWV+6CcdM048gBQ7ATq51eXOCp
FTdxUPQZQOV3wBUE6n0omCCLTIvzggtCMjA0f4maR0YxSllVaM3H1pD0zGiSRyKH
Mae1rKFeCqryPQxth2Ma5wZtU8a6Lq+RPG2EJ7l/GVHhFOUh0pDriNc9IWH1wzIy
jE2ef/UwOCwEu+2cxMdu8GRWXIjceG5QIfOGJErbLK2uFA0FZBj5L/PnrZKzzImo
u2Oue4rIOL153n0LP937197E+pVKerbV0lifi7Shl2htBhHkU349cSYhHy8Kk9+B
lJH6AHXnLVtEdvjApZh2NOkJzzNupzM2JIS9Rgw1KRghsAUMFtEiVx9JSU+euka3
2dMbQ9NVDbKhqc1UMlXihdIRQArM9zDrO8LBdgQwAQgAIBYhBNLd/a4wAXr0y2Kq
lqZyVd/M5i7NBQJgu+FTAh0gAAoJEKZyVd/M5i7Ntd4QAOPRoUM4dt/leU9PIfBW
nAuKpHbXEouOHkwHhnHIdQf/I9N1CRbfXx2anSX5kBrHCg0ldf9iKmDkNY9Yz4wG
BYba3+vKlzW0J9Na0ffhNS1duN7oswBw1Egt/3sZMX8eRSjQz6CZ38T5/xBI8gxT
At0AbniX8vtGTFPjKvNrMiOEBXNQGFDELdhYddV+DJm2x0GMy88KU9Kd8N71HfoP
/4i1ulsBAb21dSUE6vWbWKqAlWebppQIUYuF+U/3Kd10EczmK/kczQh5iUuPFj/f
za+gM4x6XKWWWZboSH8pu2i2Dri/3T6M9rgFrboQDpkGXJxeNPVrIvljmAgN3Ek8
2yyWZwdyjFfqMp3h9bwTt+imEDbwTzrIfyqCj5RI658UbmM/lywT0+0usCHuxtwt
h5LeukLf1FEgWp6dtUU4SRSo95EirxZK/eoPdhOLhIykq8DFr58qOGzT7b8ukoRT
dZkHH4IbAq5PFrsBBQGvF3S5MmvgpWlfYqmWZ/pPTqEX7734VCsg50fxzqcOEhAk
7B5BrlOcoZFIYUQomvX2POBnesh+KoIz4mr6/cBpDIF4FSqlLzctsn11cnNO2iml
5QcYvcn4Z8bA13Gkeg1kGQrPLnyhI08FiJ6Fvr9e4R7uuGyjan4foYrPBlWKQ4Cq
rQb5V9/4OnKDpRvnLks5t6tkzRhwYXVsLmJhcmtlckBzYW5jbG91ZC5jb23CwXYE
MAEIACAWIQTS3f2uMAF69MtiqpamclXfzOYuzQUCYLJluQIdIAAKCRCmclXfzOYu
zZjdD/9uF00PZAkRKpRQ2f2SA9aJYGBnXK+UHXy2t6O7PodbmKfpk6Z212xNM5o3
X7ROBe2n0LIA0M6iUn70Y46gJP0pL8rwOqwDrnVnBl1X6DzrJapyQF1IAplB225A
09oDt4QF3Y9kaPgkdccsl/Ri1YOl5cVvrsOsFgECvDDH0KpgxA1gWXeM/WEOkUV7
Fm3MWDwSAqtfjOlsWFhK36s2e05pU4oaYEHawWenT6VPaM+U95q9EwvKtM1I+ccD
t+tD2pqhbT+roRP0xmTbyaAZzqQVWRw1mYjnCDzpkChqYdDBsiBGV8UpTlpGG5zn
Kh42oBQtkFO/niE5033WYuRLPX5oUTWrW/1EZ4q+J3psQzZPYJGjigY0aAlRa4Ro
/16CaENsZY0y3xvQ9/ipcbkePQZEVcNOU+0nVacbhbIjezp58eM1+BzxYQb326ps
ZmhEY7UChPg+3O7Kal1HBHchU2O0uVMlWTBML3y/tKg+blN1ycI4aM7IGmpRqvjw
Vz57pKae7MPFAKMMZjKdiyqk3o2aWdJCdP6ne/HT38TMo2p5rkH6ggTlXyv9x1hw
0E91REzAopHenLAbq9ZlgbF+wpueIjAc0ITdfAHGBV6j9cMl+x2CzAJJDSW2wlHx
EK/vho289fFyOMUgmdjjI3VnU/sQQF8mXNddWnEWpeCCOjYVUsLBlAQTAQgAPhYh
BNLd/a4wAXr0y2KqlqZyVd/M5i7NBQJgsmV/AhsBBQkDwmcABQsJCAcCBhUKCQgL
AgQWAgMBAh4BAheAAAoJEKZyVd/M5i7NCvoQAMQHiiQxcQOuGm9Cj39LjlF+f7Ip
v7jqv00bknS2VCLFDhgpaGNNKzctboTueDNMLE8jqZaHI2thcFbzDLq3dPxS/cdr
3aOeoujVsUQFnTGJ0+A3KwNMFdCCm6LMeqh6b9/F3UTjB+6KGFlMXZctn+sHBgBX
uFrOhHmvNCOCdndNKGbfv6yKRR/p3vtDn872+/ihVN6F2Kc36/V0TLXK7ikaysIt
PuEXwuaJXCkTFopC7eYC27fBwrtXhGnjAm0V/1SMj5F5+wj86qQnhqkcbXFA6tOQ
JGqrWrlKr3xZor3tWFNjCgTH7RNVsr0lMhhJ/FYkd2Ja9STbnXezKMsH4xPbeOem
vHPO6CJZHJVC0GMjMcpCLPZIo6nUoN/IEl8IyQb5p2VQm9bXCdyxKLTKL39LxR53
vFwVp/XnpOLOxHYMd3pBbZY26cLgX7l33QlBwLL09Q1kjEf4DUx/lliuaXZuKMz+
OVgIaKcclkCXnqI9ygsB1www0bBGjEWxVBcOyFkHHymhOvVj/dgWkuMzQtZjN/Xl
XyeDZNlPgDpllnt9QR0ifAZ5QwMnviKy0Q/tNeHr+CqmrU8hdXgURF23QCOEsB3U
KASNJ8Vq8owgUDKArZDGss/Pxmxx5RNVWX53V84fsxAu690PNMlrpvoxiYlwurhc
U4aiJWYKxHo7UHvlzjgEYLJmMRIKKwYBBAGXVQEFAQEHQCBkfWTRrnDtxJyb7zN7
P0AOUm8k7i/DtpAOuSG9QURHAwEIB8LBdgQYAQgAIBYhBNLd/a4wAXr0y2KqlqZy
Vd/M5i7NBQJgsmYxAhsMAAoJEKZyVd/M5i7NGlMQAJF1hu/JDYR1qs3vAzQL7Isw
uR0SltuRztwoEaIrzwiJ67N4bEAw2y9/qeQ2Sj4OWcUsobilTcTDbzxev3LdYC1W
JSe/iGFq96bIa+IHtJPEajH5vrBuWS7aFMR3OamufI6M5W8AiW6mfs3l42Ul6R+A
xDWl6y39PpuIN2Dw8lqETZc2dDEGkQdV7xzm+8XdoqtzTXSmFJm6yKpLpgGl86rI
deTgW3r6I5V3X8SYZdMUqm4yXR6DkFsxUE+311LO7s8riDr6wmwxnbaMNkuEXr15
VquoX9NMPKbYycFH27Njc1aOjDUyx5S77UJFlfGRcgwbIO8Shmn33R9T3KNXB50Q
dbfGd+4RH9kt9fCMrWokGv1fk37mo3zzsCnqHr00npHfRqeY+reJy11hBtKobZ28
/jT443Om+oZV2/8RuWKOCiP78HuJFVDkd5ef15b7pKQzfjqpUQ/kthTVL4xT58j4
rFw7CYpNplnzcfpNXClo3CR0mlKd3enlJXyE9+kyosYEsdDIFt6xIKGRwQd7cTXg
CkX3PZYmZFvqjhkPHtws58MuqdPNZFUfdpSprArTiLB8gvzvxF2ClVUfgBz14cJd
o4Yoq8zF503M3rT+jvbSXGDUGeJmiUfhJUe2Us+yRGekcohPBgcHVy1Tk3MKK8BL
107a7zFu8hEKwoUBCK3UzjMEYLJmRhYJKwYBBAHaRw8BAQdAxbVPmyT8k4mQRc3N
RzbbqM5JjRC4qjfWMdf0RJCjdEjCwe0EGAEIACAWIQTS3f2uMAF69MtiqpamclXf
zOYuzQUCYLJmRgIbAgCBCRCmclXfzOYuzXYgBBkWCAAdFiEEu5u609fgpLWN2BtT
2DdyHxL6G+oFAmCyZkYACgkQ2DdyHxL6G+rEcAEAq0hbgvDf5ncmKG/xvg6n+KMp
nSengVLgzyxqTy7LJ0kA/1r3CJy9Hrym+zSu9bCREpZfVrwlqs7To6pKoejxdegO
Nt0P/iF9Mu1KCP+WIGANjlQekDzAj7zwGxyyQqgNG6ku+BbgvlpymgNuZtspDv7q
E1Y90dwAqt16TAtNVFLwi6sw5/prf/4Bmfj7fKzR5MNdQEB/FJnRI85s4PkHpSTb
Q+oRsMFMFsLTlYb0QxGPNYm07chJFJxnn5Ra+XSxRMePIgFNz+RptvP7w2G6tVWa
oWPxT58c/KmI83FXUP5pIbtUSrlPfA2NLNNL9Hd+OzBsxcq8MJrs9DPTp18kPLKa
wA57OGQlQACRNBCVyLBkVksnLTBGnoTPkzzkghaOxK8SjWe/66YFm/D7/7SW54ll
uy4XF5o+/hiIZpjCN51Vs4oi348xQ02G1ck5ceDUKR8cvTBlqesijtYQgzSwTh4/
rOpTDf8tri+pdzro1WK6ASZ+27y4HRNOghWQGvCfrNJzjoOOus0wrYIkHi0eldek
c6pqx7s71jTg55hDDVNAXCJfb8DwK/+N6smFaxY8ZNcjnXsTvrPtUsQCNC9d0g/Q
DIUnSYZ4sDfIuwLiAqbjltWbLnqw8Aj+3/VNbeS7eXCnqZU5oA3fBr90jTYNChAr
1vz9G+WAwWtIJBRLdimjLZUVXShexRGcNDrvWgei5C+WfdDVnZQs38lg1BTpxQs/
4FRznBpU+D1I8+Mrw+QHR8vLPB2LQT+aKMI0pZc+mjrT9AYk
=3DsH2a
-----END PGP PUBLIC KEY BLOCK-----

--------------EurgNwo0ulKaj2grrOBICSbo--

--------------7FRgvGtxQg7DmAGmLhqBxUkh--

--------------08Cku0pJoW2xeQGBciZKBmKc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCY1k+1wUDAAAAAAAKCRDYN3IfEvob6ky4
AP9kuKW5WWP6OkcIGErOVE8Q+sAWQ2LZWgIG/mmyEI4A7wD9G09njcaeiEodl6+rGrX/bumy+rvH
85SJZ/dmxiydZAo=
=TRm6
-----END PGP SIGNATURE-----

--------------08Cku0pJoW2xeQGBciZKBmKc--

