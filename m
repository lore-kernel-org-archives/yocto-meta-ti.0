Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC25C04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 14:08:29 +0000 (UTC)
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (GBR01-CWL-obe.outbound.protection.outlook.com [40.107.11.94])
 by mx.groups.io with SMTP id smtpd.web08.7415.1666706908265676631
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 07:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sancloud.onmicrosoft.com header.s=selector2-sancloud-onmicrosoft-com header.b=ne5t/uhl;
 spf=pass (domain: sancloud.com, ip: 40.107.11.94, mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3EZJt9jO3k3RBT+GWJnDR9L8eYLQsG2XTxT+1XJeJWBQy8jx9gOgW1l9ZYmh7TiLIAQLZXG2RJHzBPOEeyjD+9qUaipa09L8ympgcGwRZSQCrSbTWOJzMi+zH92e/iYx1wO1jxdVxtlUoCNreMzTgHQd8Z1SVLux1cB1lVdLXwg45CqrOO/cOLFUuExxJxcukS0GLYNUWCG3Di+D6SfmXglavzZiszkH3MfwI1QWs29o/E+up0QKG7YQYTlpzcbtwTvZ4nYXG1AvO/4li0knGWW6ojhv3jBGLenN/5Y7Ah2vtzm0r4knbiF0UxVZ/3/xqSzoGqP2FWz3yWceM4cWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3H2wrfGV4X0Lc8QfipjeSv4s7lYjofKlphjzFagNGw=;
 b=VKQLNQTNhY5KbOCZqj36BSM/txbqe7/5qX8WejSjwgrv0nGT52awgkcXnympNRiU7FS3/dhFkQtuPisejrW+ZqqDxJB31DL9kj1Fs7VhaRNLQFU80GNPHvjOd1W4j2KKC7ZF/EjzxCm9joT+Lt/+XlPJn3fTJ1jvusUWRpta3CwPDxLkPspS7Uv/tgwiFuIFori7O+bp9ugVArBsAePRqk+YsIxiO8BejARFzIWLbRmwpbRABn5QxugDmE481DVUL+3wU74bOzkzHZzGP6pr0oCrOxe6kOESSEBXbOt6MkSpyIw1MlxzIWt48QDVDqm7ZexNjjPbZaY8T0aE23U5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3H2wrfGV4X0Lc8QfipjeSv4s7lYjofKlphjzFagNGw=;
 b=ne5t/uhlI/kW85rcAKQr1MwCtBH2W1DXa7i/w0YbWitUgAVq06y2tFJ1Ur6MQkgvO425llH/4gTQkGYFKGlJtj42OVKd/5o5rxV2yqwWvG5XMkp28oJTOz+6dMQkb+sqNJ5XZ187wwZCK+Lu1PXI+BXdCobNrtl5bd3MYMYCcLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWXP123MB2248.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:7e::18)
 by LO3P123MB2874.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 14:08:25 +0000
Received: from CWXP123MB2248.GBRP123.PROD.OUTLOOK.COM
 ([fe80::749c:2fc:9577:b905]) by CWXP123MB2248.GBRP123.PROD.OUTLOOK.COM
 ([fe80::749c:2fc:9577:b905%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 14:08:24 +0000
Message-ID: <b6f24527-2e5f-ec26-f1d4-8735183d3aad@sancloud.com>
Date: Tue, 25 Oct 2022 15:08:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
 <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
From: Paul Barker <paul.barker@sancloud.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
In-Reply-To: <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0QnSekCWNoBhrAYrFzzO4Ven"
X-ClientProxiedBy: LO4P123CA0376.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::21) To CWXP123MB2248.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:7e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWXP123MB2248:EE_|LO3P123MB2874:EE_
X-MS-Office365-Filtering-Correlation-Id: 735bee65-1b88-458f-e0f8-08dab69261c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PXUgcdMFBOucgp2aOHTIM3pMuyeUvEExjYow7o0kHlywEmZ9L9L6a5d1yDgUKFLBjVth7h0mhApZJ6OfcWmt7vmo4LCVsXHaM2cPKFUz1Bg+ALeudKV+yBvow9TayarK8xPEXlzHsDQXeFuizPuBaH5J0dkYBamjHf/mVnlRhPJ9rjtsB/P9ur3cSXQx93RznBrVDPZ/KCWvRu52Eh3r6cmEbPqzEpVyV6kPxjYVZ66iJI6NcT/j6zYoKz0y9aLs59P6DG6O29ZvZdgE4VcBa2Vook3szbB0XNuS0wiiCsu/ksP009JKZPx24vZ0iK6Uxa9s3pjXRgjjZXC1oWMZ2TS/1w+UirwLpZNfOE4NZt6sX4U8bkk6kcYIQ4xIsXwx7EWbaF3h+wJQ9rukMVaAXNSQgkMI/QZTWa/MGY4ACmh3PImCsUCNMJkbn1CgJA7rFsFDTOtYWWiJZABuTkygVATubXTLsyAfoOKfgtGO5CmFfKQfp03t3HRYaaEvSu10sydMfWKUBYaNjKgvxKpZlw+mDBOWj9CQ2t30pAOxjsZqieg+eA8VLwwkUMny4tKacE37gk2Ysrrdg4qnfrYzas0a2OwjXTT/Bg82YzE6oSNT0KHXUvK7fVYR60rSngWAY9UdLSdNvMgD86vMm6RH/rWtv2pOkwJbCUtMvMSprYrZvwj8rR0bR8f0/nhRXPTCPQ0i8Vu87MvbcLwJ6kX8iVVEvLsHkbHbdH/2gc9ktUn0peQfZr4tfemIiHsT3PuQIhshZDHiJa6ZeDfwvPvBL0XMpDw1HqIDex6a+yxk5q9cXt9oa5C2BGvqaUW/5CiQICZI+Mc0Jo8l0quy1TpKwBIsYosevVat2j9LVbejBviGsJfRHipZkj97MKgUiyyvJBIKooOFRBhwvjpq5DEQ0m3AC9qDJfGqE3SHt+0gLbM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP123MB2248.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(136003)(39830400003)(376002)(396003)(451199015)(2616005)(36756003)(2906002)(66946007)(6506007)(66476007)(41300700001)(8936002)(316002)(110136005)(66556008)(966005)(235185007)(31686004)(6486002)(86362001)(5660300002)(8676002)(33964004)(52116002)(53546011)(44832011)(31696002)(21480400003)(478600001)(26005)(38350700002)(38100700002)(186003)(6512007)(83380400001)(290074003)(175373001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzEycncwRmR5Z3lPbUJLRGVHaTBkV210RGo3dFdaM2QxRFR3eTRYOGRSbk1U?=
 =?utf-8?B?bithcFUzZzdDZUZRN1hLQ2pGejYvd1JYUnpIUVljZ09hZWRhTE9iUEt0WERt?=
 =?utf-8?B?aXlZWTF2NEFHZEtJZ01vMEtGa1JkblJnU1ZiNGJkRGRIam9jc09mQWp1aXJU?=
 =?utf-8?B?T0o2Sjlqcm9tcGdid09XM2hOSDJXcUxNZms5MUx3RlQ2bXZMaEcyNWZtWFVD?=
 =?utf-8?B?NnhNbG9KMzViRllNbVZYZHJQVkc1a29hYlYxQkY4TVF6ZVcrcXFmUkR3elFH?=
 =?utf-8?B?Q0c1aUJkY0paZ2g5dVhrVnJZMEFEUjdVQ1puTldYOElROW43bVJkeGZYSFZQ?=
 =?utf-8?B?eWpTYzgwbFZHWW1MNk0xQTFaYU44VWo4dlV1NHBpQ3BtdG9SK2x1SWVzaHAz?=
 =?utf-8?B?SHQ2eW52OThTK0F1SGRub1BTNnRBYXV2Y2tGN2hOWEJhSTJhNml1czVMZGNS?=
 =?utf-8?B?RHk0N2NEc2FteVZBRmRnelRvRWVQOUJHSEQxV0Fvem5QUVJ1L0l6bHNycDNp?=
 =?utf-8?B?aFdFWTk0QUhDZ1hYR0Ntc1NKM3lRbzJ0eE1pNkltcGM1QjZhdmxJazlDa3VH?=
 =?utf-8?B?UmRXU0hRVXE4NE5yZHJJb0d6TWpVbStBeFhzMG1IbXlsL1ZPaXhsUTQ3a1hU?=
 =?utf-8?B?NndQaVRJQllIcUhYVDdIeUtMbDVTSW1HWk9peTFuQXFPUHNuem1EOFBrUlVN?=
 =?utf-8?B?b2VIMkdNZlgvYkEyZ2daUUZEeCtmd295Y095Q0xSbWk0WkZGUHl0SlEzeVFT?=
 =?utf-8?B?cmFWUXpnWmV0TGdhekJWQmhLeSt5ZXQxVm9pNGNTTXUvKzVkYk02aW9hendR?=
 =?utf-8?B?eEVOenV1QTF2WGZxeDNaNW5rSTFKUHJzVmZGMWRuUzdCUjNYcmEzV1JmWXIz?=
 =?utf-8?B?QW5UQ3dHOFdzRWEyUy9HaW80SDdKUWZvT2FvQVpjVjJIZFBqdlpWNWxxRlhX?=
 =?utf-8?B?RUVXN2gwVDdDUTRQY0x3TVBHb0IyMHlwbmI0UktyTzdtQmNwRXJYQVhOTnll?=
 =?utf-8?B?R0xGbkdqRG15dFpaNEhJR24xTUhOU1Z1eTdTalVoNU1VYkttN3l0ZjdHNzhZ?=
 =?utf-8?B?K0lPYUw5SlM3eGxWQVhRblJjNTYzNU13U29OMU9uVmpHWm8vNmtrQVg3T3Vq?=
 =?utf-8?B?dnlzVVNJUkphZ1JLQjd3TVlzNjRpTFhuc2p2NWVwVllsLzRXclplSlJiaE5F?=
 =?utf-8?B?b2pCMTZBdldPMFFoQVdrOXYvVU1mamoxY21LYTNqKzhhbCtCTll6Nkk4REJY?=
 =?utf-8?B?L0dITk1ZSmxVY1Z0d0xrd09COENNdXVQT2RwWE9uNkZQa3JvT01ZWmhDMC9s?=
 =?utf-8?B?WTQrVWVVcFFhU3ZiOTAwUGZ1VE8wWituam15VkV4T3F0bFdRdzNkc2lEQnds?=
 =?utf-8?B?MHNQaFZQL3hPMkNvWHpkQXRQcjVia3R3SVRvUS9XcTRhQzhXdllDd2tBU2ZV?=
 =?utf-8?B?dHRlL2pUcmNqaTZmdElpL1hrcXdmRUJuSGlldXowS0lJdUxOaS9ac3ZZUlJq?=
 =?utf-8?B?RmJ1QmtGSGQ0YWdLblZ4bDRmd2lpVXpjM0lRdGZBb0F0RTkvL0ErSy83UlVy?=
 =?utf-8?B?QmV6S3N1TUgvZXhyK1VMR1dhalNYanVqekRrMWxDUWtEZEdUcS90THMwTFFj?=
 =?utf-8?B?NG90cVEzRWt3NytKb3dVc2pzbElQMVpwa0J6ZGlpcS9GNFVtMnZ0czFiR295?=
 =?utf-8?B?eWdlRG5INjV5SjliNmpVTHFwbHJldlhMVVpuMWhsbTN4QlZqTUhTWlFKQ29i?=
 =?utf-8?B?Nk1ncldjc0hsR0w0K2puRUw3SUpLa2s2cW1pQWxtTjQrcDd5eFJPSWNwQi9U?=
 =?utf-8?B?Rnd6UlN4SG82U1o0SHRWaENnMnRYQ0Z5TXhiWHFxLzkwcHp4RmN4RGxxc1JK?=
 =?utf-8?B?eWpFNGdoMDlOT2F0M2pFbndJNDhEZk5tUzRxTGpLQnJvNFZrVXJBeVd3WHA4?=
 =?utf-8?B?NDJoeUlnNkJQcXRJMWM3NzVRN2d3NDZVZkJCWndZUm42bUVjaXVnNm16WXZo?=
 =?utf-8?B?NkxQWlMzYk9NYWFSa25POEJxWjZtMmwxblc4N1dKSWxScVNWeTUwZ0paT1pK?=
 =?utf-8?B?RHpJL0cya0U0RWdXVEpJSmVkZExWclIrL1NJc2FtL0dsbmRlbHYxYWVLQXJ3?=
 =?utf-8?B?U0lRRGJiRWk2Umxybng1MkVsdzFHc1QzT2ZWeERJYlFWamEvWkdtRUFqSjFX?=
 =?utf-8?B?WkE9PQ==?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735bee65-1b88-458f-e0f8-08dab69261c0
X-MS-Exchange-CrossTenant-AuthSource: CWXP123MB2248.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:08:24.9107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vvrvCO7uY6TjibFt49bjGlveSNZc9+qUT/NNQSejL27UdqTtjOE107/WvRgyhZT+nEgXu6e/z2zV23Sqg94RG3jTgmBxXqc642O0R5+TYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB2874
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Oct 2022 14:08:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15197

--------------0QnSekCWNoBhrAYrFzzO4Ven
Content-Type: multipart/mixed; boundary="------------t2B4bNLPkwHJOWg6fKD2hvT5";
 protected-headers="v1"
From: Paul Barker <paul.barker@sancloud.com>
To: Andrew Davis <afd@ti.com>, meta-ti@lists.yoctoproject.org,
 Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Message-ID: <b6f24527-2e5f-ec26-f1d4-8735183d3aad@sancloud.com>
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
 <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
In-Reply-To: <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>

--------------t2B4bNLPkwHJOWg6fKD2hvT5
Content-Type: multipart/mixed; boundary="------------b0NA9RExSda5af01aCS64gwZ"

--------------b0NA9RExSda5af01aCS64gwZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On 17/10/2022 15:30, Andrew Davis wrote:
> I'm attaching a patch for meta-ti that should
> get both core-image-x11 and core-image-weston building for Kirkstone.

I'll give this a test this week. I've included some review comments
below so we can hopefully get something merged to fix this issue...

> From c81fbae2cf7787ed01ee00b378e95be9d653d7df Mon Sep 17 00:00:00 2001
> From: Andrew Davis <afd@ti.com>
> Date: Thu, 13 Oct 2022 09:59:46 -0500
> Subject: [PATCH] Add core-image-weston and core-image-x11 support
>=20
> This is more changes than I would normally like in a single commit
> but these all do seem so logically connected. The goal being to
> enable the two oe-core graphical images.
>=20
> These changes are needed due to our MACHINES all only having GLES2
> and not the desktop OpenGL versions. That would mean these belong
> in the layer that adds the machines and not in a distro layer.
>=20
> At some point we should add a new MACHINE_FEATURE that lets a BSP
> layer specify the API supported by the hardware. Until then
> we append these key recipes to switch them over to GLES2.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>

I expect the long-term solution will be to add a "gles2" entry to
MACHINE_FEATURES on the Yocto master branch, but I doubt that will be
accepted onto the existing kirkstone branch. In the meantime we do need
a solution which can be applied for kirkstone.

Are the changes here expected to work for all TI targets or just the
AM335x SoC? i.e. can this be applied to the kirkstone branch in meta-ti
once refactored into a couple of different commits (e.g. one per
package)?

> ---
>  .../recipes-graphics/cairo/cairo_%.bbappend   |  3 ++
>  ...abling-patch-to-not-exclude-libepoxy.patch | 46 +++++++++++++++++++=

>  .../recipes-graphics/gtk+/gtk+3_%.bbappend    |  9 ++++
>  .../libepoxy/libepoxy_%.bbappend              |  3 ++
>  .../xorg-xserver/xserver-xorg_%.bbappend      |  2 +
>  .../xwayland/xwayland_%.bbappend              |  3 ++
>  6 files changed, 66 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend=

>  create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-Op=
enGL-disabling-patch-to-not-exclude-libepoxy.patch
>  create mode 100644 meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
>  create mode 100644 meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bb=
append
>  create mode 100644 meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-x=
org_%.bbappend
>  create mode 100644 meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bb=
append
>=20
> diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta=
-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> new file mode 100644
> index 00000000..726f3911
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
> @@ -0,0 +1,3 @@
> +PR:append:ti-soc =3D ".ti1"
> +PACKAGECONFIG:append:ti-soc =3D " ${@bb.utils.contains('MACHINE_FEATUR=
ES', 'gpu', 'egl glesv2', '', d)}"
> +PACKAGECONFIG:remove:ti-soc =3D "opengl"
> diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-di=
sabling-patch-to-not-exclude-libepoxy.patch b/meta-ti-bsp/recipes-graphic=
s/gtk+/gtk+3/0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patc=
h
> new file mode 100644
> index 00000000..c873fb8d
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3/0001-Fix-OpenGL-disabling=
-patch-to-not-exclude-libepoxy.patch
> @@ -0,0 +1,46 @@
> +From eb16e80bf1f7c51024f3ed950ae85541e5ba2233 Mon Sep 17 00:00:00 2001=

> +From: Andrew Davis <afd@ti.com>
> +Date: Wed, 12 Oct 2022 13:05:45 -0500
> +Subject: [PATCH] Fix OpenGL disabling patch to not exclude libepoxy
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Andrew Davis <afd@ti.com>

I think this is appropriate to fix upstream.

> +---
> + configure.ac | 9 ++++-----
> + 1 file changed, 4 insertions(+), 5 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 3cb24e9..aa365be 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -348,10 +348,9 @@ AC_ARG_ENABLE(cloudproviders,
> +                               [cloudproviders_set=3Dyes])
> + AC_ARG_ENABLE(opengl,
> +               [AS_HELP_STRING([--enable-opengl],
> +-                              [When enabled, Gtk+ will use libepoxy a=
nd exposes GtkGLArea widget ])])
> ++                              [When enabled, Gtk+ exposes GtkGLArea w=
idget ])])
> + AS_IF([test "x$enable_opengl" !=3D "xno"], [
> +-  AC_DEFINE([HAVE_OPENGL], [1], [libepoxy and opengl APIs are availab=
le at buildtime])
> +-  EPOXY_PACKAGES=3D"epoxy >=3D epoxy_required_version"
> ++  AC_DEFINE([HAVE_OPENGL], [1], [OpenGL APIs are available at buildti=
me])

This section can be changed to always define EPOXY_PACKAGES, or to
define it when `--enable-epoxy` is passed on the command line if we need
a way to enable/disable this dependency to be able to submit the patch
upstream.

> + ])
> + AM_CONDITIONAL([HAVE_OPENGL],[test "x$enable_opengl" !=3D "xno"])
> +=20
> +@@ -1365,7 +1364,7 @@ CFLAGS=3D"$saved_cflags"
> + LDFLAGS=3D"$saved_ldflags"
> +=20
> + GDK_PACKAGES=3D"$PANGO_PACKAGES gdk-pixbuf-2.0 >=3D gdk_pixbuf_requir=
ed_version cairo >=3D cairo_required_version cairo-gobject >=3D cairo_req=
uired_version"
> +-GDK_PRIVATE_PACKAGES=3D"$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGE=
S $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES $PROFILER_PACKA=
GES fribidi >=3D fribidi_required_version"
> ++GDK_PRIVATE_PACKAGES=3D"$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGE=
S $cairo_backends epoxy >=3D epoxy_required_version $CLOUDPROVIDER_PACKAG=
ES $PROFILER_PACKAGES fribidi >=3D fribidi_required_version"

This line can remain unchanged if EPOXY_PACKAGES is unconditionally
defined above.

> +=20
> + PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
> + GDK_DEP_LIBS=3D"$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
> +@@ -1399,7 +1398,7 @@ fi
> + PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
> +=20
> + GTK_PACKAGES=3D"atk >=3D atk_required_version cairo >=3D cairo_requir=
ed_version cairo-gobject >=3D cairo_required_version gdk-pixbuf-2.0 >=3D =
gdk_pixbuf_required_version gio-2.0 >=3D glib_required_version"
> +-GTK_PRIVATE_PACKAGES=3D"$ATK_PACKAGES $WAYLAND_PACKAGES $EPOXY_PACKAG=
ES fribidi >=3D fribidi_required_version"
> ++GTK_PRIVATE_PACKAGES=3D"$ATK_PACKAGES $WAYLAND_PACKAGES epoxy >=3D ep=
oxy_required_version fribidi >=3D fribidi_required_version"

As above.

> + if test "x$enable_x11_backend" =3D xyes -o "x$enable_wayland_backend"=
 =3D xyes; then
> +   GTK_PRIVATE_PACKAGES=3D"$GTK_PRIVATE_PACKAGES pangoft2"
> + fi
> diff --git a/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend b/meta-=
ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
> new file mode 100644
> index 00000000..b6e82d14
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/gtk+/gtk+3_%.bbappend
> @@ -0,0 +1,9 @@
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> +
> +SRC_URI:append:ti-soc =3D " \
> +	file://0001-Fix-OpenGL-disabling-patch-to-not-exclude-libepoxy.patch =
\
> +"
> +
> +PR:append:ti-soc =3D ".ti1"
> +PACKAGECONFIG:remove:ti-soc =3D "opengl"
> +DEPENDS:append:ti-soc =3D " libepoxy"
> diff --git a/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend =
b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
> new file mode 100644
> index 00000000..aadf5bab
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/libepoxy/libepoxy_%.bbappend
> @@ -0,0 +1,3 @@
> +PR:append:ti-soc =3D ".ti1"
> +PACKAGECONFIG:append:ti-soc =3D " ${@bb.utils.contains('MACHINE_FEATUR=
ES', 'gpu', 'egl', '', d)}"
> +PACKAGECONFIG:remove:ti-soc =3D "x11"
> diff --git a/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.b=
bappend b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappe=
nd
> new file mode 100644
> index 00000000..86c1e714
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend=

> @@ -0,0 +1,2 @@
> +PR:append:ti-soc =3D ".ti1"
> +OPENGL_PKGCONFIGS:ti-soc =3D ""
> diff --git a/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend =
b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
> new file mode 100644
> index 00000000..e7163207
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-graphics/xwayland/xwayland_%.bbappend
> @@ -0,0 +1,3 @@
> +PR:append:ti-soc =3D ".ti1"
> +PACKAGECONFIG:remove:ti-soc =3D "glx"
> +DEPENDS:append:ti-soc =3D " libxshmfence"

Thanks,

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

e: paul.barker@sancloud.com
w: https://sancloud.com/
--------------b0NA9RExSda5af01aCS64gwZ
Content-Type: application/pgp-keys; name="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xA67255DFCCE62ECD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3DsH2a
-----END PGP PUBLIC KEY BLOCK-----

--------------b0NA9RExSda5af01aCS64gwZ--

--------------t2B4bNLPkwHJOWg6fKD2hvT5--

--------------0QnSekCWNoBhrAYrFzzO4Ven
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCY1ft1wUDAAAAAAAKCRDYN3IfEvob6hi7
APsEEcY3t8cIbbTZukeOscVFlEqKiqDI0RiZAqFHmC8c3AEAmdkjvhptGukYMs+3G0cM45QpOKsZ
yuDrP6VibW8d4Ao=
=jtkq
-----END PGP SIGNATURE-----

--------------0QnSekCWNoBhrAYrFzzO4Ven--

