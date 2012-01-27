Return-Path: <wmills@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EB35E0030F
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 13:52:36 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RLqXme024580;
	Fri, 27 Jan 2012 15:52:33 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RLqXSq018084;
	Fri, 27 Jan 2012 15:52:33 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 15:52:32 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0RLqWLr010477;	Fri, 27 Jan 2012 15:52:32 -0600
Message-ID: <4F231CA0.1000800@ti.com>
Date: Fri, 27 Jan 2012 16:52:32 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>	<4F22E41B.8070708@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>	<4F2304E7.7070809@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>	<20120127202150.GE8707@denix.org>	<02FC2B87-16E6-419F-9889-E070516AA122@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9DB56@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1010BF9DB56@DLEE12.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port	from	arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 21:52:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/27/2012 03:55 PM, Maupin, Chase wrote:
>> Op 27 jan. 2012, om 21:21 heeft Denys Dmytriyenko het volgende
>> geschreven:
>>> On Fri, Jan 27, 2012 at 08:17:42PM +0000, Maupin, Chase wrote:
>>> How about splitting meta-ti into:
>>> * BSP only
>>> * SGX graphics
>>> * DSP tools
>> Since sgx and dsp are built into the SoC, why isn't it considered
>> BSP? I must really start warming about getting overzealous with
>> layers and breeding a silo mentality. I'm not saying we only need
>> one layer, but not a gazillion like the base proposal.
> I did not read the above as making a bunch of layers in meta-ti.  At the risk of getting this all started again, I really hope meta-ti is one layer with BSP, SGX, DSP, WiFi support for our devices.
>

Well that was the proposal and why I figured you would barf all over 
it.  I am OK with all the above in one layer (but separate dirs) if it 
all works with all the layer stack combinations we are targeting.  The 
issue is we have no meta-ti+oe-core builds going on so we don't know 
where the dependencies will be hard to break.

We all know the DSP support can get involved.  If we got to the point 
where BSP and graphics worked with oe-core but DSP support needed 
meta-oe or something else, then I would want the DSP stuff in a separate 
layer so people that did not need it could opt out.

Likewise people using TI WIFI on non-TI processors should be able to get 
that in any layer stack.  If that all works with all the above in one 
layer thats fine.  We just don't know yet.  We can be optimistic and put 
it all in one layer or pessamistic and seperate them.  In this example I 
am more inclined to believe that the other TI stuff would not cause 
problems.

Koen:  having a number of layers in on repo is a bad thing?  You should 
tell the meta-oe maintainer because that guys has a good number of 
layers in there.  :)  Are you saying that was the wrong thing to do for 
meta-oe?  Is there a leason learned?



