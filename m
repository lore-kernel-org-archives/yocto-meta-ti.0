Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 512A2E00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 08:59:53 -0800 (PST)
Received: (qmail 30993 invoked by uid 1003); 9 Feb 2012 16:59:52 -0000
Received: from unknown (HELO ?192.168.0.140?) (philip@opensdr.com@12.207.17.2)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	9 Feb 2012 16:59:52 -0000
Message-ID: <4F33FB87.8030102@balister.org>
Date: Thu, 09 Feb 2012 08:59:51 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>	<4F32F59B.7010804@mlbassoc.com>	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>	<4F32F87E.2070907@mlbassoc.com>	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>	<4F331E78.3000302@ti.com>	<CAFZh4h_dVaOnbYMZjnAc34upJqoPKK4AaPEOEHPTQL6ZEyU-6w@mail.gmail.com>	<CAFZh4h8nXRRXdaQ3Ms-fAN3KSBxSVJ_qV16=S6Z1UtFaGQin8g@mail.gmail.com>
	<20120209163651.GA3917@denix.org>
In-Reply-To: <20120209163651.GA3917@denix.org>
X-Enigmail-Version: 1.1.2
Cc: meta-ti@yoctoproject.org
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Thu, 09 Feb 2012 16:59:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/09/2012 08:36 AM, Denys Dmytriyenko wrote:
> On Thu, Feb 09, 2012 at 11:23:14AM -0500, Brian Hutchinson wrote:
>>  On Wed, Feb 8, 2012 at 8:16 PM, William Mills <wmills@ti.com> wrote:
>>> As Gary said there has not been too many end user questions on meta-ti yet.
>>
>>  All I care about is meta-ti as that is what all our products are based
>>  on. I've been watching subject for a while now trying to discern all
>>  the issues and make a wise choice.
> 
> Brian,
> 
>>  I'm wanting to switch from Arago to whatever TI supports next as I
>>  supply the rest of our development team with tools and images that
>>  they build applications on for our products and I can't jerk them
>>  around changing distros.
> 
> As you are aware, Arago is not going away - there is work going on in 
> meta-arago layer to update/port it to the new Yocto infrastructure.
> 
> Arago/meta-arago is still going to be the official platform distribution for 
> TI SDK products. But, a separate meta-ti layer was created early in the 
> process to detach and unify the BSP layer and allow people to use TI hardware 
> with different distributions. And that's actually part of the problem, as 
> distributions like religions conflict with each other in a single layer... :)
> 

Denys, from my point of view, there are two issues we need to solve:

1) Defining the meta-ti toolchain dependencies. Angstrom uses gcc-4.5
for various reasons. Will the TI programs work against all gcc versions
available from oe-core/meta-oe?

2) Image construction pieces in oe-core are not all there yet. This is
what leads to angstrom specific bits creeping into the BSP layer. I've
talked with Paul Eggleton and Koen about this at FOSDEM. We should sit
down next week at ELC and see if we can come up with a set os tasks we
can push into oe-core that let all layer/distro combinations produce
working images.

Philip

