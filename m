Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693A7C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 01:19:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14131.1680052752225494464
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Mar 2023 18:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gZ+ewNwa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=345263d112=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T0ebEK008846;
	Tue, 28 Mar 2023 18:19:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=mnt3eC18VKzALnZ/uuLAXP1hg2ARAwj3FImZ6+iD448=;
 b=gZ+ewNwagsAUtFkww79z81Iay6jLC0Je296OG9iE5wuvGPlYRikyLjb3x/5TNLOzEnhj
 Gqb3EeR7LIZmdiMbEmjk0IoGpaIcObX6zvEnw8mtnEIP4jlw7beXHpYCOAQGRRAzWJ38
 /OoTu1bGw0zxAlS7oNX1S7uFetknEJ9agTYEgo/fzi+ka7Mi0S0HI3KLbAFZudkQ1iMm
 UmwRlNAMmWpMKraoatD+bTpPEWA05oexN5bD0nCNpm/Nyf+agqlHckDsJIwcJTdafMFN
 HYf7CjmmumujdWs4+AyLy0MaLQ3OgzTlAGbGIN/Kr+rvPllxcFgbS4OIJkxEqYsp6GoI EA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85uy9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 18:19:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFmHPrvbAZPt1nMwezY6G2hPGMOKPpv5iRy6DF7fEtcRUQ89LqyL/V6/jw2+dlhKuhZD3EFcg+6kzM67Uvah2ZRp4aHOl/nF30v76j1PmaByEDFWzZw5izUE3lY2FodcPhNLeIWD3lnWxujyPsGrI6QDbS8bLrprHtS5OMoOx9gJqMTvwJP/c+1fkSzxFR/z/DNMnXyLsKCE87okmzzNM/qqX79gf6tAaQNhE1hBuAx7lGAy/Cbs0USCh+xjr63lGZP8fvCZKdJieEy3d9f1j86msB5IAR+5RbhIxnYImHn2dY2qCv3gaHRA3Y2iFl62+JIw+BBidum/VBGwFdUBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnt3eC18VKzALnZ/uuLAXP1hg2ARAwj3FImZ6+iD448=;
 b=n05EbnlE86Su6ybmD+DLUqxqo/whqvnIJ8yFndGuDFIWqB2Np0CoQeQT8GSNtAQPNzaylV/7Ew7DdLU1zE1cJSz7cwkKqRSoBUNiJnCARncxn4kliiVe92wmGsAdPdH3DtgrJUctSnHshnEUvMlG62bZbwQknz9/SWnWWrrBKcccrChJflAdVzwJUuuBVMw6TomAL/mEpnbavnw4K8OS2+/RM5R6vNB9ul/5GWeSBR63JS41cJmmXeGOKrfJefi0Qlu2JErvsESbYhbU0GEpiWujlX6khsdYDcIYPQ28CrZtEl/Kzb2Sixzg468LBzS5XFDcWN3P2fCweIMOarL/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 01:19:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6222.032; Wed, 29 Mar 2023
 01:19:03 +0000
Message-ID: <658cf00f-5e68-b192-310c-77400ce919f2@windriver.com>
Date: Wed, 29 Mar 2023 09:18:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti] [PATCH] mesa/mesa-gl: remove version from bbappend file
 name
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, Kai Kang <kai.kang@eng.windriver.com>
Cc: meta-ti@lists.yoctoproject.org
References: <20230328025621.15198-1-kai.kang@windriver.com>
 <20230328154559.GU18050@denix.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <20230328154559.GU18050@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::33)
 To MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba79c94-eec1-4396-2c8f-08db2ff394c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0C+4gl0svMtvRXU4OK25fali8b8rxBlBud3b7yWj6gCRk77LkUYNHVrg/xjuM9zM6sZy8yvWEmOkh0L5Bj9QPFoatAyuuHnnYX8tkUgp97ccPl2NO7Ob4IzCd8eaiz/On8wFknU7TeBUTJi09t7zQCC5dy4YT12hZr4jXlI46w4HjhFzYFHSIzBtVY9Wb/ofT5+V0F2T3fp3cgnY5zngoeRE0KBl8VTci7YkkJIlSbnBfWSr0OIhP16AkSp3Z7wReuxiseWBT4cpTw51UpT23YEjo6pXH8W3KC8SIvWgx5ziaKD0ZUrSaqekNG3rsDkUrY8bmtmBGVuERDVJ1cz/YJk6rZ8l7IEbwu6ADyDi2lEOCiPFJqScn8xHwcaIX60vS9KYNESFzX3JoO+t94fNB1T2PsOewONMOhqn3rpyxOBaIak9sna2idmnlQIR+LkO4MfGlNP2B0c6+GO9NtESBictbbUaHw4wwWBn9uPdkgcEQIZGPm8b1bWVnb4e/qLb6ctrtsJnYraEEX2lFy/zLH5Ga0WKsA/y7K0IdORg9si0XmFPJDhc6Ec93amnfVmrL+2eUdM8DbeGmS2dxglcLy6ZlK0IYW1NMhNTfvSG8JJf2eiKCP7ErP90rUH1jhwfc2yd3R/MMuf7olkS2H+PwP9xnHaDqxH7/6Nt/2csrSQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6059.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39850400004)(366004)(136003)(451199021)(83380400001)(478600001)(2906002)(38100700002)(66899021)(6486002)(966005)(31686004)(6506007)(6512007)(2616005)(31696002)(5660300002)(8936002)(110136005)(86362001)(316002)(6666004)(186003)(53546011)(26005)(41300700001)(66476007)(66946007)(4326008)(8676002)(66556008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LzYwV3NlWWk3eGN5OXpNQUxSR3ZkdkZrVlNaWjBFOTBjNjdwK0xtYUZ4YzNo?=
 =?utf-8?B?eFE4OGpPb09CZ0RRWmhSSnJKNVpRZE9Rby9ONlZDUit3djNOdFF3Ylg1ZjFC?=
 =?utf-8?B?MUI3RlEyRFVRc0RqQm1HaTZKbWJObnpwQTJNU0I1WG1HRGR1ZG93cW9Jd2l6?=
 =?utf-8?B?Y3o5NVExMStLYnlLVXg5MkoyS0RVU3RxQk5TSlhiSElUUGkxaEpxSnM4SDRY?=
 =?utf-8?B?cXp5K2dkcUg4NE40bzlrSTVkVkhPSXJtTUFxNGJrVnIwalRzM2ZhWUFWNFpo?=
 =?utf-8?B?Q1U2OEp3T2lxY0FwbFI0S0psNFI1L2FRYnFiZytDd1hkVkgrWWkzTW9qZGYv?=
 =?utf-8?B?SnpDcnljdE8yNzhDck91dERUc2l2UlV0ZUNEdW9Zek1KNTFMN2dKY1EwNjNj?=
 =?utf-8?B?emRzenlSUG4yNzZYTVd6RXRjYk5yYmE3cmxqNzN5SDI5RDBsYU1pTXNFMzRo?=
 =?utf-8?B?RG9ESHFNMk1WV0piRDRWRXp6cm9WVEhIZENTSDAwbjJTaXNaaUxFckRnWlk0?=
 =?utf-8?B?NXZidThOZHVzRzJBS21QenhwZXlEeVBnc1Zsd2o4WExuRjA1ZTZBTGtwemw5?=
 =?utf-8?B?MHBKYWZoYmM2TENzVHZSdHdQMVFXTlVPdmp0M2psclRSOVRibjZUOFIvUkR6?=
 =?utf-8?B?cUJ0NDVraDk1MHBuZUNPajNkSkEzdG5OakdEY2dENnR0cmYvZTZGYWVJK1lj?=
 =?utf-8?B?bXprVWdBNFFKalpqdzVQWHNUNnEweWlqOEthWTZKTEZxdzhzcDVSQ0kxTmFy?=
 =?utf-8?B?TytOM3hLNXVpcEZXUFJXSE1KYXMrTmRZcWFZWXdmS29XM2FuMnhZNlcySnFl?=
 =?utf-8?B?Z2FnVno3L1dsRXFpUUNtUUROVWJjTzA4aXo3VUo5dnViVElvL2JvK1hmd0xZ?=
 =?utf-8?B?WUVQZjM3TmtSSlBKdjBMdHVQdVhmTWRudEM4K0NzdFBMTTg2ZHpYSExlQVM2?=
 =?utf-8?B?aW1Tc01MZUY4ai9VUkxRb0NTOGlPMU9qSGdXRkZjaWVKSDJ1NWVrWTlpcjV0?=
 =?utf-8?B?UGcvL3c0K2JHNGZDRHEvMEdoMmF0d1N1UWwybW1mZDA0enJRWXZPVERDOTdp?=
 =?utf-8?B?em5QYUM3U0dsT3R3bHZsNSt3bTlVTytLd2VXMU40K0JtOVRlbFk1ZVErQTZ5?=
 =?utf-8?B?Z1RDVWE0dUJzeDFmakNIVGF0RE5VWW1mTVZRL2pwYkZxY2JOOCtqMVNKUzVT?=
 =?utf-8?B?RDhSemkzZXFvUmpvUGZBQjBQc1N4QUVXei9DREUxVytKdTl4cU93NWxxUitk?=
 =?utf-8?B?eHkrcU1VSzNSUWJSQ0ZDaUw2Y0kyelVhR1daY1hidkNVNm05SWczVjRqR3Fm?=
 =?utf-8?B?NkF4NmNzbkVSMXMzbiswSDBJbVRiNmtxMXpLb054Y3NJaGxja2FIT2ErV21n?=
 =?utf-8?B?YXpVaUhROTU3ekNZekd5ekI3VUgwd0Y2ZmdRbjlqdFNoYWVrY1lkUzIxOXNr?=
 =?utf-8?B?LzgrV3VkTGpBOUloVjBNLzh0blg2VXpwYTNzY2RjbkZTS1FOUjZBdjlHd1h1?=
 =?utf-8?B?a0svL1dsbVhNdVZJOWxvUnVURXVzT2J6OWltbWNwNzVWSm00dVFQTlB2YXZm?=
 =?utf-8?B?VzkwZjBEQWhaSG51cEtKeEVxWmFqc3owQlFLeU1GS0liSFlYa3A1MTRSeXQ3?=
 =?utf-8?B?MmowTTliN3NhcmMvRTZSVC9jZVloSHdxODR3elEwNWRyNHljV3ZwK1lRNXpQ?=
 =?utf-8?B?TVNIMStmVG04L2NrUGxCaXRrczZ1TEl1YlR2TjI2clVmL3NvY0R3YmV2M1JT?=
 =?utf-8?B?ODBGaHVFSnJXMG4vLzJuTmNhekRVdVFMZytoTlNCRWNudUdPUDU5Q0JtTkpO?=
 =?utf-8?B?c1ZRU25VUjZSMGJoUmFCa0VnSUF6L2lIYVFPbzA5MmZNcmQxL0VqbU1rVWxm?=
 =?utf-8?B?M3dCN0JaWllWa2cvdTl3OGtldHV5b3FZeE1RSk9yM1VrV0JTM0lzVm1DWWdy?=
 =?utf-8?B?dGJORXdxUEY1eFNKSmtNcFBKMWdWRGE0a0ZKc2taWThRUGxyOHFxVGUwMWtU?=
 =?utf-8?B?dVl0dm1wQmJmZE5ucEMyV1JJMklqOW4wbWFRRHBJMXZLZFh4cHY1TGkxV0wz?=
 =?utf-8?B?Z2x5MjNhUnV1b2wycHdVcWxNSm1RT2dDUUZDTWxhNmsrRFJ2MllUcWFuQUgz?=
 =?utf-8?Q?2hhxgjC6BtEuSz3bc/Zb/mCGT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba79c94-eec1-4396-2c8f-08db2ff394c8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 01:19:02.4907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+tQ8mDWF6iWaWfmiMv7qwiEb8jhxMnClxfwBNqfJlDGgINKfcnOBkn8MhxYUFQ5aBovUJXEn0L6sCpiCBpI7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
X-Proofpoint-GUID: K9q-Kkf3AO7PwcBMyARxlAtaA5r2usjC
X-Proofpoint-ORIG-GUID: K9q-Kkf3AO7PwcBMyARxlAtaA5r2usjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1011 mlxlogscore=794 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290008
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Mar 2023 01:19:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16251

On 3/28/23 23:45, Denys Dmytriyenko wrote:
> NAK
>
> 1. https://patchwork.yoctoproject.org/project/ti/patch/20230327170809.2115712-1-theodore_roth@trimble.com/
>
>
> On Tue, Mar 28, 2023 at 10:56:21AM +0800, Kai Kang wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Remove version from mesa/mesa-gl bbappend file names that no need to
>> rename them when mesa update.
>>
>> Issue: LINUXEXEC-26101
> 2. Unknown tag
>
>
>> (LOCAL REV: NOT UPSTREAM) - Send to meta-ti on 20230328
> 3. Seems inappropriate here
Sorry for the noise that I forgot to clean 2 & 3.
>
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../mesa/{mesa-gl_22.%.bbappend => mesa-gl_%.bbappend}            | 0
>>   .../recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_%.bbappend} | 0
>>   2 files changed, 0 insertions(+), 0 deletions(-)
>>   rename meta-ti-bsp/recipes-graphics/mesa/{mesa-gl_22.%.bbappend => mesa-gl_%.bbappend} (100%)
>>   rename meta-ti-bsp/recipes-graphics/mesa/{mesa_22.%.bbappend => mesa_%.bbappend} (100%)
> 4. PowerVR changes are definitely not version agnostic!

OK.

Regards,
Kai

>
>
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa-gl_%.bbappend
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.%.bbappend
>> rename to meta-ti-bsp/recipes-graphics/mesa/mesa-gl_%.bbappend
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend b/meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
>> similarity index 100%
>> rename from meta-ti-bsp/recipes-graphics/mesa/mesa_22.%.bbappend
>> rename to meta-ti-bsp/recipes-graphics/mesa/mesa_%.bbappend
>> -- 
>> 2.17.1
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16249): https://lists.yoctoproject.org/g/meta-ti/message/16249
>> Mute This Topic: https://lists.yoctoproject.org/mt/97898091/3616933
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/12166737/3616933/1349768870/xyzzy [kai.kang@eng.windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Kai Kang
Wind River Linux


