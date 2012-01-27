Return-Path: <wmills@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 405DBE00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 09:51:26 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RHpO4B025469;
	Fri, 27 Jan 2012 11:51:24 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RHpOOu022139;
	Fri, 27 Jan 2012 11:51:24 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 11:51:24 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0RHpOT6027456;	Fri, 27 Jan 2012 11:51:24 -0600
Message-ID: <4F22E41B.8070708@ti.com>
Date: Fri, 27 Jan 2012 12:51:23 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
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
X-List-Received-Date: Fri, 27 Jan 2012 17:51:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 01/27/2012 08:50 AM, Maupin, Chase wrote:

 > but I definitely don’t think matrix belongs in meta-arago

Why, justify.  Yes matrix needs to be different than the distro 
definition on arago but As you point out below the only people using 
Matrix are Arago and Koen in Angstrom.  I think this comes down to not 
wanting the word "arago" occurring in the Angstrom layer stack.

meta-ti should be about using TI chips.  Matrix and other demo programs 
we put together for our demo distro are not essential to using TI chips.

>
> 1. As of now matrix is only maintained by TI and used by TI (and Koen to some extent) on our products.  So I would put this in a layer that we maintain because it would seem strange to me to have to go through another set of maintainers to update the SRCREV of the package we are developing.  Particularly if no one is using it.
> 2. If people wanted matrix they could still include our layer to get it.  If we see that happening a lot a there is a request from a group of people to have this then we could push it lower, but if we are the only ones using it and who care about it then I don't see the reason to move this lower in the layer stack.
>

