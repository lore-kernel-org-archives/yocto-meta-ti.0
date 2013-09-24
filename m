Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 802B5E015E3
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 06:49:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8ODnrBF012664
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 08:49:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8ODnrbH011063
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 08:49:53 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 08:49:53 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Rini, Tom" <trini@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 4/4] ti33x, ti43x, omap-a15: switch
	KERNEL_IMAGETYPE to zImage by default
Thread-Index: AQHOuSYe3RcAyZqKrUOSsIsh27dC5pnU50yw
Date: Tue, 24 Sep 2013 13:49:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159747465@DLEE11.ent.ti.com>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
	<1379989631-8098-4-git-send-email-denis@denix.org>
	<78C276BE-E2AF-46CF-9931-4247D6182123@ti.com>	<20130924043924.GJ4390@edge>
	<52418D00.8060904@ti.com>
In-Reply-To: <52418D00.8060904@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 4/4] ti33x, ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2013 13:49:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Rini, Tom
>Sent: Tuesday, September 24, 2013 8:01 AM
>To: Dmytriyenko, Denys
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCH 4/4] ti33x, ti43x, omap-a15: switch
>KERNEL_IMAGETYPE to zImage by default
>
>On 09/24/2013 12:39 AM, Denys Dmytriyenko wrote:
>> On Tue, Sep 24, 2013 at 03:36:47AM +0000, Cooper Jr., Franklin
>wrote:
>>> What is the benefit of this switch?
>>>
>>> Although outdated a lot of posts talking about uImage vs zImage
>seems to
>>> favor uImage due to additional functionality that it provides.
>>
>> I guess this is a more generic question addressed to Tom...
>
>There are two sides to it.  On the zImage side, it's what the
>kernel
>produces normally, without needing other tools, so it's vastly
>preferred
>by the majority of kernel developers.  On the production side,
>uImages
>provide useful things like a checksums and the ability to detect
>overlaps.  If we enabled FIT images, we could go so far as to
>allow for
>cryptographically signed images and configurations (what FIT calls
>a
>kernel+fdt(+optional ramdisk)).
>
>For community oriented things like this, zImage is best and for
>production, it's up to the designer on what's important and what's
>not.

A key point is that either can still be used with new u-boots.  Tom, I thin=
k you were saying there is a way if the AMSDK wants to for it to fall back =
to uImage if zImage is not found.

>
>--
>Tom
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

