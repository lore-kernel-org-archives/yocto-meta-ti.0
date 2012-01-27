Return-Path: <wmills@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1854DE0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:11:21 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RKBK7T013476;
	Fri, 27 Jan 2012 14:11:20 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RKBKu3005053;
	Fri, 27 Jan 2012 14:11:20 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 14:11:20 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0RKBJvC019995;	Fri, 27 Jan 2012 14:11:19 -0600
Message-ID: <4F2304E7.7070809@ti.com>
Date: Fri, 27 Jan 2012 15:11:19 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from	arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:11:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit


On 01/27/2012 02:46 PM, Maupin, Chase wrote:
> I guess we have a difference of opinion on how we see meta-arago. I 
> don’t separate that layer into distro and non-distro. I was really 
> planning on meta-arago being all the stuff related to the arago/SDK 
> distribution. Meta-ti is for TI packages that can be used by other 
> distros. That being said I'm OK with meta-ti being split into a BSP 
> layer and everthing else, but I don't know exactly what that buys us. 
> Does it particularly hurt someone that pulls in meta-ti to have access 
> to matrix if they don't use it? I pull in things from meta-oe or 
> oe-core that I don’t "need" but they are there anyway.

Do you know that everything you are putting in meta-ti today only 
depends on oe-core?  I don't think you do as we are not testing that 
today.  Yes, in the old days a recipie collection had tons of stuff that 
would be present but just fail if you actually tried to use it.  The 
point of layers was to clean that up.


