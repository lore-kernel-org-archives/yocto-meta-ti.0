Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40954E00BA7
	for <meta-ti@yoctoproject.org>; Sun, 27 Apr 2014 15:54:42 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4P00LF1OY8KT00@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 27 Apr 2014 17:54:25 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C105F20265; Sun,
	27 Apr 2014 18:54:08 -0400 (EDT)
Date: Sun, 27 Apr 2014 18:54:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: deepak vijay <deepakvijay2255@rediff.com>
Message-id: <20140427225408.GZ11339@denix.org>
References: <CAAxuRXguvLRy+DosUUzeLD_BUN7eM=47D6VYZhW2QVPzFWBjww@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAAxuRXguvLRy+DosUUzeLD_BUN7eM=47D6VYZhW2QVPzFWBjww@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Compatibility of linux kernel 2.6.37
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
X-List-Received-Date: Sun, 27 Apr 2014 22:54:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Apr 26, 2014 at 12:28:31PM +0530, deepak vijay wrote:
> Hi,
> I am new to yocto project.
> So I wold like to know whether the linux kernels versions less than 3.x
> (like 2.6.37) are compatible to the yocto.
> If yes I also want to know that how create a new recipe for this kernel.

Something like this?

http://arago-project.org/git/?p=meta-ti.git;a=blob;f=recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb;hb=HEAD

-- 
Denys

