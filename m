Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB532E01430
	for <meta-ti@yoctoproject.org>; Fri, 14 Sep 2012 04:45:39 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 75E8FF81206; Fri, 14 Sep 2012 05:45:39 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 74EB6F811FD;
	Fri, 14 Sep 2012 05:45:38 -0600 (MDT)
Message-ID: <505318E3.9060009@mlbassoc.com>
Date: Fri, 14 Sep 2012 05:45:39 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
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
X-List-Received-Date: Fri, 14 Sep 2012 11:45:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-09-14 05:29, Richard Purdie wrote:
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
>
> I appreciate we're not there yet however I think the overall goal of
> separating hardware support from "policy" is a good one. There are a few
> pain points we need to work through but if it was easy, we'd already
> have done it :)
>
> systemd support in OE-Core is being deferred to 1.4 as I want it done
> well and would be too rushed given where we're at in the schedule now.

When that does happen, I hope that it will still be possible to have
a distribution which uses initd.  Will that be the case, or do we all
have to follow down the systemd yellow brick road (which I personally
am not in favour of)?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

