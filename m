Return-Path: <h-fache@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CB7FE002AB
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2012 00:24:34 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9F7OUNa010940
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2012 02:24:30 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9F7OU0t008799
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2012 02:24:30 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 15 Oct 2012 02:24:30 -0500
Received: from [137.167.109.3] (unb0919861.emea.dhcp.ti.com [137.167.109.3])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9F7OTVP029648;
	Mon, 15 Oct 2012 02:24:30 -0500
Message-ID: <507BBA32.5000206@ti.com>
Date: Mon, 15 Oct 2012 09:24:34 +0200
From: =?ISO-8859-1?Q?Herv=E9_Fache?= <h-fache@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <507836EF.8050506@ti.com> <20121012153140.GG26956@edge>
	<50783E2F.4060204@ti.com> <20121012161944.GH26956@edge>
In-Reply-To: <20121012161944.GH26956@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: No /sbin/init when deriving m7y own image
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
X-List-Received-Date: Mon, 15 Oct 2012 07:24:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 10/12/2012 06:19 PM, Denys Dmytriyenko wrote:
> On Fri, Oct 12, 2012 at 05:58:39PM +0200, Herv? Fache wrote:
>> On 10/12/2012 05:31 PM, Denys Dmytriyenko wrote:
>>> On Fri, Oct 12, 2012 at 05:27:43PM +0200, Herv? Fache wrote:
>>>> Hi guys,
>>>>
>>>> I am new to Poky and have created the following recipe:
>>>>      require recipes-graphics/images/core-image-x11.bb
>>>>      IMAGE_INSTALL += "omapdrmtest"
>>> Can you try adding to CORE_IMAGE_EXTRA_INSTALL instead of IMAGE_INSTALL?
>>>
>> Thanks a lot, that did it!
> I'm glad it worked for you.
>
> But I'm still baffled why IMAGE_INSTALL didn't work. The only 2 reasons I can
> see for that are:
>
> 1. If you made a typo and used '=' instead of '+=', which would re-assign
> IMAGE_INSTALL, instead of appending to it, losing its current value.
>
> 2. Or if you tried to append to IMAGE_INSTALL before loading the base image
> recipe with 'require' (effectively, swapping the 2 lines of your recipe) - in
> that case you'd append to an empty IMAGE_INSTALL first and inside the
> core-image class it uses conditional assignment to pre-set that variable with
> system defaults. But since you already assigned to it early on, it won't be
> populated with system defaults...
>
> Other than that, the example you showed above seems to work for me here...
Well, I just copied and pasted into the e-mail, so what you see it what 
I had :-)
And FWIW I also tried to add spaces everywhere to no avail!

Hervé

