Return-Path: <w.egorov@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950F9F3C27D
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 09:49:26 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36370.1773136160582193611
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 02:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=cW9E37Pg;
 spf=pass (domain: phytec.de, ip: 52.101.83.83, mailfrom: w.egorov@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUvvcCzmAxzxJYq2tYBTp7ob8N8FLOTH/3stdSI+l/gsZ8iR3h1xuWxfS3QluaLRIokhbAEL8wqxJqVxOQy/RrWoVtOyzq6//oF9NXT+dUbQDgykzKD8wnoLYI+S5m1Hpy4wq7T3dIo498HTpWUlikUpf/xu6T2lAYQ8iMnjV8FO3+NlDDhlxCXv24cGHz7dZPjKIIXJQfumpl1P0QazPwLIcplb/827aMjR2MuTMg/GoWHEqQTdbVhEkI2pwvYYxLW3NGF7QLAqvBbMKMxNx22rWZ+St3N7IK4t8cBTviZn5P60CnWqsOU7ORphDPFlB9Kxtv4E5G74k99mvhGtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fSQqM39bevF+IYiEyv9xK19EBAQxVMUBa49lN+Sj9k=;
 b=kDGVWajmBNdBKcx7CK6HbKZL8mP9E/5haODTdf8GHdJM1iugzH8pPXn+qcKZfhQ9gzsTFsaYmx2bzkUFuNjgYAewO97b7gi/+Am+Fc9XGZ1/zZK+RnTljYFaGuiYi3BBDycBLoWZfspEfN/xN1+304uGeVR3LIYUOXoKpPyNxBjUM1PfuEgAdzuNl0HGzOj1frnNoA5nfbfpYyHVUIf/VtHIwTa/xkANP7JylX7tdm9lHOYJKXp3cohp6hirwLmkCLYYtjTFSV1/nSwkJKGVEM+7PLkSwrM9gb/9YfDLoVDQ/V2mB6EEuaZ4K6/oe9IxAYZe7UZahPVwFftoE0wkGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fSQqM39bevF+IYiEyv9xK19EBAQxVMUBa49lN+Sj9k=;
 b=cW9E37PgoLr8+lHtx4uqNF/zmJTVK5D/2NVWhqxAJ58yg+KEfX1CGgDcyhUD7+92WYpsEHZmrbGWMwPlYjZKgErtEMSX8FPPrvJVzRa6Uwcvhk+8ecou4RRm/6YJckWlV8i7ukwIdqnpviIsplluhg57xtvrYcqXEhLY1KnTL20pi9VUjIYVkO+ewfkwPPjb0FVs4uAIZByT/dsuJ2Kn48vlWe8UuXxXe4rRPhlTAos1LQxWE2K9FqQ/AZqbe3Uqfs9iKERqRXd6boZN16O+GEF67kjyps9hblTDgxBn8hQVyFNgcHoO2o/0oI3awPbrwd0e03e2aU9Oq2g07gSGjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by AS4P195MB1549.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 09:49:15 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 09:49:15 +0000
Message-ID: <3bd1e7cb-f438-4aa9-99cf-52430b758eea@phytec.de>
Date: Tue, 10 Mar 2026 10:49:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [scarthgap] meta-ti-bsp: ti-img-rogue-driver: Avoid
 TMPDIR in debug paths
To: meta-ti@lists.yoctoproject.org
Cc: reatmon@ti.com, denys@konsulko.com
References: <1894FF9E1031E4F3.219417@lists.yoctoproject.org>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <1894FF9E1031E4F3.219417@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|AS4P195MB1549:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fb534f-250d-460a-bc0a-08de7e8a4a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	xpF/Pafq9C/16mu5jyDmL8F39mSMX9WiNIxpMJTSzI+J2yWOUGuiFCV7No0zjYlNk0mHadfPQ//7aLA16Tf7EJXXeAxE+jGsqcN+UTrhfgcOG3O+KbFavi4RwIZWhaPHE77ceWPoWKbya0QZoByYHufZAHkEH0fabZaNneGTBMTMGs6g12bhCXQJG03z0jFzT+V8ly4nSfgLl88aKgi7WEREab0jFAF+4s5KQqJzIAlYqf3ml4d5koJ7QDdmm/e36OKqwqv80kj8ihJoyKc7a/RpI1UI0mG680kxn+7umYhDkwv9GuYFPDZ42YZ785wXzNI3eOzIHvioNWqfJGHT1sfKGb7BULhChriUFAK3QnpHS9Rzs39HXFAsWcQsGkn2mZWILY7c/6W6aEKpMVsl05AbnRjEQ815J1xWBPlGZdvMZ1s5nYK464CPa5mcbaf+3p0tfcGFQrFHKGQZap43uEbusf0hRdU3w9lk5DlqWn0PBYMdISC1zC0GXnLF2aPifIneENvJblJ4Y8f+Ez4ANUlqffHOwBQQLegTI8/ex+Kn05ANwcPVQ5DC13aMA63HHUV/0LhIpCjFG5Y53LR6lkzChppotd7+B5uJpiCdt+JeSNVamV45T10islU7Pfunsd6CVIhBkR/lrTOIAy747wUPlMYjKnGtu0kqHhR/szfn9hP5boyOQKeapJBRGSg1iLrdY28nC80A5H6PYHHok3exUhFCjQo/yId+rYsku9o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2s3QVFrMzJaNU5yZTBKNjVXdFYxdkZpbklQdFlqVU5rL2F6NzA0eGxmc2VZ?=
 =?utf-8?B?aEE1c1puUUZVRXp0THV4aitpQmFtdFAwNzE5VE9FWndNczQwTzRDVUdxdlI2?=
 =?utf-8?B?Vk5xd1RoZ1RRTTdLbWRwSGVTNUU5ZEZDYmpIZlVNQVRpem1DMC9CUUdkTE5i?=
 =?utf-8?B?dFJZb2VUY01QQXpEdy9lRXlHVkpJUmpsWkFzR3dMOU9YLytRMm1vbDBkWWo4?=
 =?utf-8?B?RFcvYy9yL3BvQzg1U1lLTzNBY1hTWWF1UHlZajM1bmtCQU1ydDFrVEROaUt5?=
 =?utf-8?B?MkVtRXpINCswS09wOHJQakZFbzdSTzhhWFMvU055Z2hLVmFsSHZqdUhOS2Jz?=
 =?utf-8?B?Zmw4YmZJVDJ0VTZwbzBxMmQrZndwUFJLd0xTYkl1TCtFcHdTc1diTFMzQnFO?=
 =?utf-8?B?Z2IrUzJOaGNaUnhmNmlWVjV2NG1LMUdYd09Ob1lHZ2orUFJRQkZzb256a0Fj?=
 =?utf-8?B?MjVRbFJybUU0amRIUGs0dWNsOU94V09PZGJaYUhWV2U5NnRDRlkzNjNwRVZY?=
 =?utf-8?B?bWFlY282YVF4bmM3dnhZYURkT08rdFpZWTFYUy9EOGVYem50YjJueUtONnIy?=
 =?utf-8?B?eHJPWnl5b0ZSUHE2ekh4VzhkVmg3YjQraENHS0ZzL3B3d0hNRVhoT2V5QmlT?=
 =?utf-8?B?ZjNrcFNPZ3VaUGk5ekRoZHczc2p2b1M5alFzMEF6WVpRY2xaa1pFVlpXSTIy?=
 =?utf-8?B?WWxqMVFZc0hUWnpKc2VaeU8zSVlybjk3THRLTWs4bTJ6KzAwMnhoMHlCUHMy?=
 =?utf-8?B?WnpaK1JuVUlreFp4QnpGdVZybk9RdXVZR096ckVYelA2Ymh2VUlXQ0dYaGFG?=
 =?utf-8?B?Y3Rja2tqS1Z2K0VnalY2YTZXMVcyQ095U3NSaVA2WEJZUVMySzZhaXZvRDho?=
 =?utf-8?B?NnQwWU8veHdiNENYT1FGSXNVUGxJaURBYXBWOHE3Wk1IVUtRQ0sycXg3QzUv?=
 =?utf-8?B?Ym1MWFFBWXBUZDltRk1BdXd1b1Q4SVg0dVRjaDVYMHZoRHRzL2VJc0ovR0xw?=
 =?utf-8?B?K3BuTUNBV1ZUQnAyOHo0dlltZmlEbk1aWHRYODlvTzgwUklmYy9hdEdGWEVv?=
 =?utf-8?B?ZjJscVBSYUNuS3NFQWkyQUdOaVNhOFh0WlVqanprNjRSTzNNMHE1anFVblNv?=
 =?utf-8?B?TDBWY0ZJM3JrUURZUUIvT2V2akNvaUovMnlkdVFVSkdTOTJvV2pGalhkaXVN?=
 =?utf-8?B?aDlTVTluR09kZ3Qwb2pJL1pWUUdDZjdKTVNxNC9sNGh5c05tM3RuT0FLZnZ3?=
 =?utf-8?B?emlLU0g4QW9wNzNsMy9CeTZaRGNBcmgwUkd4dTRvS3ROQU8zWWFiNFgrOTln?=
 =?utf-8?B?SGNhR1ZidUc1Szd0eERGSDRXSmtWRzVGS1lPSTA3YnpMRFN2WnNIUlhYR01y?=
 =?utf-8?B?WHJvZXdkOVpicHRZRE56NkJmRzV6QVdLK0Q2VFBMMGZ3WC81RUVCSUQweUFG?=
 =?utf-8?B?NkthVUtVOFNESDJZMzVDbVBCUEJLb3pvOTFCSExwVXkwSS9VbVZHakJJV1Rk?=
 =?utf-8?B?bVRrazFNQ1prTXhXTkoyVk9UQ0l3NE00V3dHNlFyVGhrQVlCdTgxQzRKeWZp?=
 =?utf-8?B?d2lOZXhjZnRqeUJkbTJuSlJJcnhHWndGZWs0VS8rWXlOb1c4WnR3ZHBVN1Zy?=
 =?utf-8?B?VU00ODQyRHlFNWN3M09ESnB2ZGl5RlJJbnBGanpJSmJrNGJVU1Nzb1BMTWRZ?=
 =?utf-8?B?TlhqUWRCZXpwbGFyNHlpV21iN25veER6enhoVlZuK1c3Q1NpV01yR0JMb0pw?=
 =?utf-8?B?ekNWRURxbDQ1RW94SzRNVlpyVzE1TkFXVmNYRktCN1g5YTh4bUxLNlYybW9Z?=
 =?utf-8?B?NStRaHR6WTBqK1VxVWFXS0RMVTdTL0pqK3NNMFZubjdCeHBITjVpVlJRUUxY?=
 =?utf-8?B?ZDV6eGZVdDVheFlzcVVHQkRYTzE4TzNtcUd2WCtsdFpBUllKM0Y1Y0xMUDdo?=
 =?utf-8?B?V2dqakFmZ2hGL1VJbTFkUUF3SEJMZFUrNXRXRGs4MGpoaC8wakdTZ1dTcXpy?=
 =?utf-8?B?dzNuRVoxcHNhcVlXUU5Tc3AzcVowQjV6c1Y3VnhnNkd4TkhNUEZQKzV0dWl4?=
 =?utf-8?B?bmdWZkp1Sk5vTllsWjhKamdRYytkMzNJQTZyQVpxTTcvVThVQ3U0OGZyUjNz?=
 =?utf-8?B?UnQvSEphZ0dINUh5QlhYSitUZzdCTFgzbm5GTnBWcWQ0RnBvRDJVaHZHREN6?=
 =?utf-8?B?cWl6NzJSMStKNFJmMlF2VHdQRGVBNHJPc2NYWElFRWc4RVgrQnZTWHJVVmJV?=
 =?utf-8?B?ZXM5ZTlUWk50L1BpcUZhZTJ3NFUyL0o1ZlhraTB2Q0xwMW5IMWpVM1hJbFBR?=
 =?utf-8?B?TDYvTjJTeUZxcDVCaHlaMCtqZVdmL250YlcvTmxhMVR1L250WFJqeGVOVUtE?=
 =?utf-8?Q?ysVKx9gzBLQLfnO+4zb/ZF26v+Zd0GMiopErzZQmsjYPe?=
X-MS-Exchange-AntiSpam-MessageData-1: MFhZ3FYi3g1Lkg==
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fb534f-250d-460a-bc0a-08de7e8a4a94
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:49:15.6574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxoZ9/dunqj3a96/B6s8ARJg1yIo4mkXv+cQ+yHrGyjtHZrsr6gYrlDMMJNPgaTykyeezlDjJIZPgtmf6SigOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1549
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Mar 2026 09:49:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19688



On 2/17/26 10:46 AM, Wadim Egorov via lists.yoctoproject.org wrote:
> Build module with KBUILD_OUTPUT to avoid TMPDIR in debug info
> (buildpaths QA). Also bump SRCREV to include upstream path/prefix-map fixes.
> 
> Fixes the following warning:
> 
> WARNING: ti-img-rogue-driver-25.2.6850647-r0 do_package_qa: QA Issue: File /usr/lib/modules/6.12.57-g7af20799-g7af207992070/updates/.debug/pvrsrvkm.ko in package ti-img-rogue-driver-dbg contains reference to TMPDIR [buildpaths]
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>


Anything missing for this patch to be applied on scarthgap?


