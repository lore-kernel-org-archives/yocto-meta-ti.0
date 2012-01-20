Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F198BE00307
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 09:10:12 -0800 (PST)
Received: (qmail 20534 invoked by uid 1003); 20 Jan 2012 17:10:11 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	20 Jan 2012 17:10:11 -0000
Message-ID: <4F199FF1.8090606@balister.org>
Date: Fri, 20 Jan 2012 12:10:09 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <9F2249DF-2E56-4B4E-98CB-CE746690DCEC@dominion.thruhere.net>
In-Reply-To: <9F2249DF-2E56-4B4E-98CB-CE746690DCEC@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC] u-boot recipe naming
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
X-List-Received-Date: Fri, 20 Jan 2012 17:10:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/20/2012 07:41 AM, Koen Kooi wrote:
> Hi,
> 
> We currently have a problem with other layers including their own version of u-boot_2011.12.bb which confuses bitbake. To avoid such hassle in the future I'm going to propose using the kernel naming scheme for u-boot recipes as well:
> 
> u-boot-denx_2011.12.bb -> u-boot from git.denx.de master + patches
> u-boot-ti_git.bb -> u-boot from git.denx.de ti branch + patches
> u-boot-psp-<soc>_git.bb -> u-boot from psp tree for $SoC + patches e.g. u-boot-psp-am18x_git.bb

Since I kind of started the problem, some background....

I'm very nervous using a shared u-boot recipe to ship to customers,
since there always seems to be some regression creeping in as other
people fix things for their hardware (the recent L2 cache turn off for
omap3 to fix omap4 booting comes to mind).

So I want to control my u-boot with an iron fist!

But, I tried to be lazy and not pollute the u-boot package namespace by
calling the recipe u-boot-usrp-e1xx. Apparently this did not work so well :)

Philip

> 
> This should avoid filename based conflicts between layers and make it clearer which tree the recipe will be building.
> 
> Thoughts/flames/opinions?
> 
> regards,
> 
> Koen

