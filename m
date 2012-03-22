Return-Path: <wmills@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95F77E013A3
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 09:48:21 -0700 (PDT)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q2MGmDDH021727;
	Thu, 22 Mar 2012 11:48:13 -0500
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q2MGmDBO021849;
	Thu, 22 Mar 2012 11:48:13 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 22 Mar 2012 11:48:12 -0500
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q2MGmCBO025292;	Thu, 22 Mar 2012 11:48:12 -0500
Message-ID: <4F6B57CB.5080000@ti.com>
Date: Thu, 22 Mar 2012 12:48:11 -0400
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>	<86ehsln0t7.fsf@coulee.tdb.com>	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>	<1332365246.9740.195.camel@ted>
	<20120321214515.GD6857@denix.org>	<1332367838.9740.208.camel@ted>	<F83C8961-F16F-4D3F-AF57-8FF4414022F6@dominion.thruhere.net>
	<20120322150716.GA13495@denix.org>
In-Reply-To: <20120322150716.GA13495@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: question on meta-ti for yocto
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
X-List-Received-Date: Thu, 22 Mar 2012 16:48:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

>> Op 21 mrt. 2012, om 23:10 heeft Richard Purdie het volgende geschreven:
>>> The trouble is Koen keeps doing this and nobody in general replies. The
>>> lack of a reply can be seen as to condone what was said and its
>>> certainly leading to people getting more confused. I think a response
>>> was appropriate.

For the record I will try to speak for the official TI position on this.
-------------------

1) Koen speaks for himself.  He does not speak for TI.  He is not a TI 
employee any longer but he remains a valuable contributor to 
beagleboard, angstrom, oe-core, meta-oe, and meta-ti among many others. 
  I think we all benefit from his [ code :) ] contributions.

2) When people ask about building for "yocto" we (TI) assume they mean 
building using the poky component of yocto.

3) Angstrom is a valuable member of the openembedded eco system and 
enables much progress in oe-core and other areas.  Angstrom is based on 
oe-core, as is poky.  Angstrom is not an official yocto project. 
Therefore TI believes that when people are building based on Angstrom, 
they are NOT building "yocto".

4) Denys, Koen, and others are working to ensure that meta-ti can be 
used with just oe-core or just poky.

5) meta-ti will be able to be used in an Angstrom configuration but 
(now) does not, and will not, require it.

6) Although we plan to support base oe-core and poky configurations, 
they will *not* be recommended configurations for several reasons:
6.1) oe-core and poky ignore ~ 12 month of toolchain improvements made 
by Linaro.
6.2) At this time, all of the internal and customer validation of TI 
BSPs has been done with a gcc 4.5 based toolchain that includes the 
linaro patches.

As stated in #6, TI will continue to recommend meta-oe in the layer 
stack to get the toolchain that TI tests with.  We hope, as work with 
linaro continues to switch that to an official meta-linaro layer.

TI will continue to test with and recommend a toolchain that is closely 
aligned with Linaro.  We see no reason customers should have to misalign 
themselves with the ARM ecosystem just to align with poky.

---------------------------------
[speaking for myself now]

I fully support base poky testing but I think we are getting dangerously 
close to a defacto statement that the only real yocto based distro is 
one that _only_ uses poky + a BSP layer.  I am not aligned with that 
view.  I think oe-core and poky are a fine base but many customers will 
need to expand on what is there with more layers.

Richard,

You seem to take offense at Koen's claim that Angstrom is Yocto.  As I 
stated above I don't think Angstrom _is_ yocto but how do we refer to 
distributions that are based off of oe-core or even poky that include 
other layers.  Are they "Yocto based" or "Yocto aligned"?  How about 
"Yocto adjacent" :) ?

Koen,

The next time someone asks how to build "yocto" can you let Denys answer 
please :)

Thanks,
Bill

