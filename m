Return-Path: <trini@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 883D3E015E3
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 06:00:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OD0rQX013526
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 08:00:53 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OD0rDG007696
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 08:00:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 24 Sep 2013 08:00:53 -0500
Received: from [172.24.52.224] (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OD0mLv016366;
	Tue, 24 Sep 2013 08:00:50 -0500
Message-ID: <52418D00.8060904@ti.com>
Date: Tue, 24 Sep 2013 09:00:48 -0400
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
	<1379989631-8098-4-git-send-email-denis@denix.org>
	<78C276BE-E2AF-46CF-9931-4247D6182123@ti.com>
	<20130924043924.GJ4390@edge>
In-Reply-To: <20130924043924.GJ4390@edge>
X-Enigmail-Version: 1.5.2
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
X-List-Received-Date: Tue, 24 Sep 2013 13:00:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 09/24/2013 12:39 AM, Denys Dmytriyenko wrote:
> On Tue, Sep 24, 2013 at 03:36:47AM +0000, Cooper Jr., Franklin wrote:
>> What is the benefit of this switch?
>>
>> Although outdated a lot of posts talking about uImage vs zImage seems to 
>> favor uImage due to additional functionality that it provides.
> 
> I guess this is a more generic question addressed to Tom...

There are two sides to it.  On the zImage side, it's what the kernel
produces normally, without needing other tools, so it's vastly preferred
by the majority of kernel developers.  On the production side, uImages
provide useful things like a checksums and the ability to detect
overlaps.  If we enabled FIT images, we could go so far as to allow for
cryptographically signed images and configurations (what FIT calls a
kernel+fdt(+optional ramdisk)).

For community oriented things like this, zImage is best and for
production, it's up to the designer on what's important and what's not.

-- 
Tom

