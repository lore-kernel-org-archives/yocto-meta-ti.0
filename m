Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D459E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 19:23:39 -0800 (PST)
Received: (qmail 14687 invoked by uid 1003); 28 Jan 2012 03:23:37 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	28 Jan 2012 03:23:36 -0000
Message-ID: <4F236A37.5040108@balister.org>
Date: Fri, 27 Jan 2012 22:23:35 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>	<4F22E41B.8070708@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>	<4F2304E7.7070809@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>	<20120127202150.GE8707@denix.org>	<02FC2B87-16E6-419F-9889-E070516AA122@dominion.thruhere.net>	<7D46E86EC0A8354091174257B2FED1010BF9DB56@DLEE12.ent.ti.com>	<4F231CA0.1000800@ti.com>
	<ECCE16CF-E624-47BD-BDEB-614A5BEF755D@dominion.thruhere.net>
In-Reply-To: <ECCE16CF-E624-47BD-BDEB-614A5BEF755D@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] matrix-gui-browser:	port	from	arago	overlay
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
X-List-Received-Date: Sat, 28 Jan 2012 03:23:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/27/2012 06:04 PM, Koen Kooi wrote:
> 
> Op 27 jan. 2012, om 22:52 heeft William Mills het volgende geschreven:
> 
>>
>>
>> On 01/27/2012 03:55 PM, Maupin, Chase wrote:
>>>> Op 27 jan. 2012, om 21:21 heeft Denys Dmytriyenko het volgende
>>>> geschreven:
>>>>> On Fri, Jan 27, 2012 at 08:17:42PM +0000, Maupin, Chase wrote:
>>>>> How about splitting meta-ti into:
>>>>> * BSP only
>>>>> * SGX graphics
>>>>> * DSP tools
>>>> Since sgx and dsp are built into the SoC, why isn't it considered
>>>> BSP? I must really start warming about getting overzealous with
>>>> layers and breeding a silo mentality. I'm not saying we only need
>>>> one layer, but not a gazillion like the base proposal.
>>> I did not read the above as making a bunch of layers in meta-ti.  At the risk of getting this all started again, I really hope meta-ti is one layer with BSP, SGX, DSP, WiFi support for our devices.
>>>
>>
>> Well that was the proposal and why I figured you would barf all over it.  I am OK with all the above in one layer (but separate dirs) if it all works with all the layer stack combinations we are targeting.  The issue is we have no meta-ti+oe-core builds going on so we don't know where the dependencies will be hard to break.
>>
>> We all know the DSP support can get involved.  If we got to the point where BSP and graphics worked with oe-core but DSP support needed meta-oe or something else, then I would want the DSP stuff in a separate layer so people that did not need it could opt out.
>>
>> Likewise people using TI WIFI on non-TI processors should be able to get that in any layer stack.  If that all works with all the above in one layer thats fine.  We just don't know yet.  We can be optimistic and put it all in one layer or pessamistic and seperate them.  In this example I am more inclined to believe that the other TI stuff would not cause problems.
>>
>> Koen:  having a number of layers in on repo is a bad thing?  You should tell the meta-oe maintainer because that guys has a good number of layers in there.  :)  Are you saying that was the wrong thing to do for meta-oe?  Is there a leason learned?
> 
> It's getting late here, so I'll give the short version: every additional layer is a pain to maintain and it's even worse for the type of users we target. You need a really good set of layer tools, which still don't exist :(
> And I just know that someone is going to ask the "why do I need 5 TI layers for my simple board?" question and I don't think we can give a satisfactory answer for users based on this discussion.

Koen is trying to touch in the matter that I am at the high end of
customers skill levels wrt to the OE ecosystem :) So I can sort through
the layers I need (and curse a lot), but people who have not been around
as long just give up.

The Intel guys have easy to follow bsp's because their chips are not
that interesting :)

TI brings to the table the asymmetric multiprocessing (or whatever the
proper buzzzword is) which adds a fair bit of complexity to the BSP.

Philip

> 
> So what about this plan:
> 
> 1) evaluate directory structure of the current meta-ti, fix if needed
> 2) break the easy dependencies on external layers by duplicating the image recipes.
> 3) document the remaining dependencies in the README
> 
> That should get us a layer that parses when being using with only bitbake+oe-core. Kernel and u-boot will build & work with the right toolchain
> 
> 4) rename our u-boot recipes per the earlier RFC
> 
> That should avoid clashes with other layers
> 
> The remaining tasks are a bit more involved:
> 
> 5) make our kernel+bootloaders compile and work with gcc 4.6/binutils 2.22
> 6) Make SOC_FAMILY work or find an equivalent
> 
> regards,
> 
> Koen
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

