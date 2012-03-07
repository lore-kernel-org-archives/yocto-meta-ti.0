Return-Path: <jdk@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C98BE013A2
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Mar 2012 07:25:18 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q27FPHJ1015456;
	Wed, 7 Mar 2012 09:25:17 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q27FPHlF026908;
	Wed, 7 Mar 2012 09:25:17 -0600 (CST)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 7 Mar 2012 09:25:17 -0600
From: "Kridner, Jason" <jdk@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, Jason Kridner
	<jkridner@beagleboard.org>
Thread-Topic: [meta-ti] [PATCH] gadget init: don't dump info to info.txt on
	boot
Thread-Index: AQHM/HZ/mhDWbq9CP0GrRbDeKNCD8g==
Date: Wed, 7 Mar 2012 15:25:16 +0000
Message-ID: <CB7CE7A7.75FB0%jdk@ti.com>
In-Reply-To: <AFDEF0D3-01E3-4A50-889C-CB6748B488E5@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.14.0.111121
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] gadget init: don't dump info to info.txt on boot
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2012 15:25:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D49B28E7F25B514C975432A02D3DD22D@owa.mail.ti.com>
Content-Transfer-Encoding: quoted-printable



On 3/7/12 10:22 AM, "Koen Kooi" <koen@dominion.thruhere.net> wrote:

>
>Op 7 mrt. 2012, om 16:20 heeft Jason Kridner het volgende geschreven:
>
>> On Wednesday, March 7, 2012, Koen Kooi wrote:
>> This script adds ~10s to the boot time, doesn't have error checking and
>>prevents loading the storage gadget 3 out of 10 times.
>>=20
>> What is the root cause?  Would it be better to add error checking?
>
>I'm not going to add error checking, so chances are slim it will get
>fixed in time for the release.
>
>>  Remove it from ExecStartPre to get a fast, consistent boot. The
>>functionality should be moved to bone101.
>>=20
>> If the drive is already mounted, is it valid to edit this file?  (I
>>would think not.)
>
>It wouldn't touch the drive, it would show the info on the webpage.

That makes some sense, but the need to "eject the drive" before this info
shows up makes me think some people might miss it.  Removing the info.txt
functionality needs an update to README.htm to stop pointing to it and I
think it makes sense to switch to the composite MSC+RNDIS+serial gadget
driver to avoid the need to eject to be able to see this information.

>
>regards,
>
>Koen
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti


