Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC6FCE00306
	for <meta-ti@yoctoproject.org>; Mon, 23 Jan 2012 11:00:13 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LY9008GVM40CBC2@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Jan 2012 13:00:02 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3D1DF20333; Mon,
	23 Jan 2012 14:00:00 -0500 (EST)
Date: Mon, 23 Jan 2012 14:00:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andreas M?ller <schnitzeltony@gmx.de>
Message-id: <20120123190000.GG17838@denix.org>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
	<201201231752.12060.schnitzeltony@gmx.de>
	<B6BB4942-0E12-4A95-A52E-10132586B5F2@dominion.thruhere.net>
	<201201231946.48960.schnitzeltony@gmx.de>
MIME-version: 1.0
In-reply-to: <201201231946.48960.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/7] SGX recipe rework
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
X-List-Received-Date: Mon, 23 Jan 2012 19:00:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 23, 2012 at 07:46:48PM +0100, Andreas M?ller wrote:
> On Monday, January 23, 2012 05:55:07 PM Koen Kooi wrote:
> > Right, you need 32 bit libs installed for installjammer to work
> > 
> > On fedora: yum install glibc.i686
> > 
> Fixed build here. Thanks! Will run test in the next days.
> 
> Ehm - aren't there few tricky lines of code available, informing user of missing 
> packets and abort then?

Correct, sanity.bbclass

There is a code to test for 64/32-bit libs/headers in oe-core, which can be 
extended to test for the above...

-- 
Denys

