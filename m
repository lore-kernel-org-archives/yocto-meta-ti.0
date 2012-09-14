Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC63CE01430
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 05:03:56 -0700 (PDT)
Received: from [192.168.0.2] (host81-153-86-254.range81-153.btcentralplus.com
	[81.153.86.254]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 1C9319ADE
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 13:03:42 +0100 (BST)
Message-ID: <50531D1D.2030900@r-finger.com>
Date: Fri, 14 Sep 2012 13:03:41 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <20120914080805.GD26968@edge> <5053065A.4090009@r-finger.com>
	<1347622164.9456.18.camel@ted>
In-Reply-To: <1347622164.9456.18.camel@ted>
Subject: Re: Make meta-ti comply with Yocto Project BSP requirements
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
X-List-Received-Date: Fri, 14 Sep 2012 12:03:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/09/12 12:29, Richard Purdie wrote:
> On Fri, 2012-09-14 at 11:26 +0100, Tomas Frydrych wrote:
>> On 14/09/12 09:08, Denys Dmytriyenko wrote:
>>> 3. Inheriting (i.e. inherit systemd) classes from another layer, such as 
>>> meta-systemd. This behavior breaks parsing and requires BBMASK-ing those 
>>> problematic recipes. Although, it requires an "application" layer and not a 
>>> "distribution" one, it's quite bad nonetheless, as it breaks parsing. High 
>>> priority.
>>
>> I am not sure about this one; it is reasonable / necessary for a bsp
>> layer to provide an -initd / -systemd packages (e.g., the pvr drivers
>> need this, the gstreamer-ti package needs this), and as long as there is
>> no systemd.bbclass in oe-core, I suspect the only answer is to split the
>> bsp layer into -bsp, -bsp-initd and --bsp-systemd. I am not sure whether
>> such endless proliferation of layers is a particularly good solution?
> 
> I don't think PVR modules having a dependency on some particular init
> system is a good thing.
> 
> What we need is a good core init system architecture and then these
> pieces can plug into that in whatever way is appropriate.

You could have a single bbclass that would provide the necessary
functionality for both systems; the current two classes could just be
aliases for it, providing backward compatibility. That would make the
basic problem of having more than one init bbclass go away.

> 
> I appreciate we're not there yet however I think the overall goal of
> separating hardware support from "policy" is a good one. 

Yes, but we are not talking about having policy in the bsp layer, we are
talking about the bsp layer supporting common policy types that a higher
layer can choose to impose. I think the distinction between 'policy' and
'policy awareness' is an important one.

> There are a few
> pain points we need to work through but if it was easy, we'd already
> have done it :)
> 
> systemd support in OE-Core is being deferred to 1.4 as I want it done
> well and would be too rushed given where we're at in the schedule now.

Actually, there is a really simple fix for this specific problem, and
that's for oe-core to include a dummy systemd.bbclass that does nothing.
This stops the parsing from being broken, and it makes no difference if
you are including meta-systemd.

Tomas

