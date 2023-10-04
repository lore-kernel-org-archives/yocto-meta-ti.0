Return-Path: <ggiordano@phytec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86731E7C4D4
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 15:41:14 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.51])
 by mx.groups.io with SMTP id smtpd.web11.21863.1696434069860361309
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Oct 2023 08:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@PHYTEC.onmicrosoft.com header.s=selector2-PHYTEC-onmicrosoft-com header.b=I75oCKBe;
 spf=pass (domain: phytec.com, ip: 40.107.223.51, mailfrom: ggiordano@phytec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE+Tviamtm8ZzhkczbRf/ng3NiR7983nrDAHTh1azMqvS/wAb+aX5AvRcC/Ze818XVwSmStFFXG48e00QBHE3MKz1VXHhbmbtvYV4wZz/tNdpGK/AWURmuEd1dUhBZM4zebSfNL2WiwVUNoOZPlhgSzQaOtnk93K+FSNZoFlClgILUMzIlGHB+976D0Mxqa0TtNiJ099FKTpo+qjjs8BCGefX83oDDn9SfzrtoOe3fhoommIr5ntFZ9muG+lqu5UFLHP1LZCfuX+QeK2cjnf8stlJbvY6zZwoC2eFFpJyNUZG4FJewvj1D0e7hWU6sIl1E9n+bT7JyHttJWJ9VJmcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHgPbKcLxu3cF5VLEGHE3i0iVB5NZT+fjfjB15PW92A=;
 b=fGoz9SdNuvuuV9xllvG3wqj9j9KRbnt2c0knc+sKYsJiQE1YnPfLYcljduRZicQkyLdjICFvbUjy4Wm9YXUbzL25JzuDBKpEfEcj7FrVWES0hYZWq8YjN98sZ1VVVYuDj/s/QBBbT4uLD9sP+a6Kk3VP2oGsL1JS2lhUJqTiQve7CaMwzqW/Nkosb9am0txxGMpqYZ/BLhKBp109N3E/lA97D34gs4NpgV4qoJTJzsWFKcHZjMM0NqwP8AVSc5w3uJxSjyyGZ112KaISwXhVISGxhZOqE8uMS+WsmR7UcF0tIUZUMubYXDUlfMXigrJdNx7kC75JbsopI/cqZuHbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.com; dmarc=pass action=none header.from=phytec.com;
 dkim=pass header.d=phytec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=PHYTEC.onmicrosoft.com; s=selector2-PHYTEC-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHgPbKcLxu3cF5VLEGHE3i0iVB5NZT+fjfjB15PW92A=;
 b=I75oCKBe1O55t+QRnMWCjcoQwMLdnlL4F/uo8VkL5KdycLFN/iybU/OeaGZngvyQR5HTDix241ErNNVQW7Oms2KjLVvOWl/kIT4Je7JYuqV1EYDMMFvkGjyYExJlyZlg7lmINLJjau1iX+huF77tNw4t0Yj0V7J1GwF7qLZXH2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.com;
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com (2603:10b6:a03:537::8)
 by MN2PR22MB1853.namprd22.prod.outlook.com (2603:10b6:208:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Wed, 4 Oct
 2023 15:41:06 +0000
Received: from SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::295f:d4aa:af24:fd8e]) by SJ2PR22MB4354.namprd22.prod.outlook.com
 ([fe80::295f:d4aa:af24:fd8e%2]) with mapi id 15.20.6838.028; Wed, 4 Oct 2023
 15:41:05 +0000
Message-ID: <c66c7388-8336-56c9-8626-cab7cbe7ac7a@phytec.com>
Date: Wed, 4 Oct 2023 08:41:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH] machine:k3r5:Handle
 UBOOT_CONFIG for multiple R5 defconfigs
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
References: <20231002211616.4103160-1-ggiordano@phytec.com>
 <20231003130144.GA26382@denix.org>
From: Garrett Giordano <ggiordano@phytec.com>
In-Reply-To: <20231003130144.GA26382@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0309.namprd04.prod.outlook.com
 (2603:10b6:303:82::14) To SJ2PR22MB4354.namprd22.prod.outlook.com
 (2603:10b6:a03:537::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR22MB4354:EE_|MN2PR22MB1853:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bba856-023f-4d0f-560a-08dbc4f05270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vrBmCKRhEnj07+BymbsSIoAhvO7vms372DAxiezfrYcygxT/EQiwe7hMPedLqCq3v6gvAt+jF0DW27BAZa0FZphr88OUaqyHUGkgElIG72bHsR7L4wv0BHR71fDpsqICWoVphNgf8g1Mj0rfUSsMOItnstaD7P0IXb2K9u09SCyHgTtDUTMvbmbbKBBwzp13c/7FHZI5vCkb/3m4IjozlUS216UNT8rimaCcZSJkka4NAm7DZdHHJq1t6VFRGALaAQ/4ok2mDeNq7O/wOkKe4jN/xO4pgF5Hh8XCSR/z6p5OiU4p8qk4Rx7AGfTbV9zgKPQ9/Km6qC50Nx0HVK/sZuG0uwTTKQmMxe1zMdaIZ9HfzKoZMwewXHaRTinDjsaWwqojiszB8Zlqf+cxVKS0MGZFgBdd3/DUnfXzBLXzJ4T0NG6Io4ophMHpcN45RN4SA6TLDERvywu77t122M1CBrYhPvPF7BeYRX3v8suLQt3CG+hJjnRpqPfp/3inDw++CKQyEIzhLan0acFRwLzCLyOEbYRcK2fReKJ/A38BD8AvxKI9ndv3IVMuhRD+J2iGX/Q1ppokx5cxiylMEvUthnaWMeFpc63A2aqEeEGE0odCM4Igo1EYAkY60/bDwmjbY646+ft9mIlI7BfhQPHm8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR22MB4354.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(346002)(376002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(2906002)(31686004)(4326008)(5660300002)(66946007)(8676002)(6916009)(41300700001)(66476007)(66556008)(8936002)(6486002)(478600001)(966005)(6506007)(6512007)(53546011)(316002)(2616005)(83380400001)(38100700002)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXpaUzJOVi9hZ1NZc1NHUWxyVXIvSTluWmlrdm5yTVlheVJjZ1JzRCtvT0dz?=
 =?utf-8?B?aE1mYW9ZekxFelBDTWlTQjkwTmtwRkg5c0FhcWdYZTR2ZHY1enNRNnJwcnBw?=
 =?utf-8?B?aW1yZXhJYys0aDNWNnAwaFFNZ3FWaFE3aGtGcGQvVXpoSTIzTXEvOFgrYVox?=
 =?utf-8?B?YnBobmV4NHhSK3M1TE5OcFJwS09SWDhQM3BwS0xXS21mK3VFdENGVzNQNU5M?=
 =?utf-8?B?ZGFxbGhoY0hMWTJIVkdibTdYbHA1WnpHa0I4ZWFrSkRMUndYNzRFelVCdEVC?=
 =?utf-8?B?QUpqQjZlbytRVHB1TktnUDBBb1JJajFJaFdaMGdOaGZhT3U5UWdmdzhvby9h?=
 =?utf-8?B?ZEpzdWx3ZFNkSk9RL1FUQmFSa1pjYWt5bHdFUUtHRGtWaDNnOUlhN2ZTMmh2?=
 =?utf-8?B?SjdJN1RRSFFaN01HYnBta0VYeU1CYjg4MVdoR3Y5Wm5GMTVpcXhNQkFGWG56?=
 =?utf-8?B?ZmpZbHQxekZocDdNckNxZStSUVZkbGFOZk0zb21mWThLb3FaTEtDNnliSEhw?=
 =?utf-8?B?dmd2RzRyaGpJckRCZnZlVnZ5UjdTWDIvSlRHQ1BpL2VGRzZNRU9UajcrUUxp?=
 =?utf-8?B?L3llcDNIN204RHpoNDNkU0FYcnNYQkd1UnJxcDhHeVlYTmxyazZ2OFZFRWxI?=
 =?utf-8?B?eG9mc2JZU054amNpREVScVo2NlYrTU5aekdUdEJyQThkVWkxTHZEZlhKU0ZE?=
 =?utf-8?B?dDBUMWoyRDlCbHlmaVl4djhoOWg3RjJkbzAwVDJ5RTlmNnBGNGNmR2NNWC9p?=
 =?utf-8?B?ZFRpM0lVV3htcTYyeDR3Vkwxdk5GVG1IQ0tIbW83eVlMdVFRM05HcXJpbHJT?=
 =?utf-8?B?Um91djlSbjExejVUUjhYeGN5SXY0Z2FZSDVOSmk1UTlwVU9ZWXQ2T2FEQVE4?=
 =?utf-8?B?OGlHRDhTbnVxSU9nOGdKWjl5aXJPSzZOaUs0YlFMOWd0VVVDRERzWlRCZnln?=
 =?utf-8?B?WnhEallTTFhlaU5kZE9lWXZUc2Q5NWEzNmxMbU9IdVhCTTZFWnZkUWx6UTVW?=
 =?utf-8?B?QStneFVpempqLzBKN2ZWNlBXbWs5NU5Wd2h4NkNPVmpqbWY2eUhaTnNXM1l6?=
 =?utf-8?B?UUErOGFYMjd3M0ttZTYxZkx4ZldnaXhpemJmNnN0Y2JqNVBFQU0rWG9CWmR0?=
 =?utf-8?B?ZWtEY1Btd2ExTnUvTno2ZkN6U25YUzAzVHZ4S3V5R29CMzRxUk92NThLcEw1?=
 =?utf-8?B?LzJvcElPMi9GN2E4SFlIY0VqaWpKc05IK2hJR1hPR1VoSXpTNWZ4SnJja1Fs?=
 =?utf-8?B?VW5KN1FuWUczaVAvUGpoR0pvOWpqcGo3Z1pOK2JxMHdLMms0V2NJRDJtTlJl?=
 =?utf-8?B?bWU5QkFjMFcxVVRyUnVITDA5NlBtK1BhdUZjeUs5OURtU0VKTTBETDUvTUpN?=
 =?utf-8?B?ZHNxQ0NpL3c2NXA4UHlKOWFTYU81ZUtaK3JXVFcrWWxPelpCM0JrSlNEOWlz?=
 =?utf-8?B?UmJsTnBYUHRQRmxLd2pYKzR5Z0N3SlVSdVU4UWhpZGRpcTZ1WWRLaVRPL3ln?=
 =?utf-8?B?MHp1RDhQOGFQNEZlWlN6NXpLQnQ1RE5MZXZxRmJYZXF6SkhZRVpMd2dSSm5K?=
 =?utf-8?B?eFk3RHZuQ2FpTGNKN2gyNmNOMVFpMkVyM2pWUHNNOUc5STNrU004cTQwcWtn?=
 =?utf-8?B?ZEpGZjVQK3djemVlMGY2bnY1aXlGS1U4QWUyd1h3RWQ4K1JZU2luWWtEZEho?=
 =?utf-8?B?SXJXMFZLZE5LVDJLaWE3N3BkM1ZTbVFiM2t0V2daU3RSOEhQYnFaZlJINWox?=
 =?utf-8?B?aW1PV0ZTMk5XTEwrU2F2VU1zUHZ0dVhaMFhBd2RJeFBsMXRqaG9iaERJS0M0?=
 =?utf-8?B?dWp5emU2OVFYSHJwRlk5NXVKWVNJZTBpWWt3cnZSbm9Nb20rbWF2STB6NHBR?=
 =?utf-8?B?dzI3Z2gxaGxGNktaUXlpRWlQNnZFVVR6Tm5JVnpWcnZJb0Yvck5kVHUrVG1U?=
 =?utf-8?B?VjdSVEhmVlMzcHpwMG5hbG5mZGkvdnZCT1M1SmRadGh2cmVvUEtpNTJXaUU1?=
 =?utf-8?B?MTJNZi9OdmlHU0hwS1JXWlNaaWxVZDhtWm9aQVdRTlV2WWRjMTJpdzF2QXEw?=
 =?utf-8?B?YmFZYTl2bVJCSWkxWWlKMHpsN1JXRHlYQ3Z0RWt1QVVGbjY5VFg4QS8xbE9T?=
 =?utf-8?Q?3A37GZoWPe1Lyy34FgNx8Chjg?=
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bba856-023f-4d0f-560a-08dbc4f05270
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR22MB4354.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 15:41:05.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 67bcab1a-5db0-4ee8-86f4-1533d0b4b5c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NoOdsLsSs2njFG99IJTDHdbF6vRAD3L76puXfwsYfH1/b0Of1n+hvWZMAeJSmEiZjnDV1d/cJrwmG7ShkDfqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR22MB1853
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Oct 2023 15:41:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17051


On 10/3/23 06:01, Denys Dmytriyenko wrote:
> The prefix in the Subject indicates the area being changed, so should
> rather be u-boot: instead of machine:k3r5:
Thanks, understood.
> On Mon, Oct 02, 2023 at 02:16:16PM -0700, Garrett Giordano wrote:
>> From: Garrett Giordano <ggiordano@phytec.com>
>>
>> Currently the do_compile step fails if we try to implement UBOOT_CONFIG
>> in an attempt to build U-Boot with multiple R5 defconfigs.
>>
>> This commit adds a condition to handle linking the UBOOT_BINARY if
>> UBOOT_CONFIG is used in place of UBOOT_MACHINE.
> Are you sure you don't need any corresponding changes in do_install
> and do_deploy to handle UBOOT_CONFIG for k3r5? Have you tested that
> all binaries and symlinks are being installed and deployed properly
> from ${B}/${config} location?
>
> And I've already mentioned this before, but UBOOT_CONFIG won't work
> with recently introduced UBOOT_CONFIG_FRAGMENTS - see the list from
> last month for previous discussions on this, e.g.:
> https://lists.yoctoproject.org/g/meta-ti/topic/101245468
>
> At least UBOOT_CONFIG_FRAGMENTS will still work if UBOOT_CONFIG is
> not set, due to the else condition below.

Yes, the UBOOT_CONFIG logic is based on the do_install and do_deploy 
already included in the file, it seems to have gotten missed in the 
do_compile:k3r5.

We tested this patch using the UBOOT_CONFIG setup from the 
am335x-hs-evm.conf. A tiboot3.bin was deployed properly for each 
included defconfig.

Regards,

Garrett Giordano

>> Signed-off-by: Garrett Giordano <ggiordano@phytec.com>
>> ---
>>   meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 22 ++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 2c4ddcc2..327a31d8 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -103,8 +103,26 @@ UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
>>   UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
>>   
>>   do_compile:append:k3r5 () {
>> -	if ! [ -f ${B}/${UBOOT_BINARY} ]; then
>> -		ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
>> +	if [ -n "${UBOOT_CONFIG}" ];
>> +	then
>> +		for config in ${UBOOT_MACHINE}; do
>> +			i=$(expr $i + 1);
>> +			for type in ${UBOOT_CONFIG}; do
>> +				j=$(expr $j + 1);
>> +				if [ $j -eq $i ];
>> +				then
>> +					if ! [ -L ${B}/${config}/${UBOOT_BINARY} ] && ! [ -f ${B}/${config}/${UBOOT_BINARY} ]; then
>> +						ln -s ${B}/${config}/spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${config}/${UBOOT_BINARY}
>> +					fi
>> +				fi
>> +			done
>> +			unset  j
>> +		done
>> +		unset  i
>> +	else
>> +		if ! [ -f ${B}/${UBOOT_BINARY} ]; then
>> +			ln -s spl/u-boot-spl.${UBOOT_SUFFIX} ${B}/${UBOOT_BINARY}
>> +		fi
>>   	fi
>>   }
>>   
>> -- 
>> 2.25.1

