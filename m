Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73E83E0059A
	for <meta-ti@yoctoproject.org>; Wed, 28 Mar 2012 21:40:22 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1M00998QAUN260@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 28 Mar 2012 23:40:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 55E06201C7; Thu,
	29 Mar 2012 00:40:05 -0400 (EDT)
Date: Thu, 29 Mar 2012 00:40:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marco Monguzzi <marco.monguzzi@gmail.com>
Message-id: <20120329044005.GH32193@denix.org>
References: <CALKp9+Y-hyv34m=KTBrnCozeu-b_-kCnwqeg5BEW6m=p+faECw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALKp9+Y-hyv34m=KTBrnCozeu-b_-kCnwqeg5BEW6m=p+faECw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: failure building meta-ti for am3517-evm
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
X-List-Received-Date: Thu, 29 Mar 2012 04:40:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 26, 2012 at 02:52:25PM +0200, Marco Monguzzi wrote:
> Hi Everyone,
> 
> according with:
> 
> http://www.angstrom-distribution.org/building-angstrom
> 
> I attempted building meta-ti this way:
> 
> MACHINE=beagleboard ./oebb.sh config am3517-evm
> MACHINE=am3517-evm ./oebb.sh update
> MACHINE=am3517-evm ./oebb.sh bitbake virtual/kernel
> 
> build stops at
> 
> rm: cannot remove `.../image/lib/modules/None/build': No such file or directory

Please try again, it should be fixed now.

-- 
Denys

