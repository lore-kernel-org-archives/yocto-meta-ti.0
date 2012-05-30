Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60949E01448
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 11:37:19 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4U00HBIMDO05F0@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 30 May 2012 13:37:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 30C5620226; Wed,
	30 May 2012 14:36:59 -0400 (EDT)
Date: Wed, 30 May 2012 14:36:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120530183659.GB10106@denix.org>
References: <1337846249-26371-1-git-send-email-koen@dominion.thruhere.net>
	<20120529205756.GA10106@denix.org>
	<DFB38997-3316-4A6A-8EC3-0F5CC24FBD23@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <DFB38997-3316-4A6A-8EC3-0F5CC24FBD23@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH 1/2] linux-ti33x-psp 3.2: sgx fix from PSP + dvi cape audio fix
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
X-List-Received-Date: Wed, 30 May 2012 18:37:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 29, 2012 at 11:18:39PM +0200, Koen Kooi wrote:
> 
> Op 29 mei 2012, om 22:57 heeft Denys Dmytriyenko het volgende geschreven:
> 
> >> This patch is again out of order, as I don't have any of the above (0059-0061) -
> > are those in your personal tree? Are you going to submit those? Or do you want 
> > me to massage this one out of order?
> > 
> > Also, the M_K_PR went back to "a" for some reason...
> 
> I'd blame gmail smtp servers if I wasn't such an idiot :) You can get the 
> complete series from https://github.com/Angstrom-distribution/meta-ti/commits/angstrom-staging
> 
> I'll create a seperate branch for you to pull for each request in the future.

Thanks, merged the missing commits. A separate branch is not necessary for 
every pull request, but some branch with non-trivial changes staged would be 
appreciated.

BTW, are there any problems with the list - I didn't see the bounced commit 
emails...

-- 
Denys

