Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C11ADE00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 08:36:54 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LZ4004A3WTHLTI0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 09 Feb 2012 10:36:54 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 735F5200B9; Thu,
	09 Feb 2012 11:36:51 -0500 (EST)
Date: Thu, 09 Feb 2012 11:36:51 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-id: <20120209163651.GA3917@denix.org>
References: <4F32F1B3.8090000@mlbassoc.com> <4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
	<4F32F87E.2070907@mlbassoc.com>
	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
	<4F331E78.3000302@ti.com>
	<CAFZh4h_dVaOnbYMZjnAc34upJqoPKK4AaPEOEHPTQL6ZEyU-6w@mail.gmail.com>
	<CAFZh4h8nXRRXdaQ3Ms-fAN3KSBxSVJ_qV16=S6Z1UtFaGQin8g@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFZh4h8nXRRXdaQ3Ms-fAN3KSBxSVJ_qV16=S6Z1UtFaGQin8g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 09 Feb 2012 16:36:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 09, 2012 at 11:23:14AM -0500, Brian Hutchinson wrote:
>  On Wed, Feb 8, 2012 at 8:16 PM, William Mills <wmills@ti.com> wrote:
> > As Gary said there has not been too many end user questions on meta-ti yet.
> 
>  All I care about is meta-ti as that is what all our products are based
>  on. I've been watching subject for a while now trying to discern all
>  the issues and make a wise choice.

Brian,

>  I'm wanting to switch from Arago to whatever TI supports next as I
>  supply the rest of our development team with tools and images that
>  they build applications on for our products and I can't jerk them
>  around changing distros.

As you are aware, Arago is not going away - there is work going on in 
meta-arago layer to update/port it to the new Yocto infrastructure.

Arago/meta-arago is still going to be the official platform distribution for 
TI SDK products. But, a separate meta-ti layer was created early in the 
process to detach and unify the BSP layer and allow people to use TI hardware 
with different distributions. And that's actually part of the problem, as 
distributions like religions conflict with each other in a single layer... :)

-- 
Denys

