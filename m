Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FBBDE004E9
	for <meta-ti@yoctoproject.org>; Tue, 18 Oct 2011 00:32:37 -0700 (PDT)
Received: by eyh5 with SMTP id 5so330825eyh.35
	for <meta-ti@yoctoproject.org>; Tue, 18 Oct 2011 00:32:35 -0700 (PDT)
Received: by 10.14.23.15 with SMTP id u15mr98402eeu.63.1318923155477;
	Tue, 18 Oct 2011 00:32:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a49sm3025845eea.2.2011.10.18.00.32.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 00:32:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE706E627@DLEE09.ent.ti.com>
Date: Tue, 18 Oct 2011 09:32:27 +0200
Message-Id: <56448434-CA86-4EF0-8FE1-E479A70ECD68@dominion.thruhere.net>
References: <B0581B5571079145BA1CD78C126DBDE70619DB@DLEE09.ent.ti.com>
	<13872098A06B02418CF379A158C0F14601606D69B6@dnce02.ent.ti.com>,
	<B0581B5571079145BA1CD78C126DBDE7061ADA@DLEE09.ent.ti.com>,
	<13872098A06B02418CF379A158C0F14601606D69B7@dnce02.ent.ti.com>,
	<B0581B5571079145BA1CD78C126DBDE7061EFE@DLEE09.ent.ti.com>,
	<B0581B5571079145BA1CD78C126DBDE7063FB5@DLEE09.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE70648CD@DLEE09.ent.ti.com>,
	<8B4F1F81-5362-4637-83EF-3B760F882466@dominion.thruhere.net>
	<B0581B5571079145BA1CD78C126DBDE7064D44@DLEE09.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE706E627@DLEE09.ent.ti.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
Cc: Denys Dmytriyenko <denys@ti.com>, Chase Maupin <chase.maupin@ti.com>,
	Jason Kridner <jdk@ti.com>, Koen Kooi <k-kooi@ti.com>
Subject: Re: [PATCHES] linux-ti33x-psp
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
X-List-Received-Date: Tue, 18 Oct 2011 07:32:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Applied, thanks!

Op 17 okt. 2011, om 22:06 heeft Dmytriyenko, Denys het volgende geschreven:

> And here's corresponding u-boot patch.
> 
> 
>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Monday, October 17, 2011 9:45 AM
>> To: Koen Kooi; meta-ti@yoctoproject.org
>> Cc: Kooi, Koen; Maupin, Chase; Kridner, Jason
>> Subject: RE: [meta-ti][PATCHES] linux-ti33x-psp
>> 
>>> First 3 patches pushed with a follow up patch to fix XSERVER for the
>> evm.
>> 
>> Thanks!
>> 
>> 
>>> I need to do some more testing on 0004- and don't want to mess up things
>> before the image deadline today.
>> 
>> Sounds fair, especially since I cannot really test beaglebone myself.
>> 
>> Denys
>> 
>> 
>> ________________________________________
>> From: Koen Kooi [koen@dominion.thruhere.net]
>> Sent: Monday, October 17, 2011 9:20 AM
>> To: meta-ti@yoctoproject.org
>> Cc: Kooi, Koen; Maupin, Chase; Kridner, Jason; Dmytriyenko, Denys
>> Subject: Re: [meta-ti][PATCHES] linux-ti33x-psp
>> 
>> Op 17 okt. 2011, om 11:29 heeft Dmytriyenko, Denys het volgende
>> geschreven:
>> 
>>> Well, there seems to be some delivery problems with meta-ti ML at the
>> moment (working with their admins to resolve), so I'm sending the patches
>> here for now.
>>> 
>>> Summary:
>>> 
>>> Introduce TI33x SOC and AM335x EVM machine with corresponding kernel
>> recipe
>>> for PSP tree on Arago.
>>> 
>>> The second version of the patches add BeagleBone support and obsoletes
>> Joel's
>>> initial recipe.
>> 
>> First 3 patches pushed with a follow up patch to fix XSERVER for the evm.
>> I need to do some more testing on 0004- and don't want to mess up things
>> before the image deadline today.
>> 
>>> 
>>> Denys
>>> 
>>> 
>>> ________________________________________
>>> From: Dmytriyenko, Denys
>>> Sent: Sunday, October 16, 2011 5:54 PM
>>> To: Kooi, Koen; Koen Kooi
>>> Cc: Maupin, Chase; Kridner, Jason
>>> Subject: RE: [meta-ti][PATCHES] linux-ti33x-psp
>>> 
>>> Koen,
>>> 
>>> There is a "tipspkernel" distro feature, that I added last time, which
>> can be used to quickly switch between pure PSP and patched kernels. I'll
>> be sending an updated set of patches shortly for linux-ti33x recipes to
>> utilize that for applying LED and other patches on top of PSP kernel.
>>> 
>>> Denys
>>> 
>>> 
>>> ________________________________________
>>> From: Dmytriyenko, Denys
>>> Sent: Friday, October 14, 2011 9:48 PM
>>> To: Kooi, Koen; Koen Kooi
>>> Cc: Maupin, Chase
>>> Subject: RE: [meta-ti][PATCHES] linux-ti33x-psp
>>> 
>>>> the daily call (which doesn't feature denys)
>>> 
>>> On one hand, nobody invited me.
>>> On the other hand, at this point I'm useless with BeagleBone, as there
>> is no board available for me... And I don't really have any time to fiddle
>> with it anyway.
>>> 
>>> 
>>>> the top of the psp tree is "questionable" to say at least looking  at
>> the commits, too many "really fix crash now" and "really, really fix crash
>> now".
>>> 
>>> :) Well, sometimes it happens. But it shouldn't become a rule.
>>> 
>>> 
>>> Anyway, I'll try combining the recipes.
>>> 
>>> Denys
>>> 
>>> 
>>> ________________________________________
>>> From: Kooi, Koen
>>> Sent: Friday, October 14, 2011 5:30 PM
>>> To: Dmytriyenko, Denys; Koen Kooi
>>> Cc: Maupin, Chase
>>> Subject: RE: [meta-ti][PATCHES] linux-ti33x-psp
>>> 
>>> AIUI bone support is "upstream" now in the psp kernel, so I think we
>> only need the LED patch on top of that for bone. As I said on the daily
>> call (which doesn't feature denys), the top of the psp tree is
>> "questionable" to say at least looking  at the commits, too many "really
>> fix crash now" and "really, really fix crash now".
>>> 
>>> Between now and RTM I'd only like to see a handfull of patches being
>> different in SRC_URI between bone and evm.
>>> 
>>> Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL.
>> Registered in England & Wales under company number 00574102
>>> 
>>> ________________________________________
>>> 
>>> From: Dmytriyenko, Denys
>>> Sent: 14 October 2011 23:05
>>> To: Kooi, Koen; Koen Kooi
>>> Cc: Maupin, Chase
>>> Subject: RE: [meta-ti][PATCHES] linux-ti33x-psp
>>> 
>>> Would SRC_URI_beaglebone = "github/joel" in my recipe work for you? I
>> can send a patch for that as a follow up, i.e merging joel's into mine...
>>> 
>>> And yes, Bill wants to have working EVM in couple days (early next
>> week). Still lots of things to do...
>>> 
>>> 
>>>> -----Original Message-----
>>>> From: Kooi, Koen
>>>> Sent: Friday, October 14, 2011 4:54 PM
>>>> To: Dmytriyenko, Denys; Koen Kooi
>>>> Cc: Maupin, Chase
>>>> Subject: RE: [meta-ti][PATCHES] linux-ti33x-psp
>>>> 
>>>> At this point I think I prefer a single recipe for both (as in, kill
>> the
>>>> joel one), but if it's better to get the evm supported ASAP I can merge
>>>> these as-is.
>>>> 
>>>> Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4
>>>> 7YL. Registered in England & Wales under company number 00574102
>>>> 
>>>> ________________________________________
>>>> 
>>>> From: Dmytriyenko, Denys
>>>> Sent: 14 October 2011 22:24
>>>> To: Koen Kooi; Kooi, Koen
>>>> Cc: Maupin, Chase
>>>> Subject: [meta-ti][PATCHES] linux-ti33x-psp
>>>> 
>>>> Koen,
>>>> 
>>>> Latest PSP kernel for ti33x/am335x-evm - should not conflict with
>> Joel's,
>>>> but need to unify/merge later.
>>>> 
>>>> BTW, I'm in between setting up meta-ti trees, so I'm sending the
>> patches
>>>> instead for now...
>>>> 
>>>> Denys
>>> 
>>> 
>>> <0001-linux-omap-remove-unused-.inc-files.patch><0002-linux-ti33x-psp-
>> add-TI33x-PSP-kernel-with-am335x-evm.patch><0003-am335x-evm-add-machine-
>> config-with-corresponding-ti3.patch><0004-linux-am335x-joel-remove-
>> beaglebone-specific-recipe-.patch>
> 
> <0001-u-boot-2011.10rc-update-to-cover-ti33x-SOC-boards-no.patch>


