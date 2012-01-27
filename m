Return-Path: <wmills@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3698E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 09:39:01 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RHd0qj031739;
	Fri, 27 Jan 2012 11:39:00 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RHd0lF004872;
	Fri, 27 Jan 2012 11:39:00 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 11:39:00 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0RHcxT7024031;	Fri, 27 Jan 2012 11:39:00 -0600
Message-ID: <4F22E133.3020608@ti.com>
Date: Fri, 27 Jan 2012 12:38:59 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>	<CALbNGRTQSj696KijHn+UU45e9Z+-JhWW5FUv0GUx724PgfzpZA@mail.gmail.com>
	<FCA44E54-9FAC-4905-86BE-C5A50092A880@dominion.thruhere.net>
In-Reply-To: <FCA44E54-9FAC-4905-86BE-C5A50092A880@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 17:39:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit


On 01/27/2012 07:24 AM, Koen Kooi wrote:
>
> Op 27 jan. 2012, om 13:09 heeft Andreas Müller het volgende geschreven:
>
>> On Fri, Jan 27, 2012 at 12:50 PM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>>> Since meta-arago is supposed to be as empty as possible and matrix doesn't play well with others it's a bad fit for both meta-arago and meta-oe. Maybe we should split the meta-ti repo into 2 layers: one for BSP things (including sgx, dsp, etc) and one for 'sdk' things (matrix).
>>> The idea is to keep reusable TI deliverables together without forcing people to use arago. Putting matrix in meta-arago would mean you can only use it with DISTRO=arago, which is a huge step backwards from the current situation.
>>>
>> I think splitting out BSP into an own layer is a good idea and sorry
>> for another hijacking: This would be a good chance to make it
>> independent of angstrom ( e.g ti-hw-bringup ).
>
> Image reuse is the least of the issues, SOC_FAMILY is a much larger one.
>

Andreas: Yes, this is the layer stack independence that meta-ti is 
suppose to have and currently does not.  When meta-ti is "done" it is 
suppose to work in:

core layer stack: oe-core + meta-ti
yocto layer stack: poky + meta-ti
angstrom layer stack: oe-core + meta-oe + meta-angstrom + meta-ti + many 
more)
arago layer stack: TBD but at least oe-core + meta-oe + meta-ti + 
meta-arago)

As Koen points out we have a good many hurdles to get to the above. 
Stay tuned.


